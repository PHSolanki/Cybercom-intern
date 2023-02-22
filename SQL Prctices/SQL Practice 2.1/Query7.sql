-- Create a database schema for student grade system. It contains student data and their grade of each subject based on the different semester.

CREATE SCHEMA `studentgradesystem` ;


CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  date_of_birth DATE
);


INSERT INTO `studentgradesystem`.`students` (`student_id`, `first_name`, `last_name`, `email`, `date_of_birth`) VALUES ('1','Dutt','Mistry','dutt@gmail.com','2002-10-18'),('2', 'Priyanshu', 'Solanki', 'priyanshu@gmail.com', '2001-07-17'),('3', 'Parag', 'Parmar', 'Parag@gmail.com', '2002-08-09');


CREATE TABLE subjects (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50)
);
INSERT INTO `studentgradesystem`.`subjects` (`subject_id`, `subject_name`) VALUES ('1', 'Web Development');,('2', 'Machine Learnig'),('3', 'Data Science'),('4', 'Java'),('5', 'Blockchain');


CREATE TABLE semesters (
  semester_code VARCHAR(10) PRIMARY KEY,
  semester_start_date DATE,
  semester_end_date DATE
);
INSERT INTO `studentgradesystem`.`semesters` (`semester_code`, `semester_start_date`, `semester_end_date`) VALUES ('01', '2019-06-10', '2020-01-01');,('02', '2020-01-20', '2020-06-01'),('03', '2020-06-10', '2021-01-02');


CREATE TABLE student_grades (
  student_id INT,
  subject_id INT,
  semester_code VARCHAR(10),
  grade INT,
  PRIMARY KEY (student_id, subject_id, semester_code),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
  FOREIGN KEY (semester_code) REFERENCES semesters(semester_code)
);


INSERT INTO `studentgradesystem`.`student_grades` (`student_id`, `subject_id`, `semester_code`, `grade`) VALUES ('1', '1', '01', '9'),('1', '2', '01', '8')
,('2', '1', '01', '7')
,('2', '2', '01', '8')
,('3', '1', '01', '6')
,('3', '2', '01', '5')
,('1', '3', '02', '7')
,('1', '4', '02', '6')
,('2', '3', '02', '7')
,('2', '4', '02', '8')
,('3', '3', '02', '9')
,('3', '4', '02', '7')
,('1', '5', '03', '6')
,('2', '5', '03', '8')
,('3', '5', '03', '9')


SELECT student_grades.student_id,
students.first_name,
students.last_name,
students.email, 
students.date_of_birth,
subjects.subject_name,
student_grades.grade,
student_grades.semester_code,
student_grades.grade
FROM student_grades
INNER JOIN students ON student_grades.student_id = students.student_id
INNER JOIN subjects ON student_grades.subject_id  = subjects.subject_id
INNER JOIN semesters ON student_grades.semester_code = semesters.semester_code;


