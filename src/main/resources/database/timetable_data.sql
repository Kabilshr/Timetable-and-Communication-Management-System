-- =========================================
-- GENERATED TIMETABLE DATA
-- =========================================

-- =========================================
-- INSERT TEACHER USERS
-- =========================================
INSERT INTO users (name, email, password, role) VALUES ('Mr. Aadesh Tandukar', 'mr.aadesh.tandukar@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Aaditya Khwakhwali', 'mr.aaditya.khwakhwali@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Alish KC', 'mr.alish.kc@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Anil Kumar Yadav', 'mr.anil.kumar.yadav@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Anuj Shilpakar', 'mr.anuj.shilpakar@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Dibesh Maskey', 'mr.dibesh.maskey@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Dip Parajuli', 'mr.dip.parajuli@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Dipesh Raj Adhikari', 'mr.dipesh.raj.adhikari@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Ganesh Subedi', 'mr.ganesh.subedi@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Gyanendra Maharjan', 'mr.gyanendra.maharjan@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Indra Prasad Dhakal', 'mr.indra.prasad.dhakal@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Ishan Singh Thakuri', 'mr.ishan.singh.thakuri@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Jaganath Paudyal', 'mr.jaganath.paudyal@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Mahotsav Bhattarai', 'mr.mahotsav.bhattarai@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Mukesh Regmi', 'mr.mukesh.regmi@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Nischal Pradhan', 'mr.nischal.pradhan@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Nishan Paudel', 'mr.nishan.paudel@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Prashant Lal Shrestha', 'mr.prashant.lal.shrestha@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Prashant Pudasaini', 'mr.prashant.pudasaini@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Roshan Shrestha', 'mr.roshan.shrestha@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Rubin Thapa', 'mr.rubin.thapa@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Sanjeep Lama', 'mr.sanjeep.lama@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Srijan Bhandari', 'mr.srijan.bhandari@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Subarna Sapkota', 'mr.subarna.sapkota@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Subash Sharma', 'mr.subash.sharma@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Sudip Dahal', 'mr.sudip.dahal@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Sugam Giri', 'mr.sugam.giri@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Mr. Swarnim Pravidhi Chaulagain', 'mr.swarnim.pravidhi.chaulagain@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Ms. Arati Shilpakar', 'ms.arati.shilpakar@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Ms. Astha Sharma', 'ms.astha.sharma@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Ms. Rabina Lama', 'ms.rabina.lama@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO users (name, email, password, role) VALUES ('Ms. Somia Dahal', 'ms.somia.dahal@school.com', 'password123', 'Teacher') ON DUPLICATE KEY UPDATE name = VALUES(name);

-- =========================================
-- INSERT TEACHERS
-- =========================================
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Aadesh Tandukar' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Aaditya Khwakhwali' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Alish KC' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Anil Kumar Yadav' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Anuj Shilpakar' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Dibesh Maskey' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Dip Parajuli' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Dipesh Raj Adhikari' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Ganesh Subedi' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Gyanendra Maharjan' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Indra Prasad Dhakal' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Ishan Singh Thakuri' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Jaganath Paudyal' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Mahotsav Bhattarai' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Mukesh Regmi' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Nischal Pradhan' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Nishan Paudel' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Prashant Lal Shrestha' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Prashant Pudasaini' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Roshan Shrestha' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Rubin Thapa' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Sanjeep Lama' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Srijan Bhandari' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Subarna Sapkota' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Subash Sharma' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Sudip Dahal' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Sugam Giri' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Mr. Swarnim Pravidhi Chaulagain' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Ms. Arati Shilpakar' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Ms. Astha Sharma' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Ms. Rabina Lama' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);
INSERT INTO teachers (user_id) SELECT user_id FROM users WHERE name = 'Ms. Somia Dahal' AND NOT EXISTS (SELECT 1 FROM teachers t WHERE t.user_id = users.user_id);

-- =========================================
-- INSERT MODULES
-- =========================================
INSERT INTO modules (module_code, module_title) VALUES ('CC5009NI', 'CC5009NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CC5061NI', 'CC5061NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CC5067NI', 'CC5067NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CC5068NI', 'CC5068NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CS5002NI', 'CS5002NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CS5003NI', 'CS5003NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CS5054NI', 'CS5054NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CS5071NI', 'CS5071NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CT5009NI', 'CT5009NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CU5004NI', 'CU5004NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CU5007NI', 'CU5007NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('CU5008NI', 'CU5008NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('MA5053NI', 'MA5053NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);
INSERT INTO modules (module_code, module_title) VALUES ('SM5024NI', 'SM5024NI') ON DUPLICATE KEY UPDATE module_title = VALUES(module_title);

-- =========================================
-- INSERT SECTIONS
-- =========================================
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C1') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C10') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C11') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C2') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C3') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C4') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C5') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C6') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C7') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C8') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 1', 'C9') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'AI1') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'AI2') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'AI3') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'AI4') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'AI5') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'AI6') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'M1') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'M2') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'M3') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'M4') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N1') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N2') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N3') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N4') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N5') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N6') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N7') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N8') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);
INSERT INTO sections (year, section_name) VALUES ('Year 2', 'N9') ON DUPLICATE KEY UPDATE section_name = VALUES(section_name);

