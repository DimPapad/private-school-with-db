/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import dao.AssignmentDao;
import dao.CourseDao;
import dao.StudentDao;
import dao.TrainerDao;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Assignment;
import models.Course;
import models.Student;
import models.Trainer;

/**
 *
 * @author mhtso
 */
public class MiscUtilities {

    public static void questionForNextAction(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        System.out.println("");
        System.out.println("Πληκτρολογήστε τον αριθμό της ενέργειας με την οποία θέλετε να προχωρήσετε");
        System.out.println("1. Εκτύπωση καταχωρημένων εγγραφών");
        System.out.println("2. Καταχώρηση εγγραφής");
        System.out.println("3. Τερματισμός προγράμματος");
        int myInput;
        do {
            myInput = input.nextInt();
            if (myInput == 1) {
                outputChoice(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 2) {
                inputChoice(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 3) {
            } else {
                System.out.println("Πληκτρολογήστε έναν αριθμό από το 1 έως το 3");
            }
        } while (!((myInput == 1) || (myInput == 2) || (myInput == 3)));
    }

    public static void outputChoice(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        System.out.println("");
        System.out.println("Πληκτρολογήστε τον αριθμό της εκτύπωσης με την οποία θέλετε να προχωρήσετε");
        System.out.println("1. A list of all the students");
        System.out.println("2. A list of all the trainers");
        System.out.println("3. A list of all the assignments");
        System.out.println("4. A list of all the courses");
        System.out.println("5. All the students per course");
        System.out.println("6. All the trainers per course");
        System.out.println("7. All the assignments per course");
        System.out.println("8. All the assignments per course per student");
        System.out.println("9. A list of students that belong to more than one courses");
        int myInput;
        do {
            myInput = input.nextInt();
            if (myInput == 1) {
                outputAllStudents(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 2) {
                outputAllTrainers(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 3) {
                outputAllAssignments(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 4) {
                outputAllCourses(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 5) {
                outputAllStudentsPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 6) {
                outputAllTrainersPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 7) {
                outputAllAssignmentsPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 8) {
                outputAllAssignmentsPerCoursePerStudent(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 9) {
                outputStudentsWithManyCourses(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else {
                System.out.println("Πληκτρολογήστε έναν αριθμό από το 1 έως το 9");
            }
        } while (!((myInput == 1) || (myInput == 2) || (myInput == 3) || (myInput == 4) || (myInput == 5) || (myInput == 6) || (myInput == 7) || (myInput == 8) || (myInput == 9)));
    }

    private static void inputChoice(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        System.out.println("");
        System.out.println("Πληκτρολογήστε τον αριθμό της εισαγωγής με την οποία θέλετε να προχωρήσετε");
        System.out.println("1. Insert Student(s)");
        System.out.println("2. Insert Trainer(s)");
        System.out.println("3. Insert Assignment(s)");
        System.out.println("4. Insert Course(s)");
        System.out.println("5. Insert Student(s) in a Course");
        System.out.println("6. Insert Trainer(s) in a Course");
        System.out.println("7. Insert Assignment(s) of a Student in a Course");
        int myInput;
        do {
            myInput = input.nextInt();
            if (myInput == 1) {
                StudentDao.insertStudent(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 2) {
                TrainerDao.insertTrainer(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 3) {
                AssignmentDao.insertAssignment(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 4) {
                CourseDao.insertCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 5) {
                CourseDao.insertStudentPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 6) {
                CourseDao.insertTrainerPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else if (myInput == 7) {
                CourseDao.insertAssignmenPerStudentPerCourse(courseMap, trainerMap, studentMap, assignmentMap, input);
            } else {
                System.out.println("Πληκτρολογήστε έναν αριθμό από το 1 έως το 7");
            }
        } while (!((myInput == 1) || (myInput == 2) || (myInput == 3) || (myInput == 4) || (myInput == 5) || (myInput == 6) || (myInput == 7)));
    }

    public static void outputAllStudents(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        studentMap = StudentDao.getAllStudents();
        System.out.println("");
        studentMap.values().forEach(System.out::println);
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllTrainers(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        trainerMap = TrainerDao.getAllTrainers();
        System.out.println("");
        trainerMap.values().forEach(System.out::println);
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllAssignments(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        assignmentMap = AssignmentDao.getAllAssignments();
        System.out.println("");
        assignmentMap.values().forEach(System.out::println);
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllCourses(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = CourseDao.getAllCourses();
        System.out.println("");
        courseMap.values().forEach(System.out::println);
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllStudentsPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = CourseDao.getAllStudentsPerCourse();
        for (Map.Entry<Integer, Course> courseMapEntry : courseMap.entrySet()) {
            System.out.println("");
            System.out.println(courseMapEntry.getValue());
            studentMap = courseMap.get(courseMapEntry.getKey()).getStudentMap();
            for (Map.Entry<Integer, Student> studentMapEntry : studentMap.entrySet()) {
                System.out.print(" ");
                System.out.println(studentMapEntry.getValue());
            }
        }
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllTrainersPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = CourseDao.getAllTrainersPerCourse();
        for (Map.Entry<Integer, Course> courseMapEntry : courseMap.entrySet()) {
            System.out.println("");
            System.out.println(courseMapEntry.getValue());
            trainerMap = courseMap.get(courseMapEntry.getKey()).getTrainerMap();
            for (Map.Entry<Integer, Trainer> trainerMapEntry : trainerMap.entrySet()) {
                System.out.print(" ");
                System.out.println(trainerMapEntry.getValue());
            }
        }
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllAssignmentsPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        courseMap = CourseDao.getAllAssignmentsPerCourse();
        for (Map.Entry<Integer, Course> courseMapEntry : courseMap.entrySet()) {
            System.out.println("");
            System.out.println(courseMapEntry.getValue());
            assignmentMap = courseMap.get(courseMapEntry.getKey()).getAssignmentMap();
            for (Map.Entry<Integer, Assignment> assignmentMapEntry : assignmentMap.entrySet()) {
                System.out.print(" ");
                System.out.println(assignmentMapEntry.getValue());
            }
        }

        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputAllAssignmentsPerCoursePerStudent(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        studentMap = StudentDao.getAllAssignmentsPerCoursePerStudent();
        for (Map.Entry<Integer, Student> studentMapEntry : studentMap.entrySet()) {
            System.out.println("");
            System.out.println(studentMapEntry.getValue());
            courseMap = studentMap.get(studentMapEntry.getKey()).getCourseMap();
            for (Map.Entry<Integer, Course> courseMapEntry : courseMap.entrySet()) {
                System.out.print(" ");
                System.out.println(courseMapEntry.getValue());
                assignmentMap = courseMap.get(courseMapEntry.getKey()).getAssignmentMap();
                for (Map.Entry<Integer, Assignment> assignmentMapEntry : assignmentMap.entrySet()) {
                    System.out.print("  ");
                    System.out.println(assignmentMapEntry.getValue());
                }
            }
        }
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static void outputStudentsWithManyCourses(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        studentMap = StudentDao.getStudentsWithManyCourses();
        for (Map.Entry<Integer, Student> studentMapEntry : studentMap.entrySet()) {
            System.out.println("");
            System.out.println(studentMapEntry.getValue());
            courseMap = studentMap.get(studentMapEntry.getKey()).getCourseMap();
            for (Map.Entry<Integer, Course> courseMapEntry : courseMap.entrySet()) {
                System.out.print(" ");
                System.out.println(courseMapEntry.getValue());
            }
        }
        questionForNextAction(courseMap, trainerMap, studentMap, assignmentMap, input);
    }

    public static Map<Integer, Student> inputStudent(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        do {
            System.out.println("");
            System.out.println("Δώστε το ΑΦΜ του μαθητή");
            int afm = input.nextInt();
            System.out.println("Δώστε το Όνομα του μαθητή");
            String fname = input.next();
            System.out.println("Δώστε το Επώνυμο του μαθητή");
            String lname = input.next();
            System.out.println("Δώστε την ημερομηνία γέννησης του μαθητή (π.χ. 1990-12-31)");
            LocalDate dob = LocalDate.parse(input.next());
            Student student = new Student(afm, fname, lname, dob);
            studentMap.put(student.getSsn(), student);
            answer = sameInsert(input);
        } while (answer.equals("Y"));
        return studentMap;
    }

    public static Map<Integer, Trainer> inputTrainer(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        do {
            System.out.println("");
            System.out.println("Δώστε το ΑΦΜ του εκπαιδευτή");
            int afm = input.nextInt();
            System.out.println("Δώστε το Όνομα του εκπαιδευτή");
            String fname = input.next();
            System.out.println("Δώστε το Επώνυμο του εκπαιδευτή");
            String lname = input.next();
            System.out.println("Δώστε το αντικείμενο του εκπαιδευτή");
            String subject = input.next();
            Trainer trainer = new Trainer(afm, fname, lname, subject);
            trainerMap.put(trainer.getSsn(), trainer);
            answer = sameInsert(input);
        } while (answer.equals("Y"));
        return trainerMap;
    }

    public static Map<Integer, Assignment> inputAssignment(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        int i = 0;
        do {
            System.out.println("");
            System.out.println("Δώστε τον τίτλο του Assignment");
            String title = input.next();
            System.out.println("Δώστε την περιγραφή του Assignment");
            String description = input.next();
            System.out.println("Δώστε την ημερομηνία παράδοσης του Assignment (π.χ. 2020-12-31)");
            LocalDate subDate = LocalDate.parse(input.next());
            Assignment assignment = new Assignment(title, description, subDate);
            assignmentMap.put(i, assignment);
            answer = sameInsert(input);
            i++;
        } while (answer.equals("Y"));
        return assignmentMap;
    }

    public static Map<Integer, Course> inputCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        int i = 0;
        do {
            System.out.println("");
            System.out.println("Δώστε τον τίτλο του Course");
            String title = input.next();
            System.out.println("Δώστε τo θέμα του Course (π.χ. JAVA)");
            String stream = input.next();
            System.out.println("Δώστε τoν τύπο του Course (π.χ. PART-TIME)");
            String type = input.next();
            System.out.println("Δώστε την ημερομηνία έναρξης του Course (π.χ. 2020-12-31)");
            LocalDate startDate = LocalDate.parse(input.next());
            System.out.println("Δώστε την ημερομηνία λήξης του Course (π.χ. 2020-12-31)");
            LocalDate endDate = LocalDate.parse(input.next());
            Course course = new Course(title, type, stream, startDate, endDate);
            courseMap.put(i, course);
            answer = sameInsert(input);
            i++;
        } while (answer.equals("Y"));
        return courseMap;
    }

    public static Map<Integer, Course> inputStudentPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        System.out.println("");
        System.out.println("Δώστε τον τίτλο του Course");
        String title = input.next();
        System.out.println("Δώστε τo θέμα του Course (π.χ. JAVA)");
        String stream = input.next();
        System.out.println("Δώστε τoν τύπο του Course (π.χ. PART-TIME)");
        String type = input.next();
        System.out.println("Δώστε την ημερομηνία έναρξης του Course (π.χ. 2020-12-31)");
        LocalDate startDate = LocalDate.parse(input.next());
        System.out.println("Δώστε την ημερομηνία λήξης του Course (π.χ. 2020-12-31)");
        LocalDate endDate = LocalDate.parse(input.next());
        Course course = new Course(title, type, stream, startDate, endDate);
        courseMap.put(0, course);
        do {
            System.out.println("");
            System.out.println("Δώστε το ΑΦΜ του μαθητή");
            int afm = input.nextInt();
            System.out.println("Δώστε το Όνομα του μαθητή");
            String fname = input.next();
            System.out.println("Δώστε το Επώνυμο του μαθητή");
            String lname = input.next();
            System.out.println("Δώστε την ημερομηνία γέννησης του μαθητή (π.χ. 1990-12-31)");
            LocalDate dob = LocalDate.parse(input.next());
            System.out.println("Δώστε τα δίδακτρα του μαθητή για αυτό το Course");
            int fees = input.nextInt();
            Student student = new Student(afm, fname, lname, dob, fees);
            courseMap.get(0).setStudent(afm, student);
            answer = sameInsert(input);
        } while (answer.equals("Y"));
        return courseMap;
    }

    public static Map<Integer, Course> inputTrainerPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        System.out.println("");
        System.out.println("Δώστε τον τίτλο του Course");
        String title = input.next();
        System.out.println("Δώστε τo θέμα του Course (π.χ. JAVA)");
        String stream = input.next();
        System.out.println("Δώστε τoν τύπο του Course (π.χ. PART-TIME)");
        String type = input.next();
        System.out.println("Δώστε την ημερομηνία έναρξης του Course (π.χ. 2020-12-31)");
        LocalDate startDate = LocalDate.parse(input.next());
        System.out.println("Δώστε την ημερομηνία λήξης του Course (π.χ. 2020-12-31)");
        LocalDate endDate = LocalDate.parse(input.next());
        Course course = new Course(title, type, stream, startDate, endDate);
        courseMap.put(0, course);
        do {
            System.out.println("");
            System.out.println("Δώστε το ΑΦΜ του εκπαιδευτή");
            int afm = input.nextInt();
            System.out.println("Δώστε το Όνομα του εκπαιδευτή");
            String fname = input.next();
            System.out.println("Δώστε το Επώνυμο του εκπαιδευτή");
            String lname = input.next();
            System.out.println("Δώστε το αντικείμενο του εκπαιδευτή");
            String subject = input.next();
            Trainer trainer = new Trainer(afm, fname, lname, subject);
            courseMap.get(0).setTrainer(afm, trainer);
            answer = sameInsert(input);
        } while (answer.equals("Y"));
        return courseMap;
    }

    public static Map<Integer, Course> inputAssignmenPerStudentPerCourse(Map<Integer, Course> courseMap, Map<Integer, Trainer> trainerMap, Map<Integer, Student> studentMap, Map<Integer, Assignment> assignmentMap, Scanner input) {
        String answer = null;
        System.out.println("");
        System.out.println("Δώστε τον τίτλο του Course");
        String cTitle = input.next();
        System.out.println("Δώστε τo θέμα του Course (π.χ. JAVA)");
        String stream = input.next();
        System.out.println("Δώστε τoν τύπο του Course (π.χ. PART-TIME)");
        String type = input.next();
        System.out.println("Δώστε την ημερομηνία έναρξης του Course (π.χ. 2020-12-31)");
        LocalDate startDate = LocalDate.parse(input.next());
        System.out.println("Δώστε την ημερομηνία λήξης του Course (π.χ. 2020-12-31)");
        LocalDate endDate = LocalDate.parse(input.next());
        Course course = new Course(cTitle, type, stream, startDate, endDate);
        courseMap.put(0, course);
        System.out.println("");
        System.out.println("Δώστε το ΑΦΜ του μαθητή");
        int afm = input.nextInt();
        System.out.println("Δώστε το Όνομα του μαθητή");
        String fname = input.next();
        System.out.println("Δώστε το Επώνυμο του μαθητή");
        String lname = input.next();
        System.out.println("Δώστε την ημερομηνία γέννησης του μαθητή (π.χ. 1990-12-31)");
        LocalDate dob = LocalDate.parse(input.next());
        System.out.println("Δώστε τα δίδακτρα του μαθητή για αυτό το Course");
        int fees = input.nextInt();
        Student student = new Student(afm, fname, lname, dob, fees);
        courseMap.get(0).setStudent(0, student);
        int i = 0;
        do {
            System.out.println("");
            System.out.println("Δώστε τον τίτλο του Assignment");
            String aTitle = input.next();
            System.out.println("Δώστε την περιγραφή του Assignment");
            String description = input.next();
            System.out.println("Δώστε την ημερομηνία παράδοσης του Assignment (π.χ. 2020-12-31)");
            LocalDate subDate = LocalDate.parse(input.next());
            Assignment assignment = new Assignment(aTitle, description, subDate);
            courseMap.get(0).getStudentBySsn(0).setAssignment(i, assignment);
            answer = sameInsert(input);
            i++;
        } while (answer.equals("Y"));
        return courseMap;
    }

    public static String sameInsert(Scanner input) {
        String answer = null;
        do {
            System.out.println("");
            System.out.println("Θέλετε και άλλη όμοια καταχώριση; (Υ=ναι | N=όχι)");
            answer = input.next();
        } while (!answer.equals("Y") && !answer.equals("N"));
        return answer;
    }

}
