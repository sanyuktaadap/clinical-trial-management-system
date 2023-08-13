use DBPROJ

-- Insert sample data into Participant table
insert into Participant values
('P001', 'John Doe', 'Male', 30, '123 Main St','New York City', 'john@example.com'),
('P002', 'Jane Smith', 'Female', 25, '456 Elm St','New York City', 'jane@example.com'),
('P003', 'Michael Johnson', 'Male', 28, '789 Oak St','New York City', 'michael@example.com'),
('P004', 'Sarah Johnson', 'Female', 22, '567 Willow St','New York City', 'sarah@example.com'),
('P005', 'David Lee', 'Male', 40, '890 Birch St','Pittsburgh', 'david@example.com'),
('P006', 'Emily Anderson', 'Female', 29, '345 Oak St','Pittsburgh', 'emily@example.com'),
('P007', 'Michael Williams', 'Male', 35, '678 Elm St','Pittsburgh', 'michael@example.com'),
('P008', 'Jessica Brown', 'Female', 28, '987 Maple St','Pittsburgh', 'jessica@example.com'),
('P009', 'William Smith', 'Male', 28, '567 Pine St','Pittsburgh', 'william@example.com'),
('P010', 'Olivia Johnson', 'Female', 31, '890 Elm St','Chicago', 'olivia@example.com'),
('P011', 'Ethan Davis', 'Male', 27, '123 Maple St','Chicago', 'ethan@example.com'),
('P012', 'Sophia Martinez', 'Female', 29, '345 Oak St','Chicago', 'sophia@example.com'),
('P013', 'James Wilson', 'Male', 34, '678 Elm St','Boston', 'james@example.com'),
('P014', 'Isabella Brown', 'Female', 27, '987 Maple St','Boston', 'isabella@example.com'),
('P015', 'Alexander Davis', 'Male', 25, '123 Pine St','Boston', 'alexander@example.com'),
('P016', 'Oliver Johnson', 'Male', 33, '890 Elm St','Boston', 'oliver@example.com'),
('P017', 'Emma Smith', 'Female', 28, '567 Maple St','Boston', 'emma@example.com'),
('P018', 'Lucas Anderson', 'Male', 30, '890 Pine St','San Francisco', 'lucas@example.com'),
('P019', 'Ava Wilson', 'Female', 26, '123 Elm St','San Francisco', 'ava@example.com'),
('P020', 'Liam Davis', 'Male', 32, '456 Pine St','Seattle', 'liam@example.com');

-- Insert sample data into Employee table
insert into Employee values
('E001', 'Robert Brown', '321 Pine St', '123-45-6789', 'Researcher'),
('E002', 'Emily Davis', '654 Cedar St', '987-65-4321', 'Doctor'),
('E003', 'Daniel Wilson', '987 Maple St', '456-78-9012', 'Nurse'),
('E004', 'Jessica Martinez', '432 Oak St', '234-56-7890', 'Researcher'),
('E005', 'Christopher Wilson', '765 Maple St', '543-21-0987', 'Doctor')

-- Insert sample data into Drug table
insert into Drug values
('D001', 'Aspirin'),
('D002', 'Ibuprofen'),
('D003', 'Lipitor'),
('D004', 'Tylenol'),
('D005', 'Advil')

-- Insert sample data into Study table
insert into Study values
('S001', 'Pain Relief Study', 'Clinical Trial', 'Chronic pain patients', 'D001'),
('S002', 'Cholesterol Study', 'Observational', 'Patients with high cholesterol', 'D002'),
('S003', 'Fever Study', 'Experimental', 'Feverish patients', 'D003'),
('S004', 'Allergy Study', 'Clinical Trial', 'Patients with allergies', 'D004'),
('S005', 'Diabetes Study', 'Observational', 'Diabetic patients', 'D005');

-- Insert sample data into StudyEmployee table
insert into StudyEmployee values
('SE001', 'S001', 'E001'),
('SE002', 'S002', 'E002'),
('SE003', 'S003', 'E003'),
('SE004', 'S004', 'E004'),
('SE005', 'S005', 'E005')

-- Insert sample data into Phase table
insert into Phase values
('PH001', 'Phase 1', '10mg', 'Once daily', 'S001', 'D003'),
('PH002', 'Phase 2', '20mg', 'Twice daily', 'S002', 'D004'),
('PH003', 'Phase 3', '15mg', 'Three times daily', 'S003', 'D002'),
('PH004', 'Phase 1', '5mg', 'Once daily', 'S004', 'D005'),
('PH005', 'Phase 2', '10mg', 'Twice daily', 'S005', 'D001')

