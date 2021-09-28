rem Shairyl & Ray part B & C 3
rem trying github 2.797

drop table vetExamination cascade constraints;
drop table animalPatients cascade constraints;
drop table animalOwner cascade constraints;
drop table vetTreatment cascade constraints;
drop table animalTreatment cascade constraints;
drop table invoices cascade constraints;
drop table vetStaff cascade constraints;
drop table vetClinic cascade constraints;
drop table itemStock cascade constraints;
drop table item cascade constraints;
drop table pharmacyStock cascade constraints;
drop table pharmacy cascade constraints;

CREATE TABLE vetClinic(
clinicID NUMBER(5) NOT NULL,
clinicStreetNo VARCHAR2(7) NOT NULL,
clinicStreetName VARCHAR2(20) NOT NULL,
clinicSuburb VARCHAR2(20) NOT NULL,
clinicCity VARCHAR2(20) NOT NULL,
clinicPostcode NUMBER(4) NOT NULL,
clinicPhoneNo NUMBER(20) NOT NULL,
clinicEmail VARCHAR2(30) NOT NULL,
CONSTRAINT vetClinic_clinicID_pk PRIMARY KEY (clinicID)
);

CREATE TABLE animalOwner(
ownerID NUMBER(5) NOT NULL, 
ownerFirstName VARCHAR2(30) NOT NULL, 
ownerLastName VARCHAR2(30) NOT NULL, 
ownerStreetNo VARCHAR2(40) NOT NULL, 
ownerStreetName VARCHAR2(40) NOT NULL, 
ownerSuburb VARCHAR2(30) NOT NULL,
ownerCity VARCHAR2(15) NOT NULL, 
ownerPostcode VARCHAR2(9), 
ownerPhoneNo VARCHAR2(20) NOT NULL, 
clinicID CHAR(5) NOT NULL,
PRIMARY KEY (ownerID),
FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

CREATE TABLE vetStaff(
staffID NUMBER(5) NOT NULL,
clinicID NUMBER(5) NOT NULL,
managerID NUMBER(5),
staffFirstName VARCHAR2(20) NOT NULL,
staffLastName VARCHAR2(20) NOT NULL,
staffStreetNo VARCHAR2(7) NOT NULL,
staffStreetName VARCHAR2(20) NOT NULL,
staffSuburb VARCHAR2(20) NOT NULL,
staffCity VARCHAR2(20) NOT NULL,
staffPostcode NUMBER(4) NOT NULL,
staffPhoneNo NUMBER(20) NOT NULL,
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
drugName VARCHAR2(20) NOT NULL,
drugDescription VARCHAR2(255) NOT NULL,
drugDosage VARCHAR2(8) NOT NULL,
MethodofAdministration VARCHAR2(20) NOT NULL,
CONSTRAINT pharmacy_drugID_pk PRIMARY KEY (drugID)
);

CREATE TABLE item(
itemID NUMBER(5) NOT NULL,
itemName VARCHAR2(20) NOT NULL,
itemDescription VARCHAR2(255) NOT NULL,
isSurgical VARCHAR2(3) NOT NULL,
CONSTRAINT item_itemID_pk PRIMARY KEY (itemID)
);

CREATE TABLE itemStock(
clinicID NUMBER(5) NOT NULL,
itemID NUMBER(5) NOT NULL,
itemQuantityStock NUMBER(10) NOT NULL,
itemReorderLevel NUMBER(10) NOT NULL,
itemReorderQuantity NUMBER(10) NOT NULL,
itemCost NUMBER(10) NOT NULL,
CONSTRAINT itemStock_pk PRIMARY KEY (clinicID, itemID),
CONSTRAINT itemStock_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT itemStock_itemID_fk FOREIGN KEY (itemID) REFERENCES item(itemID)
);

CREATE TABLE pharmacyStock(
clinicID NUMBER(5) NOT NULL,
drugID NUMBER(5) NOT NULL,
pharmaQuantityStock NUMBER(10) NOT NULL,
itemReorderLevel NUMBER(10) NOT NULL,
pharmaReorderQuantity NUMBER(10) NOT NULL,
pharmaCost NUMBER(10) NOT NULL,
CONSTRAINT pharmaStock_pk PRIMARY KEY (clinicID, itemID),
CONSTRAINT pharmaStock_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT pharmaStock_drugID_fk FOREIGN KEY (drugID) REFERENCES pharmacy(drugID)
);

CREATE TABLE vetTreatment(
treatmentID NUMBER(5) NOT NULL, 
treatmentDesc VARCHAR2(40) NOT NULL, 
treatmentCharge NUMBER(5, 2) NOT NULL,
PRIMARY KEY (treatmentID) 
);

CREATE TABLE animalPatients(
animalID NUMBER(5) NOT NULL, 
animalType VARCHAR2(30) NOT NULL, 
animalDescription VARCHAR2(40) NULL, 
animalDOB DATE NOT NULL,  
RegistrationDate DATE NOT NULL, 
ownerID NUMBER(5), 
clinicID NUMBER(5),
PRIMARY KEY (animalID),
FOREIGN KEY (ownerID) REFERENCES animalOwner(ownerID),
FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);


CREATE TABLE vetExamination(
examinationID NUMBER(5) NOT NULL, 
examDate DATE NOT NULL, 
examTime NUMBER(4, 2) NOT NULL, 
examDescription VARCHAR2(40) NOT NULL, 
animalID NUMBER(6) NOT NULL, 
staffID NUMBER(4) NOT NULL,
clinicID NUMBER(5) NOT NULL,
PRIMARY KEY (examinationID),
FOREIGN KEY (animalID) REFERENCES animalPatients(animalID),
FOREIGN KEY (staffID) REFERENCES vetStaff(staffID),
FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

CREATE TABLE animalTreatment(
examinationID NUMBER(6) NOT NULL, 
treatmentID NUMBER(4) NOT NULL, 
treatmentStartDate DATE NOT NULL, 
treatmentEndDate DATE NOT NULL, 
quantityOfTreatment NUMBER(4, 1) NOT NULL, 
treatmentComments VARCHAR2(255),
PRIMARY KEY (examinationID, treatmentID),
FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID),
FOREIGN KEY (treatmentID) REFERENCES vetTreatment(treatmentID)
);

CREATE TABLE Invoice(
invoiceID NUMBER(5) NOT NULL, 
paymentDate DATE NOT NULL, 
paymentDetails VARCHAR2(40) NULL,  
ownerID NUMBER(5) NOT NULL, 
examinationID NUMBER(6) NOT NULL,
PRIMARY KEY (invoiceID),
FOREIGN KEY (ownerID) REFERENCES animalOwner(ownerID),
FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID)
);

rem it works!
