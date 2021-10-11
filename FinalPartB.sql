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

INSERT INTO vetClinic VALUES(1,'181','Onewa Road','Birkenhead','Auckland',0626,094812376,'birkenhead@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(2,'580','New North Road','Morningside','Auckland',1021,098159978,'morningside@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(3,'3162','Great North Road','New Lynn','Auckland',0600,096007684,'newlynn@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(4,'359','Church Street','Penrose','Auckland',1061,095257655,'penrose@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(5,'639','Te Rapa Road','Te Rapa','Hamilton',3200,07767543,'terapa@kiwivet.co.nz');

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
INSERT INTO animalOwner VALUES(5,'John','Constantine','3451','Sasuke rd','Penrose','Auckland','1635','44444444', 2);
INSERT INTO animalOwner VALUES(6,'Barry','Allen','3451','Metropolis','Hamilton','Hamilton','1635','44444444', 2);

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

INSERT INTO vetStaff VALUES(1,1,null,'Josh','Murdoch','4A','Holdaway Avenue','Northcote','Auckland','0627','0224055402',to_date('13-oct-1986','dd-mon-yyyy'), 'M', 7384751, 'Manager',104000);
INSERT INTO vetStaff VALUES(2,1,1,'Lucy','Yang','24','Jersey Avenue','Mt Albert','Auckland','1025','0214037401',to_date('07-jun-1993','dd-mon-yyyy'), 'F', 7382653, 'Vet Nurse',65000);
INSERT INTO vetStaff VALUES(3,1,1,'Jasmine','Luke','54B','Sequoia Place','Sunnynook','Auckland','0620','020433745',to_date('19-jun-1991','dd-mon-yyyy'), 'F', 3597754, 'Veterinarian',73000);
INSERT INTO vetStaff VALUES(4,1,1,'Reece','Graham','1','Parkhead Place','Rosedale','Auckland','0632','0210264749',to_date('25-nov-1987','dd-mon-yyyy'), 'M', 8102855,'Veterinarian',73000);
INSERT INTO vetStaff VALUES(5,1,1,'Brian','Logan','86','Grant Street','Mt Albert','Auckland','1025','0221188172',to_date('22-feb-1983','dd-mon-yyyy'), 'M', 2747333, 'Veterinarian',73000);
INSERT INTO vetStaff VALUES(6,1,1,'Jessica','Lawn','33A','Beatrice Avenue','Hillcrest','Auckland','0627','0220230222',to_date('09-jun-1992','dd-mon-yyyy'), 'F', 8547730,'Receptionist',55000);

INSERT INTO vetStaff VALUES(7,2,null,'Blake','Crouch','4A','Owens Road','Epson','Auckland','1023','0222212545',to_date('13-oct-1986','dd-mon-yyyy'), 'M', 7384751, 'Manager',110000);
INSERT INTO vetStaff VALUES(8,2,7,'Bella','Gallagher','9','Edendale Crescent','Mt Eden','Auckland','1024','022196487',to_date('27-dec-1991','dd-mon-yyyy'), 'F', 3847746, 'Veterinarian',85000);
INSERT INTO vetStaff VALUES(9,2,7,'Tim','OSullivan','4','Martin Ave','Mt Albert','Auckland','1025','022196402',to_date('01-dec-1990','dd-mon-yyyy'), 'M', 8455011, 'Veterinarian',82000);
INSERT INTO vetStaff VALUES(10,2,7,'Ruth','OSullivan','4','Martin Ave','Mt Albert','Auckland','1025','022196414',to_date('19-jan-1987','dd-mon-yyyy'), 'F', 1239322, 'Veterinarian',85000);
INSERT INTO vetStaff VALUES(11,2,7,'Isabella','Rose','51','Webster Street','Mt Roskill','Auckland','1041','0221045407',to_date('23-jun-1989','dd-mon-yyyy'), 'F', 8547743,'Receptionist',56000);

INSERT INTO vetStaff VALUES(12,3,null,'Jeff','Owens','4A','Owens Road','Epson','Auckland','1023','0222212545',to_date('21-nov-1984','dd-mon-yyyy'), 'M', 3958444, 'Manager',110000);
INSERT INTO vetStaff VALUES(13,3,12,'Tim','Musk','17C','Lancing Road','Sandringham','Auckland','1025','0214007601',to_date('08-jun-1993','dd-mon-yyyy'), 'F', 1242256, 'Veterinarian',65000);
INSERT INTO vetStaff VALUES(14,3,12,'Brian','Logan','86','Grant Street','Mt Albert','Auckland','1025','0221188172',to_date('01-feb-1983','dd-mon-yyyy'), 'M', 8395677, 'Veterinarian',73000);
INSERT INTO vetStaff VALUES(15,3,12,'Elizabeth','Blake','4','Martin Ave','Mt Albert','Auckland','1025','022196402',to_date('01-dec-1990','dd-mon-yyyy'), 'F', 4493744, 'Receptionist',55000);

INSERT INTO vetStaff VALUES(16,4,null,'Anne','Simons','26','Moana Avenue','Onehunga','Auckland','1061','0204705672',to_date('01-mar-1980','dd-mon-yyyy'), 'F', 5593805, 'Manager',95400);
INSERT INTO vetStaff VALUES(17,4,16,'Elan','Jeffrey','11A','Higgs Road','Mt Wellington','Auckland','1060','021345879',to_date('26-apr-1992','dd-mon-yyyy'), 'M', 4673354, 'Veterinarian',77500);
INSERT INTO vetStaff VALUES(18,4,16,'Otis','Grace','19B','Jersey Ave','Mt Albert','Auckland','1025','022666345',to_date('19-jan-1987','dd-mon-yyyy'), 'M', 5322256, 'Veterinarian',85000);
INSERT INTO vetStaff VALUES(19,4,16,'Leanne','Khanthee','3','Pukeranga Crescent','Ellerslie','Auckland','1051','021004376',to_date('19-sep-1997','dd-mon-yyyy'), 'F', 9837466, 'Receptionist',49000);

INSERT INTO vetStaff VALUES(20,5,null,'Kyro','Smith','19','Keats Crescent','Enderley','Hamilton','3214','020470345',to_date('26-dec-1987','dd-mon-yyyy'), 'M', 4539805, 'Manager',87000);
INSERT INTO vetStaff VALUES(21,5,20,'Maria','Collins','11','Craig Place','Fairview Downs','Hamilton','3214','027638503',to_date('02-apr-1997','dd-mon-yyyy'), 'F', 723498, 'Veterinarian Assistant',52000);
INSERT INTO vetStaff VALUES(22,5,20,'Jessica','Johns','24','Lloyd Drive','Nawton','Hamilton','3200','022823864',to_date('17-oct-1998','dd-mon-yyyy'), 'F', 3246564, 'Veterinarian',82500);
INSERT INTO vetStaff VALUES(23,5,20,'Jazmin','Boyd','3','Esmae Place','Dinsdale','Hamilton','3204','0204221783',to_date('03-oct-1990','dd-mon-yyyy'), 'F', 982344, 'Receptionist',55200);


CREATE TABLE pharmacy(
drugID NUMBER(5) NOT NULL,
drugName VARCHAR2(25) NOT NULL,
drugDescription VARCHAR2(255) NOT NULL,
drugDosage VARCHAR2(15) NOT NULL,
MethodofAdministration VARCHAR2(20) NOT NULL,
CONSTRAINT pharmacy_drugID_pk PRIMARY KEY (drugID)
);

INSERT INTO pharmacy VALUES(1,'acepromazine','sedative, tranquilizer, and antiemetic', '25MG', 'oral');
INSERT INTO pharmacy VALUES(2,'diazepam','benzodiazepine used to treat status epilepticus', '10MG', 'oral');
INSERT INTO pharmacy VALUES(3,'hydromorphone','opioid analgesic used as a premedication', '2.5MG', 'intravenous');
INSERT INTO pharmacy VALUES(4,'clavaseptin','antibiotic', '500MG', 'oral');
INSERT INTO pharmacy VALUES(5,'gabapentin','strong pain reliever', '300MG', 'oral');
INSERT INTO pharmacy VALUES(6,'ketamine','dissociative anesthetic and tranquilizer in cats, dogs, horses, and other animals', '10MG', 'intravenous');
INSERT INTO pharmacy VALUES(7,'hydroxyzine','antihistamine drug used primarily for treatment of allergies', '10MG', 'oral');
INSERT INTO pharmacy VALUES(8,'mirtazapine','antiemetic and appetite stimulant in cats and dogs', '50MG', 'oral');

CREATE TABLE item(
itemID NUMBER(5) NOT NULL,
itemName VARCHAR2(25) NOT NULL,
itemDescription VARCHAR2(255) NOT NULL,
isSurgical CHAR(1) NOT NULL,
CONSTRAINT item_itemID_pk PRIMARY KEY (itemID)
);

INSERT INTO item VALUES(1,'10cm Bandage','Cohesive wrap for small animals', 'n');
INSERT INTO item VALUES(2,'15cm Bandage','Cohesive wrap for small animals', 'n');
INSERT INTO item VALUES(3,'Bandage Scissors','Stainless Steel scissors', 'n');
INSERT INTO item VALUES(4,'Surgical Set','19 Piece General Surgery Pack', 'y');
INSERT INTO item VALUES(5,'Nail Clipper','Clipper For Small To Medium Dogs', 'n');
INSERT INTO item VALUES(6,'Portable X-Ray Stand','Portable X-Ray Stand is designed for use with many units,', 'n');
INSERT INTO item VALUES(7,'Large Animal Surgical Set','17 Piece General Surgery Pack for Large animals', 'y');


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

INSERT INTO itemStock VALUES(1,1,54,15,50,3);
INSERT INTO itemStock VALUES(1,2,30,15,50,4);
INSERT INTO itemStock VALUES(1,3,11,5,10,15);
INSERT INTO itemStock VALUES(1,4,6,3,5,55);
INSERT INTO itemStock VALUES(1,5,8,5,10,27);
INSERT INTO itemStock VALUES(1,6,3,2,1,650);
INSERT INTO itemStock VALUES(1,7,7,4,4,70);

INSERT INTO itemStock VALUES(2,1,35,15,50,3);
INSERT INTO itemStock VALUES(2,2,19,15,50,4);
INSERT INTO itemStock VALUES(2,3,14,5,10,15);
INSERT INTO itemStock VALUES(2,4,5,3,5,55);
INSERT INTO itemStock VALUES(2,5,9,5,10,27);
INSERT INTO itemStock VALUES(2,6,4,2,1,650);
INSERT INTO itemStock VALUES(2,7,5,4,4,70);

INSERT INTO itemStock VALUES(3,1,48,15,50,3);
INSERT INTO itemStock VALUES(3,2,43,15,50,4);
INSERT INTO itemStock VALUES(3,3,12,5,10,15);
INSERT INTO itemStock VALUES(3,4,7,3,5,55);
INSERT INTO itemStock VALUES(3,5,6,5,10,27);
INSERT INTO itemStock VALUES(3,6,3,2,1,650);
INSERT INTO itemStock VALUES(3,7,8,4,4,70);

INSERT INTO itemStock VALUES(4,1,36,15,50,3);
INSERT INTO itemStock VALUES(4,2,57,15,50,4);
INSERT INTO itemStock VALUES(4,3,13,5,10,15);
INSERT INTO itemStock VALUES(4,4,6,3,5,55);
INSERT INTO itemStock VALUES(4,5,13,5,10,27);
INSERT INTO itemStock VALUES(4,6,2,1,2,650);
INSERT INTO itemStock VALUES(4,7,8,4,4,70);


INSERT INTO itemStock VALUES(5,1,26,15,50,3);
INSERT INTO itemStock VALUES(5,2,47,15,50,4);
INSERT INTO itemStock VALUES(5,3,53,5,10,15);
INSERT INTO itemStock VALUES(5,4,1,3,5,55);
INSERT INTO itemStock VALUES(5,5,19,5,10,27);
INSERT INTO itemStock VALUES(5,6,2,10,2,650);
INSERT INTO itemStock VALUES(5,7,8,2,4,70);


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

INSERT INTO pharmacyStock VALUES(1,1,147,50,200,2);
INSERT INTO pharmacyStock VALUES(1,2,98,50,150,1);
INSERT INTO pharmacyStock VALUES(1,3,43,30,50,4);
INSERT INTO pharmacyStock VALUES(1,4,122,75,100,2);
INSERT INTO pharmacyStock VALUES(1,5,89,50,200,2);
INSERT INTO pharmacyStock VALUES(1,6,104,60,120,3);
INSERT INTO pharmacyStock VALUES(1,7,101,30,75,1);
INSERT INTO pharmacyStock VALUES(1,8,180,80,110,1);

INSERT INTO pharmacyStock VALUES(2,1,71,50,200,2);
INSERT INTO pharmacyStock VALUES(2,2,135,50,150,1);
INSERT INTO pharmacyStock VALUES(2,3,74,30,50,4);
INSERT INTO pharmacyStock VALUES(2,4,99,75,100,2);
INSERT INTO pharmacyStock VALUES(2,5,170,50,200,2);
INSERT INTO pharmacyStock VALUES(2,6,87,60,120,3);
INSERT INTO pharmacyStock VALUES(2,7,48,30,75,1);

INSERT INTO pharmacyStock VALUES(3,1,187,50,200,2);
INSERT INTO pharmacyStock VALUES(3,2,55,50,150,1);
INSERT INTO pharmacyStock VALUES(3,3,57,30,50,4);
INSERT INTO pharmacyStock VALUES(3,4,150,75,100,2);
INSERT INTO pharmacyStock VALUES(3,5,132,50,200,2);
INSERT INTO pharmacyStock VALUES(3,6,152,60,120,3);
INSERT INTO pharmacyStock VALUES(3,7,77,30,75,1);

INSERT INTO pharmacyStock VALUES(4,1,162,50,200,2);
INSERT INTO pharmacyStock VALUES(4,2,122,50,150,1);
INSERT INTO pharmacyStock VALUES(4,3,76,30,50,4);
INSERT INTO pharmacyStock VALUES(4,4,94,75,100,2);
INSERT INTO pharmacyStock VALUES(4,5,85,50,200,2);
INSERT INTO pharmacyStock VALUES(4,6,152,60,120,3);
INSERT INTO pharmacyStock VALUES(4,7,39,30,75,1);
INSERT INTO pharmacyStock VALUES(4,8,95,80,110,1);

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
CONSTRAINT vetExam_staffID_fk FOREIGN KEY (clinicID) REFERENCES vetStaff(staffID),
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
ownerID NUMBER(5) NOT NULL,
CONSTRAINT invoice_invoiceID_pk PRIMARY KEY (invoiceID),
CONSTRAINT invoice_examinationID_fk FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID)
);

