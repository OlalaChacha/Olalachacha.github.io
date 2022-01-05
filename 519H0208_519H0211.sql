create database company

use company
--account
create table account
(
	username varchar(20) primary key,
	password varchar(20) not null,
	aName nvarchar(20),
	position varchar(20) not null
)

--product
create table product
(
	pId varchar(5) primary key,
	pName nvarchar(40) not null,
	price float not null
)
--receiptType
create table receiptType
(
	rtId varchar(5) primary key,
	rtType varchar(20) not null
)
--receipt
create table receipt
(
	rId varchar(5) primary key,
	RTime date not null,
	rStatusOrder varchar(30) not null,
	rStatusPayment varchar(30) not null, 
	rtId varchar(5) not null,
	foreign key(rtId) references receiptType(rtId)
)

--receiptInfo
create table receiptInfo
(
	riId varchar(5) primary key,
	rId varchar(5) not null,
	pId varchar(5) not null,
	riNumber int not null default 0,
	foreign key(rId) references receipt(rId),
	foreign key(pId) references product(pId)
)
--Insert values table account
insert into account values ('OlalaChacha1','123','P','Agent');
insert into account values ('OlalaChacha2','123','F','Agent');
insert into account values ('OlalaChacha3','123','D','Agent');
insert into account values ('OnanaChacha1','123','Joseph Joestar','Accountant');
insert into account values ('OnanaChacha2','123','Jonathan Joestar','Accountant');
insert into account values ('OnanaChacha3','123','Jotaro Joestar','Accountant');

--Insert values table product
insert into product values ('P01',N'Hạt mè trắng 500gram',20000);
insert into product values ('P02',N'Hạt mè đen 500gr',72000);
insert into product values ('P03',N'Kẹo mè xửng 300gram',30000);
insert into product values ('P04',N'Nước sốt mè rang',4200);
insert into product values ('P05',N'Bột ngũ cốc mè đen',260000);
insert into product values ('P06',N'Kem đánh răng PS',18500);
insert into product values ('P07',N'Kem đánh răng CloseUp',43000);
insert into product values ('P08',N'Kem đánh răng Sensondyne',42000);
insert into product values ('P09',N'Kem đánh răng Colgate',32000);
insert into product values ('P10',N'Kem đánh răng thảo dược',32000);
--Insert values table receiptType
insert into receiptType values ('RT1','Goods Received');
insert into receiptType values ('RT2','Goods Delivery Note');
--Insert values table receipt
insert into receipt values ('R01','20210517','Transferred','Paid','RT2');
insert into receipt values ('R02','20210527','Transferred','Paid','RT2');
insert into receipt values ('R03','20210617','Transferred','Paid','RT1');
insert into receipt values ('R04','20210707','Transferred','Paid','RT1');
insert into receipt values ('R05','20210713','Transferred','Paid','RT2');
insert into receipt values ('R06','20210717','Transferred','Paid','RT2');
insert into receipt values ('R07','20220103','Being Transferred','Paid','RT2');
insert into receipt values ('R08','20220101','Being Transferred','Unpaid','RT1');
--Insert values table receiptInfo
insert into receiptInfo values ('RI1','R01','P02',2);
insert into receiptInfo values ('RI2','R02','P02',1);
insert into receiptInfo values ('RI3','R03','P06',3);
insert into receiptInfo values ('RI4','R04','P10',2);
insert into receiptInfo values ('RI5','R05','P01',4);
insert into receiptInfo values ('RI6','R06','P05',2);
insert into receiptInfo values ('RI7','R07','P07',1);
insert into receiptInfo values ('RI8','R08','P09',3);
insert into receiptInfo values ('RI9','R01','P08',2);
insert into receiptInfo values ('RI10','R02','P03',1);
insert into receiptInfo values ('RI11','R03','P05',3);
insert into receiptInfo values ('RI12','R04','P07',2);
insert into receiptInfo values ('RI13','R05','P09',4);
insert into receiptInfo values ('RI14','R06','P05',2);
insert into receiptInfo values ('RI15','R07','P08',1);
insert into receiptInfo values ('RI16','R08','P01',3);

select distinct* from receipt r,receiptInfo ri where r.rId = ri.rId

select  distinct*,riNumber*price as Total from receiptInfo, receipt, product where receiptInfo.rId = receipt.rId AND product.pId=receiptInfo.pId 
