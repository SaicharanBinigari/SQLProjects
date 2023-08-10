-- Drop tables and sequence:
DROP TABLE student_batch_maps;
DROP TABLE instructor_batch_maps;
DROP TABLE attendances;
DROP TABLE sessions;
DROP TABLE test_scores;
DROP TABLE tests;
DROP TABLE users;
DROP TABLE batches;

DROP SEQUENCE instructor_batch_maps_id_seq;
DROP SEQUENCE sessions_id_seq;
DROP SEQUENCE tests_id_seq;
DROP SEQUENCE student_batch_maps_id_seq;
DROP SEQUENCE users_id_seq;
DROP SEQUENCE batch_id_seq;


-- 1.users table:  name(user name), active(boolean to check if user is active)
CREATE SEQUENCE users_id_seq;
CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT NEXTVAL ('users_id_seq'),
  name VARCHAR(50) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into users values (1, 'Rohit', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (2, 'James', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (3, 'David', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (4, 'Steven', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (5, 'Ali', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (6, 'Rahul', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (7, 'Jacob', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (8, 'Maryam', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (9, 'Shwetha', false, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (10, 'Sarah', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (11, 'Alex', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (12, 'Charles', false, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (13, 'Perry', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (14, 'Emma', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (15, 'Sophia', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (16, 'Lucas', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (17, 'Benjamin', true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values (18, 'Hazel', false, CURRENT_DATE-5, CURRENT_DATE-4);




-- 2.batches  table:  name(batch name), active(boolean to check if batch is active)
CREATE SEQUENCE batch_id_seq;
CREATE TABLE batches (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT NEXTVAL('batch_id_seq'),
  name VARCHAR(100) UNIQUE NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into batches values (1, 'Statistics', true, CURRENT_DATE-10, CURRENT_DATE-6);
insert into batches values (2, 'Mathematics', true, CURRENT_DATE-10, CURRENT_DATE-6);
insert into batches values (3, 'Physics', false, CURRENT_DATE-10, CURRENT_DATE-6);




-- 3.student_batch_maps  table: this table is a mapping of the student and his batch. deactivated_at is the time when a student is made inactive in a batch.
CREATE SEQUENCE student_batch_maps_id_seq;
CREATE TABLE student_batch_maps (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT   NEXTVAL('student_batch_maps_id_seq'),
  user_id INTEGER NOT NULL REFERENCES users(id),
  batch_id INTEGER NOT NULL REFERENCES batches(id),
  active BOOLEAN NOT NULL DEFAULT true,
  deactivated_at TIMESTAMP NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into student_batch_maps values (1, 1, 1, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (2, 2, 1, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (3, 3, 1, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (4, 4, 1, false, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (5, 5, 2, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (6, 6, 2, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (7, 7, 2, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (8, 8, 2, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (9, 9, 2, false, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (10, 10, 3, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (11, 11, 3, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (12, 12, 3, false, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (13, 13, 3, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (14, 14, 3, true, CURRENT_TIMESTAMP, CURRENT_DATE-5, CURRENT_DATE-4);
insert into student_batch_maps values (15, 4, 2, true, CURRENT_TIMESTAMP, CURRENT_DATE-4, CURRENT_DATE-3);
insert into student_batch_maps values (16, 9, 3, false, CURRENT_TIMESTAMP, CURRENT_DATE-3, CURRENT_DATE-2);
insert into student_batch_maps values (17, 9, 1, true, CURRENT_TIMESTAMP, CURRENT_DATE-2, CURRENT_DATE-1);
insert into student_batch_maps values (18, 12, 1, true, CURRENT_TIMESTAMP, CURRENT_DATE-4, CURRENT_DATE-3);




-- 4.instructor_batch_maps  table: this table is a mapping of the instructor and the batch he has been assigned to take class/session.
CREATE SEQUENCE instructor_batch_maps_id_seq;
CREATE TABLE instructor_batch_maps (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT NEXTVAL('instructor_batch_maps_id_seq'),
  user_id INTEGER REFERENCES users(id),
  batch_id INTEGER REFERENCES batches(id),
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into instructor_batch_maps values (1, 15, 1, true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into instructor_batch_maps values (2, 16, 2, true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into instructor_batch_maps values (3, 17, 3, true, CURRENT_DATE-5, CURRENT_DATE-4);
insert into instructor_batch_maps values (4, 18, 2, true, CURRENT_DATE-5, CURRENT_DATE-4);




-- 5.sessions table: Every day session happens where the teacher takes a session or class of students.
CREATE SEQUENCE sessions_id_seq;
CREATE TABLE sessions (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT NEXTVAL('sessions_id_seq'),
  conducted_by INTEGER NOT NULL REFERENCES users(id),
  batch_id INTEGER NOT NULL REFERENCES batches(id),
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into sessions values (1, 15, 1, (CURRENT_TIMESTAMP - INTERVAL '240 MINUTE'), (CURRENT_TIMESTAMP - INTERVAL '180 MINUTE'), CURRENT_DATE, CURRENT_DATE);
insert into sessions values (2, 16, 2, (CURRENT_TIMESTAMP - INTERVAL '240 MINUTE'), (CURRENT_TIMESTAMP - INTERVAL '180 MINUTE'), CURRENT_DATE, CURRENT_DATE);
insert into sessions values (3, 17, 3, (CURRENT_TIMESTAMP - INTERVAL '240 MINUTE'), (CURRENT_TIMESTAMP - INTERVAL '180 MINUTE'), CURRENT_DATE, CURRENT_DATE);
insert into sessions values (4, 15, 1, (CURRENT_TIMESTAMP - INTERVAL '180 MINUTE'), (CURRENT_TIMESTAMP - INTERVAL '120 MINUTE'), CURRENT_DATE, CURRENT_DATE);
insert into sessions values (5, 16, 2, (CURRENT_TIMESTAMP - INTERVAL '180 MINUTE'), (CURRENT_TIMESTAMP - INTERVAL '120 MINUTE'), CURRENT_DATE, CURRENT_DATE);
insert into sessions values (6, 18, 2, (CURRENT_TIMESTAMP - INTERVAL '120 MINUTE'), (CURRENT_TIMESTAMP - INTERVAL '60 MINUTE'), CURRENT_DATE, CURRENT_DATE);




-- 6.attendances table: After session or class happens between teacher and student, attendance is given by student. students provide ratings to the teacher.
CREATE TABLE attendances (
  student_id INTEGER NOT NULL REFERENCES users(id),
  session_id INTEGER NOT NULL REFERENCES sessions(id),
  rating DOUBLE PRECISION NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (student_id, session_id)
);

insert into attendances values (1, 1, 8.5, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (2, 1, 7.5, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (3, 1, 6.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (5, 2, 8.5, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (6, 2, 7.5, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (7, 2, 6.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (8, 2, 6.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (10, 3, 9.5, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (11, 3, 7.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (13, 3, 8.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (14, 3, 6.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (1, 4, 7.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (2, 4, 5.5, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (5, 5, 5.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (5, 6, 6.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (9, 2, 4.0, CURRENT_DATE, CURRENT_DATE);
insert into attendances values (12, 3, 5.0, CURRENT_DATE, CURRENT_DATE);




-- 7.tests table: Test is created by instructor. total_mark is the maximum marks for the test.
CREATE SEQUENCE tests_id_seq;
CREATE TABLE tests (
   id INTEGER PRIMARY KEY NOT NULL DEFAULT NEXTVAL('tests_id_seq'),
  batch_id INTEGER REFERENCES batches(id),
  created_by INTEGER REFERENCES users(id),
  total_mark INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into tests values (1, 1, 15, 100, CURRENT_DATE, CURRENT_DATE);
insert into tests values (2, 2, 16, 100, CURRENT_DATE, CURRENT_DATE);
insert into tests values (3, 3, 17, 100, CURRENT_DATE, CURRENT_DATE);
insert into tests values (4, 2, 18, 100, CURRENT_DATE, CURRENT_DATE);
insert into tests values (5, 1, 15, 50, CURRENT_DATE, CURRENT_DATE);
insert into tests values (6, 1, 15, 25, CURRENT_DATE, CURRENT_DATE);
insert into tests values (7, 1, 15, 25, CURRENT_DATE, CURRENT_DATE);
insert into tests values (8, 2, 16, 50, CURRENT_DATE, CURRENT_DATE);
insert into tests values (9, 3, 17, 50, CURRENT_DATE, CURRENT_DATE);



-- 8.test_scores table: Marks scored by students are added in the test_scores table.
CREATE TABLE test_scores (
  test_id INTEGER REFERENCES tests(id),
  user_id INTEGER REFERENCES users(id),
  score INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(test_id, user_id)
);

insert into test_scores values (1, 1, 80, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (1, 2, 60, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (1, 3, 30, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (2, 5, 80, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (2, 6, 35, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (2, 7, 38, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (2, 8, 90, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (3, 10, 65, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (3, 11, 85, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (3, 13, 95, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (3, 14, 100, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (5, 1, 40, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (5, 2, 35, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (5, 3, 45, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (6, 1, 22, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (6, 2, 12, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (7, 1, 16, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (7, 3, 10, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (8, 5, 15, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (8, 6, 20, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (9, 13, 25, CURRENT_DATE, CURRENT_DATE);
insert into test_scores values (9, 14, 35, CURRENT_DATE, CURRENT_DATE);

/* ******************** ALL TABLES ******************** */
select * from users;
select * from batches;
select * from student_batch_maps;
select * from instructor_batch_maps;
select * from sessions;
select * from attendances;
select * from tests;
select * from test_scores;

--1.Calculate the average rating given by students to each teacher for each session created. Also, provide the batch name for which session was conducted.

SELECT b.name as Batch_Name,a.session_id, u.name, s.conducted_by,ROUND(AVG(a.rating)::numeric, 2) as Avg_rating
FROM batches b
JOIN sessions s ON b.id = s.batch_id
JOIN attendances a ON s.id = a.session_id
JOIN users u ON u.id = s.conducted_by
GROUP BY s.conducted_by, b.name,a.session_id,u.name
ORDER BY a.session_id;


--2.Find the attendance percentage for each session for each batch. Also mention the batch name and users name who has conduct that session
SELECT b.id,s.id,b.name AS Batch_Name,u.name as User_Name,
SUM(CASE when sbm.active = true then 1 else 0 end) as Present,
COUNT(Present)/COUNT(sbm.active) * 100 AS attendance_percent
FROM 
users u
JOIN sessions s ON u.id = s.conducted_by
JOIN batches b ON s.batch_id = b.id
JOIN student_batch_maps sbm ON b.id = sbm.batch_id
GROUP BY s.id,b.id,b.name,u.name
ORDER BY s.id;

SELECT b.id,s.id,b.name AS Batch_Name,u.name as User_Name,
(SUM(CASE when sbm.active = true then 1 else 0 end))/COUNT(sbm.active) * 100 AS attendance_percent
FROM 
users u
JOIN sessions s ON u.id = s.conducted_by
JOIN batches b ON s.batch_id = b.id
JOIN student_batch_maps sbm ON b.id = sbm.batch_id
GROUP BY s.id,b.id,b.name,u.name
ORDER BY s.id;

with students_in_batch as
		(select batch_id, count(1) as students_in_batch
		from student_batch_maps
		where active = true
		group by batch_id), -- calculated count of only active studentsin the  batch
	multiple_batch_students as
		(select inactive.user_id, inactive.batch_id as inactive_batch, active.batch_id  as active_batch
		from student_batch_maps active
		join student_batch_maps inactive on active.user_id = inactive.user_id
		where active.active = true
		and inactive.active = false),
	students_present as
		(select session_id, count(1) as students_present
		from attendances a
		join sessions s on s.id = a.session_id
		where (a.student_id,s.batch_id) not in (select user_id, inactive_batch from multiple_batch_students)
		group by session_id)
select s.id as session_id, b.name as batch, u.name as teacher, SB.students_in_batch, SP.students_present
, round((SP.students_present::decimal/SB.students_in_batch::decimal) * 100,2) as attendance_percentage
from sessions s
join students_present SP on s.id = SP.session_id
join students_in_batch SB on s.batch_id = SB.batch_id
join batches b on b.id = s.batch_id
join users u on u.id = s.conducted_by;

--3. What is the average marks scored by each student in all the tests the student had appeared?
SELECT user_id as student, round(avg(score),2) as avg_score
FROM test_scores ts
GROUP BY user_id
ORDER BY user_id;

--4. A student is passed when he scores 40 percent of total marks in a test. Find out how many students passed in each test. Also mention the batch name for that test.

select ts.test_id, b.name as batch, count(ts.test_id) as students_passed
from tests t
left join test_scores ts on t.id = ts.test_id
join users u on u.id = ts.user_id
join batches b on b.id = t.batch_id
where ((ts.score::decimal/t.total_mark::decimal)*100) >= 40
group by ts.test_id,b.name
order by test_id;

--5.What is the average percentage of marks scored by each student in all the tests the student had appeared?
SELECT user_id as student, round(avg(score),2) as avg_score
FROM test_scores ts
GROUP BY user_id
ORDER BY user_id;

SELECT user_id,u.name, ROUND(AVG((CAST(ts.score AS decimal)/CAST(t.total_mark AS decimal))*100),2) AS percentage_marks
FROM test_scores ts
JOIN tests t ON ts.test_id = t.id
JOIN users u ON u.id = ts.user_id
GROUP BY user_id,u.name
ORDER BY u.name;

--6.A student is passed when he scores 40 percent of total marks in a test. Find out how many percentage of students have passed in each test. Also mention the batch name for that test.
WITH count_students_passed AS
(
select ts.test_id, b.name as batch, count(ts.test_id) as students_passed
from tests t
join test_scores ts 
on t.id = ts.test_id
join users u 
on u.id = ts.user_id
join batches b 
on b.id = t.batch_id
where ROUND(((CAST(ts.score AS decimal)/CAST(t.total_mark AS decimal))*100),2) >= 40
group by ts.test_id,b.name
),
total_test_givers AS
(
SELECT test_id, COUNT(1) AS total_students
FROM test_scores ts
GROUP BY test_id
)
SELECT  ttg.test_id, csp.batch, round((csp.students_passed::decimal/ttg.total_students::decimal)*100,2) as pass_percent
FROM count_students_passed csp
JOIN total_test_givers ttg
ON csp.test_id = ttg.test_id;

