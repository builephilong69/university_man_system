/* insert data for appplication testing */
INSERT INTO authentication (username, pw, full_name, uniRole) VALUES ('ngoc.tranhong', 'cseLecturer', 'Tran Hong Ngoc', 'lecturer');
INSERT INTO authentication (username, pw, full_name, uniRole) VALUES ('duc.nguyentuan', 'cseLecturer', 'Nguyen Tuan Duc', 'lecturer');
INSERT INTO authentication (username, pw, full_name, uniRole) VALUES ('trang.nguyenthithuy', 'programAssitant', 'Nguyen Thi Thuy Trang', 'assistant');
INSERT INTO authentication (username, pw, full_name, ssn, place_of_birth, uniRole) VALUES ('13013', 'cseStudent', 'Bui Nguyen Mai Truc', '111111111', 'Quang Ngai', 'student');
INSERT INTO authentication (username, pw, full_name, ssn, date_of_birth, place_of_birth, uniRole) VALUES ('16619', 'cseStudent', 'Bui Le Phi Long', '222222222', str_to_date('2001-01-01', '%Y-%m-%d'), 'Ba Ria - Vung Tau', 'student');

INSERT INTO lecturer (username, title, faculty) VALUES ('ngoc.tranhong', 'Dr.', 'Engineering');
INSERT INTO lecturer (username, title, faculty) VALUES ('duc.nguyentuan', 'Dr.', 'Engineering');

INSERT INTO program_assistant (program, faculty, assistant_username) VALUES ('CSE', 'Engineering', 'trang.nguyenthithuy');
INSERT INTO program_assistant (program, faculty, assistant_username) VALUES ('MSST', 'Engineering', 'trang.nguyenthithuy');

INSERT INTO student (username, program, intake) VALUES ('13013', 'CSE', 'CS2017');
INSERT INTO student (username, program, intake) VALUES ('16619', 'CSE', 'CS2019');

INSERT INTO course_description (course_id, course_name, program, lecturer_username, semester, total_students) VALUES ('CSEW2021M13', 'Introduction to OOP - Java Programming', 'CSE', 'ngoc.tranhong', 'WS2021', 2);
 
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2021M13', '13013', 4.5);
INSERT INTO grade (course_id, student_username, grade) VALUES ('CSEW2021M13', '16619', 9.5);
