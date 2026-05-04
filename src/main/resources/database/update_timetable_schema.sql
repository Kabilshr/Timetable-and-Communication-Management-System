-- Migration script to update timetable table for JSON upload support
ALTER TABLE timetable DROP COLUMN teacher_name;
ALTER TABLE timetable DROP COLUMN class_time;

ALTER TABLE timetable ADD COLUMN teacher_id INT;
ALTER TABLE timetable ADD COLUMN start_time TIME;
ALTER TABLE timetable ADD COLUMN end_time TIME;

-- Optional: Add foreign key constraint
-- ALTER TABLE timetable ADD CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);
