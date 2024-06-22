/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Messenger {
    private int messenger_id;
    private int sender_id;
    private int receiver_id;
    private String messenger_text;
    private Date messenger_time;

    public Messenger() {
    }

    public Messenger(int messenger_id, int sender_id, int receiver_id, String messenger_text, Date messenger_time) {
        this.messenger_id = messenger_id;
        this.sender_id = sender_id;
        this.receiver_id = receiver_id;
        this.messenger_text = messenger_text;
        this.messenger_time = messenger_time;
    }
    

    public int getMessenger_id() {
        return messenger_id;
    }

    public void setMessenger_id(int messenger_id) {
        this.messenger_id = messenger_id;
    }

    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public int getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(int receiver_id) {
        this.receiver_id = receiver_id;
    }

    public String getMessenger_text() {
        return messenger_text;
    }

    public void setMessenger_text(String messenger_text) {
        this.messenger_text = messenger_text;
    }

    public Date getMessenger_time() {
        return messenger_time;
    }

    public void setMessenger_time(Date messenger_time) {
        this.messenger_time = messenger_time;
    }

    @Override
    public String toString() {
        return "Messenger{"+"messenger_id: "+messenger_id+"sender_id: "+sender_id+"receiver_id: "+receiver_id+"messenger_text: "+messenger_text+"messenger_time: "+messenger_time;
    }
    
    
    
}
