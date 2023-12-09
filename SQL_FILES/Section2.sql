--TABLE CREATION, DATA INSERTION, UPDATION, DELETION

--Table creation
CREATE TABLE userdetails ( user_id INTEGER PRIMARY KEY, user_name VARCHAR(20) UNIQUE NOT NULL,
email_address VARCHAR(20) UNIQUE NOT NULL, password VARCHAR(20) NOT NULL,
contact INTEGER UNIQUE NOT NULL, account_type VARCHAR(20) NOT NULL );

CREATE TABLE assets ( asset_id INTEGER PRIMARY KEY, asset_name VARCHAR(20) NOT NULL, asset_type VARCHAR(20) NOT NULL );

CREATE TABLE account ( account_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, account_type VARCHAR(20) NOT NULL,
account_status VARCHAR(20) NOT NULL, FOREIGN KEY (user_id) REFERENCES userdetails(user_id) ); 

CREATE TABLE location ( location_id INTEGER PRIMARY KEY, country VARCHAR(20) NOT NULL, state VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL );

CREATE TABLE bank ( bank_id INTEGER PRIMARY KEY, bank_name VARCHAR(20) NOT NULL, bank_address VARCHAR(100) NOT NULL );

CREATE TABLE exchange ( exchange_id INTEGER PRIMARY KEY, exchange_name VARCHAR(20) NOT NULL, exchange_country VARCHAR(20) NOT NULL );

CREATE TABLE portfolio_details ( portfolio_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, asset_id INTEGER NOT NULL, quantity INTEGER NOT NULL,
price DECIMAL(10,2) NOT NULL, FOREIGN KEY (user_id) REFERENCES userdetails(user_id), FOREIGN KEY (asset_id) REFERENCES assets(asset_id) ); 

CREATE TABLE orders ( order_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, asset_id INTEGER NOT NULL, order_type VARCHAR(20) NOT NULL,
order_status VARCHAR(20) NOT NULL, FOREIGN KEY (user_id) REFERENCES userdetails(user_id), FOREIGN KEY (asset_id) REFERENCES assets(asset_id) ); 

CREATE TABLE trades ( trade_id INTEGER PRIMARY KEY, order_id INTEGER NOT NULL, trade_price DECIMAL(10,2) NOT NULL, trade_volume INTEGER NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id) ); 

CREATE TABLE deposits ( deposit_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, bank_id INTEGER NOT NULL, deposit_amount DECIMAL(10,2) NOT NULL,
deposit_date DATE NOT NULL, FOREIGN KEY (user_id) REFERENCES userdetails(user_id), FOREIGN KEY (bank_id) REFERENCES bank(bank_id)); 

CREATE TABLE withdrawals ( withdrawal_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, bank_id INTEGER NOT NULL, withdrawal_amount DECIMAL(10,2) NOT NULL,
withdrawal_date DATE NOT NULL, FOREIGN KEY (user_id) REFERENCES userdetails(user_id), FOREIGN KEY (bank_id) REFERENCES bank(bank_id) ); 

CREATE TABLE fees ( fee_id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, fee_amount DECIMAL(10,2) NOT NULL, fee_description VARCHAR(100) NOT NULL,
FOREIGN KEY (user_id) REFERENCES userdetails(user_id) );

--Value insertion

--userdetails
INSERT INTO userdetails VALUES (1012345678,'John Doe','johndoe@email.com','pwd1234',9876543210,'Premium');
INSERT INTO userdetails VALUES (1023456789,'Jane Smith','janesmith@email.com','pwd4321',912345678,'Basic');
INSERT INTO userdetails VALUES (1033456789,'Bob Wilson','bobwilson@email.com','pwd5678',9234567810,'Premium');
INSERT INTO userdetails VALUES (1043456789,'Sara Davies','saradavies@email.com','pwd8765',9345678912,'Basic');
INSERT INTO userdetails VALUES (1053456789,'Mike Robinson','mikrobnson@email.com','pwd5432',9445678912,'Premium');
INSERT INTO userdetails VALUES (1063456789,'Lisa Thompson','lsathmpson@email.com','pwd7654',9545678912,'Basic');
INSERT INTO userdetails VALUES (1073456789,'Steven Garcia','stvngarcia@email.com','pwd1234',9645678912,'Premium');
INSERT INTO userdetails VALUES (1083456789,'Susan Lee','susanlee@email.com','pwd4321',9745678912,'Basic');
INSERT INTO userdetails VALUES (1093456789,'Tom Harris','tomharris@email.com','pwd5678',9845678912,'Premium');
INSERT INTO userdetails VALUES (1103456789,'Mary Johnson','mryjhnson@email.com','pwd8765',9945678912,'Basic');

