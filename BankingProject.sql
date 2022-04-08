DROP DATABASE IF EXISTS `BankingProject`;

-- create a database
CREATE DATABASE IF NOT EXISTS `BankingProject`;

USE `BankingProject`;

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customerId` int(11) NOT NULL,
    name VARCHAR(255) ,
    address VARCHAR(255) ,
   PRIMARY KEY (`customerId`)
) ;


CREATE table banks(
    Bankcode VARCHAR(255) NOT NULL,
    BankName VARCHAR(255) NOT NULL,
    MainOffice VARCHAR(255) NOT NULL,
    Address VARCHAR(255) ,
    Primary Key (Bankcode)
);


CREATE TABLE BRANCHES (
    BranchCode VARCHAR(255) NOT NULL,
    Address VARCHAR(255) ,
    Manager  VARCHAR(255) ,
    HeadOffice VARCHAR(255) ,
    Bankcode VARCHAR(255),
    PRIMARY KEY (BranchCode),
    FOREIGN KEY (Bankcode) REFERENCES Banks(Bankcode)


);

CREATE TABLE EMPLOYEE (
    EmployeeID INTEGER NOT NULL,
    Name VARCHAR(255),
    BranchCode VARCHAR(255) ,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (BranchCode) REFERENCES BRANCHES(BranchCode)
);



CREATE TABLE Admins (
    AdminID INTEGER NOT NULL,
    NAME VARCHAR(255),
    Bankcode VARCHAR(255),
    PRIMARY KEY (AdminID),
    FOREIGN KEY (Bankcode) REFERENCES BANKS(BANKCODE)
);

CREATE TABLE BANKACCOUNTS (
    AccNo VARCHAR(255) NOT NULL,
    Type VARCHAR(255) ,
    BranchCode VARCHAR(255),
    customerId int NOT NULL,
    PRIMARY KEY (AccNo),
    FOREIGN KEY (BranchCode) REFERENCES BRANCHES(BranchCode),
    FOREIGN KEY (customerId) REFERENCES customers(customerId)

);

CREATE TABLE IF NOT EXISTS ACCOUNTS(
    TRANSACTIONNO INT NOT NULL,
    AccNo VARCHAR(255) NOT NULL,
    AMOUNT BIGINT ,
    TYPE ENUM('SAVINGS','CURRENT'),
    TIMESTAMP DATETIME,
    FOREIGN KEY (AccNo) REFERENCES BANKACCOUNTS(AccNo),
    PRIMARY KEY (TRANSACTIONNO)
);

CREATE TABLE reversalRequest(
    requestid int NOT NULL,
    transactionNo int NOT NULL,
    reqDate datetime NOT NULL,
    PRIMARY KEY (requestid),
    FOREIGN KEY (transactionNo) REFERENCES ACCOUNTS(transactionNo)
);





