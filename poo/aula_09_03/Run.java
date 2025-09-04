package poo.aula_09_03;

public class Run {
    public static void main(String args[]) {
        Leitura leitura = new Leitura();

        String responseOne = leitura.input("Digite um número (x):");
        int numberOne = Integer.parseInt(responseOne);

        String responseTwo = leitura.input("Digite mais um número (y):");
        int numberTwo = Integer.parseInt(responseTwo);

        System.out.println(numberOne + " mais " + numberTwo + " é " + Calculator.sum(numberOne, numberTwo));
        System.out.println(numberOne + " menos " + numberTwo + " é " + Calculator.sub(numberOne, numberTwo));
        System.out.println(numberOne + " vezes " + numberTwo + " é " + Calculator.mul(numberOne, numberTwo));
        System.out.println(numberOne + " dividido por " + numberTwo + " é " + Calculator.div(numberOne, numberTwo));
    }
}
