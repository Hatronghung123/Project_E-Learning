/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Tuan Anh(Gia Truong)
 */
public class Course {
    private int course_id;
        private String course_name;
    private String description;
    private String image;
    private double price;
    private int course_category_id;
    private int create_by;
    private int is_active;

    public Course() {
    }

    public Course(int course_id, String course_name, String description, String image, double price, int course_category_id, int create_by, int is_active) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.course_category_id = course_category_id;
        this.create_by = create_by;
        this.is_active = is_active;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCourse_category_id() {
        return course_category_id;
    }

    public void setCourse_category_id(int course_category_id) {
        this.course_category_id = course_category_id;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + ", course_name=" + course_name + ", description=" + description + ", image=" + image + ", price=" + price + ", course_category_id=" + course_category_id + ", create_by=" + create_by + ", is_active=" + is_active + '}';
    }
    
    
    
}
