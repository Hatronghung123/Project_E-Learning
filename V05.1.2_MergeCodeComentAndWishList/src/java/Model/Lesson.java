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
public class Lesson {

    private int lessonid;
    private int moduleid;
    private String modulname;
    private String lessonname;
    private String lessoncontent;
    private String lessonvideo;
    private String coursename;
    private String mentorname;
    private String avatar;
    private int courseid;
    private long duration;

    public Lesson() {
    }

    //dùng để insert lesson
    public Lesson( int moduleid, String lessonname, String lessoncontent, String lessonvideo, long duration) {
        this.moduleid = moduleid;
        this.lessonname = lessonname;
        this.lessoncontent = lessoncontent;
        this.lessonvideo = lessonvideo;
        this.duration = duration;
    }
    
       //dùng để read và update lesson
    public Lesson(int lessonid, int moduleid, String lessonname, String lessoncontent, String lessonvideo, long duration) {
        this.lessonid = lessonid;
        this.moduleid = moduleid;
        this.lessonname = lessonname;
        this.lessoncontent = lessoncontent;
        this.lessonvideo = lessonvideo;
        this.duration = duration;
    }
    
    

    public Lesson(int lessonid, String modulname, String lessonname, String lessoncontent, String lessonvideo, String coursename, String mentorname, String avatar, int courseid, long duration) {
        this.lessonid = lessonid;
        this.modulname = modulname;
        this.lessonname = lessonname;
        this.lessoncontent = lessoncontent;
        this.lessonvideo = lessonvideo;
        this.coursename = coursename;
        this.mentorname = mentorname;
        this.avatar = avatar;
        this.courseid = courseid;
        this.duration = duration;
    }
    
    

    public int getLessonid() {
        return lessonid;
    }

    public void setLessonid(int lessonid) {
        this.lessonid = lessonid;
    }

    public int getModuleid() {
        return moduleid;
    }

    public void setModuleid(int moduleid) {
        this.moduleid = moduleid;
    }

    
    
    
    public String getModulname() {
        return modulname;
    }

    public void setModulname(String modulname) {
        this.modulname = modulname;
    }

    public String getLessonname() {
        return lessonname;
    }

    public void setLessonname(String lessonname) {
        this.lessonname = lessonname;
    }

    public String getLessoncontent() {
        return lessoncontent;
    }

    public void setLessoncontent(String lessoncontent) {
        this.lessoncontent = lessoncontent;
    }

    public String getLessonvideo() {
        return lessonvideo;
    }

    public void setLessonvideo(String lessonvideo) {
        this.lessonvideo = lessonvideo;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public String getMentorname() {
        return mentorname;
    }

    public void setMentorname(String mentorname) {
        this.mentorname = mentorname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public long getDuration() {
        return duration;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "Lesson{" + "lessonid=" + lessonid + ", modulname=" + modulname + ", lessonname=" + lessonname + ", lessoncontent=" + lessoncontent + ", lessonvideo=" + lessonvideo + ", coursename=" + coursename + ", mentorname=" + mentorname + ", avatar=" + avatar + ", courseid=" + courseid + ", duration=" + duration + '}';
    }

}
