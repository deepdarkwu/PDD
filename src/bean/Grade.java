package bean;

/**
 * Created by wzf on 2017/4/23.
 */
public class Grade {

    private String id;
    private String subject;

    public Grade(String id,String subject){
        this.id=id;
        this.subject=subject;
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
}
