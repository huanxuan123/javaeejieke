CREATE DATABASE IF NOT EXISTS library_system DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE library_system;

DROP TABLE IF EXISTS borrow_record;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS reader;
DROP TABLE IF EXISTS admin;

CREATE TABLE admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE reader (
    reader_id INT PRIMARY KEY AUTO_INCREMENT,
    student_no VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    phone VARCHAR(20),
    email VARCHAR(100),
    department VARCHAR(100),
    borrow_limit INT DEFAULT 5,
    borrowed_count INT DEFAULT 0,
    status TINYINT DEFAULT 1,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publisher VARCHAR(100),
    publish_date DATE,
    category VARCHAR(50),
    price DECIMAL(10,2),
    total_stock INT DEFAULT 1,
    available_stock INT DEFAULT 1,
    location VARCHAR(50),
    description TEXT,
    status TINYINT DEFAULT 1,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE borrow_record (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    borrow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    due_date DATETIME,
    return_date DATETIME,
    status TINYINT DEFAULT 1,
    remark VARCHAR(255),
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (reader_id) REFERENCES reader(reader_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO admin (username, password, name, phone) VALUES
('admin', 'admin123', 'Admin', '13800138000'),
('librarian', 'lib123', 'Librarian', '13800138001');

INSERT INTO reader (student_no, name, gender, phone, email, department, borrow_limit, borrowed_count, status) VALUES
('2021001', 'Zhang San', 'Male', '13900139001', 'zhangsan@example.com', 'Computer Science', 5, 0, 1),
('2021002', 'Li Si', 'Female', '13900139002', 'lisi@example.com', 'Software Engineering', 5, 0, 1),
('2021003', 'Wang Wu', 'Male', '13900139003', 'wangwu@example.com', 'Information Science', 5, 0, 1),
('2021004', 'Zhao Liu', 'Female', '13900139004', 'zhaoliu@example.com', 'Computer Science', 5, 0, 1),
('2021005', 'Qian Qi', 'Male', '13900139005', 'qianqi@example.com', 'Software Engineering', 5, 0, 1);

INSERT INTO book (isbn, title, author, publisher, publish_date, category, price, total_stock, available_stock, location, description, status) VALUES
('9787111213826', 'Java Programming', 'Bruce Eckel', 'Mechanical Industry Press', '2007-06-01', 'Programming', 108.00, 5, 5, 'A-01-01', 'Java classic textbook', 1),
('9787111544937', 'Deep Understanding of JVM', 'Zhou Zhiming', 'Mechanical Industry Press', '2016-08-01', 'Programming', 89.00, 3, 3, 'A-01-02', 'JVM deep analysis', 1),
('9787115428028', 'Introduction to Algorithms', 'Thomas H. Cormen', 'People''s Posts and Telecommunications Press', '2013-01-01', 'Algorithm', 128.00, 4, 4, 'A-02-01', 'Algorithm classic textbook', 1),
('9787115279460', 'Design Patterns', 'Erich Gamma', 'Mechanical Industry Press', '2010-09-01', 'Software Engineering', 55.00, 3, 3, 'A-02-02', 'Design patterns classic', 1),
('9787115281807', 'Refactoring', 'Martin Fowler', 'People''s Posts and Telecommunications Press', '2010-03-01', 'Software Engineering', 69.00, 2, 2, 'A-02-03', 'Code refactoring guide', 1),
('9787115427397', 'Spring in Action', 'Craig Walls', 'People''s Posts and Telecommunications Press', '2016-04-01', 'Framework', 89.00, 4, 4, 'A-03-01', 'Spring framework practice', 1),
('9787115428042', 'MyBatis from Entry to Mastery', 'Liu Zenghui', 'Electronic Industry Press', '2016-11-01', 'Framework', 79.00, 3, 3, 'A-03-02', 'MyBatis detailed', 1),
('9787115428288', 'MySQL Must Know', 'Ben Forta', 'People''s Posts and Telecommunications Press', '2018-01-01', 'Database', 59.00, 5, 5, 'B-01-01', 'MySQL introduction', 1),
('9787115428035', 'Data Structures and Algorithms', 'Mark Allen Weiss', 'Electronic Industry Press', '2017-03-01', 'Algorithm', 75.00, 3, 3, 'A-02-04', 'Data structures', 1),
('9787115428295', 'Computer Networks', 'Xie Xiren', 'Electronic Industry Press', '2017-01-01', 'Network', 65.00, 4, 4, 'B-02-01', 'Computer network basics', 1);

INSERT INTO borrow_record (book_id, reader_id, borrow_date, due_date, return_date, status, remark) VALUES
(1, 1, '2024-01-01 10:00:00', '2024-01-15 10:00:00', '2024-01-14 15:30:00', 2, 'Returned'),
(2, 1, '2024-01-05 09:00:00', '2024-01-19 09:00:00', NULL, 1, 'Borrowing'),
(3, 2, '2024-01-02 14:00:00', '2024-01-16 14:00:00', '2024-01-16 10:00:00', 2, 'Returned'),
(5, 2, '2024-01-08 11:00:00', '2024-01-22 11:00:00', NULL, 1, 'Borrowing'),
(6, 3, '2024-01-03 16:00:00', '2024-01-17 16:00:00', '2024-01-17 09:00:00', 2, 'Returned'),
(8, 3, '2024-01-10 13:00:00', '2024-01-24 13:00:00', NULL, 1, 'Borrowing');

UPDATE book SET available_stock = total_stock - (SELECT COUNT(*) FROM borrow_record WHERE book_id = book.book_id AND status = 1);

UPDATE reader SET borrowed_count = (SELECT COUNT(*) FROM borrow_record WHERE reader_id = reader.reader_id AND status = 1);

SHOW TABLES;