-- =========================================
-- INSERT TIMETABLE ENTRIES
-- =========================================

-- Timetable Entry 1
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 2
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'Lab 12 - Sushant Hona', 'Skill');

-- Timetable Entry 3
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'Lab 11 - Suvan Thapa Magar', 'Skill');

-- Timetable Entry 4
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '10:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 5
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '10:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 6
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'Lab 11 - Suvan Thapa Magar', 'Skill');

-- Timetable Entry 7
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 8
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'Lab 09 - Sheneeza Chaudhary', 'Skill');

-- Timetable Entry 9
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'Lab 12 - Sushant Hona', 'Skill');

-- Timetable Entry 10
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 11
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 12
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 13
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mahotsav Bhattarai' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'Lab 11 - Suvan Thapa Magar', 'Skill');

-- Timetable Entry 14
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'Lab 08 - Ronisha Shrestha', 'Skill');

-- Timetable Entry 15
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '12:00:00', '14:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 16
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '13:00:00', '15:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'Lab 09 - Sheneeza Chaudhary', 'Skill');

-- Timetable Entry 17
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '14:00:00', '16:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 18
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '14:00:00', '16:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 19
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '14:00:00', '16:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 20
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '14:30:00', '16:30:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 21
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '08:00:00', '10:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 22
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '08:00:00', '10:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 23
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'SR02 - Trafalgar Square', 'London');

-- Timetable Entry 24
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'Lab 09 - Sheneeza Chaudhary', 'Skill');

-- Timetable Entry 25
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'Lab 10 - Jeevan Khatiwada', 'Skill');

-- Timetable Entry 26
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'Lab 11 - Suvan Thapa Magar', 'Skill');

-- Timetable Entry 27
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '11:00:00', '13:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'SR02 - Trafalgar Square', 'London');

-- Timetable Entry 28
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '11:00:00', '13:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'Lab 08 - Ronisha Shrestha', 'Skill');

-- Timetable Entry 29
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '11:00:00', '13:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 30
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 31
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 32
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'Lab 10 - Jeevan Khatiwada', 'Skill');

-- Timetable Entry 33
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'Lab 11 - Suvan Thapa Magar', 'Skill');

-- Timetable Entry 34
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mahotsav Bhattarai' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'Lab 12 - Sushant Hona', 'Skill');

-- Timetable Entry 35
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '14:00:00', '16:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'TR15 - Sarad Paudel', 'Skill');

-- Timetable Entry 36
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '14:00:00', '16:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'Lab 10 - Jeevan Khatiwada', 'Skill');

-- Timetable Entry 37
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '14:30:00', '16:30:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 38
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '14:30:00', '16:30:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 39
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 40
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 41
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 42
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 43
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 44
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 45
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 46
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 47
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 48
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 49
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 50
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 51
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 52
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 53
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 54
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 55
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '15:00:00', '16:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 56
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '15:00:00', '16:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 57
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '15:00:00', '16:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 58
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '15:00:00', '16:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 59
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '15:00:00', '16:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 60
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '15:00:00', '16:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 61
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 62
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 63
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 64
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 65
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '09:30:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 66
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '09:30:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 67
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:00:00', '11:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 68
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:00:00', '11:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 69
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:00:00', '11:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 70
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:00:00', '11:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 71
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:00:00', '11:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 72
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:00:00', '11:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 73
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:30:00', '14:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 74
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:30:00', '14:00:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 75
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '13:00:00', '14:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 76
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '13:00:00', '14:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 77
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '13:00:00', '14:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 78
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '13:00:00', '14:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 79
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '13:00:00', '14:30:00', 'Lecture', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 80
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '15:00:00', '16:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 81
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '15:00:00', '16:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 82
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '15:00:00', '16:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 83
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '15:00:00', '16:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 84
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '15:00:00', '16:30:00', 'Lecture', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 85
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '07:00:00', '09:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 86
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '07:00:00', '09:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'Lab 01 - Aayesha Nakarmi', 'Skill');

