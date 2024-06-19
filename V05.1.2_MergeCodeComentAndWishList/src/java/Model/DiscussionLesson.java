package Model;

import java.util.ArrayList;

public class DiscussionLesson {
    private int disscussionID;
    private int acccountId;
    private int lessonId;
    private String comment; 
    private String name;
    private String avatar;

    public DiscussionLesson() {
    }

    public DiscussionLesson(int disscussionID, int acccountId, int lessonId, String comment, String name, String avatar) {
        this.disscussionID = disscussionID;
        this.acccountId = acccountId;
        this.lessonId = lessonId;
        this.comment = comment;
        this.name = name;
        this.avatar = avatar;
    }

    public int getDisscussionID() {
        return disscussionID;
    }

    public void setDisscussionID(int disscussionID) {
        this.disscussionID = disscussionID;
    }

    public int getAcccountId() {
        return acccountId;
    }

    public void setAcccountId(int acccountId) {
        this.acccountId = acccountId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "DiscussionLesson{" + "disscussionID=" + disscussionID + ", acccountId=" + acccountId + ", lessonId=" + lessonId + ", comment=" + comment + ", name=" + name + ", avatar=" + avatar + '}';
    }
}
