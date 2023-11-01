CREATE TABLE doctors (
dr_id INT PRIMARY KEY,
d_name VARCHAR(100),
age INT,
profession VARCHAR(50),
contact VARCHAR(15)
);

CREATE TABLE ward (
wardid INT PRIMARY KEY,
w_name VARCHAR(100),
wtype VARCHAR(50),
no_of_patient INT,
status VARCHAR(20)
);

CREATE TABLE diagnosis (
dia_id INT PRIMARY KEY,
test_name VARCHAR(100),
test_results VARCHAR(255),
status VARCHAR(20),
outcomes VARCHAR(255)
);

CREATE TABLE disease (
diseaseid INT PRIMARY KEY,
name VARCHAR(100),
timeline VARCHAR(255),
status VARCHAR(20),
priority INT
);

CREATE TABLE patient (
patid INT PRIMARY KEY,
drid INT,
wardid INT,
diaid INT,
p_name VARCHAR(100),
age INT,
diseaseid INT,
bloodtype VARCHAR(10),
CONSTRAINT fk_doctor FOREIGN KEY (drid) REFERENCES doctors (dr_id),
CONSTRAINT fk_ward FOREIGN KEY (wardid) REFERENCES ward (wardid),
CONSTRAINT fk_diagnosis FOREIGN KEY (diaid) REFERENCES diagnosis (dia_id),
CONSTRAINT fk_disease FOREIGN KEY (diseaseid) REFERENCES disease (diseaseid)
);

CREATE TABLE medical_store (
med_id INT PRIMARY KEY,
patid INT,
drid INT,
diseaseid INT,
med_name VARCHAR(100),
med_quantity INT,
med_cost DECIMAL(10, 2),
CONSTRAINT fk_med_patient FOREIGN KEY (patid) REFERENCES patient (patid),
CONSTRAINT fk_med_doctor FOREIGN KEY (drid) REFERENCES doctors (dr_id),
CONSTRAINT fk_med_disease FOREIGN KEY (diseaseid) REFERENCES disease (diseaseid)
);

INSERT INTO doctors (dr_id, d_name, age, profession, contact)
VALUES (1, 'Dr. Smith', 40, 'Cardiologist', '555-123-4567'),
       (2, 'Dr. Johnson', 35, 'Dermatologist', '555-987-6543'),
       (3, 'Dr. Lee', 45, 'Pediatrician', '555-111-2222'),
       (4, 'Dr. Miller', 50, 'Surgeon', '555-444-3333'),
       (5, 'Dr. Davis', 38, 'Neurologist', '555-999-8888');

INSERT INTO ward (wardid, w_name, wtype, no_of_patient, status)
VALUES (1, 'Cardiology Ward', 'General', 10, 'Available'),
       (2, 'Pediatrics Ward', 'General', 8, 'Occupied'),
       (3, 'Surgical Ward', 'General', 12, 'Available'),
       (4, 'ICU', 'Specialized', 6, 'Occupied'),
       (5, 'Oncology Ward', 'Specialized', 5, 'Available');

INSERT INTO diagnosis (dia_id, test_name, test_results, status, outcomes)
VALUES (1, 'Blood Test', 'Normal', 'Completed', 'Healthy'),
       (2, 'X-Ray', 'Abnormal', 'Pending', NULL),
       (3, 'MRI Scan', 'Normal', 'Completed', 'No abnormalities detected'),
       (4, 'CT Scan', 'Abnormal', 'Completed', 'Further evaluation needed'),
       (5, 'Ultrasound', 'Normal', 'Completed', 'Healthy');

INSERT INTO disease (diseaseid, name, timeline, status, priority)
VALUES (1, 'Hypertension', 'Chronic', 'Ongoing', 3),
       (2, 'Common Cold', 'Acute', 'Cured', 2),
       (3, 'Diabetes', 'Chronic', 'Ongoing', 4),
       (4, 'Influenza', 'Acute', 'Cured', 2),
       (5, 'Asthma', 'Chronic', 'Ongoing', 3);

INSERT INTO patient (patid, drid, wardid, diaid, p_name, age, diseaseid, bloodtype)
VALUES (1, 1, 1, 1, 'John Smith', 35, 1, 'A'),
       (2, 2, 3, 2, 'Emily Johnson', 28, 2, 'O'),
       (3, 3, 2, 3, 'Michael Lee', 42, 3, 'AB'),
       (4, 4, 4, 4, 'Sarah Miller', 55, 4, 'B'),
       (5, 5, 5, 5, 'Robert Davis', 38, 5, 'A');

INSERT INTO medical_store (med_id, patid, drid, diseaseid, med_name, med_quantity, med_cost)
VALUES (1, 1, 1, 1, 'Aspirin', 100, 5.99),
       (2, 2, 2, 2, 'Antibiotics', 50, 12);
