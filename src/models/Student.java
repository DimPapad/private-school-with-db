/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author mhtso
 */
public class Student {

    private int ssn;
    private String fname;
    private String lname;
    private LocalDate dateOfBirth;
    private float fees;
    private float oralMark;
    private float totalMark;
    private Map<Integer, Course> studentsCourseMap = new HashMap<Integer, Course>();
    private Map<Integer, Assignment> studentsAssignmentMap = new HashMap<Integer, Assignment>();

    public Student() {
    }

    public Student(int ssn, String fname, String lname, LocalDate dateOfBirth, float fees) {
        this.ssn = ssn;
        this.fname = fname;
        this.lname = lname;
        this.dateOfBirth = dateOfBirth;
        this.fees = fees;
    }

    public Student(int ssn, String fname, String lname, LocalDate dateOfBirth) {
        this.ssn = ssn;
        this.fname = fname;
        this.lname = lname;
        this.dateOfBirth = dateOfBirth;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    public float getFees() {
        return fees;
    }

    public void setFees(float fees) {
        this.fees = fees;
    }
    
    public float getOralMark() {
        return oralMark;
    }

    public void setOralMark(float oralMark) {
        this.oralMark = oralMark;
    }

    public float getTotalMark() {
        return totalMark;
    }

    public void setTotalMark(float totalMark) {
        this.totalMark = totalMark;
    }

    public Map<Integer, Course> getCourseMap() {
        return studentsCourseMap;
    }

    public Course getCourseById(Integer id) {
        return studentsCourseMap.get(id);
    }

    public void setCourse(Integer id, Course course) {
        this.studentsCourseMap.put(id, course);
    }

    public Map<Integer, Assignment> getAssignmnetMap() {
        return studentsAssignmentMap;
    }

    public Assignment getAssignmnetById(Integer id) {
        return studentsAssignmentMap.get(id);
    }

    public void setAssignment(Integer id, Assignment assignment) {
        this.studentsAssignmentMap.put(id, assignment);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Student{ssn=").append(ssn);
        sb.append(", fname=").append(fname);
        sb.append(", lname=").append(lname);
        sb.append(", dateOfBirth=").append(dateOfBirth);
        sb.append(", fees=").append(fees);
        sb.append('}');
        return sb.toString();
    }

    

    

}
