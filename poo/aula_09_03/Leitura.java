package poo.aula_09_03;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Leitura {
    public String input(String labelMessage) {
        InputStreamReader keyboard = new InputStreamReader(System.in);
        BufferedReader buffer = new BufferedReader(keyboard);

        String output = "";

        System.out.println(labelMessage);

        try {
            output = buffer.readLine();
        } catch(IOException ioe) {
            System.out.println("ERROR: JVM or RAM");
        }

        return output;
    }
}