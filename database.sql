-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- ------------------------------------------------------
-- Table: Authors
-- ------------------------------------------------------
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,         
    name VARCHAR(100) NOT NULL,                       
    email VARCHAR(100) UNIQUE                         
);

-- ------------------------------------------------------
-- Table: Books
-- ------------------------------------------------------
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,           
    title VARCHAR(150) NOT NULL,                      
    author_id INT NOT NULL,   
    published_year YEAR DEFAULT NULL,                  
    isbn VARCHAR(13) UNIQUE,                          
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE 
);

-- ------------------------------------------------------
-- Table: Members
-- ------------------------------------------------------
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,        
    full_name VARCHAR(100) NOT NULL,                  
    join_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,      
    email VARCHAR(100) UNIQUE                         
);

-- ------------------------------------------------------
-- Table: Loans
-- ------------------------------------------------------
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,         
    book_id INT NOT NULL,                             
    member_id INT NOT NULL,                           
    loan_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,      
    return_date DATE DEFAULT NULL,                    
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE, 
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
        ON DELETE CASCADE 
);

-- ------------------------------------------------------
-- Table: Staff
-- ------------------------------------------------------
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,          
    name VARCHAR(100) NOT NULL,                       
    role VARCHAR(50) DEFAULT 'Staff', 
    hire_date DATE DEFAULT CURRENT_TIMESTAMP               
);