package tool;

import java.io.IOException;

/**
 * Created by tongao on 2017/5/14.
 */
public class ZIP {
    public void zip( String id) throws IOException {
        // write your code here
        System.out.println("start zip!");
        Runtime.getRuntime().exec("C:\\Users\\wzf\\Documents\\IDEA\\PDD\\web\\file\\del.bat");
        System.out.println("del succeed!");
        Runtime.getRuntime().exec("C:\\Program Files\\WinRAR\\Rar.exe a -k -r -s  -u -m1   C:\\Users\\wzf\\Documents\\IDEA\\PDD\\web\\file\\work.rar C:\\Users\\wzf\\Desktop\\upload\\"+id);
        System.out.println("zip succeed!");
    }

    public ZIP() {
    }
}
