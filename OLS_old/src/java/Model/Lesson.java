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
    private int profile_id;
    private String avatar;
    private int courseid;
    private long duration;
<<<<<<< HEAD

=======
    private int createby;
>>>>>>> 794417edd24f2c986b41f7b0c5f132bbff2cb7a9
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
    
<<<<<<< HEAD
       //dùng để read và update lesson
    public Lesson(int lessonid, int moduleid, String lessonname, String lessoncontent, String lessonvideo, long duration) {
=======
       //dùng để read
    public Lesson(int lessonid, int moduleid, String lessonname, String lessoncontent, String lessonvideo, long duration, String modulname) {
>>>>>>> 794417edd24f2c986b41f7b0c5f132bbff2cb7a9
        this.lessonid = lessonid;
        this.moduleid = moduleid;
        this.lessonname = lessonname;
        this.lessoncontent = lessoncontent;
        this.lessonvideo = lessonvideo;
        this.duration = duration;
<<<<<<< HEAD
    }
    
    

    public Lesson(int lessonid, String modulname, String lessonname, String lessoncontent, String lessonvideo, String coursename, String mentorname, String avatar, int courseid, long duration,int profile_id) {
=======
        this.modulname = modulname;
    }
           //dùng để update lesson
        public Lesson(int lessonid, int moduleid, String lessonname, String lessoncontent, String lessonvideo, long duration) {
        this.lessonid = lessonid;
        this.moduleid = moduleid;
        this.lessonname = lessonname;
        this.lessoncontent = lessoncontent;
        this.lessonvideo = lessonvideo;
        this.duration = duration;

    }
    
    
//Dùng để lấy dữ liệu trong lesson

    public Lesson(int lessonid, String modulname, String lessonname, String lessoncontent, String lessonvideo, String coursename, String mentorname, String avatar, int courseid, long duration,int profile_id, int createby) {
>>>>>>> 794417edd24f2c986b41f7b0c5f132bbff2cb7a9
        this.lessonid = lessonid;
        this.modulname = modulname;
        this.lessonname = lessonname;
        this.lessoncontent = lessoncontent;
        this.lessonvideo = lessonvideo;
        this.coursename = coursename;
        this.mentorname = mentorname;
        this.profile_id = profile_id;
        this.avatar = avatar;
        this.courseid = courseid;
        this.duration = duration;
<<<<<<< HEAD
        this.profile_id = profile_id;
=======
        this.createby = createby;
>>>>>>> 794417edd24f2c986b41f7b0c5f132bbff2cb7a9
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

    public int getProfile_id() {
        return profile_id;
    }

    public void setProfile_id(int profile_id) {
        this.profile_id = profile_id;
    }
<<<<<<< HEAD

    
    @Override
    public String toString() {
        return "Lesson{" + "lessonid=" + lessonid + ", modulname=" + modulname + ", lessonname=" + lessonname + ", lessoncontent=" + lessoncontent + ", lessonvideo=" + lessonvideo + ", coursename=" + coursename + ", mentorname=" + mentorname + ", avatar=" + avatar + ", courseid=" + courseid + ", duration=" + duration + '}';
    }
=======

    public int getCreateby() {
        return createby;
    }

    public void setCreateby(int createby) {
        this.createby = createby;
    }
    
    

    @Override
    public String toString() {
        return "Lesson{" + "lessonid=" + lessonid + ", moduleid=" + moduleid + ", modulname=" + modulname + ", lessonname=" + lessonname + ", lessoncontent=" + lessoncontent + ", lessonvideo=" + lessonvideo + ", coursename=" + coursename + ", mentorname=" + mentorname + ", profile_id=" + profile_id + ", avatar=" + avatar + ", courseid=" + courseid + ", duration=" + duration + ", createby=" + createby + '}';
    }

    

>>>>>>> 794417edd24f2c986b41f7b0c5f132bbff2cb7a9

}
