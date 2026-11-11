USE Project;

DROP TABLE IF EXISTS appointment_has_treatment;
DROP TABLE IF EXISTS MedicalHistory;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Treatment;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
 Deptid INT NOT NULL,
 Deptname VARCHAR(45),
 phoneno VARCHAR(45),
 location VARCHAR(45),
 PRIMARY KEY (Deptid)
);

CREATE TABLE Staff (
 staffid INT NOT NULL,
 firstname VARCHAR(45),
 surname VARCHAR(45),
 job VARCHAR(45),
 hiredate DATE,
 deptid INT,
 daysoff INT,
 PRIMARY KEY (staffid),
 FOREIGN KEY (deptid) REFERENCES Department(Deptid)
);

CREATE TABLE Patient (
 patientid INT NOT NULL,
 firstname VARCHAR(45),
 surname VARCHAR(45),
 phoneno VARCHAR(45),
 address VARCHAR(100),
 bloodtype VARCHAR(5),
 PRIMARY KEY (patientid)
);

CREATE TABLE Appointment (
 appointmentID INT NOT NULL,
 patientID INT,
 staffID INT,
 appointment_date DATE,
 appointment_time TIME,
 status VARCHAR(45),
 PRIMARY KEY (appointmentID),
 FOREIGN KEY (patientID) REFERENCES Patient(patientid),
 FOREIGN KEY (staffID) REFERENCES Staff(staffid)
);

CREATE TABLE Treatment (
 treatmentid INT NOT NULL,
 treatmenttype VARCHAR(45),
 PRIMARY KEY (treatmentid)
);

CREATE TABLE MedicalHistory (
 MedicalHistoryid INT NOT NULL,
 patientid INT,
 medicalcondition VARCHAR(45),
 recordedin DATE,
 PRIMARY KEY (MedicalHistoryid),
 FOREIGN KEY (patientid) REFERENCES Patient(patientid)
);

CREATE TABLE appointment_has_treatment (
 appointment_appointmentID INT NOT NULL,
 treatment_treatmentid INT NOT NULL,
 PRIMARY KEY (appointment_appointmentID, treatment_treatmentid),
 FOREIGN KEY (appointment_appointmentID) REFERENCES Appointment(appointmentID),
 FOREIGN KEY (treatment_treatmentid) REFERENCES Treatment(treatmentid)
);

INSERT INTO Department VALUES
(1,'CARDIOLOGY','089-164-7313','WING A'),
(2,'ORTHOPEDICS','089-874-3137','WING B'),
(3,'PEDIATRICS','089-961-1236','WING C'),
(4,'NEUROLOGY','089-153-1733','WING D'),
(5,'GENERAL SURGERY','089-383-3755','WING E'),
(6,'EMERGENCY','089-823-8923','BACK ENTRANCE'),
(7,'RADIOLOGY','089-611-1942','WING F'),
(8,'SPINAL REHAB','089-842-8428','WING G'),
(9,'DERMATOLOGY','089-924-9649','WING H'),
(10,'ADMINISTRATION','089-225-3624','MAIN ENTRANCE');

INSERT INTO Staff VALUES
(1001,'BRUCE','WAYNE','CARDIOLOGIST','2010-09-11',1,4),
(1002,'KAVIN','SMITH','CARDIOLOGIST','2018-03-20',1,3),
(1003,'CHARLOTTE','WILSON','PEDIATRIC NURSE','2019-06-10',3,6),
(1004,'EVAN','FONG','PEDIATRIC NURSE','2017-11-05',3,2),
(1005,'JOHN','SMITH','CEO','2010-09-01',10,10),
(1006,'STEVE','HARVEY','RECEPTIONIST','2016-02-18',10,7),
(1007,'CHRISTOPHER','NOLAN','ORTHOPEDIC SURGEON','2014-12-12',2,1),
(1008,'MICHAEL','BAY','GENERAL SURGEON','2013-05-30',5,8),
(1009,'DEXTER','MORGAN','GENERAL SURGEON','2021-04-08',5,0),
(1010,'AMY','CARTHY','NEUROLOGIST','2012-03-25',4,9);

INSERT INTO Patient VALUES
(3456,'RICK','ROLL','089-562-8341','14 DAME STREET','A+'),
(5612,'JOHN','BOB','089-903-1274','18 ANNE STREET','O-'),
(4001,'HOMER','SIMPSON','089-471-6902','42 NAAS','B+'),
(4002,'JOHN','CONNOR','089-218-5439','84 CHURCH ROAD','AB+'),
(4003,'EMMA','STONE','089-776-3058','6 CURRYHILLS','A-'),
(4004,'TONY','STARK','089-640-9821','27 ALLENWOOD','O+'),
(4005,'EOIN','BOYLE','089-359-7146','65 MAPLETOFT','B-'),
(4006,'SHANE','PERCIVAL','089-892-4603','33 DOWNINGS','A+'),
(4007,'ALEX','REILY','089-135-2794','19 KILDARE','O-'),
(4008,'PETER','GRIFFIN','089-508-6217','51 WALL STREET','AB-');

