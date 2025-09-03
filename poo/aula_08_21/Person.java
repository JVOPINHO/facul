public class Person {
    String name;
    int age;
    char gender;

    public static void main(String[] args) {
        Person john = new Person("João", 20, 'M');

        john.print();
    }

    public Person(String name, int age, char gender) {
        this.name = name;
        this.age = age;
        this.gender = gender;
    }

    public void print() {
        System.out.println("Nome: " + this.name + " | Idade: " + this.age + " | Genero: " + this.gender);
    }
}
