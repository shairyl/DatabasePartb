rem Shairyl & Ray part B & C
rem trying github

drop table vetExamination cascade constraints;
drop table animalPatients cascade constraints;
drop table animalOwner cascade constraints;
drop table vetTreatment cascade constraints;
drop table animalTreatment cascade constraints;
drop table invoices cascade constraints;

CREATE TABLE animalPatients(
animalID CHAR(6) NOT NULL, 
animalType VARCHAR2(30) NOT NULL, 
animalDescription VARCHAR2(40) NULL, 
animalDOB DATE NOT NULL,  
RegistrationDate DATE NOT NULL, 
ownerID CHAR(5), 
clinicID CHAR(5),
PRIMARY KEY animalID 
FOREIGN KEY (ownerID) REFERENCES animalOwner(ownerID),
FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

INSERT INTO animalPatients VALUES('1','Chihuahua','Friendly',to_date('30-nov-1994','dd-mon-yyyy'), to_date('10-aug-1995','dd-mon-yyyy'),'1','c1112');
INSERT INTO animalPatients VALUES('2','Golden retriever','Active',to_date('4-mar-2001','dd-mon-yyyy'), to_date('2-may-2001','dd-mon-yyyy'),2,'c1111');
INSERT INTO animalPatients VALUES('3','Labrador','Quiet',to_date('9-jan-2000','dd-mon-yyyy'), to_date('12-nov-1998','dd-mon-yyyy'),'3','c1111');
INSERT INTO animalPatients VALUES('4','Boxer','Shy',to_date('18-jan-1999','dd-mon-yyyy'), to_date('9-oct-1999','dd-mon-yyyy'),'4','c1112');
INSERT INTO animalPatients VALUES('5','German Shepherd','Noisy',to_date('10-feb-1998','dd-mon-yyyy'), to_date('12-nov-1998','dd-mon-yyyy'),'5','c1113');
INSERT INTO animalPatients VALUES('6','Pit Bull','Scary',to_date('10-feb-1999','dd-mon-yyyy'), to_date('12-nov-2000','dd-mon-yyyy'),'5',null);
INSERT INTO animalPatients VALUES('7','Chihuahua','Agressive',to_date('10-feb-2001','dd-mon-yyyy'), to_date('12-aug-2001','dd-mon-yyyy'), 2,'c1112');

CREATE TABLE vetExamination(
examinationID CHAR(6) NOT NULL, 
examDate DATE NOT NULL, 
examTime NUMBER(4, 2) NOT NULL, 
examDescription VARCHAR2(40) NOT NULL, 
animalID CHAR(6) NOT NULL, 
staffID CHAR(4) NOT NULL,
clinicID CHAR(5) NOT NULL,
PRIMARY KEY (examinationID),
FOREIGN KEY (animalID) REFERENCES animalPatients(animalID),
FOREIGN KEY (staffID) REFERENCES vetStaff(staffID)
FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

CREATE TABLE animalOwner(
ownerID CHAR(5) NOT NULL, 
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

CREATE TABLE Invoice(
invoiceID CHAR(6) NOT NULL, 
paymentDate DATE NOT NULL, 
paymentDetails VARCHAR2(40) NULL,  
ownerID CHAR(5) NOT NULL, 
examinationID CHAR(6) NOT NULL,
PRIMARY KEY (invoiceID),
FOREIGN KEY (ownerID) REFERENCES animalOwner(ownerID),
FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID)
);


CREATE TABLE vetTreatment(
treatmentID CHAR(4) NOT NULL, 
treatmentDesc VARCHAR2(40) NOT NULL, 
treatmentCharge NUMBER(5, 2) NOT NULL,
PRIMARY KEY treatmentID 
);


CREATE TABLE animalTreatment(
examinationID CHAR(6) NOT NULL, 
treatmentID CHAR(4) NOT NULL, 
treatmentStartDate DATE NOT NULL, 
treatmentEndDate DATE NOT NULL, 
quantityOfTreatment NUMBER(4, 1) NOT NULL, 
treatmentComments CHAR(255),
PRIMARY KEY (examinationID, treatmentID),
FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID),
FOREIGN KEY (treatmentID) REFERENCES vetTreatment(treatmentID)
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

CREATE TABLE item(
itemID NUMBER(5) NOT NULL,
itemName VARCHAR2(20) NOT NULL,
itemDescription VARCHAR2(255) NOT NULL,
isSurgical VARCHAR2(3) NOT NULL,
CONSTRAINT item_itemID_pk PRIMARY KEY (itemID)
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

CREATE TABLE pharmacy(
drugID NUMBER(5) NOT NULL,
drugName VARCHAR2(20) NOT NULL,
drugDescription VARCHAR2(255) NOT NULL,
drugDosage VARCHAR2(8) NOT NULL,
MethodofAdministration VARCHAR2(20) NOT NULL,
CONSTRAINT pharmacy_drugID_pk PRIMARY KEY (drugID)
);