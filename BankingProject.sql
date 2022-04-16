DROP DATABASE IF EXISTS `BankingProject`;

-- create a database
CREATE DATABASE IF NOT EXISTS `BankingProject`;

USE `bankingproject`;
CREATE TABLE address(
  addressId int NOT NULL ,
  street varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) NOT NULL,
  country varchar(50) NOT NULL,
   pincode int NOT NULL,
  PRIMARY KEY (addressId)
);
DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customerId` int(11) NOT NULL,
    name VARCHAR(255) ,
    address INT NOT NULL,
   PRIMARY KEY (`customerId`),
    FOREIGN KEY (`ADDRESS`) REFERENCES ADDRESS (ADDRESSID)
) ;


CREATE table banks(
    Bankcode INTEGER NOT NULL,
    BankName VARCHAR(255) NOT NULL,
    MainOfficeAddress INT ,
    Primary Key (Bankcode),
    FOREIGN KEY (`MAINOFFICEADDRESS`) REFERENCES ADDRESS (ADDRESSID)
);


CREATE TABLE BRANCHES (
    BranchCode INTEGER NOT NULL,
    Address INT ,
    Manager  VARCHAR(255) ,
    HeadOffice VARCHAR(255) ,
    Bankcode INTEGER NOT NULL,
    PRIMARY KEY (BranchCode),
    FOREIGN KEY (Bankcode) REFERENCES Banks(Bankcode),
FOREIGN KEY (`ADDRESS`) REFERENCES ADDRESS (ADDRESSID)

);

CREATE TABLE EMPLOYEE (
    EmployeeID INTEGER NOT NULL,
    Name VARCHAR(255),
    BranchCode INTEGER ,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (BranchCode) REFERENCES BRANCHES(BranchCode)
);



CREATE TABLE Admins (
    AdminID INTEGER NOT NULL,
    NAME VARCHAR(255),
    Bankcode INTEGER,
    PRIMARY KEY (AdminID),
    FOREIGN KEY (Bankcode) REFERENCES BANKS(BANKCODE)
);

CREATE TABLE BANKACCOUNTS (
    AccNo BIGINT NOT NULL,
     TYPE ENUM('SAVINGS','CURRENT'),
    BranchCode INTEGER,
    customerId int NOT NULL,
    PRIMARY KEY (AccNo),
    FOREIGN KEY (BranchCode) REFERENCES BRANCHES(BranchCode),
    FOREIGN KEY (customerId) REFERENCES customers(customerId)

);

CREATE TABLE IF NOT EXISTS TRANSACTIONS(
    TRANSACTIONNO INT NOT NULL,
    AccNo BIGINT NOT NULL,
    AMOUNT BIGINT ,
    TYPE ENUM('DEBIT','CREDIT'),
    TIMESTAMP DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccNo) REFERENCES BANKACCOUNTS(AccNo),
    PRIMARY KEY (TRANSACTIONNO)
);

CREATE TABLE reversalRequest(
    requestid int NOT NULL,
    transactionNo int NOT NULL,
    reqDate datetime NOT NULL,
    PRIMARY KEY (requestid),
    FOREIGN KEY (transactionNo) REFERENCES TRANSACTIONS(transactionNo)
);


INSERT into address VALUES('20','Nizampet','Hyderabad','Telangana','India','500090');

INSERT INTO Banks VALUES('1234','SBI','20');
INSERT INTO Banks VALUES('4356','ICICI','20');

insert into customers VALUES('12','amruth','20');
insert into branches VALUES('250','20','patil','Delhi','1234');
insert into employee VALUES('430','sridevi','250');

insert into bankaccounts values('89023383','savings','250','12');
INSERT INTO TRANSACTIONS VALUES('2450','89023383','1000','debit',default);