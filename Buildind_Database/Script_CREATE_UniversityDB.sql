--------------Create the database---------------
USE master ;
DROP DATABASE IF EXISTS UniversityDB;
GO
CREATE DATABASE UniversityDB;
GO

------------------ Use the database -------------------
USE UniversityDB;
GO
--------------------- Create the Schemas----------------------

CREATE SCHEMA STG ; ---for Data Source

CREATE SCHEMA Students; -- Student
CREATE SCHEMA Feedback; --Feedback_Questions, Feedback_Student
CREATE SCHEMA HumanResources; -- Departmant, Instructor
CREATE SCHEMA Cources; --Cource , program, Student_Cource

GO
------------------------- Count Table = 8 ----------------
-------------------------------------------------------------
-------------------- Create Department table----------------
CREATE TABLE HumanResources.Department (
    DID INT IDENTITY(1,1), -- Primary Key constraint
    Dname NVARCHAR(100) NOT NULL, 
	CONSTRAINT PK_Department_DID PRIMARY KEY (DID)
);
GO


-------------- Create Program table ------------------
CREATE TABLE Students.Program (
    PID INT IDENTITY(100,1),
    Department NVARCHAR(100) NOT NULL,
    Specialization NVARCHAR(100) NOT NULL,
    PDescription NVARCHAR(255),
	CONSTRAINT PK_Program_PID PRIMARY KEY (PID)
);
GO

-------------- Create Student table ----------------------
CREATE TABLE Students.Student (
    S_ID INT ,
    Sname NVARCHAR(100) NOT NULL,
    Semail NVARCHAR(100) NOT NULL UNIQUE,
    SStatus NVARCHAR(20) NOT NULL,
    Slevel CHAR NOT NULL,       
    PID INT NOT NULL,
	CONSTRAINT PK_Student_S_ID PRIMARY KEY (S_ID), -- Primary Key constraint
    CONSTRAINT FK_Student_Program FOREIGN KEY (PID) REFERENCES Students.Program(PID) -- Foreign Key for Program

	
);


Go
----------------- Create Instructor table-------------
--Drop TABLE HumanResources.Instructor
CREATE TABLE HumanResources.Instructor (
    InsID INT  , -- Primary Key constraint
    Ins_name NVARCHAR(100) NOT NULL,
    Degree NVARCHAR(100),
    Ins_Phone NVARCHAR(100),
    Ins_email NVARCHAR(255) NOT NULL UNIQUE,
    DID INT NOT NULL,  -- Foreign key for Department
	CONSTRAINT PK_Instructor_InsID PRIMARY KEY (InsID),
    CONSTRAINT FK_Instructor_Department FOREIGN KEY (DID) REFERENCES HumanResources.Department(DID) -- Foreign Key constraint
);
GO

------------Create cource table-----------------
--drop table Cources.cource
CREATE TABLE Cources.cource (
    CID INT , 
    Cname NVARCHAR(255), 
	gradelevel char, 
    score_written FLOAT, 
    with_written BIT, 
    Bubble_sheet NVARCHAR(255),
    InsID INT,      -- Foreign key for Instructor
    PID INT NOT NULL,        -- Foreign key for Program
	CONSTRAINT PK_cource_CID PRIMARY KEY( CID),
    CONSTRAINT FK_cource_Instructor FOREIGN KEY (InsID) REFERENCES HumanResources.Instructor(InsID), -- Foreign Key constraint
    CONSTRAINT FK_cource_Program FOREIGN KEY (PID) REFERENCES Students.Program(PID) -- Foreign Key constraint
);
GO

------------Create Student_cource table == Gether from Relationship(Study) -----------------
--drop table Cources.Student_cource
CREATE TABLE Cources.Student_cource(
    S_ID INT, 
    CID INT, 
	score_Grade Float,
	score_percent FLOAT,
    CONSTRAINT PK_Student_cource PRIMARY KEY (S_ID, CID),
    CONSTRAINT FK_Student_S_ID  FOREIGN KEY (S_ID) REFERENCES Students.Student(S_ID),
    CONSTRAINT FK_student_cource_CID FOREIGN KEY (CID) REFERENCES Cources.Cource(CID)

	);
GO


---------------------------------------------------------------
----------------------------- Feedback -------------------------
------------------------------------------------------------
---------- Create Feedback_Questions table----------------

CREATE TABLE Feedback.Feedback_Questions (
   	QuestionID INT  ,
	QuestionCategory NVARCHAR(50),
	QuestionText NVARCHAR(Max) ,   
	CONSTRAINT PK_Feedback_QuestionID PRIMARY KEY (QuestionID),
    
);
GO


---------Create Feedback_Student table == Gether from Relationship(Response) -------------

CREATE TABLE Feedback.Student_Feedback (
    S_ID INT NOT NULL,         -- Foreign key for Student
    CID INT NOT NULL,         -- Foreign Key For Cource  
	QuestionID INT NOT NULL,  -- Foreign key for Feedback_Question
    Response nvarchar(max)
    CONSTRAINT PK_Student_Feedback PRIMARY KEY (S_ID,CID,QuestionID), -- Composite Primary Key constraint
    CONSTRAINT FK_Response_Student FOREIGN KEY (S_ID) REFERENCES Students.Student(S_ID), -- Foreign Key constraint
	CONSTRAINT FK_Response_Cource FOREIGN KEY (CID) REFERENCES Cources.Cource(CID),  --Foreign Key constraint
    CONSTRAINT FK_Response_FeedbackQuestion FOREIGN KEY (QuestionID) REFERENCES Feedback.Feedback_Questions(QuestionID) -- Foreign Key constraint
);
GO



------------------------------------1.2 VERSION---------------------------------------------