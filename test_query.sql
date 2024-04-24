-- Users
CREATE TABLE users (
    userid INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    useremail VARCHAR(100),
    batchid INTEGER
);

INSERT INTO users(username, useremail, batchid) VALUES
    ('Santhosh', 'santhosh@gmail.com', 50),
    ('Shiyam', 'shiyam@gmail.com', 9),
    ('Surya', 'surya@gmail.com', 60),
    ('Muhib', 'muhib@gmail.com', 51);


-- Codekata
CREATE TABLE codekata (
    userid INTEGER PRIMARY KEY,
    number_of_problems_solved INTEGER,
    FOREIGN KEY (userid) REFERENCES users(userid)
);

INSERT INTO codekata(userid, number_of_problems_solved) VALUES
    (1, 98),
    (2, 99),
    (3, 98),
    (4, 95);


-- Company drives
CREATE TABLE company_drives (
    driveid INTEGER AUTO_INCREMENT PRIMARY KEY,
    userid INTEGER,
    drive_date DATE,
    company VARCHAR(100),
    FOREIGN KEY (userid) REFERENCES users(userid)
);

INSERT INTO company_drives(userid, drive_date, company) VALUES
    (2, '2024-01-05', 'Apple'),
    (3, '2024-05-19', 'Amazon'),
    (4, '2024-06-29', 'Zomato'),
    (1, '2024-09-01', 'Flipkart');


-- Mentors
CREATE TABLE mentors (
    mentorid INTEGER AUTO_INCREMENT PRIMARY KEY,
    mentorname VARCHAR(100),
    mentoremail VARCHAR(100)
);

INSERT INTO mentors(mentorname, mentoremail) VALUES
    ('SuryaKumar', 'suryakumar@gmail.com'),
    ('Vijay', 'Vijay@gmail.com'),
    ('Shaikh', 'shaikh@gmail.com'),
    ('prabha', 'prabha@gmail.com');


-- Topics
CREATE TABLE topics (
    topicid INTEGER AUTO_INCREMENT PRIMARY KEY,
    topic VARCHAR(200),
    topic_date DATE,
    mentorid INTEGER,
    batchid INTEGER,
    FOREIGN KEY (mentorid) REFERENCES mentors(mentorid)
);

INSERT INTO topics(topic, topic_date, mentorid, batchid) VALUES
    ('HTML - Basics', '2024-04-01', 1, 50),
    ('NodeJS - Basics', '2024-06-03', 2, 9),
    ('JavaScript - Basics', '2024-07-05', 3, 60),
    ('React - Basics', '2024-08-06', 4, 51);

    
-- Tasks
CREATE TABLE tasks (
    taskid INTEGER AUTO_INCREMENT PRIMARY KEY,
    topicid INTEGER,
    task VARCHAR(1000),
    batchid INTEGER,
    FOREIGN KEY (topicid) REFERENCES topics(topicid)
);

INSERT INTO tasks(topicid, task, batchid) VALUES
    (1, 'HTML Task', 50),
    (2, 'Javascript Task', 9),
    (3, 'React Task', 60),
    (4, 'NodeJs Task', 51);
    

-- Attendance
CREATE TABLE attendance (
    attendanceid INTEGER AUTO_INCREMENT PRIMARY KEY,
    userid INTEGER,
    topicid INTEGER,
    attended BOOLEAN,
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (topicid) REFERENCES topics(topicid)
);

INSERT INTO attendance(userid, topicid, attended) VALUES
    (2, 3, 1),
    (4, 1, 1),
    (1, 2, 0),
    (3, 4, 1);

    
-- Queries
CREATE TABLE queries (
    queryid INTEGER AUTO_INCREMENT PRIMARY KEY,
    userid INTEGER,
    querybody VARCHAR(1000),
    mentorid INTEGER,
    FOREIGN KEY (userid) REFERENCES users(userid),
    FOREIGN KEY (mentorid) REFERENCES mentors(mentorid)
);

INSERT INTO queries(userid, querybody, mentorid) VALUES
    (1, 'query about HTML', 1),
    (3, 'query about Javascript', 3),
    (2, 'query about React', 4),
    (4, 'query about DS', 2);  

-- Check Tables
SHOW TABLES;

-- Check Data
SELECT * FROM users;
SELECT * FROM codekata;
SELECT * FROM company_drives;
SELECT * FROM mentors;
SELECT * FROM topics;
SELECT * FROM tasks;
SELECT * FROM attendance;
SELECT * FROM queries;

-- Check Relationships
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_NAME IN ('codekata', 'company_drives', 'topics', 'tasks', 'attendance', 'queries');
