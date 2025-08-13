#!/bin/bash
ENV_FILES=()
COMMAND=()
VARS=()
PARSE_ENV=true
NEXT_IS_VAR=false
NEXT_IS_FILE=false
DEBUG=false

# Argument parser
for arg in "$@"; do
  if [ "$arg" == "--" ]; then
    PARSE_ENV=false
    continue
  fi

  if $PARSE_ENV; then
    if [ "$arg" == "--env-file" ]; then
      NEXT_IS_FILE=true
      continue
    elif [ "$arg" == "--var" ]; then
      NEXT_IS_VAR=true
      continue
    elif [ "$arg" == "--debug" ]; then
      DEBUG=true
      continue
    fi

    if [ "$NEXT_IS_FILE" = true ]; then
      ENV_FILES+=("$arg")
      $DEBUG && echo "📦 Added env file: $arg"
      NEXT_IS_FILE=false
      continue
    fi

    if [ "$NEXT_IS_VAR" = true ]; then
      VARS+=("$arg")
      $DEBUG && echo "⚙️  Added inline var: $arg"
      NEXT_IS_VAR=false
      continue
    fi
  else
    COMMAND+=("$arg")
  fi
done

expand_partial() {
  local raw="$1"
  local parsed="$raw"

  # ${VAR:-default}
  parsed=$(echo "$parsed" | perl -pe 's/\$\{([A-Za-z_][A-Za-z0-9_]*)[:](.*?)\}/$ENV{$1} ne "" ? $ENV{$1} : "$2"/ge')
  parsed=$(echo "$parsed" | perl -pe 's/\$\{([A-Za-z_][A-Za-z0-9_]*)\}/$ENV{$1} ne "" ? $ENV{$1} : "\${$1}"/ge')
  parsed=$(echo "$parsed" | perl -pe 's/\$([A-Za-z_][A-Za-z0-9_]*)/$ENV{$1} ne "" ? $ENV{$1} : "\$$1"/ge')

  echo "$parsed"
}

# Load inline variables
if [ ! ${#VARS} -eq 0 ]; then
  for var in "${VARS[@]}"; do
    if [[ "$var" =~ ^([A-Za-z_][A-Za-z0-9_]*)=(.*)$ ]]; then
      KEY="${BASH_REMATCH[1]}"
      VALUE="${BASH_REMATCH[2]}"

      EXPANDED_VALUE=$(expand_partial "$VALUE")
      export "$KEY=$EXPANDED_VALUE"
      $DEBUG && echo -e "🧩 \e[34m$KEY\e[0m \e[35m->\e[0m \e[33m$EXPANDED_VALUE\e[0m"
    else
      echo "⚠️ Invalid variable passed with --var: $var"
    fi
  done
fi

# Load env files
for FILE in "${ENV_FILES[@]}"; do
  if [ ! -f "$FILE" ]; then
    echo "❌ File not found: $FILE"
    exit 1
  fi

  echo "📄 Reading env file: $FILE..."

  export $(cat $FILE | xargs)
done