-- Timetable Entry 87
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'TR15 - Sarad Paudel', 'Skill');

-- Timetable Entry 88
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 89
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 90
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'TR08 - Sagarmatha', 'Nepal');

-- Timetable Entry 91
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'LT06 - Chhitesh Lal Shrestha', 'Alumni');

-- Timetable Entry 92
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 93
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 94
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 95
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 96
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 97
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 98
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 99
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mahotsav Bhattarai' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'SR07 - Sujan Khadgi', 'Alumni');

-- Timetable Entry 100
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 101
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 102
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 103
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'TR08 - Sagarmatha', 'Nepal');

-- Timetable Entry 104
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mahotsav Bhattarai' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'SR07 - Sujan Khadgi', 'Alumni');

-- Timetable Entry 105
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 106
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 107
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'TR08 - Sagarmatha', 'Nepal');

-- Timetable Entry 108
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '14:00:00', '15:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 109
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '14:00:00', '15:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'SR07 - Sujan Khadgi', 'Alumni');

-- Timetable Entry 110
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '15:00:00', '16:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 111
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '07:00:00', '08:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 112
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '07:00:00', '09:00:00', 'Workshop', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 113
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '08:00:00', '10:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aaditya Khwakhwali' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 114
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C7' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 115
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Mukesh Regmi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 116
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'SR07 - Sujan Khadgi', 'Alumni');

-- Timetable Entry 117
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'SR02 - Trafalgar Square', 'London');

-- Timetable Entry 118
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C9' LIMIT 1), 'LT08 - Naresh Lamgade', 'Alumni');

-- Timetable Entry 119
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:30:00', '11:30:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Rabina Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 120
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Alish KC' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C3' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 121
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '13:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 122
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'SR07 - Sujan Khadgi', 'Alumni');

-- Timetable Entry 123
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C1' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 124
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C8' LIMIT 1), 'SR01 - Tower Bridge', 'London');

-- Timetable Entry 125
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CC5067NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C4' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 126
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 127
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '13:00:00', '15:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Astha Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C5' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 128
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '13:00:00', '14:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 129
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '13:00:00', '14:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C2' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 130
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '14:00:00', '15:00:00', 'Tutorial', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C10' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 131
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:00:00', '11:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sanjeep Lama' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C11' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 132
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '15:00:00', '17:00:00', 'Workshop', 'CS5054NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nishan Paudel' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 1' AND section_name = 'C6' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 133
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Pudasaini' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 134
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'Lab 08 - Ronisha Shrestha', 'Skill');

-- Timetable Entry 135
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '10:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'TR08 - Sagarmatha', 'Nepal');

-- Timetable Entry 136
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'TR15 - Sarad Paudel', 'Skill');

-- Timetable Entry 137
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'Lab 08 - Ronisha Shrestha', 'Skill');

-- Timetable Entry 138
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Srijan Bhandari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 139
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 140
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subash Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 141
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 142
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 143
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 144
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'Lab 03 - Lasata Maharjan', 'Skill');

-- Timetable Entry 145
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '13:00:00', '15:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 146
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '13:00:00', '15:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 147
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '13:00:00', '15:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'Lab 08 - Ronisha Shrestha', 'Skill');

-- Timetable Entry 148
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '14:00:00', '16:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 149
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '07:00:00', '09:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 150
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'SR01 - Tower Bridge', 'London');

-- Timetable Entry 151
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 152
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 153
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 154
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subash Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'Lab 08 - Ronisha Shrestha', 'Skill');

