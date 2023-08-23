/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tareaast3d;

import java.io.IOException;
import java.io.StringReader;
import java.util.Scanner;

/**
 *
 * @author Usuario
 */
public class TareaAST3D {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingresa el texto de entrada: ");
        String entrada = scanner.nextLine();
//        String entrada = "x = 12 * (id1 * 12) + 10;\n"
//                + "y = 100 - (-id1 + 12) + 10;\n"
//                + "z = (100 + 2 * (-9 + 1) + id) * id;\n";
        System.out.println(entrada);
        LexicalAnalyzer lexicalAnalyzer = new LexicalAnalyzer(new StringReader(entrada));
        SyntaxAnalyzer syntaxAnalyzer = new SyntaxAnalyzer(lexicalAnalyzer);
        try {
            
            syntaxAnalyzer.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
