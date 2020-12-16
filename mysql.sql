SELECT *
FROM grades;

-- Finding averages... -- 
SELECT grades_course_id, AVG(grades_value)
FROM grades
GROUP BY grades_course_id;

-- The top grades for each student --
SELECT students_name, grades_value, MAX(grades_value)
FROM grades
INNER JOIN students
ON grades.grades_students_id = students.students_id
GROUP BY grades_students_id;

-- group students by the courses that they are enrolled in --
SELECT grades_course_id, COUNT(grades_students_id)
FROM grades
GROUP BY grades_course_id;

-- Create a summary report of courses and their average grades, 
-- sorted by the most challenging course (course with the lowest average grade) to the easiest course (may have errors)
SELECT courses_id, courses_level
FROM courses
INNER JOIN grades
ON courses.courses_id = grades.grades_id
WHERE AVG(grades_value);

-- Finding which student and professor have the most courses in common (may have errors)
SELECT students_name, professors_name, COUNT(courses_id)
FROM grades
JOIN students
ON student.students_id = grades.grades_students_id
JOIN professors
ON professors.professors_id = course.courses_professors_id
GROUP BY students_name, professors_name;