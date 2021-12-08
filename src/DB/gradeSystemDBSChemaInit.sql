CREATE TABLE authentication (
	username VARCHAR(50), -- e.g. lecturer: ngoc.tranhong, assistant: trang.nguyenthithuy, student: 13013
	pw VARCHAR(50) NOT NULL,
    	full_name VARCHAR(100) NOT NULL,
	ssn VARCHAR(12),
    	date_of_birth DATE, -- format YYYY-MM-DD; when inserting, if using oracle DB, use to_date() func, if using mySQL use str_to_date() func
    	place_of_birth VARCHAR(150),
    	uniRole VARCHAR(50) NOT NULL, -- 3 types: lecturer, assistant, student
	CONSTRAINT authentication_pk PRIMARY KEY (username)
);

CREATE TABLE lecturer (
	username VARCHAR(50),
    	title VARCHAR(50) NOT NULL,
    	faculty VARCHAR(50) NOT NULL,
    	CONSTRAINT lecturer_pk PRIMARY KEY (username),
    	CONSTRAINT lecturer_authentication_username_fk FOREIGN KEY (username) REFERENCES authentication (username) ON DELETE CASCADE
);
-- one staff can be programm assistants for multiple programs, but one program has only one assistant
CREATE TABLE program_assistant (
	program VARCHAR(50),
    	faculty VARCHAR(50) NOT NULL,
    	assistant_username VARCHAR(50) NOT NULL,
    	CONSTRAINT program_assistant_pk PRIMARY KEY (program),
    	CONSTRAINT program_assistant_authencation_username_fk FOREIGN KEY (assistant_username) REFERENCES authentication (username) ON DELETE CASCADE
);

CREATE TABLE student (
	username VARCHAR(50),
    	program VARCHAR(50),
    	intake VARCHAR(10) NOT NULL, -- e.g. CSE2018, FA2019
    	CONSTRAINT student_pk PRIMARY KEY (username),
    	CONSTRAINT student_authentication_username_fk FOREIGN KEY (username) REFERENCES authentication (username) ON DELETE CASCADE,
    	CONSTRAINT student_program_assistant_fk FOREIGN KEY (program) REFERENCES program_assistant (program) ON DELETE SET NULL
);

CREATE TABLE course_description (
	course_id VARCHAR(20), -- e.g. CSEW2021M13 for Computer Science module 13 Java OOP 
    	course_name VARCHAR(100) NOT NULL,
    	program VARCHAR(50) NOT NULL,
    	lecturer_username VARCHAR(50) NOT NULL,
    	semester CHAR(6) NOT NULL, -- e.g. WS2021 or SS2016
    	total_students INT DEFAULT 0,
    	CONSTRAINT course_description_pk PRIMARY KEY (course_id),
    	CONSTRAINT course_descr_program_assistant_program_fk FOREIGN KEY (program) REFERENCES program_assistant (program) ON DELETE CASCADE,
    	CONSTRAINT course_descr_lecturer_username_fk FOREIGN KEY (lecturer_username) REFERENCES lecturer (username) ON DELETE CASCADE 
);

CREATE TABLE grade (
	course_id VARCHAR(20),
    	student_username VARCHAR(50),
    	grade NUMERIC(3, 1) NOT NULL,
    	CONSTRAINT grade_pk PRIMARY KEY (course_id, student_username),
    	CONSTRAINT grade_course_descr_course_id_fk FOREIGN KEY (course_id) REFERENCES course_description (course_id) ON DELETE CASCADE,
    	CONSTRAINT grade_student_username_fk FOREIGN KEY (student_username) REFERENCES student (username) ON DELETE CASCADE
);
