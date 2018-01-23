import java.util.concurrent.ThreadLocalRandom;

public class Burbujeo{
    public static int[] burbujeo(int vector[]){
         for(int i = 0; i < vector.length-1; i++){
            for(int j = i + 1; j < vector.length; j++){
                if(vector[i] > vector[j]){
                    int auxiliary = vector[i];
                    vector[i] = vector[j];
                    vector[j] = auxiliary;
                }
            }
         }
        
        return vector;
    }
    
    public static void main(String[] args){
        final int SIZE = 10000;
        
        int vector[] = new int[SIZE];
        
        for(int i = 0; i < SIZE; i++){
            vector[i] = ThreadLocalRandom.current() .nextInt(0, SIZE + 1);
        }
        
        vector = burbujeo(vector);
        
        for(int i = 0; i < SIZE; i++){
            System.out.println(vector[i]);
        }
    }
}
