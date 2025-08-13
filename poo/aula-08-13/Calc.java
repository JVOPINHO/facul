public class Calc {
    public static void main(String[] args) {
        int x = 1;
        int y = 1;

        System.out.println("Soma: " + sum(x, y));
        System.out.println("Subtração: " + sub(x, y));
        System.out.println("Multiplicação: " + mul(x, y));
        System.out.println("Divisão: " + div(x, y));
    }

    public static int sum(int x, int y) {
        return x + y;
    }

    public static int sub(int x, int y) {
        return x + y;
    }

    public static int mul(int x, int y) {
        return x * y;
    }
    
    public static int div(int x, int y) {
        return x / y;
    }
}
