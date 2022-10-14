/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 *
 * @author mhtso
 */
public class Course {

    private int id;
    private String title;
    private String type;
    private String stream;
    private LocalDate startDate;
    private LocalDate endDate;
    private Map<Integer, Assignment> coursesAssignmentMap = new HashMap<Integer, Assignment>();
    private Map<Integer, Student> coursesStudentMap = new HashMap<Integer, Student>();
    private Map<Integer, Trainer> coursesTrainerMap = new HashMap<Integer, Trainer>();

    public Course() {
    }

    public Course(int id, String title, String type, String stream, LocalDate startDate, LocalDate endDate) {
        this.id = id;
        this.title = title;
        this.type = type;
        this.stream = stream;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Course(String title, String type, String stream, LocalDate startDate, LocalDate endDate) {
        this.title = title;
        this.type = type;
        this.stream = stream;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public LocalDate getEdnDate() {
        return endDate;
    }

    public void setEdnDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStream() {
        return stream;
    }

    public void setStream(String stream) {
        this.stream = stream;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public Map<Integer, Assignment> getAssignmentMap() {
        return coursesAssignmentMap;
    }

    public Assignment getAssignmentById(Integer id) {
        return coursesAssignmentMap.get(id);
    }

    public void setAssignment(Integer id, Assignment assignment) {
        this.coursesAssignmentMap.put(id, assignment);
    }

    public Map<Integer, Student> getStudentMap() {
        return coursesStudentMap;
    }

    public Student getStudentBySsn(Integer ssn) {
        return coursesStudentMap.get(ssn);
    }

    public void setStudent(Integer ssn, Student student) {
        this.coursesStudentMap.put(ssn, student);
    }

    public Map<Integer, Trainer> getTrainerMap() {
        return coursesTrainerMap;
    }

    public Trainer getTrainerBySsn(Integer ssn) {
        return coursesTrainerMap.get(ssn);
    }

    public void setTrainer(Integer ssn, Trainer trainer) {
        this.coursesTrainerMap.put(ssn, trainer);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Course{id=").append(id);
        sb.append(", title=").append(title);
        sb.append(", type=").append(type);
        sb.append(", stream=").append(stream);
        sb.append(", startDate=").append(startDate);
        sb.append(", endDate=").append(endDate);
        sb.append('}');
        return sb.toString();
    }

}