--assets
INSERT INTO assets VALUES (1001,'XYZ Corp','Stock');
INSERT INTO assets VALUES (1002,'ABC Inc','Stock');
INSERT INTO assets VALUES (1003,'MNO Bank','Stock');
INSERT INTO assets VALUES (1004,'DEF Ltd','Stock');
INSERT INTO assets VALUES (1005,'GHI Trust','Stock');
INSERT INTO assets VALUES (1006,'JKL Mutual Fund','Mutual Fund');
INSERT INTO assets VALUES (1007,'PQR ETF','ETF');
INSERT INTO assets VALUES (1008,'STU Bond','Bond'); 
INSERT INTO assets VALUES (1009,'VWX Currency','Currency');
INSERT INTO assets VALUES (1010,'YZA Crypto','Crypto');

--account
INSERT INTO account VALUES (20001,1012345678,'Margin','Active');
INSERT INTO account VALUES (20002,1023456789,'Cash','Active');
INSERT INTO account VALUES (20003,1033456789,'Margin','Active');
INSERT INTO account VALUES (20004,1043456789,'Cash','Active');
INSERT INTO account VALUES (20005,1053456789,'Margin','Active');
INSERT INTO account VALUES (20006,1063456789,'Cash','Active');
INSERT INTO account VALUES (20007,1073456789,'Margin','Active');
INSERT INTO account VALUES (20008,1083456789,'Cash','Active');
INSERT INTO account VALUES (20009,1093456789,'Margin','Active'); 
INSERT INTO account VALUES (20010,1103456789,'Cash','Active');

--location
INSERT INTO location VALUES(30001,'USA','California','Los Angeles');
INSERT INTO location VALUES(30002,'USA','Texas','Houston');
INSERT INTO location VALUES(30003,'USA','New York','New York'); 
INSERT INTO location VALUES(30004,'India','Maharashtra','Mumbai');
INSERT INTO location VALUES(30005,'India','Karnataka','Bangalore'); 
INSERT INTO location VALUES(30006,'UK','England','London');
INSERT INTO location VALUES(30007,'Japan','Tokyo','Tokyo'); 
INSERT INTO location VALUES(30008,'France','Île-de-France','Paris'); 
INSERT INTO location VALUES(30009,'Canada','Ontario','Toronto');
INSERT INTO location VALUES(30010,'Australia','New South Wales','Sydney');

--bank
INSERT INTO bank VALUES(40001,'Citi Bank','388 Greenwich St, New York, NY 10013, USA');
INSERT INTO bank VALUES(40002,'HSBC','452 Fifth Ave, New York, NY 10018, USA');
INSERT INTO bank VALUES(40003,'Barclays','745 Seventh Ave, New York, NY 10019, USA'); 
INSERT INTO bank VALUES(40004,'RBC','200 Vesey St, New York, NY 10281, USA');
INSERT INTO bank VALUES(40005,'TD Bank','1701 Route 70 E, Cherry Hill, NJ 08034, USA');
INSERT INTO bank VALUES(40006,'Capital One','1680 Capital One Dr, McLean, VA 22102, USA');
INSERT INTO bank VALUES(40007,'ICICI','ICICI Bank Tower, Bandra Kurla Complex, Mumbai 400051');
INSERT INTO bank VALUES(40008,'HDFC','HDFC Bank House, Senapati Bapat Marg, Lower Parel, Mumbai 400013');
INSERT INTO bank VALUES(40009,'Deutsche Bank','Taunusanlage 12, 60325 Frankfurt am Main, Germany');
INSERT INTO bank VALUES(40010,' BNP Paribas','16 Boulevard des Italiens, 75009 Paris, France');

--exchange
INSERT INTO exchange VALUES (50001,'NYSE','USA');
INSERT INTO exchange VALUES (50002,'NASDAQ','USA'); 
INSERT INTO exchange VALUES (50003,'LSE','UK');
INSERT INTO exchange VALUES (50004,'TSX','Canada');
INSERT INTO exchange VALUES (50005,'NSE','India');
INSERT INTO exchange VALUES (50006,'BSE','India'); 
INSERT INTO exchange VALUES (50007,'Nikkei','Japan'); 
INSERT INTO exchange VALUES (50008,'DB','Germany');
INSERT INTO exchange VALUES (50009,'Euronext','France'); 
INSERT INTO exchange VALUES (50010,'ASX','Australia');

--portfolio_details
INSERT INTO portfolio_details VALUES (60001,1012345678,1001,100,510.25);
INSERT INTO portfolio_details VALUES (60002,1012345678,1002,250,82.50);
INSERT INTO portfolio_details VALUES (60003,1023456789,1003,75,195.55);
INSERT INTO portfolio_details VALUES (60004,1033456789,1004,300,25.75);
INSERT INTO portfolio_details VALUES (60005,1043456789,1005,450,17.85);
INSERT INTO portfolio_details VALUES (60006,1053456789,1006,200,28.45);
INSERT INTO portfolio_details VALUES (60007,1063456789,1007,600,52.30);
INSERT INTO portfolio_details VALUES (60008,1073456789,1008,125,998.50);
INSERT INTO portfolio_details VALUES (60009,1083456789,1009,1100,1.15);
INSERT INTO portfolio_details VALUES (60010,1093456789,1010,950,47382.35);