INSERT INTO Invoice VALUES(1,to_date('11-oct-2021','dd-mon-yyyy'),'cash',1, (SELECT animalPatients.ownerID FROM vetExamination, animalPatients WHERE vetExamination.animalID = animalPatients.animalID  AND vetExamination.examinationID = 1));
INSERT INTO Invoice VALUES(2,to_date('12-jan-2021','dd-mon-yyyy'),'credit',2,  (SELECT animalPatients.ownerID FROM vetExamination, animalPatients WHERE vetExamination.animalID = animalPatients.animalID  AND vetExamination.examinationID = 2));
INSERT INTO Invoice VALUES(3,to_date('21-aug-2021','dd-mon-yyyy'),'cash',3,  (SELECT animalPatients.ownerID FROM vetExamination, animalPatients WHERE vetExamination.animalID = animalPatients.animalID  AND vetExamination.examinationID = 3));
INSERT INTO Invoice VALUES(4,to_date('14-jan-2021','dd-mon-yyyy'),'cash',4,  (SELECT animalPatients.ownerID FROM vetExamination, animalPatients WHERE vetExamination.animalID = animalPatients.animalID  AND vetExamination.examinationID = 4));
INSERT INTO Invoice VALUES(5,to_date('13-may-2021','dd-mon-yyyy'),'credit',5,  (SELECT animalPatients.ownerID FROM vetExamination, animalPatients WHERE vetExamination.animalID = animalPatients.animalID  AND vetExamination.examinationID = 5));



SELECT * FROM animalowner;
SELECT * FROM vetexamination;
SELECT * FROM animaltreatment;
SELECT * FROM invoice;
SELECT * FROM vettreatment;
SELECT * FROM animalpatients;

SELECT * FROM vetClinic;
SELECT * FROM vetStaff;
SELECT * FROM pharmacy;
SELECT * FROM item;
SELECT * FROM pharmacyStock;
SELECT * FROM itemStock;