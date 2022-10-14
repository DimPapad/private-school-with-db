/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package privateschooldb;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import models.Assignment;
import models.Course;
import models.Student;
import models.Trainer;
import utilities.MiscUtilities;

/**
 *
 * @author mhtso
 */
public class PrivateSchoolDB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Map<Integer,Assignment> assignmentMap=new HashMap<Integer,Assignment>();
        Map<Integer,Course> courseMap=new HashMap<Integer,Course>();
        Map<Integer,Student> studentMap=new HashMap<Integer,Student>();
        Map<Integer,Trainer> trainerMap=new HashMap<Integer,Trainer>();
        Scanner input=new Scanner(System.in);
        
        MiscUtilities.questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
        
        
    }
    
}