-- Timetable Entry 155
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '10:00:00', '12:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 156
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '11:00:00', '13:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'SR01 - Tower Bridge', 'London');

-- Timetable Entry 157
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '11:00:00', '13:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subash Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'Lab 01 - Aayesha Nakarmi', 'Skill');

-- Timetable Entry 158
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 159
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 160
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 161
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Pudasaini' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'Lab 03 - Lasata Maharjan', 'Skill');

-- Timetable Entry 162
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'Lab 04 - Kshitiz Shrestha', 'Skill');

-- Timetable Entry 163
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '13:00:00', '15:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'SR01 - Tower Bridge', 'London');

-- Timetable Entry 164
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '14:00:00', '16:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 165
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '14:00:00', '16:00:00', 'Workshop', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'Lab 02 - Ams Ghimire', 'Skill');

-- Timetable Entry 166
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 167
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 168
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 169
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 170
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 171
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 172
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 173
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 174
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '10:00:00', '11:30:00', 'Lecture', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Aadesh Tandukar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 175
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 176
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 177
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 178
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 179
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 180
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 181
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 182
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 183
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '13:00:00', '14:30:00', 'Lecture', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 184
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 185
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 186
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 187
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 188
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 189
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 190
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 191
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 192
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '08:30:00', '10:00:00', 'Lecture', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 193
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 194
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 195
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 196
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 197
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 198
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 199
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 200
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 201
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:30:00', '13:00:00', 'Lecture', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'Hall - 01', 'Kumari');

-- Timetable Entry 202
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '08:00:00', '09:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Srijan Bhandari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 203
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 204
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 205
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 206
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 207
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 208
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 209
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Pudasaini' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 210
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 211
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 212
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 213
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 214
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 215
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 216
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 217
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 218
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 219
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 220
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subash Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'TR06 - Annapurna', 'Nepal');

-- Timetable Entry 221
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '14:00:00', '15:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 222
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '07:00:00', '09:00:00', 'Workshop', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'Lab 09 - Sheneeza Chaudhary', 'Skill');

-- Timetable Entry 223
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '08:00:00', '10:00:00', 'Workshop', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 224
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'SR04 - Tower of London', 'London');

-- Timetable Entry 225
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '11:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Lal Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'TR15 - Sarad Paudel', 'Skill');

-- Timetable Entry 226
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '11:00:00', 'Workshop', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 227
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:00:00', '11:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N6' LIMIT 1), 'SR04 - Tower of London', 'London');

-- Timetable Entry 228
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:00:00', '11:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ganesh Subedi' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N3' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 229
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:30:00', '11:30:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subash Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 230
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 231
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 232
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N8' LIMIT 1), 'SR01 - Tower Bridge', 'London');

-- Timetable Entry 233
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N4' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 234
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Somia Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N2' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 235
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sugam Giri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 236
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CT5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Prashant Pudasaini' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N1' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 237
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subash Sharma' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N9' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 238
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '13:00:00', '14:00:00', 'Tutorial', 'CS5071NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Nischal Pradhan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'SR04 - Tower of London', 'London');

-- Timetable Entry 239
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '13:00:00', '14:00:00', 'Tutorial', 'CC5068NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Jaganath Paudyal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N5' LIMIT 1), 'SR06 - Abhash Bikram Thapa', 'Alumni');

-- Timetable Entry 240
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '14:00:00', '15:00:00', 'Tutorial', 'CC5009NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anuj Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'N7' LIMIT 1), 'SR04 - Tower of London', 'London');

-- Timetable Entry 241
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'Lab 07 - Sonik Das Mulmi', 'Skill');

-- Timetable Entry 242
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '08:00:00', '10:00:00', 'Workshop', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 243
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 244
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'Lab 07 - Sonik Das Mulmi', 'Skill');

-- Timetable Entry 245
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '11:00:00', '13:00:00', 'Workshop', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'Lab 05 - Sahas Shakya', 'Skill');

-- Timetable Entry 246
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '12:00:00', '14:00:00', 'Workshop', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 247
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '13:00:00', '15:00:00', 'Workshop', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'Lab 05 - Sahas Shakya', 'Skill');

-- Timetable Entry 248
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '14:30:00', '16:30:00', 'Workshop', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Swarnim Pravidhi Chaulagain' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 249
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '08:00:00', '10:00:00', 'Workshop', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'Lab 07 - Sonik Das Mulmi', 'Skill');

