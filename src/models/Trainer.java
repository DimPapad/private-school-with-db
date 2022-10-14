/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author mhtso
 */
public class Trainer {

    private int ssn;
    private String fname;
    private String lname;
    private String subject;
    private Map<Integer, Course> trainersCourseMap = new HashMap<Integer, Course>();

    public Trainer() {
    }

    public Trainer(int ssn, String fname, String lname, String subject) {
        this.ssn = ssn;
        this.fname = fname;
        this.lname = lname;
        this.subject = subject;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getSsn() {
        return ssn;
    }

    public void setSsn(int ssn) {
        this.ssn = ssn;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public Map<Integer, Course> getCourseMap() {
        return trainersCourseMap;
    }

    public Course getCourseById(Integer id) {
        return trainersCourseMap.get(id);
    }

    public void setCourse(Integer id, Course course) {
        this.trainersCourseMap.put(id, course);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Trainer{ssn=").append(ssn);
        sb.append(", fname=").append(fname);
        sb.append(", lname=").append(lname);
        sb.append(", subject=").append(subject);
        sb.append('}');
        return sb.toString();
    }

}
