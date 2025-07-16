--Exercise3Case2

CREATE DATABASE EmployeeTraining;

USE EmployeeTraining

CREATE TABLE Employee(
	EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	MiddleName VARCHAR(30),
	LastName VARCHAR(30),
	Phone VARCHAR(20)
);

CREATE TABLE Instructor(
	InstructorId INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeId INT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);

CREATE TABLE TrainingCourse(
	CourseId INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(100) NOT NULL,
    Description VARCHAR(100),
    DurationHours INT NOT NULL
);

CREATE TABLE TrainingSession(
	SessionId INT IDENTITY(1,1) PRIMARY KEY,
	CourseId INT NOT NULL,
	InstructorId INT NOT NULL,
	SessionDate DATE NOT NULL,
	TrainingLocation VARCHAR(20),
	FOREIGN KEY (CourseId) REFERENCES TrainingCourse(CourseId),
	FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId)
);

--TABEL JUNCTION ANTARA EMPLOYEE DAN TRAINING SESSION
CREATE TABLE ParticipationRecord(
	ParticipationId INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeId INT NOT NULL,
	SessionId INT NOT NULL,
	DateAttended DATE NOT NULL,
	TrainingStatus BIT NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
	FOREIGN KEY (SessionId) REFERENCES TrainingSession(SessionId)
);
