Create Database DMS;
use DMS
Create table Doc_Master_Login(
UserId int,
UserName Varchar(255),
Password Varchar(255),
FullName Varchar(255),
Email Varchar(255),
CreatedOn Varchar(255),
Status Bit 

primary key (UserId)
);
select * from Doc_Master_Login
insert into Doc_Master_Login values ('1','Adarsh','Adarsh@123','Adarsh singh','Adarsh@gmail.com','07/06/2022','1')
insert into Doc_Master_Login values ('2','Vaishu','Akshita@123','Akshita singh','Akshita@gmail.com','07/06/2022','1')
insert into Doc_Master_Login values ('3','Vaishu','Akshita@123','Akshita singh','Akshita@gmail.com','07/06/2022','0')

insert into Doc_Master_Login values ('4','Kartik','Kartik@123','Kartik Kaushik','Kartik@gmail.com','07/06/2022','1')

create table Doc_Master_Role(
RoleId int,
RoleName Varchar(255),
RoleDesc varchar(255)
Primary key(RoleId)
);

insert into Doc_Master_Role values ('1','HR','CRU')
insert into Doc_Master_Role values ('2','Employee','R')
insert into Doc_Master_Role values ('3','Admin','CRUD')

create table LoginRoleMapping(
LoginRoleId int,
UserId int,
RoleId int,
CreatedOn Varchar(255),
Status Bit ,
CreatedBy Varchar(255),
ModifiedBy Varchar(255)
Foreign key (UserId) References Doc_Master_Login(UserId),
Foreign key (RoleId) References Doc_Master_Role(RoleId)
);
insert into  LoginRoleMapping values('1','1','3','07/06/2022','1','HR','Admin');
insert into  LoginRoleMapping values('2','2','1','07/06/2022','1','HR','HR');


create table Doc_Master_Frequency(
FrequencyId int,
Deadline Varchar(255),
Hours bit ,
Days bit,
Months Bit,
Years bit,
Primary Key (FrequencyId)
);

insert into Doc_Master_Frequency Values('1','6','0','0','1','0')
insert into Doc_Master_Frequency Values('2','365','0','1','0','0')
insert into Doc_Master_Frequency Values('3','4','0','0','1','0')


create table Doc_Master_DocumentType(

DocumentTypeId int,
FrequencyId Int,
DocumentType Varchar(255),
CreatedOn Varchar(255),
CreatedBy Varchar(255),
ModifiedBy Varchar(255)
Foreign key (FrequencyId) References Doc_Master_Frequency(FrequencyId)
primary key (DocumentTypeId)
);
insert into Doc_Master_DocumentType values('1','2','Insurance','07/06/2022','HR','HR')
insert into Doc_Master_DocumentType values('2','1','Investment','07/06/2022','Admin','HR')
insert into Doc_Master_DocumentType values('3','2','Tax_Savings','07/06/2022','HR','Admin')
insert into Doc_Master_DocumentType values('4','3','HrPolicies ','07/06/2022','Admin','HR')
insert into Doc_Master_DocumentType values('5','1','Others ','07/06/2022','Admin','HR')

Create table Doc_Transition_Document(
DocumentId int ,
DocumentTypeId int,
UserId int,
CreatedOn Varchar(255),
CreatedBy Varchar(255),
ModifiedBy Varchar(255),
Status bit

primary key (DocumentId),
Foreign key (UserId) References Doc_Master_Login(UserId),
Foreign key (DocumentTypeId) References Doc_Master_DocumentType(DocumentTypeId)

 
);
drop table DocumentType
Select*from DocumentType


insert into DocumentDeatails(ImgFormat)
select BulkColumn
from openrowset(bulk 'C:\Users\adarsh singh\Desktop\new\images\1.jpg',Single_Blob) as img

Select * from LoginRoleMapping
Select * from Doc_Master_Role
Select * from Doc_Master_Login
Select *from Doc_Master_DocumentType
Select * from Doc_Master_Frequency
Select * from Doc_Master_DocumentFormat
Select * from Doc_Details

drop table Login
drop table LoginRoleMapping
drop table Frequency
drop table DocumentType
drop table Role
drop table 
Docid Docname DocFormatnm path AlowedFormts (Extension) createdon MOdifiedon Status approvedBy
  formatid formatnm extension allowedformat
 create table Doc_Master_DocumentFormat(
  DocumentFormatId int,
  DocumentFormatName varchar(255),
  Extension varchar(255),
  Status Bit,
  AllowedUploadSize int, 
  CreatedOn Varchar(255),
  ModifiedBy Varchar(255),
  primary key(DocumentFormatId),
  
  );
  insert into Doc_Master_DocumentFormat values('1','Image','.PNG,.GIF,.JPEG,.JPG','1','60','13/06/2022','HR')
  insert into Doc_Master_DocumentFormat values('2','PDF','.PDF','1','70','13/06/2022','Admin')
  insert into Doc_Master_DocumentFormat values('3','Word','.DOCX,.DOC','1','50','13/06/2022','HR')
  drop table  Doc_Details
  drop table Doc_Master_DocumentFormat
Docid Docname DocFormatnm path AlowedFormts (Extension) createdon MOdifiedon Status approvedBy

create table Doc_Details(
DocumentId int,
UserId int,
DocumentName Varchar(255),
DocumentFormatId Int,
DocumentPath Varchar(255),
DocumentSize int,

CreatedOn Varchar(255),
ModifiedOn Varchar(255),
Status Bit,
Approved Bit,
approvedBy varchar(255),
primary Key (DocumentId),
Foreign key (DocumentFormatId) References Doc_Master_DocumentFormat(DocumentFormatId),
Foreign key (UserId) References Doc_Master_Login(UserId)
);