INSERT INTO Treatment VALUES
(7001,'HEART CHECK-UP'),
(7002,'KNEE CHECK-UP'),
(7003,'CHILD CHECK-UP'),
(7004,'SPINE CHECK-UP'),
(7005,'BRAIN SCAN'),
(7006,'X-RAY SCAN'),
(7007,'SKIN CHECK-UP'),
(7008,'SURGERY CONSULTATION'),
(7009,'EMERGENCY VISIT'),
(7010,'GENERAL CHECK-UP');

INSERT INTO MedicalHistory VALUES
(7381,3456,'DIABETES','2024-01-10'),
(1924,5612,'CHEST PAIN','2024-01-12'),
(6047,4008,'KNEE PAIN','2024-02-05'),
(8579,4002,'CHILD ILLNESS','2024-02-20'),
(4316,4005,'HEADACHE','2024-03-01'),
(9852,4001,'BROKEN ARM','2024-03-15'),
(2468,4007,'SKIN RASH','2024-03-30'),
(7135,4004,'BACK PAIN','2024-04-10'),
(5290,4006,'ANXIETY','2024-04-20'),
(8643,4003,'CHECK-UP REQUIRED','2024-05-01');

INSERT INTO Appointment VALUES
(6501,3456,1001,'2025-11-10','09:00:00','SCHEDULED'),
(6502,5612,1002,'2025-11-15','12:30:00','COMPLETED'),
(6503,4001,1007,'2026-01-05','10:20:00','SCHEDULED'),
(6504,4002,1010,'2025-12-17','14:30:00','COMPLETED'),
(6505,4003,1003,'2025-10-25','15:40:00','COMPLETED'),
(6506,4004,1004,'2025-12-13','08:30:00','CANCELLED'),
(6507,4005,1008,'2025-12-08','11:15:00','COMPLETED'),
(6508,4006,1009,'2026-01-10','13:00:00','COMPLETED'),
(6509,4007,1001,'2025-11-19','10:45:00','COMPLETED'),
(6510,4008,1002,'2025-11-20','16:00:00','SCHEDULED');

INSERT INTO appointment_has_treatment VALUES
(6501,7001),
(6502,7001),
(6502,7010),
(6503,7002),
(6504,7005),
(6505,7003),
(6506,7010),
(6507,7008),
(6508,7010),
(6509,7001),
(6510,7010);

SELECT Deptid, Deptname, phoneno, location
FROM Department;

SELECT patientid, firstname, surname, phoneno, address, bloodtype
FROM Patient
WHERE patientid = 5612;

INSERT INTO Appointment VALUES
(6511,5612,1001,'2026-02-01','09:30:00','SCHEDULED');

SELECT *
FROM Appointment
WHERE appointmentID = 6511;

SELECT p.patientid, p.firstname, p.surname, p.bloodtype,
       m.medicalcondition, m.recordedin
FROM Patient p
INNER JOIN MedicalHistory m
        ON p.patientid = m.patientid
WHERE m.medicalcondition = 'DIABETES';

SELECT p.firstname, p.surname
FROM Patient p
INNER JOIN Appointment a
        ON p.patientid = a.patientID
INNER JOIN Staff s
        ON a.staffID = s.staffid
WHERE s.firstname = 'KAVIN'
  AND s.surname = 'SMITH';

SELECT firstname, surname, hiredate
FROM Staff
ORDER BY hiredate DESC;

SELECT COUNT(*)
FROM Patient p
INNER JOIN Appointment a
        ON p.patientid = a.patientID
INNER JOIN appointment_has_treatment aht
        ON a.appointmentID = aht.appointment_appointmentID
INNER JOIN Treatment t
        ON aht.treatment_treatmentid = t.treatmentid
WHERE t.treatmenttype = 'HEART CHECK-UP';

INSERT INTO Department
VALUES (11,'PHYSIOTHERAPY','089-333-2211','WING I');
INSERT INTO Staff
VALUES (1011,'ANNA','JONES','PHYSIOTHERAPIST','2022-01-01',11,3);
INSERT INTO Patient
VALUES (6001,'SEAN','O NEILL','089-444-8822','5 LAKE ROAD','B+');
INSERT INTO Treatment
VALUES (7011,'PHYSIO SESSION');
INSERT INTO MedicalHistory
VALUES (9001,6001,'MUSCLE PAIN','2024-06-01');
INSERT INTO Appointment
VALUES (6512,6001,1011,'2026-03-10','11:30:00','SCHEDULED');
INSERT INTO appointment_has_treatment
VALUES (6512,7011);

