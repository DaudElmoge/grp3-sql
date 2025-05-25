--Information that doctors track:
--Full name,DOB,gender
--medical history
--Appoinment history
--Prescriptions
--Diagnoses

--Information that patients track:
--Doctor's name
--Speciality
--Contacts
--Appointment history

--Importance of organized,accessible information:
--Patient safety -> avoid errors i.e wrong prescriptions
--Efficiency -> saves time for both doctors and patients
--Billing -> accurate invoicing and insurance claims
--Medical research -> good data structure supports reasearch and analytics

--Issues that arise from disorganized data:
--Duplicate records
--Missed appointments
--Prescription errors
--Billing issues
--Poor communication

--Relationships
--Doctor can have many appointments(1:M)
--Patient can have many appointments (1:M)
--Doctor can write many prescriptions(1:M)
--A patient can have several prescriptions(1:M)
--Many doctors can see many patients(M:M)

CREATE TABLE Patient (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE
    contact_info TEXT NOT NULL,
    doctor_id INTEGER
);

CREATE TABLE Doctor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    speciality TEXT NOT NULL,
    contact_info TEXT NOT NULL,
    patient_id INTEGER
);

CREATE TABLE Appointment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    date_and_time DATETIME,
    reason TEXT NOT NULL,
    duration TIME,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

CREATE TABLE Prescription (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    medication_name TEXT NOT NULL,
    date DATE,
    dosage TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);
--INNER JOIN (LISTING PATIENT AND DOCTOR NAMES FOR ALL APPOINTMENTS)
SELECT Patient.first_name AS patient_first_name,
       Patient.last_name AS patient_last_name,
       Doctor.first_name AS doctor_first_name,
       Doctor.last_name AS doctor_last_name,
       Appointment.date_and_time
FROM Appointment
INNER JOIN Patient ON Appointment.patient_id = Patient.id
INNER JOIN Doctor ON Appointment.doctor_id = Doctor.id; 

--INNER JOIN (FINDING ALL PRESCRIPTIONS WITH ASSOCIATED PATIENT AND DOCTOR NAMES)
SELECT 
    Patient.first_name AS patient_first_name,
    Patient.last_name AS patient_last_name,
    Doctor.first_name AS doctor_first_name,
    Doctor.last_name AS doctor_last_name,
    Prescription.medication_name,
    Prescription.date,
    Prescription.dosage
FROM Prescription
INNER JOIN Patient ON Prescription.patient_id = Patient.id
INNER JOIN Doctor ON Prescription.doctor_id = Doctor.id;

--LEFT JOIN (LISTING ALL PATIENTS AND THEIR APPOINTMENTS,INCLUDING THOSE WITHOUT)
SELECT 
    Patient.first_name,
    Patient.last_name,
    Appointment.date_and_time,
    Appointment.reason
FROM Patient
LEFT JOIN Appointment ON Patient.id = Appointment.patient_id;

--LEFT JOIN (LISTING ALL DOCTORS PLUS THEIR WRITTEN PRESCRIPTIONS,INCLUDING THOSE WITHOUT)
SELECT 
    Doctor.first_name,
    Doctor.last_name,
    Prescription.medication_name,
    Prescription.date
FROM Doctor
LEFT JOIN Prescription ON Doctor.id = Prescription.doctor_id;
