rem Shairyl & Ray part B & C

CREATE TABLE vetClinic(
clinicID NUMBER(5) NOT NULL,
clinicStreetNo VARCHAR2(10) NOT NULL,
clinicStreetName VARCHAR2(25) NOT NULL,
clinicSuburb VARCHAR2(25) NOT NULL,
clinicCity VARCHAR2(25) NOT NULL,
clinicPostcode VARCHAR2(5) NOT NULL,
clinicPhoneNo VARCHAR2(15) NOT NULL,
clinicEmail VARCHAR2(30) NOT NULL,
CONSTRAINT vetClinic_clinicphone_chk CHECK (LENGTH(clinicPhoneNo) < 15 AND LENGTH(clinicPhoneNo) > 7),
CONSTRAINT vetClinic_clinicpostcode_chk CHECK (LENGTH(clinicPostcode) = 4),
CONSTRAINT vetClinic_clinicID_pk PRIMARY KEY (clinicID)
);

INSERT INTO vetClinic VALUES(1,'181','Onewa Road','Birkenhead','Auckland','0626','094812376','birkenhead@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(2,'580','New North Road','Morningside','Auckland','1021','098159978','morningside@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(3,'3162','Great North Road','New Lynn','Auckland','0600','096007684','newlynn@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(4,'359','Church Street','Penrose','Auckland','1061','095257655','penrose@kiwivet.co.nz');
INSERT INTO vetClinic VALUES(5,'639','Te Rapa Road','Te Rapa','Hamilton','3200','07767543','terapa@kiwivet.co.nz');

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
CONSTRAINT animalOwner_ownerphone_chk CHECK (LENGTH(ownerPhoneNo) < 15 AND LENGTH(ownerPhoneNo) > 7),
CONSTRAINT animalOwner_ownerpostcode_chk CHECK (LENGTH(ownerPostcode) = 4),
CONSTRAINT animalOwner_ownerID_pk PRIMARY KEY (ownerID),
CONSTRAINT animalOwner_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID)
);

INSERT INTO animalOwner VALUES(1,'Bruce','Wayne','1342','hillsborough rd','Mt Roskill','Auckland','1041','0274990156', 1);
INSERT INTO animalOwner VALUES(2,'Clark','Kent','1231','Arthur rd','Mt Eden','Auckland','1234','0276488917', 2);
INSERT INTO animalOwner VALUES(3,'Diana','Prince','1643','Naruto rd','New Lynn','Auckland','1261','0283086548', 1);
INSERT INTO animalOwner VALUES(4,'John','Constantine','3451','Sasuke rd','Penrose','Auckland','1635','0291650554', 2);
INSERT INTO animalOwner VALUES(5,'Barry','Allen','3451','Metropolis','Hamilton','Hamilton','1635','0216217302', 2);
INSERT INTO animalOwner VALUES(6,'Jake','Dillon','165','Vanderbilt Parade','Northcross','North Shore','0632','0267020774', 3);
INSERT INTO animalOwner VALUES(7,'Katherine','Watts','75','Monarch Grove','Haywards','Lower Hutt','5018','0290705748', 5);
INSERT INTO animalOwner VALUES(8,'Daniel','Gillen','225','Kauae Place','Whakarewarewa','Rotorua','3010','0205295-859', 5);
INSERT INTO animalOwner VALUES(9,'John','Jones','154','Arundel Crescent','Motu Rimu','Invercargill','9812','0273821471', 4);
INSERT INTO animalOwner VALUES(10,'James','Diaz','132','Taylor Street','Maungatapu','Tauranga','9812','0209115743', 4);

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
staffPostcode VARCHAR2(5) NOT NULL,
staffPhoneNo VARCHAR2(15) NOT NULL,
staffDOB DATE NOT NULL,
staffGender CHAR(1) NOT NULL,
staffIRN NUMBER(9) NOT NULL,
staffRole VARCHAR2(20) NOT NULL,
annualSalary NUMBER(7) NOT NULL,
CONSTRAINT vetStaff_staffphone_chk CHECK (LENGTH(staffPhoneNo) < 15 AND LENGTH(staffPhoneNo) > 7),
CONSTRAINT vetStaff_staffpostcode_chk CHECK (LENGTH(staffPostcode) = 4),
CONSTRAINT vetStaff_staffirn_chk CHECK (LENGTH(staffIRN) = 9),
CONSTRAINT vetStaff_staffID_pk PRIMARY KEY (staffID),
CONSTRAINT vetStaff_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT vetStaff_managerID_fk FOREIGN KEY (managerID) REFERENCES vetStaff(staffID)
);