--orders
INSERT INTO orders VALUES (70001,1012345678,1001,'Market','Filled');
INSERT INTO orders VALUES (70002,1023456789,1002,'Limit','Partially Filled');
INSERT INTO orders VALUES (70003,1033456789,1003,'Market','Cancelled');
INSERT INTO orders VALUES (70004,1043456789,1004,'Limit','Filled');
INSERT INTO orders VALUES (70005,1053456789,1005,'Market','Filled');
INSERT INTO orders VALUES (70006,1063456789,1006,'Limit','Open');
INSERT INTO orders VALUES (70007,1073456789,1007,'Market','Filled');
INSERT INTO orders VALUES (70008,1083456789,1008,'Limit','Cancelled');
INSERT INTO orders VALUES (70009,1093456789,1009,'Market','Partially Filled');
INSERT INTO orders VALUES (70010,1103456789,1010,'Limit','Open');

--trades
INSERT INTO trades VALUES (80001,70001,512.15,50);
INSERT INTO trades VALUES (80002,70002,83.10,100);
INSERT INTO trades VALUES (80003,70004,26.05,200);
INSERT INTO trades VALUES (80004,70005,18.20,300);
INSERT INTO trades VALUES (80005,70007,53.75,400);
INSERT INTO trades VALUES (80006,70009,1.17,500);

--deposits
INSERT INTO deposits VALUES (90001, 1012345678, 40001, 5500.00, TO_DATE('2023-02-14', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90002, 1023456789, 40002, 2500.00, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90003, 1033456789, 40003, 10000.00, TO_DATE('2023-02-25', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90004, 1043456789, 40004, 3000.00, TO_DATE('2023-03-05', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90005, 1053456789, 40005, 4000.00, TO_DATE('2023-03-12', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90006, 1063456789, 40006, 1500.00, TO_DATE('2023-03-18', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90007, 1073456789, 40007, 6000.00, TO_DATE('2023-03-22', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90008, 1083456789, 40008, 2000.00, TO_DATE('2023-03-28', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90009, 1093456789, 40009, 7500.00, TO_DATE('2023-04-02', 'YYYY-MM-DD'));
INSERT INTO deposits VALUES (90010, 1103456789, 40010, 1000.00, TO_DATE('2023-04-10', 'YYYY-MM-DD'));

--withdrawals
INSERT INTO withdrawals VALUES (10001, 1012345678, 40001, 2000.00, TO_DATE('2023-02-16', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10002, 1023456789, 40002, 1000.00, TO_DATE('2023-02-22', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10003, 1033456789, 40003, 3000.00, TO_DATE('2023-02-28', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10004, 1043456789, 40004, 500.00, TO_DATE('2023-03-08', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10005, 1053456789, 40005, 2500.00, TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10006, 1063456789, 40006, 800.00, TO_DATE('2023-03-20', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10007, 1073456789, 40007, 1500.00, TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10008, 1083456789, 40008, 700.00, TO_DATE('2023-03-30', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10009, 1093456789, 40009, 2000.00, TO_DATE('2023-04-05', 'YYYY-MM-DD'));
INSERT INTO withdrawals VALUES (10010, 1103456789, 40010, 300.00, TO_DATE('2023-04-12', 'YYYY-MM-DD'));


--fees
INSERT INTO fees VALUES (11001,1012345678,9.99,'Monthly account fee');
INSERT INTO fees VALUES (11002,1023456789,4.99,'Monthly account fee');
INSERT INTO fees VALUES (11003,1033456789,9.99,'Monthly account fee');
INSERT INTO fees VALUES (11004,1043456789,4.99,'Monthly account fee');
INSERT INTO fees VALUES (11005,1053456789,9.99,'Monthly account fee');
INSERT INTO fees VALUES (11006,1063456789,4.99,'Monthly account fee');
INSERT INTO fees VALUES (11007,1073456789,9.99,'Monthly account fee');
INSERT INTO fees VALUES (11008,1083456789,4.99,'Monthly account fee');
INSERT INTO fees VALUES (11009,1093456789,9.99,'Monthly account fee');
INSERT INTO fees VALUES (11010,1103456789,4.99,'Monthly account fee');

select * from withdrawals;


--data updation
select * from account where account_id = 20009;

update account
set account_status = 'Inactive'
where account_id = 20009;

select * from account where account_id = 20009;

--data deletion
select * from fees;

delete from fees
where fee_id = 11002;

select * from fees;

