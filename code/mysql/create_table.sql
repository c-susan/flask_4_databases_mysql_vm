## Script to create a doctors table and a patients table into the database. 

CREATE TABLE doctors(
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    department TEXT NOT NULL, 
    phone_num VARCHAR(10) NOT NULL
);

CREATE TABLE patients(
    patient_id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    date_of_birth DATE,
    primary_doctor_id INT,
    FOREIGN KEY (primary_doctor_id) REFERENCES doctors(doctor_id)
);