INSERT INTO vetStaff VALUES(1,1,null,'Josh','Murdoch','4A','Holdaway Avenue','Northcote','Auckland','0627','0224055402',to_date('13-oct-1986','dd-mon-yyyy'), 'M', 738475189, 'Manager',104000);
INSERT INTO vetStaff VALUES(2,1,1,'Lucy','Yang','24','Jersey Avenue','Mt Albert','Auckland','1025','0214037401',to_date('07-jun-1993','dd-mon-yyyy'), 'F', 738265345, 'Vet Nurse',65000);
INSERT INTO vetStaff VALUES(3,1,1,'Jasmine','Luke','54B','Sequoia Place','Sunnynook','Auckland','0620','020433745',to_date('19-jun-1991','dd-mon-yyyy'), 'F', 354977543, 'Veterinarian',73000);
INSERT INTO vetStaff VALUES(4,1,1,'Reece','Graham','1','Parkhead Place','Rosedale','Auckland','0632','0210264749',to_date('25-nov-1987','dd-mon-yyyy'), 'M', 810285556,'Veterinarian',73000);
INSERT INTO vetStaff VALUES(5,1,1,'Brian','Logan','86','Grant Street','Mt Albert','Auckland','1025','0221188172',to_date('22-feb-1983','dd-mon-yyyy'), 'M', 112747333, 'Veterinarian',73000);
INSERT INTO vetStaff VALUES(6,1,1,'Jessica','Lawn','33A','Beatrice Avenue','Hillcrest','Auckland','0627','0220230222',to_date('09-jun-1992','dd-mon-yyyy'), 'F', 854773056,'Receptionist',55000);

INSERT INTO vetStaff VALUES(7,2,null,'Blake','Crouch','4A','Owens Road','Epson','Auckland','1023','0222212545',to_date('13-oct-1986','dd-mon-yyyy'), 'M', 738475109, 'Manager',110000);
INSERT INTO vetStaff VALUES(8,2,7,'Bella','Gallagher','9','Edendale Crescent','Mt Eden','Auckland','1024','022196487',to_date('27-dec-1991','dd-mon-yyyy'), 'F', 384774615, 'Veterinarian',85000);
INSERT INTO vetStaff VALUES(9,2,7,'Tim','OSullivan','4','Martin Ave','Mt Albert','Auckland','1025','022196402',to_date('01-dec-1990','dd-mon-yyyy'), 'M', 845501132, 'Veterinarian',82000);
INSERT INTO vetStaff VALUES(10,2,7,'Ruth','OSullivan','4','Martin Ave','Mt Albert','Auckland','1025','022196414',to_date('19-jan-1987','dd-mon-yyyy'), 'F', 123932276, 'Veterinarian',85000);
INSERT INTO vetStaff VALUES(11,2,7,'Isabella','Rose','51','Webster Street','Mt Roskill','Auckland','1041','0221045407',to_date('23-jun-1989','dd-mon-yyyy'), 'F', 854774388,'Receptionist',56000);

INSERT INTO vetStaff VALUES(12,3,null,'Jeff','Owens','4A','Owens Road','Epson','Auckland','1023','0222212545',to_date('21-nov-1984','dd-mon-yyyy'), 'M', 395844429, 'Manager',110000);
INSERT INTO vetStaff VALUES(13,3,12,'Tim','Musk','17C','Lancing Road','Sandringham','Auckland','1025','0214007601',to_date('08-jun-1993','dd-mon-yyyy'), 'F', 212422564, 'Veterinarian',65000);
INSERT INTO vetStaff VALUES(14,3,12,'Brian','Logan','86','Grant Street','Mt Albert','Auckland','1025','0221188172',to_date('01-feb-1983','dd-mon-yyyy'), 'M', 158395677, 'Veterinarian',73000);
INSERT INTO vetStaff VALUES(15,3,12,'Elizabeth','Blake','4','Martin Ave','Mt Albert','Auckland','1025','022196402',to_date('01-dec-1990','dd-mon-yyyy'), 'F', 449374402, 'Receptionist',55000);
INSERT INTO vetStaff VALUES(16,3,12,'Steven','Lugo','85','Ireland Street','Westhaven','Auckland','1011','0204790404',to_date('03-mar-1993','dd-mon-yyyy'), 'F', 144493907, 'Vet Assistant',62000);
INSERT INTO vetStaff VALUES(17,3,12,'Megan','Killinger','68','Sprott Road','St Heliers','Auckland','1071','0216710240',to_date('24-apr-1987','dd-mon-yyyy'), 'F', 315785456, 'Veterinarian',72000);
INSERT INTO vetStaff VALUES(18,3,12,'Katherine','Rosario','141A','Short Street','Freemans Bay','Auckland','1011','0276283275',to_date('30-mar-1986','dd-mon-yyyy'), 'F', 521362933, 'Receptionist',58000);

