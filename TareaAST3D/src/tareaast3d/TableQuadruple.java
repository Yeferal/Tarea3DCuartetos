/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tareaast3d;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class TableQuadruple {
    private List<Quadruple> tableQuadruple = new ArrayList<>();
    private int countT = 1;
    
    public void addQuadrupleArith(String op, String arg1, String arg2){
        if (tableQuadruple.size()==0) {
            countT = 1;
        }else {
            countT++; 
        }
        tableQuadruple.add(new Quadruple(op, arg1, arg2, "t"+countT));
    }
    
    public void addQuadrupleEnos(String op, String arg1){
        if (tableQuadruple.size()==0) {
            countT = 0;
        }else {
            countT++; 
        }
        tableQuadruple.add(new Quadruple(op, arg1, null, "t"+countT));
    }
    
    public void addQuadrupleAsig(String op, String arg1, String result){
        tableQuadruple.add(new Quadruple(op, arg1, null, result));
    }
    
    public void addQuadrupleJump(){
        tableQuadruple.add(new Quadruple("jump", null, null, null));
    }
    
    public int getCountT(){
        return countT;
    }
    
    public String getText3D(){
        StringBuilder stringBuilder = new StringBuilder();
        for (Quadruple quadruple : tableQuadruple) {
            switch(quadruple.getOp()){
                case "/":
                case "*":
                case "+":
                case "-":
                    stringBuilder.append(quadruple.getResult()+" = "+quadruple.getArg1()+" "+quadruple.getOp()+" "+ quadruple.getArg2()+"\n");
                    break;
                case "=":
                    stringBuilder.append(quadruple.getResult()+" "+quadruple.getOp()+" "+quadruple.getArg1()+"\n");
                    break;
                    
                case "enos":
                    stringBuilder.append(quadruple.getResult()+" = "+quadruple.getArg1()+"\n");
                    break;
                case "jump":
                    stringBuilder.append("\n");
                    break;
            }
        }
        return stringBuilder.toString();
    }
}
