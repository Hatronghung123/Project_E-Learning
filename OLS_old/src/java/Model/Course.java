/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
public class Course {

    private int course_id;
    private String course_name;
    private String description;
    private String instructor;
    private String image;
    private int price;
    private String course_category_id;
    private int create_by;
    private Date date;
    private String study_time;
    private String formattedPrice; 
    private int is_active;

    public Course() {
    }

    public Course(int course_id, String course_name, String description, String instructor, String image, int price, String course_category_id, int create_by, Date date, String study_time, int is_active) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.instructor = instructor;
        this.image = image;
        this.price = price;
        this.course_category_id = course_category_id;
        this.create_by = create_by;
        this.date = date;
        this.study_time = study_time;
        this.formattedPrice = formattedPrice;
        this.is_active = is_active;
    }

    public Course(String course_name, String image, int create_by) {
        this.course_name = course_name;
        this.image = image;
        this.create_by = create_by;
    }
    

   

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCourse_category_id() {
        return course_category_id;
    }

    public void setCourse_category_id(String course_category_id) {
        this.course_category_id = course_category_id;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public String getStudy_time() {
        return study_time;
    }

    public void setStudy_time(String study_time) {
        this.study_time = study_time;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    public String getFormattedPrice() {
        return formattedPrice;
    }

    public void setFormattedPrice(String formattedPrice) {
        this.formattedPrice = formattedPrice;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + ", course_name=" + course_name + ", description=" + description + ", instructor=" + instructor + ", image=" + image + ", price=" + price + ", course_category_id=" + course_category_id + ", create_by=" + create_by + ", date=" + date + ", study_time=" + study_time + ", formattedPrice=" + formattedPrice + ", is_active=" + is_active + '}';
    }
    
    

    

    

}
