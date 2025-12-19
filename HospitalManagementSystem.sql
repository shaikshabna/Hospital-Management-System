CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    age int,
    mobile bigint,
    psw varchar(255)
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    dname VARCHAR(255) NOT NULL,
    specialization VARCHAR(100),
    mobile bigint,
	psw varchar(255)
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date Date,
    appointment_time TIME,
    pname varchar(255),
    age int,
    mobile bigint,
    pdiseas varchar(255),
    status varchar(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

SELECT * FROM hospital_db.patients;

SELECT * FROM hospital_db.doctors;

SELECT * FROM hospital_db.appointments;