INSERT INTO vetStaff VALUES(19,4,null,'Anne','Simons','26','Moana Avenue','Onehunga','Auckland','1061','0204705672',to_date('01-mar-1980','dd-mon-yyyy'), 'F', 559380532, 'Manager',95400);
INSERT INTO vetStaff VALUES(20,4,16,'Elan','Jeffrey','11A','Higgs Road','Mt Wellington','Auckland','1060','021345879',to_date('26-apr-1992','dd-mon-yyyy'), 'M', 114673354, 'Veterinarian',77500);
INSERT INTO vetStaff VALUES(21,4,16,'Otis','Grace','19B','Jersey Ave','Mt Albert','Auckland','1025','022666345',to_date('19-jan-1987','dd-mon-yyyy'), 'M', 165322256, 'Veterinarian',85000);
INSERT INTO vetStaff VALUES(22,4,16,'Leanne','Khanthee','3','Pukeranga Crescent','Ellerslie','Auckland','1051','021004376',to_date('19-sep-1997','dd-mon-yyyy'), 'F', 239837466, 'Receptionist',49000);
INSERT INTO vetStaff VALUES(23,4,20,'Sergio','Ferris','65','Laurel Street','Sandringham','Auckland','1025','0267112239',to_date('07-jul-1984','dd-mon-yyyy'), 'F', 102091548, 'Vet Assistant',72800);

INSERT INTO vetStaff VALUES(24,5,null,'Kyro','Smith','19','Keats Crescent','Enderley','Hamilton','3214','020470345',to_date('26-dec-1987','dd-mon-yyyy'), 'M', 264539805, 'Manager',97000);
INSERT INTO vetStaff VALUES(25,5,20,'Maria','Collins','11','Craig Place','Fairview Downs','Hamilton','3214','027638503',to_date('02-apr-1997','dd-mon-yyyy'), 'F', 194723498, 'Vet Assistant',52000);
INSERT INTO vetStaff VALUES(26,5,20,'Jessica','Johns','24','Lloyd Drive','Nawton','Hamilton','3200','022823864',to_date('17-oct-1998','dd-mon-yyyy'), 'F', 133246564, 'Veterinarian',82500);
INSERT INTO vetStaff VALUES(27,5,20,'Jazmin','Boyd','3','Esmae Place','Dinsdale','Hamilton','3204','0204221783',to_date('03-oct-1990','dd-mon-yyyy'), 'F', 209823443, 'Receptionist',55200);
INSERT INTO vetStaff VALUES(28,5,20,'Marian','Rowland','35','River Oaks Place','Te Rapa Park','Hamilton','3200','0203141123',to_date('27-feb-1975','dd-mon-yyyy'), 'F', 183246356, 'Veterinarian',75200);
INSERT INTO vetStaff VALUES(29,5,20,'Eric','McKay','103','Ballance Street','Te Awamutu','Hamilton','3800','0204043147',to_date('12-feb-1989','dd-mon-yyyy'), 'M', 174532891, 'Veterinarian',82800);
INSERT INTO vetStaff VALUES(30,5,20,'Wendy','Moore','245','Miro Street','Nawton','Hamilton','3200','0269614499',to_date('29-apr-1991','dd-mon-yyyy'), 'F', 202091548, 'Receptionist',60500);


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
CONSTRAINT itemStock_itemCost_chk CHECK (itemCost > 0),
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
pharmaReorderLevel NUMBER(5) NOT NULL,
pharmaReorderQuantity NUMBER(5) NOT NULL,
pharmaCost NUMBER(5) NOT NULL,
CONSTRAINT pharmacyStock_pharmaCost_chk CHECK (pharmaCost > 0),
CONSTRAINT pharmaStock_pk PRIMARY KEY (clinicID, drugID),
CONSTRAINT pharmaStock_clinicID_fk FOREIGN KEY (clinicID) REFERENCES vetClinic(clinicID),
CONSTRAINT pharmaStock_drugID_fk FOREIGN KEY (drugID) REFERENCES pharmacy(drugID)
);

