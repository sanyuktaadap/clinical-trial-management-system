# clinical_trial_management_system
Relational Database Management System for Clinical Trials

## Business Rules
ABC Hospital is having an opening to pitch a new database for its clinical studies. The main objective of the database is to make it easier for researchers to analyse and track activities in the study. For privacy and security reasons we need a more reliable database system. They wish to track the clinical studies being conducted through all 4 phases. They note down patients' demographics (name, age, gender, address, and email address), and assign them the study. The study includes a set of employees having different roles, such as nurses (who would administer drugs to the participant), physician (who would look at the results of the tests), an admin, and other researchers conducting the study. 

For each study, they wish to track the name of the study, its type, inclusion and exclusion criteria and the drug of interest. Through each phase, the dosage and frequency of the drug keeps changing for testing purposes. Participants are divided into 3 groups based on the drug they’re being administered. The drug could be the drug of interest, an existing drug for comparing outcomes, and a placebo drug. Each patient can only receive one of these drugs. The existing drug would keep changing as and when the phase changes. For example, in phase 1, our drug is being tested against drug ABC that is already out in the market, it will be tested against a different drug, say drug XYZ, in phase 2. 

The drugs given will be tested at different stages of the trial and the test results will be used to analyse the effect of the trial. Each study will have a certain number of participants and a set of employees. One participant cannot be a part of more than one clinical study at a time, however, an employee can be a part of multiple clinical studies simultaneously albeit in the same role. Additionally, one drug can be a part of multiple clinical studies, but one clinical study can only have one drug of interest.


## ER Diagram

![er_diagram](extra/Final%20ERD.png)


## GUI - Test table

- Added code to get a GUI for adding, editing, deleting, and viewing the Test table.

![sample_ui](extra/sample_ui.png)
