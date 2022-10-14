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
public class TrainerDao {

    public static Map<Integer, Trainer> getAllTrainers() {
        Map<Integer, Trainer> allTrainersMap = new HashMap<Integer, Trainer>();
        String sql = "select * from trainer";
        try (Connection con = DbUtilities.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);) {
            while (rs.next()) {
                Trainer trainer = new Trainer(
                        rs.getInt("tr_ssn"),
                        rs.getString("tr_fname"),
                        rs.getString("tr_lname"),
                        rs.getString("tr_subject")
                );
                allTrainersMap.put(trainer.getSsn(), trainer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TrainerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allTrainersMap;
    }

    public static void insertTrainer(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        trainerMap = MiscUtilities.inputTrainer(courseMap, trainerMap, studentMap, assignmentMap, input);
        String sql = "insert into trainer (tr_ssn,tr_fname,tr_lname,tr_subject) values (?,?,?,?)";
        try (Connection con = DbUtilities.getConnection();
                PreparedStatement ps = con.prepareCall(sql)) {
            for (Map.Entry<Integer, Trainer> trainerMapEntry : trainerMap.entrySet()) {
                ps.setInt(1, trainerMap.get(trainerMapEntry.getKey()).getSsn());
                ps.setString(2, trainerMap.get(trainerMapEntry.getKey()).getFname());
                ps.setString(3, trainerMap.get(trainerMapEntry.getKey()).getLname());
                ps.setString(4, trainerMap.get(trainerMapEntry.getKey()).getSubject());
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

}
