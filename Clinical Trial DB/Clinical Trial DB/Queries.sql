use DBPROJ


/* Participant Statistics by Gender:
Retrieve the average age of male and female participants, along with the count of participants in each gender category.*/
select Gender, 
avg(Age) as avg_age,
count(Gender) as head_count
from Participant
group by Gender


/* Study Enrollment Statistics:
Retrieve total number of Participants in each study. */
select Study.Name as Study_Name,
count(DrugAdmission.DA_ParticipantId) as Patient_count
from Study JOIN DrugAdmission
on Study.StudyId = DrugAdmission.DA_StudyId
group by Study.Name


/* Participant Test Results:
Retrieve a list of participants along with the test details and the participants test results.*/
select distinct Participant.Name as P_Names,
Test.Name as T_Names,
Test.Threshold as Thresh,
Result.Result as Results
from Participant 
JOIN Result on Participant.ParticipantId = Result.ParticipantId
JOIN Test on Result.TestId = Test.TestId


/* Drug Usage by Study Type:
Display the total number of drug administrations for each study type (e.g., Clinical Trial, Observational, Experimental).*/
select Study.Type as Study_Type,
count(DrugAdmission.DrugAdmissionId) as num_DA
from Study JOIN DrugAdmission
on Study.StudyId = DrugAdmission.DA_StudyId
group by Study.Type


/* Studies and the drugs involved
Display both DOI and Existing Drug being compared to involved in each Study */
with 
Phase_Extended as(
	select Phase.P_StudyId as StudyId,
	Phase.Exist_DrugId as Exist_DrugId,
	Drug.Name as Exist_Drug_Name
	from Drug 
	JOIN Phase on Drug.DrugId = Phase.Exist_DrugId
),
Study_Extended as(
	select Study.StudyId as StudyId,
	Study.Name as Study_Name,
	Study.DrugofInterestId as DOIid,
	Drug.Name as Drug_Name
	from Study JOIN Drug on Study.DrugofInterestId = Drug.DrugId
)
select 
	Study_Extended.Study_Name as Study_Name,
	Study_Extended.DOIid as DOIid,
	Study_Extended.Drug_Name as Drug_Name,
	Phase_Extended.Exist_DrugId as Exist_DrugId,
	Phase_Extended.Exist_Drug_Name as Exist_Drug_Name
from Study_Extended JOIN Phase_Extended on Study_Extended.StudyId = Phase_Extended.StudyId


/* Display the distribution of Participants accross cities*/
select 
	City, 
	avg(Age) as avg_age, 
	count(*) as total_participants 
from Participant group by City order by avg(Age)