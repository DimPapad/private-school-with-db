/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Assignment;
import models.Course;
import models.Student;
import models.Trainer;
import utilities.DbUtilities;
import utilities.MiscUtilities;

/**
 *
 * @author mhtso
 */
public class StudentDao {

    public static Map<Integer, Student> getAllStudents() {
        Map<Integer, Student> allStudentsMap = new HashMap<Integer, Student>();
        String sql = "select * from student";
        try (Connection con = DbUtilities.getConnection();
                Statement st = con.prepareStatement(sql);
                ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                Student student = new Student(
                        rs.getInt("st_ssn"),
                        rs.getString("st_fname"),
                        rs.getString("st_lname"),
                        rs.getDate("st_date_of_birth").toLocalDate()
                );
                allStudentsMap.put(student.getSsn(), student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allStudentsMap;
    }

    public static Map<Integer, Student> getAllAssignmentsPerCoursePerStudent() {
        Map<Integer, Student> AllStudentsMapWithAssignmentsPerCourse = new HashMap<Integer, Student>();
        String sql = "select * from coursexstudentxassignment_detailed";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery();) {
            rs.last();
            int i = rs.getInt("Course_ID");
            int j = rs.getInt("Student_SSN");
            rs.beforeFirst();
            while (rs.next()) {
                if (rs.getInt("Course_ID") != i) {
                    if (rs.getInt("Student_SSN") != j) {
                        Student student = new Student(
                                rs.getInt("Student_SSN"),
                                rs.getString("Student_First_Name"),
                                rs.getString("Student_Last_Name"),
                                rs.getDate("Student_Date_of_Birth").toLocalDate(),
                                rs.getFloat("Tuition_Fees")
                        );
                        AllStudentsMapWithAssignmentsPerCourse.put(student.getSsn(), student);
                        j = rs.getInt("Student_SSN");
                    }
                    Course course = new Course(rs.getInt("Course_ID"),
                            rs.getString("Course_Title"),
                            rs.getString("Course_Type"),
                            rs.getString("Course_Stream"),
                            rs.getDate("Course_Start_Date").toLocalDate(),
                            rs.getDate("Course_End_Date").toLocalDate()
                    );
                    AllStudentsMapWithAssignmentsPerCourse.get(j).setCourse(course.getId(), course);
                    i = rs.getInt("Course_ID");
                }
                Assignment assignment = new Assignment(rs.getInt("Assignment_ID"),
                        rs.getString("Assignment_Title"),
                        rs.getString("Assignment_Description"),
                        rs.getDate("Assignment_Sub_Date").toLocalDate()
                );
                AllStudentsMapWithAssignmentsPerCourse.get(j).getCourseById(i).setAssignment(assignment.getId(), assignment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return AllStudentsMapWithAssignmentsPerCourse;
    }

    public static Map<Integer, Student> getStudentsWithManyCourses() {
        Map<Integer, Student> studentMapWithManyCourses = new HashMap<Integer, Student>();
        String sql = "select * from students_with_many_courses_detailed";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery()) {
            rs.last();
            int i = rs.getInt("Students_SSN");
            rs.beforeFirst();
            while (rs.next()) {
                if (rs.getInt("Students_SSN") != i) {
                    Student student = new Student(rs.getInt("Students_SSN"),
                            rs.getString("LastName"),
                            rs.getString("FirstName"),
                            rs.getDate("Student_Date_of_Birth").toLocalDate(),
                            rs.getInt("Tuition_Fees")
                    );
                    studentMapWithManyCourses.put(student.getSsn(), student);
                    i = rs.getInt("Students_SSN");
                }
                Course course = new Course(
                        rs.getInt("Course_ID"),
                        rs.getString("Course_Title"),
                        rs.getString("Course_Type"),
                        rs.getString("Course_Stream"),
                        rs.getDate("Course_Start_Date").toLocalDate(),
                        rs.getDate("Course_end_Date").toLocalDate()
                );
                studentMapWithManyCourses.get(i).setCourse(course.getId(), course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentMapWithManyCourses;
    }

    public static void insertStudent(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        studentMap = MiscUtilities.inputStudent(courseMap, trainerMap, studentMap, assignmentMap, input);
        String sql = "insert into student (st_ssn,st_fname,st_lname,st_date_of_birth) values (?,?,?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareCall(sql)) {
            for (Map.Entry<Integer, Student> studentMapEntry : studentMap.entrySet()) {
                ps.setInt(1, studentMap.get(studentMapEntry.getKey()).getSsn());
                ps.setString(2, studentMap.get(studentMapEntry.getKey()).getFname());
                ps.setString(3, studentMap.get(studentMapEntry.getKey()).getLname());
                ps.setDate(4, java.sql.Date.valueOf(studentMap.get(studentMapEntry.getKey()).getDateOfBirth()));
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

}
