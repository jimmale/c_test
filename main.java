// import java.util.String;

public class main{
public static void main(String[] args){
    String buf = "";
    for (int i = 0; i<100000000; i++ ){
      buf = Integer.toString(i);
    }
    System.out.println(buf);
  }
}
