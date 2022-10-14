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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class CourseDao {

    public static Map<Integer, Course> getAllCourses() {
        Map<Integer, Course> allCoursesMap = new HashMap<Integer, Course>();
        String sql = "select * from course";
        try (Connection con = DbUtilities.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("c_id"),
                        rs.getString("c_title"),
                        rs.getString("c_type"),
                        rs.getString("c_stream"),
                        rs.getDate("c_start_date").toLocalDate(),
                        rs.getDate("c_end_date").toLocalDate()
                );
                allCoursesMap.put(course.getId(), course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allCoursesMap;
    }

    public static Map<Integer, Course> getAllStudentsPerCourse() {
        Map<Integer, Course> allCoursesMapWithStudents = new HashMap<Integer, Course>();
        String sql = "select * from coursexstudent_detailed";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery()) {
            rs.last();
            int i = rs.getInt("Course_ID");
            rs.beforeFirst();
            while (rs.next()) {
                if (rs.getInt("Course_ID") != i) {
                    Course course = new Course(
                            rs.getInt("Course_ID"),
                            rs.getString("Course_Title"),
                            rs.getString("Course_Type"),
                            rs.getString("Course_Stream"),
                            rs.getDate("Course_Start_Date").toLocalDate(),
                            rs.getDate("Course_End_Date").toLocalDate()
                    );
                    allCoursesMapWithStudents.put(course.getId(), course);
                    i = rs.getInt("Course_ID");
                }
                Student student = new Student(
                        rs.getInt("Student_SSN"),
                        rs.getString("Student_First_Name"),
                        rs.getString("Student_Last_Name"),
                        rs.getDate("Student_Date_of_Birth").toLocalDate(),
                        rs.getFloat("Tuition_Fees")
                );
                allCoursesMapWithStudents.get(i).setStudent(student.getSsn(), student);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allCoursesMapWithStudents;
    }

    public static Map<Integer, Course> getAllTrainersPerCourse() {
        Map<Integer, Course> allCoursesMapWithTrainers = new HashMap<Integer, Course>();
        String sql = "select * from coursextrainer_detailed";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery()) {
            rs.last();
            int i = rs.getInt("Course_ID");
            rs.beforeFirst();
            while (rs.next()) {
                if (rs.getInt("Course_ID") != i) {
                    Course course = new Course(
                            rs.getInt("Course_ID"),
                            rs.getString("Course_Title"),
                            rs.getString("Course_Type"),
                            rs.getString("Course_Stream"),
                            rs.getDate("Course_Start_Date").toLocalDate(),
                            rs.getDate("Course_End_Date").toLocalDate()
                    );
                    allCoursesMapWithTrainers.put(course.getId(), course);
                    i = rs.getInt("Course_ID");
                }
                Trainer trainer = new Trainer(
                        rs.getInt("Trainer_SSN"),
                        rs.getString("Trainer_First_Name"),
                        rs.getString("Trainer_Last_Name"),
                        rs.getString("Trainer_Subject")
                );
                allCoursesMapWithTrainers.get(i).setTrainer(trainer.getSsn(), trainer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allCoursesMapWithTrainers;
    }

    public static Map<Integer, Course> getAllAssignmentsPerCourse() {
        Map<Integer, Course> allCoursesMapWithAssignments = new HashMap<Integer, Course>();
        String sql = "select * from coursexassignment_detailed";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = ps.executeQuery()) {
            rs.last();
            int i = rs.getInt("Course_ID");
            rs.beforeFirst();
            while (rs.next()) {
                if (rs.getInt("Course_ID") != i) {
                    Course course = new Course(
                            rs.getInt("Course_ID"),
                            rs.getString("Course_Title"),
                            rs.getString("Course_Type"),
                            rs.getString("Course_Stream"),
                            rs.getDate("Course_Start_Date").toLocalDate(),
                            rs.getDate("Course_End_Date").toLocalDate()
                    );
                    allCoursesMapWithAssignments.put(course.getId(), course);
                    i = rs.getInt("Course_ID");
                }
                Assignment assignment = new Assignment(
                        rs.getInt("Assignment_ID"),
                        rs.getString("Assignment_Title"),
                        rs.getString("Assignment_Description"),
                        rs.getDate("Assignment_Sub_Date").toLocalDate()
                );
                allCoursesMapWithAssignments.get(i).setAssignment(assignment.getId(), assignment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allCoursesMapWithAssignments;
    }

    public static void insertCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = MiscUtilities.inputCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
        String sql = "insert into course (c_title,c_type,c_stream,c_start_date,c_end_date) values (?,?,?,?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareCall(sql)) {
            for (Map.Entry<Integer, Course> courseMapEntry : courseMap.entrySet()) {
                ps.setString(1, courseMap.get(courseMapEntry.getKey()).getTitle());
                ps.setString(2, courseMap.get(courseMapEntry.getKey()).getType());
                ps.setString(3, courseMap.get(courseMapEntry.getKey()).getStream());
                ps.setDate(4, java.sql.Date.valueOf(courseMap.get(courseMapEntry.getKey()).getStartDate()));
                ps.setDate(5, java.sql.Date.valueOf(courseMap.get(courseMapEntry.getKey()).getEdnDate()));
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void insertStudentPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = MiscUtilities.inputStudentPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
        studentMap = courseMap.get(0).getStudentMap();
        String sql_c_in = "insert into course (c_title,c_type,c_stream,c_start_date,c_end_date) values (?,?,?,?,?)";
        String sql_c_out = "select c_id from course order by c_id desc limit 1";
        String sql_s = "insert into student (st_ssn,st_fname,st_lname,st_date_of_birth) values (?,?,?,?)";
        String sql_c_s = "insert into course_student (cst_c_id,cst_st_ssn,cst_tuition_fees) values (?,?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps_c_in = con.prepareCall(sql_c_in);
                PreparedStatement ps_c_out = con.prepareCall(sql_c_out);
                PreparedStatement ps_s = con.prepareCall(sql_s);
                PreparedStatement ps_c_s = con.prepareCall(sql_c_s)) {
            //
            // course insert parameters & update
            ps_c_in.setString(1, courseMap.get(0).getTitle());
            ps_c_in.setString(2, courseMap.get(0).getType());
            ps_c_in.setString(3, courseMap.get(0).getStream());
            ps_c_in.setDate(4, java.sql.Date.valueOf(courseMap.get(0).getStartDate()));
            ps_c_in.setDate(5, java.sql.Date.valueOf(courseMap.get(0).getEdnDate()));
            ps_c_in.executeUpdate();
            //
            // student insert parameters & update
            for (Map.Entry<Integer, Student> studentMapEntry : studentMap.entrySet()) {
                ps_s.setInt(1, studentMap.get(studentMapEntry.getKey()).getSsn());
                ps_s.setString(2, studentMap.get(studentMapEntry.getKey()).getFname());
                ps_s.setString(3, studentMap.get(studentMapEntry.getKey()).getLname());
                ps_s.setDate(4, java.sql.Date.valueOf(studentMap.get(studentMapEntry.getKey()).getDateOfBirth()));
                ps_s.executeUpdate();
            }
            //
            // course id select from course insert
            ResultSet rs = ps_c_out.executeQuery();
            rs.next();
            int c_id = rs.getInt("c_id");
            //
            // course_student insert parameters & update
            for (Map.Entry<Integer, Student> studentMapEntry : studentMap.entrySet()) {
                ps_c_s.setInt(1, c_id);
                ps_c_s.setInt(2, studentMap.get(studentMapEntry.getKey()).getSsn());
                ps_c_s.setFloat(3, studentMap.get(studentMapEntry.getKey()).getFees());
                ps_c_s.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void insertTrainerPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = MiscUtilities.inputTrainerPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
        trainerMap = courseMap.get(0).getTrainerMap();
        String sql_c_in = "insert into course (c_title,c_type,c_stream,c_start_date,c_end_date) values (?,?,?,?,?)";
        String sql_c_out = "select c_id from course order by c_id desc limit 1";
        String sql_t = "insert into trainer (tr_ssn,tr_fname,tr_lname,tr_subject) values (?,?,?,?)";
        String sql_c_t = "insert into course_trainer (ctr_c_id,ctr_tr_ssn) values (?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps_c_in = con.prepareCall(sql_c_in);
                PreparedStatement ps_c_out = con.prepareCall(sql_c_out);
                PreparedStatement ps_t = con.prepareCall(sql_t);
                PreparedStatement ps_c_t = con.prepareCall(sql_c_t)) {
            //
            // course insert parameters & update
            ps_c_in.setString(1, courseMap.get(0).getTitle());
            ps_c_in.setString(2, courseMap.get(0).getType());
            ps_c_in.setString(3, courseMap.get(0).getStream());
            ps_c_in.setDate(4, java.sql.Date.valueOf(courseMap.get(0).getStartDate()));
            ps_c_in.setDate(5, java.sql.Date.valueOf(courseMap.get(0).getEdnDate()));
            ps_c_in.executeUpdate();
            //
            // trainer insert parameters & update
            for (Map.Entry<Integer, Trainer> trainerMapEntry : trainerMap.entrySet()) {
                ps_t.setInt(1, trainerMap.get(trainerMapEntry.getKey()).getSsn());
                ps_t.setString(2, trainerMap.get(trainerMapEntry.getKey()).getFname());
                ps_t.setString(3, trainerMap.get(trainerMapEntry.getKey()).getLname());
                ps_t.setString(4, trainerMap.get(trainerMapEntry.getKey()).getSubject());
                ps_t.executeUpdate();
            }
            //
            // course id select from course insert
            ResultSet rs = ps_c_out.executeQuery();
            rs.next();
            int c_id = rs.getInt("c_id");
            //
            // course_trainer insert parameters & update
            for (Map.Entry<Integer, Trainer> trainerMapEntry : trainerMap.entrySet()) {
                ps_c_t.setInt(1, c_id);
                ps_c_t.setInt(2, trainerMap.get(trainerMapEntry.getKey()).getSsn());
                ps_c_t.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void insertAssignmenPerStudentPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = MiscUtilities.inputAssignmenPerStudentPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
        Student student = courseMap.get(0).getStudentBySsn(0);
        assignmentMap = student.getAssignmnetMap();
        String sql_c_in = "insert into course (c_title,c_type,c_stream,c_start_date,c_end_date) values (?,?,?,?,?)";
        String sql_c_out = "select c_id from course order by c_id desc limit 1";
        String sql_s = "insert into student (st_ssn,st_fname,st_lname,st_date_of_birth) values (?,?,?,?)";
        String sql_a_in = "insert into assignment (as_title,as_description,as_sub_date_time) values (?,?,?)";
        String sql_a_out = "select as_id from assignment order by as_id desc limit ?";
        String sql_c_s = "insert into course_student (cst_c_id,cst_st_ssn,cst_tuition_fees) values (?,?,?)";
        String sql_c_a = "insert into course_assignment (cas_c_id,cas_as_id) values (?,?)";
        String sql_s_a = "insert into student_assignment (stas_st_ssn,stas_as_id) values (?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps_c_in = con.prepareCall(sql_c_in);
                PreparedStatement ps_c_out = con.prepareCall(sql_c_out);
                PreparedStatement ps_s = con.prepareCall(sql_s);
                PreparedStatement ps_a_in = con.prepareCall(sql_a_in);
                PreparedStatement ps_a_out = con.prepareCall(sql_a_out);
                PreparedStatement ps_c_s = con.prepareCall(sql_c_s);
                PreparedStatement ps_c_a = con.prepareCall(sql_c_a);
                PreparedStatement ps_s_a = con.prepareCall(sql_s_a);) {
            //
            // course insert parameters & update
            ps_c_in.setString(1, courseMap.get(0).getTitle());
            ps_c_in.setString(2, courseMap.get(0).getType());
            ps_c_in.setString(3, courseMap.get(0).getStream());
            ps_c_in.setDate(4, java.sql.Date.valueOf(courseMap.get(0).getStartDate()));
            ps_c_in.setDate(5, java.sql.Date.valueOf(courseMap.get(0).getEdnDate()));
            ps_c_in.executeUpdate();
            //
            // student insert parameters & update
            ps_s.setInt(1, student.getSsn());
            ps_s.setString(2, student.getFname());
            ps_s.setString(3, student.getLname());
            ps_s.setDate(4, java.sql.Date.valueOf(student.getDateOfBirth()));
            ps_s.executeUpdate();
            //
            // assignment insert parameters & update
            for (Map.Entry<Integer, Assignment> assignmentMapEntry : assignmentMap.entrySet()) {
                ps_a_in.setString(1, assignmentMap.get(assignmentMapEntry.getKey()).getTitle());
                ps_a_in.setString(2, assignmentMap.get(assignmentMapEntry.getKey()).getDescription());
                ps_a_in.setDate(3, java.sql.Date.valueOf(assignmentMap.get(assignmentMapEntry.getKey()).getSubDate()));
                ps_a_in.executeUpdate();
            }
            //
            // course id select from course insert
            ResultSet rs_c = ps_c_out.executeQuery();
            rs_c.next();
            int c_id = rs_c.getInt("c_id");
            //
            // assignment id select from course insert
            int noOfInsertedAssignments = assignmentMap.size();
            List<Integer> assignmentIds = new ArrayList();
            ps_a_out.setInt(1, noOfInsertedAssignments);
            ResultSet rs_a = ps_a_out.executeQuery();
            while (rs_a.next()) {
                assignmentIds.add(rs_a.getInt("as_id"));
            }
            //
            // course_assignment insert parameters & update
            for (int i = 0; i < noOfInsertedAssignments; i++) {
                ps_c_a.setInt(1, c_id);
                ps_c_a.setInt(2, assignmentIds.get(i));
                ps_c_a.executeUpdate();
            }
            //
            // student_assignment insert parameters & update
            for (int i = 0; i < noOfInsertedAssignments; i++) {
                ps_s_a.setInt(1, student.getSsn());
                ps_s_a.setInt(2, assignmentIds.get(i));
                ps_s_a.executeUpdate();
            }
            //
            // course_student insert parameters & update
            ps_c_s.setInt(1, c_id);
            ps_c_s.setInt(2, student.getSsn());
            ps_c_s.setFloat(3, student.getFees());
            ps_c_s.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

}
