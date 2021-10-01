rem Shairyl & Ray part B & C

drop table vetExamination cascade constraints;
drop table animalPatients cascade constraints;
drop table animalOwner cascade constraints;
drop table vetTreatment cascade constraints;
drop table animalTreatment cascade constraints;
drop table invoice cascade constraints;
drop table vetStaff cascade constraints;
drop table vetClinic cascade constraints;
drop table itemStock cascade constraints;
drop table item cascade constraints;
drop table pharmacyStock cascade constraints;
drop table pharmacy cascade constraints;

CREATE TABLE vetClinic(
clinicID NUMBER(5) NOT NULL,
clinicStreetNo VARCHAR2(10) NOT NULL,
clinicStreetName VARCHAR2(25) NOT NULL,
clinicSuburb VARCHAR2(25) NOT NULL,
clinicCity VARCHAR2(25) NOT NULL,
clinicPostcode NUMBER(5) NOT NULL,
clinicPhoneNo NUMBER(15) NOT NULL,
clinicEmail VARCHAR2(30) NOT NULL,
CONSTRAINT vetClinic_clinicID_pk PRIMARY KEY (clinicID)
);

CREATE TABLE animalOwner(
ownerID NUMBER(5) NOT NULL, 
ownerFirstName VARCHAR2(30) NOT NULL, 
ownerLastName VARCHAR2(30) NOT NULL, 
ownerStreetNo VARCHAR2(10) NOT NULL, 
ownerStreetName VARCHAR2(25) NOT NULL, 
ownerSuburb VARCHAR2(25) NOT NULL,
ownerCity VARCHAR2(25) NOT NULL, 
ownerPostcode VARCHAR2(5) NOT NULL, 
ownerPhoneNo VARCHAR2(15) NOT NULL, 
clinicID NUMBER(5) NOT NULL,
CONSTRAINT animalOwner_ownerID_pk PRIMARY KEY (ownerID),
CONSTRAINT animalOwner_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

CREATE TABLE vetStaff(
staffID NUMBER(5) NOT NULL,
clinicID NUMBER(5) NOT NULL,
managerID NUMBER(5),
staffFirstName VARCHAR2(30) NOT NULL,
staffLastName VARCHAR2(30) NOT NULL,
staffStreetNo VARCHAR2(10) NOT NULL,
staffStreetName VARCHAR2(25) NOT NULL,
staffSuburb VARCHAR2(25) NOT NULL,
staffCity VARCHAR2(25) NOT NULL,
staffPostcode NUMBER(5) NOT NULL,
staffPhoneNo NUMBER(15) NOT NULL,
staffDOB DATE NOT NULL,
staffGender CHAR(1) NOT NULL,
staffIRN NUMBER(9) NOT NULL,
staffRole VARCHAR2(20) NOT NULL,
annualSalary NUMBER(7) NOT NULL,
CONSTRAINT vetStaff_staffID_pk PRIMARY KEY (staffID),
CONSTRAINT vetStaff_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT vetStaff_managerID_fk FOREIGN KEY (managerID) REFERENCES vetStaff(staffID)
);

CREATE TABLE pharmacy(
drugID NUMBER(5) NOT NULL,
drugName VARCHAR2(25) NOT NULL,
drugDescription VARCHAR2(255) NOT NULL,
drugDosage VARCHAR2(15) NOT NULL,
MethodofAdministration VARCHAR2(20) NOT NULL,
CONSTRAINT pharmacy_drugID_pk PRIMARY KEY (drugID)
);

CREATE TABLE item(
itemID NUMBER(5) NOT NULL,
itemName VARCHAR2(25) NOT NULL,
itemDescription VARCHAR2(255) NOT NULL,
isSurgical CHAR(1) NOT NULL,
CONSTRAINT item_itemID_pk PRIMARY KEY (itemID)
);

CREATE TABLE itemStock(
clinicID NUMBER(5) NOT NULL,
itemID NUMBER(5) NOT NULL,
itemQuantityStock NUMBER(5) NOT NULL,
itemReorderLevel NUMBER(5) NOT NULL,
itemReorderQuantity NUMBER(5) NOT NULL,
itemCost NUMBER(5) NOT NULL,
CONSTRAINT itemStock_pk PRIMARY KEY (clinicID, itemID),
CONSTRAINT itemStock_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT itemStock_itemID_fk FOREIGN KEY (itemID) REFERENCES item(itemID)
);

CREATE TABLE pharmacyStock(
clinicID NUMBER(5) NOT NULL,
drugID NUMBER(5) NOT NULL,
pharmaQuantityStock NUMBER(5) NOT NULL,
itemReorderLevel NUMBER(5) NOT NULL,
pharmaReorderQuantity NUMBER(5) NOT NULL,
pharmaCost NUMBER(5) NOT NULL,
CONSTRAINT pharmaStock_pk PRIMARY KEY (clinicID, drugID),
CONSTRAINT pharmaStock_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT pharmaStock_drugID_fk FOREIGN KEY (drugID) REFERENCES pharmacy(drugID)
);

CREATE TABLE vetTreatment(
treatmentID NUMBER(5) NOT NULL, 
treatmentDesc VARCHAR2(255) NOT NULL, 
treatmentCharge NUMBER(10) NOT NULL,
CONSTRAINT vetTreatment_treatmentID_pk PRIMARY KEY (treatmentID) 
);

CREATE TABLE animalPatients(
animalID NUMBER(5) NOT NULL, 
animalType VARCHAR2(30) NOT NULL, 
animalDescription VARCHAR2(255) NULL, 
animalDOB DATE NOT NULL,  
registrationDate DATE NOT NULL, 
ownerID NUMBER(5), 
clinicID NUMBER(5),
CONSTRAINT animalPatients_animalID_pk PRIMARY KEY (animalID),
CONSTRAINT animalPatients_ownerID_fk FOREIGN KEY (ownerID) REFERENCES animalOwner(ownerID),
CONSTRAINT animalPatients_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);


CREATE TABLE vetExamination(
examinationID NUMBER(5) NOT NULL, 
examDate DATE NOT NULL, 
examTime CHAR(8) NOT NULL, 
examDescription VARCHAR2(255) NOT NULL, 
animalID NUMBER(5) NOT NULL, 
staffID NUMBER(5) NOT NULL,
clinicID NUMBER(5) NOT NULL,
CONSTRAINT vetExam_examinationID_pk PRIMARY KEY (examinationID),
CONSTRAINT vetExam_animalID_fk FOREIGN KEY (animalID) REFERENCES animalPatients(animalID),
CONSTRAINT vetExam_staffID_fk FOREIGN KEY (staffID) REFERENCES vetStaff(staffID),
CONSTRAINT vetExam_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

CREATE TABLE animalTreatment(
examinationID NUMBER(5) NOT NULL, 
treatmentID NUMBER(5) NOT NULL, 
treatmentStartDate DATE NOT NULL, 
treatmentEndDate DATE NOT NULL, 
quantityOfTreatment NUMBER(10) NOT NULL, 
treatmentComments VARCHAR2(255),
CONSTRAINT animalTreat_pk PRIMARY KEY (examinationID, treatmentID),
CONSTRAINT animalTreat_examinationID_fk FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID),
CONSTRAINT animalTreat_treatmentID_fk FOREIGN KEY (treatmentID) REFERENCES vetTreatment(treatmentID)
);

CREATE TABLE invoice(
invoiceID NUMBER(5) NOT NULL, 
paymentDate DATE NOT NULL, 
paymentDetails VARCHAR2(255) NULL,  
ownerID NUMBER(5) NOT NULL, 
examinationID NUMBER(5) NOT NULL,
CONSTRAINT invoice_invoiceID_pk PRIMARY KEY (invoiceID),
CONSTRAINT invoice_ownerID_fk FOREIGN KEY (ownerID) REFERENCES animalOwner(ownerID),
CONSTRAINT invoice_examinationID_fk FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID)
);