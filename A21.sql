/*
DROP TABLE PART cascade constraints;
DROP TABLE SUPPLIER cascade constraints;
DROP TABLE SUPPLY cascade constraints;
*/

CREATE TABLE PART (
PNO NUMBER(2),
PNAME VARCHAR2(10),
COLOUR VARCHAR2(10),
CONSTRAINT pk_pno PRIMARY KEY (PNO)
);

CREATE TABLE SUPPLIER(
SNO NUMBER(2),
SNAME VARCHAR2(20),
ADDRESS VARCHAR2(50),
CONSTRAINT pk_sno PRIMARY KEY (SNO)
);

CREATE TABLE SUPPLY(
PNO NUMBER(2),
SNO NUMBER(2),
QUANTITY NUMBER(2),
CONSTRAINT pk_pno_sno PRIMARY KEY (PNO,SNO),
CONSTRAINT fk_pno FOREIGN KEY (PNO) REFERENCES PART(PNO),
CONSTRAINT fk_sno FOREIGN KEY (SNO) REFERENCES SUPPLIER(SNO)
);

INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(1,'Wheel','Green');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(2,'Wheel','Brown');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(3,'Steering','Brown');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(4,'Steering','Black');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(5,'Helmet','Black');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(6,'Helmet','Brown');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(7,'Bolts','Brown');
INSERT INTO PART (PNO,PNAME,COLOUR) VALUES(8,'Bolts','Green');

INSERT INTO SUPPLIER(SNO,SNAME,ADDRESS) VALUES(1,'Ram','10 Ramnagar bangalore 40');
INSERT INTO SUPPLIER(SNO,SNAME,ADDRESS) VALUES(2,'Somu','10 Somnagar bangalore 20');
INSERT INTO SUPPLIER(SNO,SNAME,ADDRESS) VALUES(3,'Tom','10 Tomnagar bangalore 30');

INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(1,1,10);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(2,1,5);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(3,1,6);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(4,2,3);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(5,2,2);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(6,2,5);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(7,3,1);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(8,3,8);
INSERT INTO SUPPLY(PNO,SNO,QUANTITY) VALUES(1,3,9);



SELECT PNO FROM SUPPLY WHERE SNO = (SELECT SNO FROM SUPPLIER WHERE SNAME = 'Ram') ;

SELECT SNAME FROM SUPPLIER WHERE SNO in (SELECT SNO FROM SUPPLY WHERE PNO IN (SELECT PNO FROM PART WHERE PNAME = 'Bolts'));

DELETE FROM SUPPLY WHERE PNO IN (SELECT PNO FROM PART WHERE COLOUR = 'Green');
DELETE FROM PART WHERE COLOUR = 'Green';