SELECT * FROM Department WHERE Deptid = 11;
SELECT * FROM Staff WHERE staffid = 1011;
SELECT * FROM Patient WHERE patientid = 6001;
SELECT * FROM Treatment WHERE treatmentid = 7011;
SELECT * FROM MedicalHistory WHERE MedicalHistoryid = 9001;
SELECT * FROM Appointment WHERE appointmentID = 6512;
SELECT * FROM appointment_has_treatment WHERE appointment_appointmentID = 6512;

DELETE FROM appointment_has_treatment
WHERE appointment_appointmentID = 6512;
DELETE FROM Appointment
WHERE appointmentID = 6512;
DELETE FROM MedicalHistory
WHERE MedicalHistoryid = 9001;
DELETE FROM Treatment
WHERE treatmentid = 7011;
DELETE FROM Patient
WHERE patientid = 6001;
DELETE FROM Staff
WHERE staffid = 1011;
DELETE FROM Department
WHERE Deptid = 11;

SELECT  A.appointmentID,
        A.appointment_date,
        A.appointment_time,
        P.patientid,
        P.firstname AS PatientFirstName,
        P.surname  AS PatientSurname,
        S.staffid,
        S.firstname AS StaffFirstName,
        S.surname  AS StaffSurname
FROM Appointment A
INNER JOIN Patient P
        ON A.patientID = P.patientid
INNER JOIN Staff S
        ON A.staffID = S.staffid
ORDER BY A.appointment_date, A.appointment_time;

SELECT  S.staffid,
        S.firstname,
        S.surname,
        COUNT(A.appointmentID) AS NumberOfAppointments
FROM Staff S
LEFT JOIN Appointment A
       ON S.staffid = A.staffID
GROUP BY S.staffid, S.firstname, S.surname
ORDER BY NumberOfAppointments DESC;

SELECT  P.patientid,
        P.firstname,
        P.surname,
        COUNT(M.MedicalHistoryid) AS NumberOfHistoryRecords
FROM Patient P
LEFT JOIN MedicalHistory M
       ON P.patientid = M.patientid
GROUP BY P.patientid, P.firstname, P.surname
ORDER BY NumberOfHistoryRecords DESC;

SELECT  T.treatmentid,
        T.treatmenttype,
        COUNT(AHT.appointment_appointmentID) AS TimesUsed
FROM Treatment T
LEFT JOIN appointment_has_treatment AHT
       ON T.treatmentid = AHT.treatment_treatmentid
GROUP BY T.treatmentid, T.treatmenttype
ORDER BY TimesUsed DESC;

SELECT  A.appointmentID,
        A.appointment_date,
        A.appointment_time,
        A.status
FROM Appointment A
WHERE A.patientID = 5612
ORDER BY A.appointment_date, A.appointment_time;

SELECT  appointmentID,
        patientID,
        staffID,
        appointment_date,
        appointment_time,
        status
FROM Appointment
WHERE appointment_date BETWEEN '2025-11-01' AND '2025-11-30'
ORDER BY appointment_date, appointment_time;

SELECT  P.patientid,
        P.firstname,
        P.surname,
        D.Deptid,
        D.Deptname
FROM Patient P
INNER JOIN Appointment A
        ON P.patientid = A.patientID
INNER JOIN Staff S
        ON A.staffID = S.staffid
INNER JOIN Department D
        ON S.deptid = D.Deptid
ORDER BY P.patientid;

SELECT  bloodtype,
        COUNT(*) AS NumberOfPatients
FROM Patient
GROUP BY bloodtype
ORDER BY NumberOfPatients DESC;

SELECT  A.appointmentID,
        A.appointment_date,
        A.appointment_time,
        T.treatmentid,
        T.treatmenttype
FROM Appointment A
INNER JOIN appointment_has_treatment AHT
        ON A.appointmentID = AHT.appointment_appointmentID
INNER JOIN Treatment T
        ON AHT.treatment_treatmentid = T.treatmentid
ORDER BY A.appointmentID, T.treatmentid;

SELECT  D.Deptid,
        D.Deptname,
        COUNT(S.staffid) AS NumberOfStaff
FROM Department D
LEFT JOIN Staff S
       ON D.Deptid = S.deptid
GROUP BY D.Deptid, D.Deptname
ORDER BY D.Deptid;