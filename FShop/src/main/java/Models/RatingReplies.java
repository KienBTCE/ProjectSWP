/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HP
 */
public class RatingReplies {
<<<<<<< HEAD
    private  int replyID;
    private  int employeeID;
    private  int rateID;
    private  String Answer;
    private  boolean  isRead;
=======
    private int replyID;
    private int employeeID;
    private int rateID;
    private String answer;
    private boolean isRead;
>>>>>>> 3d93b6c (fig bug on crud order create view feedback.)

    public RatingReplies() {
    }

<<<<<<< HEAD
    public RatingReplies(int replyID, int employeeID, int rateID, String Answer, boolean isRead) {
        this.replyID = replyID;
        this.employeeID = employeeID;
        this.rateID = rateID;
        this.Answer = Answer;
        this.isRead = isRead;
    }

    
=======
    public RatingReplies(int replyID, int employeeID, int rateID, String answer, boolean isRead) {
        this.replyID = replyID;
        this.employeeID = employeeID;
        this.rateID = rateID;
        this.answer = answer;
        this.isRead = isRead;
    }

>>>>>>> 3d93b6c (fig bug on crud order create view feedback.)
    public int getReplyID() {
        return replyID;
    }

    public void setReplyID(int replyID) {
        this.replyID = replyID;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getRateID() {
        return rateID;
    }

    public void setRateID(int rateID) {
        this.rateID = rateID;
    }

    public String getAnswer() {
<<<<<<< HEAD
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
=======
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
>>>>>>> 3d93b6c (fig bug on crud order create view feedback.)
    }

    public boolean isIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }
    
<<<<<<< HEAD
    
    
=======
>>>>>>> 3d93b6c (fig bug on crud order create view feedback.)
}
