package poo.aula_09_02;

public class Run {
    public static void main(String args[]) {
        Leitura leitura = new Leitura();

        String responseOne = leitura.input("Digite um número (x):");
        int numberOne = Integer.parseInt(responseOne);

        String responseTwo = leitura.input("Digite mais um número (y):");
        int numberTwo = Integer.parseInt(responseTwo);

        int result = numberOne + numberTwo;

        System.out.println("A soma de " + numberOne + " e " + numberTwo + " é " + result);
    }
}
