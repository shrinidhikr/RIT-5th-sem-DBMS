/*
DROP TABLE BOAT cascade constraints;
DROP TABLE SAILOR cascade constraints;
DROP TABLE RESERVES cascade constraints;
*/

CREATE TABLE BOAT (
BID NUMBER(2),
BNAME VARCHAR2(10),
COLOUR VARCHAR2(10),
CONSTRAINT pk_bid PRIMARY KEY (BID)
);

CREATE TABLE SAILOR(
SID NUMBER(2),
SNAME VARCHAR2(20),
AGE NUMBER(2),
RATING NUMBER(2),
CONSTRAINT pk_sid PRIMARY KEY (SID)
);

CREATE TABLE RESERVES(
BID NUMBER(2),
SID NUMBER(2),
DAY VARCHAR2(10),
CONSTRAINT fk_bid FOREIGN KEY (BID) REFERENCES BOAT(BID),
CONSTRAINT fk_sid FOREIGN KEY (SID) REFERENCES SAILOR(SID)
);

INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(1,'Aarav','Green');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(2,'Vivaan','Brown');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(3,'Vihaan','Brown');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(4,'Aditya','Black');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(5,'Reyansh','Black');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(6,'Sai','Brown');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(7,'Muhammad','Brown');
INSERT INTO BOAT (BID,BNAME,COLOUR) VALUES(8,'Vineeth','Green');

INSERT INTO SAILOR(SID,SNAME,AGE,RATING) VALUES(1,'Ram',20,5);
INSERT INTO SAILOR(SID,SNAME,AGE,RATING) VALUES(2,'John',30,4);
INSERT INTO SAILOR(SID,SNAME,AGE,RATING) VALUES(3,'Tom',35,4);

INSERT INTO RESERVES(BID,SID,DAY) VALUES(1,1,'Monday');
INSERT INTO RESERVES(BID,SID,DAY) VALUES(2,1,'Monday');
INSERT INTO RESERVES(BID,SID,DAY) VALUES(3,1,'Friday');
INSERT INTO RESERVES(BID,SID,DAY) VALUES(4,2,'Wednesday');
INSERT INTO RESERVES(BID,SID,DAY) VALUES(5,2,'Tuesday');
INSERT INTO RESERVES(BID,SID,DAY) VALUES(6,2,'Friday');
INSERT INTO RESERVES(BID,SID,DAY) VALUES(8,3,'Monday');
