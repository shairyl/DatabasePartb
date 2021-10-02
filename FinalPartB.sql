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


INSERT INTO vetClinic VALUES(1,'Bruce','Wayne','1342','hillsborough rd',1111,111,'1041');
INSERT INTO vetClinic VALUES(2,'Brdfguce','fdgfdWayne','1342','hillsborough rd',1111,111,'1041');
INSERT INTO vetClinic VALUES(3,'asdsad','fdgfdWayne','1342','hillsborough rd',1111,111,'1041');

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


INSERT INTO animalOwner VALUES(1,'Bruce','Wayne','1342','hillsborough rd','Mt Roskill','Auckland','1041','111111111', 1);
INSERT INTO animalOwner VALUES(2,'Clark','Kent','1231','Arthur rd','Mt Eden','Auckland','1234','222222222', 2);
INSERT INTO animalOwner VALUES(3,'Diana','Prince','1643','Naruto rd','New Lynn','Auckland','1261','3333333333', 1);
INSERT INTO animalOwner VALUES(4,'John','Constantine','3451','Sasuke rd','Penrose','Auckland','1635','44444444', 2);

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

INSERT INTO vetTreatment VALUES(1,'tranquilizer',25);
INSERT INTO vetTreatment VALUES(2,'Xray',45);
INSERT INTO vetTreatment VALUES(3,'Diabetes Course',100);
INSERT INTO vetTreatment VALUES(4,'Spray',5);
INSERT INTO vetTreatment VALUES(6,'Cream',80);
INSERT INTO vetTreatment VALUES(7,'anitibiotic course',60);
INSERT INTO vetTreatment VALUES(8,'feline hysterectomy',400);
INSERT INTO vetTreatment VALUES(9,'Vaccination',20);


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

INSERT INTO animalPatients VALUES(1,'Chihuahua','Always active',to_date('12-oct-2008','dd-mon-yyyy'), to_date('11-aug-2021','dd-mon-yyyy'),1,2);
INSERT INTO animalPatients VALUES(2,'Labrador','Aggressive',to_date('4-apr-2009','dd-mon-yyyy'), to_date('3-may-2021','dd-mon-yyyy'), 2,1);
INSERT INTO animalPatients VALUES(3,'Boxer','Barks a lot',to_date('2-feb-2010','dd-mon-yyyy'), to_date('21-nov-2021','dd-mon-yyyy'), 3, 1);
INSERT INTO animalPatients VALUES(4,'Golden Retriever','has a broken limb',to_date('11-mar-2015','dd-mon-yyyy'), to_date('28-oct-2021','dd-mon-yyyy'), 4,2);
INSERT INTO animalPatients VALUES(5,'German Shepherd','has a damaged eye',to_date('17-feb-2018','dd-mon-yyyy'), to_date('09-nov-2021','dd-mon-yyyy'), 1,3);
INSERT INTO animalPatients VALUES(6,'Pit Bull','has a damaged ear',to_date('14-oct-2019','dd-mon-yyyy'), to_date('27-nov-2021','dd-mon-yyyy'), 3,3);
INSERT INTO animalPatients VALUES(7,'Husky','has a damaged nose',to_date('29-mar-2020','dd-mon-yyyy'), to_date('26-aug-2021','dd-mon-yyyy'), 4, 2);


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
CONSTRAINT vetExam_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetStaff(staffID),
CONSTRAINT vetExam_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

INSERT INTO vetExamination VALUES(1,to_date('11-oct-2021','dd-mon-yyyy'),'12:15:21','No Treatment Needed',1,2,2);
INSERT INTO vetExamination VALUES(2,to_date('12-jan-2021','dd-mon-yyyy'),'13:30:34','Give vaccine',2,1,1);
INSERT INTO vetExamination VALUES(3,to_date('21-aug-2021','dd-mon-yyyy'),'16:23:35','Ear needs treatment',5,3,1);
INSERT INTO vetExamination VALUES(4,to_date('14-jan-2021','dd-mon-yyyy'),'14:14:37','eye needs treatment',4,1,1);
INSERT INTO vetExamination VALUES(5,to_date('13-may-2021','dd-mon-yyyy'),'21:12:39','nose needs treatment',7,3,2);


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

INSERT INTO animalTreatment VALUES(1,1,to_date('2-feb-2021','dd-mon-yyyy'),to_date('12-feb-2021','dd-mon-yyyy'),1,'come back to clinic for reassesment');
INSERT INTO animalTreatment VALUES(2,3,to_date('7-mar-2021','dd-mon-yyyy'),to_date('18-mar-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(3,4,to_date('25-jan-2021','dd-mon-yyyy'),to_date('30-jan-2021','dd-mon-yyyy'),1,'give healthy food');
INSERT INTO animalTreatment VALUES(1,2,to_date('10-nov-2021','dd-mon-yyyy'),to_date('19-nov-2021','dd-mon-yyyy'),1,'more antibiotics');
INSERT INTO animalTreatment VALUES(4,9,to_date('2-may-2021','dd-mon-yyyy'),to_date('9-may-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(4,8,to_date('13-apr-2021','dd-mon-yyyy'),to_date('19-apr-2021','dd-mon-yyyy'),2,null);
INSERT INTO animalTreatment VALUES(5,7,to_date('12-jun-2021','dd-mon-yyyy'),to_date('20-jun-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(5,8,to_date('11-feb-2021','dd-mon-yyyy'),to_date('20-feb-2021','dd-mon-yyyy'),1,'ready');

CREATE TABLE invoice(
invoiceID NUMBER(5) NOT NULL, 
paymentDate DATE NOT NULL, 
paymentDetails VARCHAR2(255) NULL,  
examinationID NUMBER(5) NOT NULL,
CONSTRAINT invoice_invoiceID_pk PRIMARY KEY (invoiceID),
CONSTRAINT invoice_examinationID_fk FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID)
);

INSERT INTO Invoice VALUES(1,to_date('11-oct-2021','dd-mon-yyyy'),'cash',1);
INSERT INTO Invoice VALUES(2,to_date('12-jan-2021','dd-mon-yyyy'),'credit',2);
INSERT INTO Invoice VALUES(3,to_date('21-aug-2021','dd-mon-yyyy'),'cash',3);
INSERT INTO Invoice VALUES(4,to_date('14-jan-2021','dd-mon-yyyy'),'cash',4);
INSERT INTO Invoice VALUES(5,to_date('13-may-2021','dd-mon-yyyy'),'credit',5);

SELECT * FROM animalowner;
SELECT * FROM vetexamination;
SELECT * FROM animaltreatment;
SELECT * FROM invoice;
SELECT * FROM vettreatment;
SELECT * FROM animalpatients;
