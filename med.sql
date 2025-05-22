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
    duration TIME
);

CREATE TABLE Prescription (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER,
    doctor_id INTEGER,
    medication_name TEXT NOT NULL,
    date DATE,
    dosage TEXT
);