INSERT INTO pharmacyStock VALUES(1,1,51,50,200,2);
INSERT INTO pharmacyStock VALUES(1,2,98,50,150,1);
INSERT INTO pharmacyStock VALUES(1,3,43,30,50,4);
INSERT INTO pharmacyStock VALUES(1,4,122,75,100,2);
INSERT INTO pharmacyStock VALUES(1,5,58,50,200,2);
INSERT INTO pharmacyStock VALUES(1,6,104,60,120,3);
INSERT INTO pharmacyStock VALUES(1,7,41,30,75,1);
INSERT INTO pharmacyStock VALUES(1,8,180,80,110,1);

INSERT INTO pharmacyStock VALUES(2,1,71,50,200,2);
INSERT INTO pharmacyStock VALUES(2,2,135,50,150,1);
INSERT INTO pharmacyStock VALUES(2,3,74,30,50,4);
INSERT INTO pharmacyStock VALUES(2,4,99,75,100,2);
INSERT INTO pharmacyStock VALUES(2,5,170,50,200,2);
INSERT INTO pharmacyStock VALUES(2,6,87,60,120,3);
INSERT INTO pharmacyStock VALUES(2,7,32,30,75,1);

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

INSERT INTO pharmacyStock VALUES(5,1,154,50,200,2);
INSERT INTO pharmacyStock VALUES(5,2,96,50,150,1);
INSERT INTO pharmacyStock VALUES(5,3,65,30,50,4);
INSERT INTO pharmacyStock VALUES(5,4,140,75,100,2);
INSERT INTO pharmacyStock VALUES(5,5,187,50,200,2);
INSERT INTO pharmacyStock VALUES(5,6,122,60,120,3);
INSERT INTO pharmacyStock VALUES(5,7,40,30,75,1);
INSERT INTO pharmacyStock VALUES(5,8,111,80,110,1);

CREATE TABLE vetTreatment(
treatmentID NUMBER(5) NOT NULL, 
treatmentDesc VARCHAR2(255) NOT NULL, 
treatmentCharge NUMBER(10) NOT NULL,
CONSTRAINT vetTreatment_treatmentChrg_chk CHECK (treatmentCharge > 0),
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
INSERT INTO vetTreatment VALUES(10,'treatment charge',20);


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
INSERT INTO animalPatients VALUES(8,'Bordercollie','intelligent',to_date('15-mar-2020','dd-mon-yyyy'), to_date('23-aug-2021','dd-mon-yyyy'), 5, 5);
INSERT INTO animalPatients VALUES(9,'German Shepherd','very sensible',to_date('15-jan-2020','dd-mon-yyyy'), to_date('23-feb-2021','dd-mon-yyyy'), 6, 5);
INSERT INTO animalPatients VALUES(10,'Poodle','is friendly',to_date('11-feb-2020','dd-mon-yyyy'), to_date('01-jun-2021','dd-mon-yyyy'), 7, 4);
INSERT INTO animalPatients VALUES(11,'rottweiler','is Aggressive',to_date('11-dec-2020','dd-mon-yyyy'), to_date('01-jan-2021','dd-mon-yyyy'), 8, 2);

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

INSERT INTO vetExamination VALUES(1,to_date('11-oct-2021','dd-mon-yyyy'),'12:15:21','No severe Treatment Needed',1,2,2);
INSERT INTO vetExamination VALUES(2,to_date('12-jan-2021','dd-mon-yyyy'),'13:30:34','Give vaccine',2,1,1);
INSERT INTO vetExamination VALUES(3,to_date('21-aug-2021','dd-mon-yyyy'),'16:23:35','Ear needs treatment',5,3,1);
INSERT INTO vetExamination VALUES(4,to_date('14-jan-2021','dd-mon-yyyy'),'14:14:37','eye needs treatment',4,1,1);
INSERT INTO vetExamination VALUES(5,to_date('13-may-2021','dd-mon-yyyy'),'21:12:39','nose needs treatment',7,3,2);
INSERT INTO vetExamination VALUES(6,to_date('14-jun-2021','dd-mon-yyyy'),'23:02:30','stool sample may be needed',8,26,2);
INSERT INTO vetExamination VALUES(7,to_date('17-jul-2021','dd-mon-yyyy'),'13:22:31','very healthy',9,3,4);
INSERT INTO vetExamination VALUES(8,to_date('17-aug-2021','dd-mon-yyyy'),'10:21:31','Pet is very young',10,1,5);


CREATE TABLE animalTreatment(
examinationID NUMBER(5) NOT NULL, 
treatmentID NUMBER(5) NOT NULL, 
treatmentStartDate DATE, 
treatmentEndDate DATE, 
quantityOfTreatment NUMBER(10), 
treatmentComments VARCHAR2(255),
CONSTRAINT animalTreat_pk PRIMARY KEY (examinationID, treatmentID),
CONSTRAINT animalTreat_examinationID_fk FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID),
CONSTRAINT animalTreat_treatmentID_fk FOREIGN KEY (treatmentID) REFERENCES vetTreatment(treatmentID)
);

