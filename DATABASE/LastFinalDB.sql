use master
go
drop database [Project Online Learning]
go
create database [Project Online Learning]
go
use [Project Online Learning]
go

CREATE table Role(
	RoleId int primary key identity(1,1),
	RoleName varchar(20)
);

insert into Role
values ('ADMIN'),
		('Manager'),('Mentor'),('Mentee');

create table Account(
	AccountId int primary key identity(1,1),
	Email varchar(255) not null, 
	Password varchar(255) not null,
	Status bit not null,
	RoleId int foreign key references Role(RoleId) not null,
);

insert into Account
values
('tuong0505ht@gmail.com','10101010',1,1),
('manager@gmail.com','123123123',1,2),
('mentor001@gmail.com','123123123',1,3),
('mentee001@gmail.com','123123123',1,4);

create table Profile(
	ProfileId int primary key not null,
	foreign key (ProfileId) references Account(AccountId),
	FullName nvarchar(255),
	Gender int, -- 0 Female, 1 Male, 2 Other
	Avatar image,
	Money money,
	ManagedBy int foreign key references Account(AccountId),
);

insert into Profile
values
(1,'Pham Cat Tuong',1,null,99999,null),
(2,'Manager001',2,null,99999,null),
(3,'Mentor001',0,null,100,2),
(4,'Mentee001',0,null,100,null);

create table CourseCategory(
	CourseCateroryId varchar(10) primary key,
	CategoryName nvarchar(255)
);
insert into CourseCategory
values
('IT','Information Technology'),
('BSN','Business'),
('CS','Computer Science');

create table Course(
	CourseId int primary key identity(1,1),
	CourseName nvarchar(255),
	Description nvarchar(2000),
	Image image,
	Price float,
	Discount float,
	CourseCateroryId varchar(10) foreign key references CourseCategory(CourseCateroryId),
	CreatedBy int references Account(AccountId),
	DateCreated date,
	StudyTime varchar(50),
	Status bit,
);

create table CourseRating(
	RatingId int primary key identity(1,1),
	Star int,
	Comment text,
	DateCreated date,
	CourseId int references Course(CourseId),
	AccountId int references Account(AccountId)
);

create table Teaching(
	MentorId int references Account(AccountId),
	CourseId int references Course(CourseId),
	primary key(MentorId,CourseId)
);


create table WishList(
	AccountId int references Account(AccountId),
	CourseId int references Course(CourseId),
	primary key(AccountId,CourseId)
);

create table Enrollment(
	EnrollmentId int primary key identity(1,1),
	AccountId int references Account(AccountId),
	CourseId int references Course(CourseId),
	EnrollmentDate date,
	Progress int --per 100%
);

create table PaymentMethod(
	PaymentMethodId varchar(10) primary key,
	PaymentMethodName varchar(50)
);

insert into PaymentMethod
values
('VNPAY','VN Pay'),
('CRD','Credit'),
('PP','PayPal'),
('MM','Momo');

create table Payment(
	PaymentId int primary key identity(1,1),
	AccountId int references Account(AccountId),
	CourseId int references Course(CourseId),
	PaymentDate date,
	PaymentMethodId varchar(10) references PaymentMethod(PaymentMethodId),
	Money float
);


create table Module(
	ModuleId int primary key identity(1,1),
	ModuleName varchar(255),
	CourseId int foreign key references Course(CourseId),

);

create table Lesson(
	LessonId int primary key identity(1,1),
	ModuleId int foreign key references Module(ModuleId),
	LessonName varchar(255),
	LessonContent text,
	LessonVideo text,
);

create table Quiz(
	QuizId int primary key identity(1,1),
	ModuleId int foreign key references Module(ModuleId),
	QuizName varchar(255),
	QuizTime time,
	PassScore int,
);

create table Question(
	QuestionId int primary key identity(1,1),
	QuestionNum int,
	QuizId int foreign key references Quiz(QuizId),
	QuestionName nvarchar(255),
	Type bit, -- 0: checkBox, 1: Radio
);

create table QuestionChoices(
	QuestionId int foreign key references Question(QuestionId),
	Choices text,
	IsCorrect bit,
);

create table AnswerQuestion(
	AccountId int references Account(AccountId),
	QuestionId int references Question(QuestionId),
	primary key(AccountId, QuestionId),
	Answer text,
	IsCorrect bit,
);

create table ScoreQuiz(
	AccountId int references Account(AccountId),
	QuizId int references Quiz(QuizId),
	primary key(AccountId,QuizId),
	Score int,
);

create table DiscussionLesson(
	DisscussionId int primary key identity(1,1),
	AccountId int foreign key references Account(AccountId),
	LessonId int foreign key references Lesson(LessonId),
	Comment text,
);

create table Message(
	MessageId int primary key identity(1,1),
	SenderId int foreign key references Account(AccountId),
	ReceiverId int foreign key references Account(AccountId),
	MessageText text,
	MessageTime datetime,
);

create table Certificate(
	CertificateId int primary key identity(1,1),
	CourseId int foreign key references Course(CourseId),
	AccountId int foreign key references Account(AccountId),
	Issuer int foreign key references Account(AccountId),
	IssueDate date,
);



