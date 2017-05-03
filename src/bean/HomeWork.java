package bean;

import javax.xml.crypto.Data;
import java.util.Date;

/**
 * Created by wzf on 2017/4/23.
 */
public class HomeWork {

    private String id;
    private String subject;
    private String  date;

    public HomeWork(String id, String subject, String date) {
        this.id = id;
        this.subject = subject;
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String toString(){
        return id+subject;
    }

    public String  getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
