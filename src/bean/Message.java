package bean;

/**
 * Created by wzf on 2017/4/29.
 */
public class Message {

    private int id;
    private String title;
    private String info;
    private String url;
    private int level;

    public int getId() {
        return id;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Message(int id, String title, String info, String url, int level) {
        this.id = id;
        this.title = title;
        this.info = info;
        this.url = url;
        this.level = level;
    }
    public Message(String title, String info, String url, int level) {
        this.title = title;
        this.info = info;
        this.url = url;
        this.level = level;
    }
}
