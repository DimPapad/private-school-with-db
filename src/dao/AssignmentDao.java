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
public class AssignmentDao {

    public static Map<Integer, Assignment> getAllAssignments() {
        Map<Integer, Assignment> allAssignmentsMap = new HashMap<Integer, Assignment>();
        String sql = "select * from assignment";
        try (Connection con = DbUtilities.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Assignment assignment = new Assignment(
                        rs.getInt("as_id"),
                        rs.getString("as_title"),
                        rs.getString("as_description"),
                        rs.getDate("as_sub_date_time").toLocalDate()
                );
                allAssignmentsMap.put(assignment.getId(), assignment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allAssignmentsMap;
    }

    public static void insertAssignment(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        assignmentMap = MiscUtilities.inputAssignment(courseMap, trainerMap, studentMap, assignmentMap, input);
        String sql = "insert into assignment (as_title,as_description,as_sub_date_time) values (?,?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareCall(sql)) {
            for (Map.Entry<Integer, Assignment> assignmentMapEntry : assignmentMap.entrySet()) {
                ps.setString(1, assignmentMap.get(assignmentMapEntry.getKey()).getTitle());
                ps.setString(2, assignmentMap.get(assignmentMapEntry.getKey()).getDescription());
                ps.setDate(3, java.sql.Date.valueOf(assignmentMap.get(assignmentMapEntry.getKey()).getSubDate()));
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

}
