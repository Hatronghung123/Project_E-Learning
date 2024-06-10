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
	ManagedBy int foreign key references Account(AccountId)
);

insert into Account
values
('tuong0505ht@gmail.com','10101010',1,1,null),
('manager@gmail.com','123123123',1,2,1),
('mentor001@gmail.com','123123123',1,3,2),
('mentee001@gmail.com','123123123',1,4,null);

create table Profile(
	AccountId int primary key not null,
	foreign key (AccountId) references Account(AccountId),
	FullName nvarchar(255),
	Gender int, -- 0 Female, 1 Male, 2 Other
	Avatar image,
	Money money,
);

insert into Profile
values
(1,'Pham Cat Tuong',1,null,99999),
(2,'Manager001',2,null,99999),
(3,'Mentor001',0,null,100),
(4,'Mentee001',0,null,100);

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


create table CourseContent(
	CourseContentId int primary key identity(1,1),
	CourseContentName varchar(255),
	CourseId int foreign key references Course(CourseId),

);

create table Lesson(
	LessonId int primary key identity(1,1),
	CourseContentId int foreign key references CourseContent(CourseContentId),
	LessonName varchar(255),
	LessonContent text,
	LessonVideo text,
);

create table Quiz(
	QuizId int primary key identity(1,1),
	CourseContentId int foreign key references CourseContent(CourseContentId),
	QuizName varchar(255),
	QuizTime time,
);

create table Question(
	QuestionId int primary key identity(1,1),
	QuestionNum int,
	QuizId int foreign key references Quiz(QuizId),
	QuestionName nvarchar(255),
	Type bit, -- 0: checkBox, 1: Radio
);

create table QuestionChoices(
	QuestionId int references Question(QuestionId),
	Choices text,
	IsCorrect bit,
);

create table DoQuiz(
	AccountId int references Account(AccountId),
	QuizId int references Quiz(QuizId),
	QuestionId int references Question(QuestionId),
	primary key(AccountId,QuizId, QuestionId),
	Answer text,
	Status bit,
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