-- Timetable Entry 250
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'Lab 05 - Sahas Shakya', 'Skill');

-- Timetable Entry 251
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '10:00:00', '12:00:00', 'Workshop', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 252
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '10:00:00', '12:00:00', 'Workshop', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'Lab 07 - Sonik Das Mulmi', 'Skill');

-- Timetable Entry 253
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '11:00:00', '13:00:00', 'Workshop', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dip Parajuli' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'Lab 05 - Sahas Shakya', 'Skill');

-- Timetable Entry 254
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Swarnim Pravidhi Chaulagain' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'Lab 06 - Aashima Chalise', 'Skill');

-- Timetable Entry 255
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '13:00:00', '15:00:00', 'Workshop', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'Lab 05 - Sahas Shakya', 'Skill');

-- Timetable Entry 256
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '13:00:00', '15:00:00', 'Workshop', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'Lab 07 - Sonik Das Mulmi', 'Skill');

-- Timetable Entry 257
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '07:00:00', '08:30:00', 'Lecture', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 258
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '07:00:00', '08:30:00', 'Lecture', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 259
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '07:00:00', '08:30:00', 'Lecture', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 260
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '07:00:00', '08:30:00', 'Lecture', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 261
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '09:30:00', '11:00:00', 'Lecture', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 262
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '09:30:00', '11:00:00', 'Lecture', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 263
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '09:30:00', '11:00:00', 'Lecture', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 264
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '09:30:00', '11:00:00', 'Lecture', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 265
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 266
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 267
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 268
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:00:00', '08:30:00', 'Lecture', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 269
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:30:00', '11:00:00', 'Lecture', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 270
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:30:00', '11:00:00', 'Lecture', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 271
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:30:00', '11:00:00', 'Lecture', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 272
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:30:00', '11:00:00', 'Lecture', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 273
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Swarnim Pravidhi Chaulagain' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 274
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 275
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 276
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 277
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'LT05 - Amir Khadka', 'Alumni');

-- Timetable Entry 278
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 279
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 280
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'SR08 - Sajiya Gurung', 'Alumni');

-- Timetable Entry 281
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Ms. Arati Shilpakar' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 282
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:00:00', '11:00:00', 'Tutorial', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M3' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 283
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:00:00', '11:00:00', 'Tutorial', 'CU5008NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dip Parajuli' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'SR07 - Sujan Khadgi', 'Alumni');

-- Timetable Entry 284
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:00:00', '11:00:00', 'Tutorial', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 285
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dibesh Maskey' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M1' LIMIT 1), 'SR09 - Simran Bhattarai', 'Alumni');

-- Timetable Entry 286
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'SM5024NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Anil Kumar Yadav' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 287
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CU5007NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Gyanendra Maharjan' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M4' LIMIT 1), 'SR02 - Trafalgar Square', 'London');

-- Timetable Entry 288
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:00:00', '13:00:00', 'Tutorial', 'CU5004NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Swarnim Pravidhi Chaulagain' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'M2' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 289
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '07:00:00', '09:00:00', 'Workshop', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'TR08 - Sagarmatha', 'Nepal');

-- Timetable Entry 290
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '08:00:00', '09:00:00', 'Tutorial', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 291
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dipesh Raj Adhikari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'TR14 - Prashidika Tiwari', 'Skill');

-- Timetable Entry 292
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 293
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'SR02 - Trafalgar Square', 'London');

-- Timetable Entry 294
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 295
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '10:00:00', '12:00:00', 'Workshop', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'LT02 - Kensington Palace', 'London');

-- Timetable Entry 296
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'LT01 - Buckingham Palace', 'London');

-- Timetable Entry 297
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '12:00:00', '14:00:00', 'Workshop', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 298
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '13:00:00', '15:00:00', 'Workshop', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'SR01 - Tower Bridge', 'London');

-- Timetable Entry 299
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('SUN', '12:00:00', '14:00:00', 'Workshop', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'SR04 - Tower of London', 'London');

-- Timetable Entry 300
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '07:00:00', '09:00:00', 'Workshop', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 301
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 302
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dipesh Raj Adhikari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 303
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '09:00:00', '11:00:00', 'Workshop', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 304
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '10:00:00', '12:00:00', 'Workshop', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 305
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dipesh Raj Adhikari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'SR03 - Piccadilly Circus', 'London');

