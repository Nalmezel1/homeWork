package ru.nalmezel;
import java.util.Random;

/**
 * Created by nalmezel on 05.09.2015.
 */
public class Matrix {

    public static int[][] input()
    {
        Random rand = new Random();

        int[][] mas = new int[5][];

        mas[0] = new int [1+rand.nextInt(5)];
        mas[1] = new int [1+rand.nextInt(5)];
        mas[2] = new int [1+rand.nextInt(5)];
        mas[3] = new int [1+rand.nextInt(5)];
        mas[4] = new int [1+rand.nextInt(5)];

        for(int i = 0; i<5; i++)
        {
            for(int j = 0; j<mas[i].length; j++)
            {
                mas[i][j]= 1;
            }
        }
        return mas;
    }

    public static void output(int[][] mas)
    {
        for(int i = 0; i<5; i++)
        {
            for(int j = 0; j<mas[i].length; j++)
            {
                System.out.print(mas[i][j]+" ");
            }
            System.out.println("");
        }

    }

    public static void main(String[] args)
    {
        output(input());
    }
}