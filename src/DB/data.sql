/* insert data for appplication testing */
INSERT INTO authentication (username, pw, full_name, uniRole) VALUES ('ngoc.tranhong', 'cseLecturer1', 'Tran Hong Ngoc', 'lecturer');
INSERT INTO authentication (username, pw, full_name, uniRole) VALUES ('duc.nguyentuan', 'cseLecturer2', 'Nguyen Tuan Duc', 'lecturer');
INSERT INTO authentication (username, pw, full_name, uniRole) VALUES ('trang.nguyenthithuy', 'programAssistant', 'Nguyen Thi Thuy Trang', 'assistant');
INSERT INTO authentication (username, pw, full_name, ssn, place_of_birth, uniRole) VALUES ('11111', 'cseStudent1', 'Nguyen Van A', '111111111', 'Ha Noi', 'student');
INSERT INTO authentication (username, pw, full_name, ssn, date_of_birth, place_of_birth, uniRole) VALUES ('22222', 'cseStudent2', 'Tran Thi B', '222222222', str_to_date('2001-01-01', '%Y-%m-%d'), 'TP Ho Chi Minh', 'student');

INSERT INTO lecturer (username, title, faculty) VALUES ('ngoc.tranhong', 'Dr.', 'Engineering');
INSERT INTO lecturer (username, title, faculty) VALUES ('duc.nguyentuan', 'Dr.', 'Engineering');

INSERT INTO program_assistant (program, faculty, assistant_username) VALUES ('CSE', 'Engineering', 'trang.nguyenthithuy');
INSERT INTO program_assistant (program, faculty, assistant_username) VALUES ('MSST', 'Engineering', 'trang.nguyenthithuy');

INSERT INTO student (username, program, intake) VALUES ('11111', 'CSE', 'CS2018');
INSERT INTO student (username, program, intake) VALUES ('22222', 'CSE', 'CS2019');

INSERT INTO course_description (course_id, course_name, program, lecturer_username, semester, total_students) VALUES ('CSEW2021M13', 'OOP Programming with Java', 'CSE', 'ngoc.tranhong', 'WS2021', 2);
INSERT INTO course_description (course_id, course_name, program, lecturer_username, semester, total_students) VALUES ('CSEW2021M15', 'Computer Networks', 'CSE', 'duc.nguyentuan', 'WS2021', 2);
INSERT INTO course_description (course_id, course_name, program, lecturer_username, semester, total_students) VALUES ('CSEW2020M15', 'Computer Networks', 'CSE', 'duc.nguyentuan', 'WS2020', 1);

 
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2021M13', '11111', 4.5);
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2021M13', '22222', 9.5);
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2021M15', '11111', 7.5);
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2021M15', '22222', 6.5);
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2020M15', '11111', 2.5);