-- Timetable Entry 306
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'SR10 - Samir Gautam', 'Alumni');

-- Timetable Entry 307
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR16 - Prashraya Thapa', 'Skill');

-- Timetable Entry 308
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('MON', '12:00:00', '14:00:00', 'Workshop', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'TR17 - Raj Bikram Shrestha', 'Skill');

-- Timetable Entry 309
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 310
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 311
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 312
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 313
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 314
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '08:30:00', '10:00:00', 'Lecture', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Roshan Shrestha' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 315
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 316
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 317
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 318
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 319
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 320
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('TUE', '11:30:00', '13:00:00', 'Lecture', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 321
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '07:30:00', '08:30:00', 'Tutorial', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 322
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:00:00', '10:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 323
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:00:00', '10:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 324
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:00:00', '10:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 325
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:00:00', '10:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 326
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:00:00', '10:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 327
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '09:00:00', '10:30:00', 'Lecture', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 328
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '10:30:00', '11:30:00', 'Tutorial', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'LT04 - Tridev Gurung', 'Alumni');

-- Timetable Entry 329
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '11:00:00', '12:00:00', 'Tutorial', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 330
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:00:00', '13:30:00', 'Lecture', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 331
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:00:00', '13:30:00', 'Lecture', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 332
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:00:00', '13:30:00', 'Lecture', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 333
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:00:00', '13:30:00', 'Lecture', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 334
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:00:00', '13:30:00', 'Lecture', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 335
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '12:00:00', '13:30:00', 'Lecture', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'Hall - 02', 'Kumari');

-- Timetable Entry 336
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('WED', '13:30:00', '14:30:00', 'Tutorial', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'SR05 - Rotash Shrestha', 'Alumni');

-- Timetable Entry 337
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 338
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 339
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '09:00:00', '10:00:00', 'Tutorial', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 340
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 341
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 342
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Ishan Singh Thakuri' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 343
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '10:00:00', '11:00:00', 'Tutorial', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 344
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dipesh Raj Adhikari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 345
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '11:00:00', '12:00:00', 'Tutorial', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 346
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 347
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '12:00:00', '13:00:00', 'Tutorial', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 348
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('THU', '13:00:00', '14:00:00', 'Tutorial', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 349
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '07:00:00', '09:00:00', 'Workshop', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 350
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '07:00:00', '09:00:00', 'Workshop', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 351
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '08:30:00', '10:30:00', 'Workshop', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 352
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '10:30:00', '11:30:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Rubin Thapa' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 353
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI5' LIMIT 1), 'TR04 - Lumbini', 'Nepal');

-- Timetable Entry 354
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dipesh Raj Adhikari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI2' LIMIT 1), 'TR05 - Machapuchare', 'Nepal');

-- Timetable Entry 355
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '12:30:00', '13:30:00', 'Tutorial', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI6' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 356
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '09:00:00', '10:00:00', 'Tutorial', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'TR07 - Kanchanjunga', 'Nepal');

-- Timetable Entry 357
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '13:00:00', 'Workshop', 'MA5053NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Indra Prasad Dhakal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI4' LIMIT 1), 'TR02 - Patan', 'Nepal');

-- Timetable Entry 358
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:00:00', '12:00:00', 'Tutorial', 'CS5002NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Dipesh Raj Adhikari' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'TR03 - Pokhara', 'Nepal');

-- Timetable Entry 359
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '11:30:00', '12:30:00', 'Tutorial', 'CS5003NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Sudip Dahal' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI3' LIMIT 1), 'TR01 - Kantipur', 'Nepal');

-- Timetable Entry 360
INSERT INTO timetable (day, start_time, end_time, class_type, module_code, lecturer_id, section_id, room, block) VALUES ('FRI', '13:00:00', '15:00:00', 'Workshop', 'CC5061NI', (SELECT t.teacher_id FROM teachers t JOIN users u ON t.user_id = u.user_id WHERE u.name = 'Mr. Subarna Sapkota' LIMIT 1), (SELECT section_id FROM sections WHERE year = 'Year 2' AND section_name = 'AI1' LIMIT 1), 'TR03 - Pokhara', 'Nepal');