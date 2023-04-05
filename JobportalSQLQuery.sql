Use JobPortal;

CREATE TABLE Job_Seeker (
Job_SeekerId INT IDENTITY(1,1) PRIMARY KEY,
Job_SeekerName VARCHAR(50) NOT NULL,
Gender VARCHAR(10),
Email VARCHAR(50) UNIQUE NOT NULL,
MobileNumber INT,
Skills VARCHAR(1000),
Password VARCHAR(100) NOT NULL
);

-- Create the Company table
CREATE TABLE Company (
CompanyId INT IDENTITY(1,1) PRIMARY KEY,
CompanyName VARCHAR(100) NOT NULL,
CompanyEmail VARCHAR(100) UNIQUE NOT NULL,
CompanyPhone INT,
CompanyAddress VARCHAR(100),
CompanyDescription VARCHAR(100),
Password VARCHAR(100) NOT NULL
);

-- Create the JobPosting table
CREATE TABLE JobPosting (
JobId INT IDENTITY(1,1) PRIMARY KEY,
JobTitle VARCHAR(100) NOT NULL,
JobDescription VARCHAR(1000),
JobExperienceLevel VARCHAR(100),
JobSkillSet VARCHAR(100),
JobPayScale VARCHAR(100),
JobLocation VARCHAR(100),
StartDate DATE DEFAULT GETDATE(),
EndDate DATE,
CompanyId INT NOT NULL,
CONSTRAINT FK_JobPosting_Company FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId) ON DELETE CASCADE
);

-- Create the ApplyforJobs table
CREATE TABLE ApplyforJobs (
AppliedJobId INT IDENTITY(1,1) PRIMARY KEY,
Job_SeekerId INT NOT NULL,
JobId INT NOT NULL,
Resume VARBINARY(MAX),
CONSTRAINT FK_ApplyforJobs_Job_Seeker FOREIGN KEY (Job_SeekerId) REFERENCES Job_Seeker(Job_SeekerId) ON DELETE CASCADE,
CONSTRAINT FK_ApplyforJobs_JobPosting FOREIGN KEY (JobId) REFERENCES JobPosting(JobId) ON DELETE CASCADE
);

-- Create the Message table
CREATE TABLE Message (
MessageId INT IDENTITY(1,1) PRIMARY KEY,
Job_SeekerId INT NOT NULL,
CompanyId INT NOT NULL,
MessageText VARCHAR(MAX),
CONSTRAINT FK_Message_Job_Seeker FOREIGN KEY (Job_SeekerId) REFERENCES Job_Seeker(Job_SeekerId) ON DELETE CASCADE,
CONSTRAINT FK_Message_Company FOREIGN KEY (CompanyId) REFERENCES Company(CompanyId) ON DELETE CASCADE
);

-- Create the Job Match table for storing the matches between Job Seekers and Jobs
CREATE TABLE JobMatch (
JobMatchId INT IDENTITY(1,1) PRIMARY KEY,
Job_SeekerId INT NOT NULL,
JobId INT NOT NULL,
CONSTRAINT FK_JobMatch_Job_Seeker FOREIGN KEY (Job_SeekerId) REFERENCES Job_Seeker(Job_SeekerId) ON DELETE CASCADE,
CONSTRAINT FK_JobMatch_JobPosting FOREIGN KEY (JobId) REFERENCES JobPosting(JobId) ON DELETE CASCADE
);

Create table Admin( 
AdminId int IDENTITY(1,1) PRIMARY KEY,
Name varchar(100), 
Email varchar(100) UNIQUE, 
Phone varchar(100), 
Password varchar(100) NOT NULL 
)