-- Insert sample data into DrugAdmission table
insert into dbo.DrugAdmission values
('DA001', 'Oral', '2023-08-01', 'P001', 'S001', 'E001'),
('DA002', 'Injection', '2023-08-02', 'P002', 'S002', 'E002'),
('DA003', 'Topical', '2023-08-03', 'P003', 'S003', 'E003'),
('DA004', 'Oral', '2023-08-04', 'P004', 'S004', 'E004'),
('DA005', 'Injection', '2023-08-05', 'P005', 'S005', 'E005'),
('DA006', 'Oral', '2023-08-06', 'P006', 'S001', 'E001'),
('DA007', 'Injection', '2023-08-07', 'P007', 'S002', 'E002'),
('DA008', 'Topical', '2023-08-08', 'P008', 'S003', 'E003'),
('DA009', 'Oral', '2023-08-09', 'P009', 'S004', 'E004'),
('DA010', 'Injection', '2023-08-10', 'P010', 'S005', 'E005'),
('DA011', 'Oral', '2023-08-11', 'P011', 'S001', 'E001'),
('DA012', 'Injection', '2023-08-12', 'P012', 'S002', 'E002'),
('DA013', 'Topical', '2023-08-13', 'P013', 'S003', 'E003'),
('DA014', 'Oral', '2023-08-14', 'P014', 'S004', 'E004'),
('DA015', 'Injection', '2023-08-15', 'P015', 'S005', 'E005'),
('DA016', 'Oral', '2023-08-16', 'P016', 'S001', 'E001'),
('DA017', 'Injection', '2023-08-17', 'P017', 'S002', 'E002'),
('DA018', 'Topical', '2023-08-18', 'P018', 'S003', 'E003'),
('DA019', 'Oral', '2023-08-19', 'P019', 'S004', 'E004'),
('DA020', 'Injection', '2023-08-20', 'P020', 'S005', 'E005');

-- Insert sample data into Test table
insert into Test values
('T001', 'Blood Pressure', '120/80 mmHg'),
('T002', 'Cholesterol', 'Less than 200 mg/dL'),
('T003', 'Temperature', '98.6蚌'),
('T004', 'Blood Sugar', 'Less than 120 mg/dL'),
('T005', 'Heart Rate', '60-100 bpm'),
('T006', 'Blood Oxygen Level', 'Above 95%'),
('T007', 'Blood Glucose', '70-100 mg/dL'),
('T008', 'Hemoglobin A1c', 'Less than 6%'),
('T009', 'Vitamin D Level', '30-100 ng/mL'),
('T010', 'Blood Urea Nitrogen', '8-20 mg/dL'),
('T011', 'Thyroid Stimulating Hormone', '0.4-4.0 mIU/L'),
('T012', 'Vitamin B12 Level', '200-900 pg/mL'),
('T013', 'Kidney Function', '60-120 mL/min'),
('T014', 'Thyroxine (T4)', '4.5-12.5 痢/dL'),
('T015', 'Prothrombin Time', '11-13.5 seconds'),
('T016', 'Creatinine', '0.6-1.3 mg/dL'),
('T017', 'White Blood Cell Count', '4.5-11.0 K/無'),
('T018', 'Platelet Count', '150-450 K/無'),
('T019', 'Hemoglobin', '12-16 g/dL'),
('T020', 'Hematocrit', '36-46%');

-- Insert sample data into Result table
insert into Result values
('R001', '120/70 mmHg', '2023-08-05 10:00:00', 'P001', 'T001', 'E001'),
('R002', '185 mg/dL', '2023-08-06 11:30:00', 'P002', 'T002', 'E002'),
('R003', '98.7蚌', '2023-08-07 09:45:00', 'P003', 'T003', 'E003'),
('R004', '115/75 mmHg', '2023-08-08 09:15:00', 'P004', 'T001', 'E004'),
('R005', '150 mg/dL', '2023-08-09 14:20:00', 'P005', 'T002', 'E005'),
('R006', '98%', '2023-08-10 08:30:00', 'P006', 'T006', 'E001'),
('R007', '95 mg/dL', '2023-08-11 10:15:00', 'P007', 'T007', 'E002'),
('R008', '5.2%', '2023-08-12 11:45:00', 'P008', 'T008', 'E003'),
('R009', '45 ng/mL', '2023-08-13 09:30:00', 'P009', 'T009', 'E001'),
('R010', '15 mg/dL', '2023-08-14 11:00:00', 'P010', 'T010', 'E002'),
('R011', '2.5 mIU/L', '2023-08-15 12:30:00', 'P011', 'T011', 'E003'),
('R012', '118/72 mmHg', '2023-08-16 09:45:00', 'P012', 'T001', 'E004'),
('R013', '175 mg/dL', '2023-08-17 11:30:00', 'P013', 'T002', 'E005'),
('R014', '98.9蚌', '2023-08-18 08:15:00', 'P014', 'T003', 'E001'),
('R015', '122/78 mmHg', '2023-08-19 10:00:00', 'P015', 'T001', 'E002'),
('R016', '160 mg/dL', '2023-08-20 09:30:00', 'P016', 'T002', 'E003'),
('R017', '98.4蚌', '2023-08-21 10:45:00', 'P017', 'T003', 'E004'),
('R018', '850 pg/mL', '2023-08-22 09:30:00', 'P016', 'T012', 'E001'),
('R019', '85 mL/min', '2023-08-23 11:00:00', 'P017', 'T013', 'E002'),
('R020', '8.0 痢/dL', '2023-08-24 12:30:00', 'P018', 'T014', 'E003'),
('R021', '12.0 seconds', '2023-08-25 09:45:00', 'P019', 'T015', 'E004'),
('R022', '1.0 mg/dL', '2023-08-26 11:30:00', 'P020', 'T016', 'E005'),
('R023', '6.0 K/無', '2023-08-27 08:15:00', 'P001', 'T017', 'E001'),
('R024', '200 K/無', '2023-08-28 10:00:00', 'P002', 'T018', 'E002'),
('R025', '14.5 g/dL', '2023-08-29 09:30:00', 'P003', 'T019', 'E003'),
('R026', '40%', '2023-08-30 10:45:00', 'P004', 'T020', 'E004'),
('R027', '725 pg/mL', '2023-08-31 09:15:00', 'P005', 'T012', 'E005');