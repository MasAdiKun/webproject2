/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author masad
 */
public class DramaModel {
    private int id;
    private String title;
    private String type;
    private String link;
    private String img;
    private int year;
    private String genres;
    private int eps;
    private String act;
    private String desc;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setAct(String act) {
        this.act = act;
    }

    public String getAct() {
        return act;
    }

    public void setEps(int eps) {
        this.eps = eps;
    }

    public int getEps() {
        return eps;
    }

    public void setGenres(String genres) {
        this.genres = genres;
    }

    public String getGenres() {
        return genres;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getLink() {
        return link;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getYear() {
        return year;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
    
}
