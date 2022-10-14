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
public class Assignment {

    private int id;
    private String title;
    private String description;
    private LocalDate subDate;
    private Map<Integer, Course> assignmentsCourseMap = new HashMap<Integer, Course>();

    public Assignment() {
    }

    public Assignment(int id, String title, String description, LocalDate subDate) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.subDate = subDate;
    }

    public Assignment(String title, String description, LocalDate subDate) {
        this.title = title;
        this.description = description;
        this.subDate = subDate;
    }

    public LocalDate getSubDate() {
        return subDate;
    }

    public void setSubDate(LocalDate subDate) {
        this.subDate = subDate;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Map<Integer, Course> getCourseMap() {
        return assignmentsCourseMap;
    }

    public Course getCourseById(Integer id) {
        return assignmentsCourseMap.get(id);
    }

    public void setCourse(Integer id, Course course) {
        this.assignmentsCourseMap.put(id, course);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Assignment{id=").append(id);
        sb.append(", title=").append(title);
        sb.append(", description=").append(description);
        sb.append(", subDate=").append(subDate);
        sb.append('}');
        return sb.toString();
    }

}
