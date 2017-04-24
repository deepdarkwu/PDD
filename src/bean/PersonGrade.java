package bean;

/**
 * Created by wzf on 2017/4/23.
 */
public class PersonGrade {

    private String subid;
    private  String subname;
    private String score;

    public String getSubid() {
        return subid;
    }

    public void setSubid(String subid) {
        this.subid = subid;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public PersonGrade(String subid, String subname, String score) {
        this.subid = subid;
        this.subname = subname;
        this.score = score;
    }
}