INSERT INTO animalTreatment VALUES(1,1,to_date('11-oct-2021','dd-mon-yyyy'),to_date('12-feb-2021','dd-mon-yyyy'),1,'come back to clinic for reassesment');
INSERT INTO animalTreatment VALUES(1,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(2,3,to_date('12-jan-2021','dd-mon-yyyy'),to_date('18-mar-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(2,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(3,4,to_date('21-aug-2021','dd-mon-yyyy'),to_date('30-jan-2021','dd-mon-yyyy'),1,'give healthy food');
INSERT INTO animalTreatment VALUES(3,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(1,2,to_date('10-nov-2021','dd-mon-yyyy'),to_date('19-nov-2021','dd-mon-yyyy'),1,'more antibiotics');
INSERT INTO animalTreatment VALUES(4,9,to_date('14-jan-2021','dd-mon-yyyy'),to_date('9-may-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(4,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(4,8,to_date('14-jan-2021','dd-mon-yyyy'),to_date('19-apr-2021','dd-mon-yyyy'),2,null);
INSERT INTO animalTreatment VALUES(5,7,to_date('13-may-2021','dd-mon-yyyy'),to_date('20-jun-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(5,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(5,8,to_date('11-feb-2021','dd-mon-yyyy'),to_date('20-feb-2021','dd-mon-yyyy'),1,'ready');
INSERT INTO animalTreatment VALUES(6,1,to_date('11-jan-2021','dd-mon-yyyy'),to_date('12-jan-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(6,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(7,2,to_date('17-jul-2021','dd-mon-yyyy'),to_date('17-jul-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(7,10,null,null,null,null);
INSERT INTO animalTreatment VALUES(8,3,to_date('18-aug-2021','dd-mon-yyyy'),to_date('18-sep-2021','dd-mon-yyyy'),1,null);
INSERT INTO animalTreatment VALUES(8,10,null,null,null,null);

CREATE TABLE invoice(
invoiceID NUMBER(5) NOT NULL, 
paymentDate DATE NOT NULL, 
paymentDetails VARCHAR2(255) NULL,  
examinationID NUMBER(5) NOT NULL,
ownerID NUMBER(5) NOT NULL,
totalCost NUMBER(5) NOT NULL,
CONSTRAINT invoice_invoiceID_pk PRIMARY KEY (invoiceID),
CONSTRAINT invoice_examinationID_fk FOREIGN KEY (examinationID) REFERENCES vetExamination(examinationID)
);

INSERT INTO Invoice VALUES(1,to_date('2-feb-2021','dd-mon-yyyy'),'debit',1, 1, 45);
INSERT INTO Invoice VALUES(2,to_date('7-mar-2021','dd-mon-yyyy'),'credit',2, 2, 120);
INSERT INTO Invoice VALUES(3,to_date('21-aug-2021','dd-mon-yyyy'),'cash',3, 1, 25);
INSERT INTO Invoice VALUES(4,to_date('14-jan-2021','dd-mon-yyyy'),'debit',4, 4, 440);
INSERT INTO Invoice VALUES(5,to_date('13-may-2021','dd-mon-yyyy'),'credit',5, 4, 480);
INSERT INTO Invoice VALUES(6,to_date('11-jan-2021','dd-mon-yyyy'),'cash',6, 5, 45);
INSERT INTO Invoice VALUES(7,to_date('17-jul-2021','dd-mon-yyyy'),'credit',7, 6, 65);
INSERT INTO Invoice VALUES(8,to_date('18-aug-2021','dd-mon-yyyy'),'debit',8, 7, 120);

COMMIT;