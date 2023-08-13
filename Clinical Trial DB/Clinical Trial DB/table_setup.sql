create database DBPROJ;
use DBPROJ
create table DBPROJ.dbo.Participant(
ParticipantId		varchar(10) primary key, 
Name				varchar(100) not null, 
Gender				varchar(6), 
Age					numeric not null, 
Address				varchar(200),
City varchar(20),
Email				varchar(40),
)
; 

create table DBPROJ.dbo.Employee(
EmployeeId		varchar(10) primary key, 
Name			varchar(100), 
Address			varchar(200), 
SSN				varchar(15),
Role			varchar(100)
)
;

create table DBPROJ.dbo.Drug(
DrugId			varchar(10) primary key,
Name			varchar(100) not null, 
)
;

create table DBPROJ.dbo.Study (
StudyId			varchar(10) primary key, 
Name				varchar(150) not null, 
Type				varchar(50),
Criteria			varchar(300),
DrugofInterestId	varchar(10) foreign key(DrugofInterestId) references DBPROJ.dbo.Drug(DrugId)
)
; 

create table DBPROJ.dbo.StudyEmployee (
StudyEmployeeId	varchar(15) primary key, 
SE_StudyId			varchar(10) foreign key(SE_StudyId) references DBPROJ.dbo.Study(StudyId),
SE_EmployeeId		varchar(10) foreign key(SE_EmployeeId) references DBPROJ.dbo.Employee(EmployeeId)
)
; 

create table DBPROJ.dbo.Phase(
PhaseId		varchar(10) primary key, 
PhaseNumber		varchar(10) not null, 
Drug_Dosage		varchar(50),
Frequency		varchar(50), 
P_StudyId		varchar(10) foreign key(P_StudyId) references DBPROJ.dbo.Study(StudyId),
Exist_DrugId	varchar(10) foreign key(Exist_DrugId) references DBPROJ.dbo.Drug(DrugId)
)

create table DBPROJ.dbo.DrugAdmission(
DrugAdmissionId		varchar(10) primary key, 
DrugType				varchar(50),
DateofAdministration	date,
DA_ParticipantId		varchar(10) foreign key	(DA_ParticipantId)  references Participant(ParticipantId),
DA_StudyId				varchar(10) foreign key (DA_StudyId)			references DBPROJ.dbo.Study(StudyId),
DrugAdminId				varchar(10) foreign key (DrugAdminId)	 references DBPROJ.dbo.Employee(EmployeeId)
)
;




create table DBPROJ.dbo.Test(
TestId		varchar(10) primary key,
Name		varchar(100) not null,
Threshold	varchar(50)
)
;

create table DBPROJ.dbo.Result(
ResultId		varchar(10) primary key,
Result			varchar(100),
DateofTest		datetime,
ParticipantId	varchar(10) foreign key references DBPROJ.dbo.Participant(ParticipantId),
TestId			varchar(10) foreign key references DBPROJ.dbo.Test(TestId),
InvigilatorId	varchar(10) foreign key references DBPROJ.dbo.Employee(EmployeeId)
)
;