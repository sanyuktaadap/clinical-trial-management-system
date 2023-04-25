create database Final;

create table Final.dbo.Participant(
ParticipantId		varchar(10) primary key, 
Name				varchar(100) not null, 
Gender				varchar(6), 
Age					numeric not null, 
Address				varchar(200), 
Email				varchar(40),
)
; 

create table Final.dbo.Employee(
EmployeeId		varchar(10) primary key, 
Name			varchar(100), 
Address			varchar(200), 
SSN				varchar(15),
Role			varchar(100)
)
;

create table Final.dbo.Drug(
DrugId			varchar(10) primary key,
Name			varchar(100) not null, 
)
;

create table Final.dbo.Study (
StudyId			varchar(10) primary key, 
Name				varchar(150) not null, 
Type				varchar(50),
Criteria			varchar(300),
DrugofInterestId	varchar(10) foreign key(DrugofInterestId) references Final.dbo.Drug(DrugId)
)
; 

create table Final.dbo.StudyEmployee (
StudyEmployeeId	varchar(15) primary key, 
SE_StudyId			varchar(10) foreign key(SE_StudyId) references Final.dbo.Study(StudyId),
SE_EmployeeId		varchar(10) foreign key(SE_EmployeeId) references Final.dbo.Employee(EmployeeId)
)
; 

create table Final.dbo.Phase(
PhaseId		varchar(10) primary key, 
PhaseNumber		varchar(10) not null, 
Drug_Dosage		varchar(50),
Frequency		varchar(50), 
P_StudyId		varchar(10) foreign key(P_StudyId) references Final.dbo.Study(StudyId),
Exist_DrugId	varchar(10) foreign key(Exist_DrugId) references Final.dbo.Drug(DrugId)
)

create table Final.dbo.DrugAdmission(
DrugAdmissionId		varchar(10) primary key, 
DrugType				varchar(50),
DateofAdministration	date,
DA_ParticipantId		varchar(10) foreign key	(DA_ParticipantId)  references Participant(ParticipantId),
DA_PhaseId				varchar(10) foreign key (DA_PhaseId)			references Final.dbo.Phase(PhaseId),
DrugAdminId				varchar(10) foreign key (DrugAdminId)	 references Final.dbo.Employee(EmployeeId)
)
;

create table Final.dbo.Test(
TestId		varchar(10) primary key,
Name		varchar(100) not null,
Threshold	varchar(50)
)
;

create table Final.dbo.Result(
ResultId		varchar(10) primary key,
Result			varchar(100),
DateofTest		datetime,
ParticipantId	varchar(10) foreign key references Final.dbo.Participant(ParticipantId),
TestId			varchar(10) foreign key references Final.dbo.Test(TestId),
InvigilatorId	varchar(10) foreign key references Final.dbo.Employee(EmployeeId)
)
;