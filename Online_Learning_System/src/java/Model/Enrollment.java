/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author tuong
 */
public class Enrollment {
    private int enrollment_id;
    private int account_id;
    private int course_id;
    private String enrollment_date;
    private int progress;

    public Enrollment() {
    }

    public Enrollment(int enrollment_id, int account_id, int course_id, String enrollment_date, int progress) {
        this.enrollment_id = enrollment_id;
        this.account_id = account_id;
        this.course_id = course_id;
        this.enrollment_date = enrollment_date;
        this.progress = progress;
    }

    public int getEnrollment_id() {
        return enrollment_id;
    }

    public void setEnrollment_id(int enrollment_id) {
        this.enrollment_id = enrollment_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getEnrollment_date() {
        return enrollment_date;
    }

    public void setEnrollment_date(String enrollment_date) {
        this.enrollment_date = enrollment_date;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }
    
    
}
