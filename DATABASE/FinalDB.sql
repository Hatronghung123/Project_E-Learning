﻿


create database Project_Online_Learning




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
('CS','Computer Science'),
('MC','Multimedia Communications');


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

insert into Course
values (N'Lập trình hướng đối tượng trong C#', 
N'
Serial dành cho những bạn chưa có bất kỳ kiến thức về lập trình hướng đối tượng. Hoặc cần củng cố lại lập trình hướng đối tượng trong C#.

Nội dung Serial này được phân tách chi tiết nhất có thể, nhằm giúp các bạn dễ hiểu và thực hành được ngay.

Thời lượng mỗi video trung bình từ 5 – 30p

Qua serial này, LEPETE hi vọng các bạn sẽ:
 
 -Nắm vững kiến thức nền tảng về OOP C# để học những khóa chuyên sâu hơn.',
 'https://www.google.com/imgres?imgurl=https%3A%2F%2Flotusacademy.edu.vn%2Fapi%2Fmedia%2Fdownload%2F641%2FC-OOP-Interview-Questions.jpg&tbnid=m8ihs14Wmd_8sM&vet=12ahUKEwj_oa_Tk9SGAxUrhVYBHRNFDw4QMygBegQIARBJ..i&imgrefurl=https%3A%2F%2Flotusacademy.edu.vn%2Fblog%2F4-tinh-chat-oop-c-cac-framework-phat-trien-c-268&docid=fGYJTVugQ2Bs6M&w=900&h=500&q=oop%20c%23%20image&ved=2ahUKEwj_oa_Tk9SGAxUrhVYBHRNFDw4QMygBegQIARBJ',
 500000, 20, 'IT',2 ,'2024-06-12', '1.30 Hrs', 1
 ),
 --cach--
 (N'Khóa học lập trình C# căn bản', 
N'
Bạn mới bắt đầu học lập trình? Bạn đang muốn học thêm ngôn ngữ lập trình mới? C# là lựa chọn hoàn hảo để đáp ứng các nhu cầu trên.

Ngôn ngữ C# là một ngôn ngữ mới, cấu trúc rõ ràng, dễ hiểu và dễ học. C# thừa hưởng những ưu việt từ ngôn ngữ Java, C, C++ cũng như khắc phục được những hạn chế của các ngôn ngữ này. C# là ngôn ngữ lập trình hướng đối tượng được phát triển bởi Microsoft, được xây dựng dựa trên C++ và Java.

Khoá học lần này sẽ mang đến toàn bộ những kiến thức cơ bản về C#. Chào mừng các bạn đã đến với khoá học LẬP TRÌNH C# CƠ BẢN của LEPETE.

Khoá học tập trung vào:
Làm quen với ngôn ngữ lập trình C# và công cụ lập trình Visual Studio.
Các khái niệm nền tảng trong C#.
Một số từ khoá, cú pháp và cấu trúc cơ bản trong C#.
Nâng cao tư duy bằng cách sử dụng C# để giải một số thuật toán cơ bản.
Và nhiều kỹ thuật hay ho khác. LEPETE
hy vọng sau khóa học, bạn sẽ nắm được các kiến thức:

Cái nhìn tổng quan về ngôn ngữ lập trình C#.
Nắm vững kiến thức nền tảng về C# để học những khóa chuyên sâu hơn 
Nắm vững các coding convention, naming convention
Thành thạo các thao tác lập trình trên visual studio
Biết cách tìm ra lỗi và gỡ lỗi trong lập trình
Và còn nhiều thứ khác chờ các bạn khám phá
Là kiến thức nền tảng để tiếp cận các công nghệ hay ho của C# như Winform, WPF, ASP.NET, WCF, Xamarin,…,'
,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbkhost.vn%2Fblog%2Fc-sharp%2F&psig=AOvVaw3EFIq3yoE0Jg4ssoSNdnlX&ust=1718216726502000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJjui6KW1IYDFQAAAAAdAAAAABAI',
 500000, 20, 'IT',2 ,'2024-06-12', '1.30 Hrs', 1
 ),
 (N'Lập trình Http Request với C#', 
N'
Trong khoá học này các bạn sẽ được hướng dẫn về:

Cách lấy dữ liệu từ một website.
Get & post dữ liệu (ví dụ: chấp nhận bạn bè facebook; lấy dữ liệu từ website nghe nhạc)
Kỹ thuật vượt normal captcha, re-captcha.
Upload file lên website hoặc hệ thống bất kỳ
Tải hình ảnh, file, video…
Verify email, fake IP
Và rất nhiều thủ thuật cá nhân cùng kinh nghiệm thực tế từ tác giả.
Để có đủ khả năng học hiểu các nội dung được đề cập đến trong khóa học. Bạn nên có tối thiểu kiến thức về các phần:
LẬP TRÌNH C# CƠ BẢN
LẬP TRÌNH KEYLOGGER VỚI C#
LẬP TRÌNH WINFORM CƠ BẢN
Ngoài ra, cũng nên trau dồi thêm kiến thức khác qua các project thực tế như:
LẬP TRÌNH TỪ ĐIỂN NÓI VỚI C# WINFORM
LẬP TRÌNH GAME CARO VỚI C# WINFORM
LẬP TRÌNH ỨNG DỤNG LẬP LỊCH BẰNG C# WINFORM
Thời lượng mỗi video từ 3 – 30 phút nhằm chia nhỏ quá trình thực hiện, giúp bạn dễ tiếp thu và ứng dụng source code hỗ trợ từ thư viện LEPETE',
 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi0.wp.com%2Fwww.phanxuanchanh.com%2Fwp-content%2Fuploads%2F2020%2F09%2FC-696x392-1.jpg%3Fresize%3D696%252C392%26ssl%3D1&tbnid=hYSsFMtph5JkaM&vet=12ahUKEwj9mqzOmtSGAxX9TvUHHRG4AjUQMygLegQIARBa..i&imgrefurl=https%3A%2F%2Fwww.phanxuanchanh.com%2F2022%2F05%2F24%2Flap-trinh-c-lay-dia-chi-ip-cong-cong-cua-may-tinh%2F&docid=zHTy8kN2UsEuMM&w=696&h=392&q=%E1%BA%A2nh%20Request%20v%E1%BB%9Bi%20C%23&ved=2ahUKEwj9mqzOmtSGAxX9TvUHHRG4AjUQMygLegQIARBa',
 800000, 30, 'IT',2 ,'2024-06-12', '3.65 Hrs', 1
 ),

 (N'Khóa học lập trình C# nâng cao', 
N'
Bạn đã học hết các khoá học về C# CƠ BẢN, LẬP TRÌNH WINFORM thậm chí là LẬP TRÌNH WPF nhưng vẫn bối rối trước những hướng dẫn về CÁC PROJECT THỰC TẾ của LEPETE?

Hoặc bạn nghe nói mãi về .NET nhưng vẫn thắc mắc nó có gì hay ho bên trong đó?

Hay đơn giản bạn viết muốn 1 đoạn code cực kỳ nguy hiểm khiến người khác khi nhìn vào phải thốt lên: “Ồ!!!......... Trẻ trâu…”

Khoá học lần này sẽ giúp bạn giải đáp những thắc mắc trên. Chào mừng các bạn đã đến với khoá học Lập trình C# nâng cao của Kteam.

Khoá học tập trung vào:

Giới thiệu một số cấu trúc dữ liệu phổ biến được hỗ trợ sẵn trong .NET Framework.
Các khái niệm mới trong C#.
Một số từ khoá và cú pháp chưa được giới thiệu trong khoá học LẬP TRÌNH C# CƠ BẢN.
Và nhiều kỹ thuật hay ho khác.
Sau khoá học bạn sẽ có được:

Cái nhìn hoàn thiện hơn về C# và .NET Framework.
Có đủ kiến thức để dễ tiếp cận các khoá học project thực tế của Kteam.
Là nền tảng để xây dựng các ứng dụng và làm project thực tế.',
 'https://www.google.com/imgres?imgurl=https%3A%2F%2Ftedu.com.vn%2F%2FUploadData%2Fimages%2Fcsharp%2520advance.PNG&tbnid=VONhy5L_UaH3dM&vet=12ahUKEwiqoOHRmNSGAxXxu1YBHQXQDGsQMygQegQIARBp..i&imgrefurl=https%3A%2F%2Ftedu.com.vn%2Fkhoa-hoc-mien-phi%2Fkhoa-hoc-lap-trinh-c-nang-cao-23.html&docid=vhhf45lWhKP9DM&w=947&h=529&itg=1&q=l%E1%BA%ADp%20tr%C3%ACnh%20c%23%20n%C3%A2ng%20cao%20tutorial&ved=2ahUKEwiqoOHRmNSGAxXxu1YBHQXQDGsQMygQegQIARBp',
 1000000, 10, 'IT',2 ,'2024-06-12', '5.7 Hrs', 1
 ),
 (N'Lập trình hướng đối tượng trong C#', 
N'
Serial dành cho những bạn chưa có bất kỳ kiến thức về lập trình hướng đối tượng. Hoặc cần củng cố lại lập trình hướng đối tượng trong C#.

Nội dung Serial này được phân tách chi tiết nhất có thể, nhằm giúp các bạn dễ hiểu và thực hành được ngay.

Thời lượng mỗi video trung bình từ 5 – 30p

Qua serial này, mình hi vọng các bạn sẽ:
 
 -Nắm vững kiến thức nền tảng về OOP C# để học những khóa chuyên sâu hơn.',
 'https://www.google.com/imgres?imgurl=https%3A%2F%2Flotusacademy.edu.vn%2Fapi%2Fmedia%2Fdownload%2F641%2FC-OOP-Interview-Questions.jpg&tbnid=m8ihs14Wmd_8sM&vet=12ahUKEwj_oa_Tk9SGAxUrhVYBHRNFDw4QMygBegQIARBJ..i&imgrefurl=https%3A%2F%2Flotusacademy.edu.vn%2Fblog%2F4-tinh-chat-oop-c-cac-framework-phat-trien-c-268&docid=fGYJTVugQ2Bs6M&w=900&h=500&q=oop%20c%23%20image&ved=2ahUKEwj_oa_Tk9SGAxUrhVYBHRNFDw4QMygBegQIARBJ',
 500000, 20, 'IT',2 ,'2024-06-12', '1.30 Hrs', 1
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

insert into CourseContent 
values('Khóa học lập trình C# căn bản',2)

create table Lesson(
	LessonId int primary key identity(1,1),
	CourseContentId int foreign key references CourseContent(CourseContentId),
	LessonName varchar(255),
	LessonContent text,
	LessonVideo text,
);



insert into Lesson
values(1, 'C# la gi?','Trong bài học này, chúng ta sẽ cùng tìm hiểu các vấn đề:
Sơ lược về ngôn ngữ C#.
Những đặc trưng của ngôn ngữ C#.
Tại sao lại lựa chọn ngôn ngữ C#' ,'https://www.youtube.com/embed/9kohr6pMwag?si=U9sJEvQTUKLxvHHx'),
(1, 'Cấu trúc lệnh cơ bản trong C# Console Application', 'Trong bài học này, chúng ta sẽ cùng tìm hiểu các vấn đề:

Cấu trúc cơ bản của một chương trình trong C#.
Giải thích ý nghĩa một số từ khóa được sử dụng trong chương trình đầu tiên.
Cách viết comment trong C#.
Ví dụ chương trình đầu tiên bằng C#.','https://www.youtube.com/embed/FhAIc0tlyaQ?si=c5ClSGle5mNg1fNw'),
(1,'Nhập xuất cơ bản trong C# Console Application
','Trong bài học này, chúng ta sẽ cùng tìm hiểu các vấn đề:

Cấu trúc cơ bản của các lệnh nhập xuất và ý nghĩa của chúng trong C#.
Ví dụ demo chương trình nhập xuất bằng C#.','https://www.youtube.com/embed/BAscPWPtCD8?si=-hrRHd1obZIIp2vy'),

(1,'Biến trong C#','Để đọc hiểu bài này tốt nhất các bạn nên có kiến thức cơ bản về các phần:

Cấu trúc lệnh của C# viết trên nền Console Application.
Cấu trúc nhập xuất của C# trên nền Console Application.
 Trong bài học này, chúng ta sẽ cùng tìm hiểu các vấn đề:

Biến là gì? Tại sao phải sử dụng biến?
Khai báo và sử dụng biến.
Quy tắc đặt tên biến.','https://www.youtube.com/embed/IEz7uMSHitM?si=D_FhSF4eWfGE4Qok'),
(1,'Kiểu dữ liệu trong C#','Để đọc hiểu bài này tốt nhất các bạn nên có kiến thức cơ bản về các phần:

Cấu trúc lệnh của C# viết trên nền Console Application.
Cấu trúc nhập xuất của C# trên nền Console Application.
Biến trong C#.
 Trong bài học này, chúng ta sẽ cùng tìm hiểu các vấn đề:

Kiểu dữ liệu là gì? Tại sao phải có kiểu dữ liệu?
Phân loại kiểu dữ liệu và ý nghĩa của từng kiểu dữ liệu.
Ví dụ chương trình sử dụng một số kiểu dữ liệu.
','"https://www.youtube.com/embed/yrH7Qe8FXqE?si=lC8OMRwzNwPpJvU3'),
(1,'Toán tử trong C#','Để đọc hiểu bài này tốt nhất các bạn nên có kiến thức cơ bản về các phần:

CẤU TRÚC LỆNH CỦA C# VIẾT TRÊN NỀN CONSOLE APPLICATION.
CẤU TRÚC NHẬP XUẤT CỦA C# TRÊN NỀN CONSOLE APPLICATION.
BIẾN & KIỂU DỮ LIỆU trong C#.
Trong bài học này, chúng ta sẽ cùng tìm hiểu các vấn đề:

Toán tử là gì? Có mấy loại toán tử?
Cú pháp và ý nghĩa của từng toán tử.
Độ ưu tiên của toán tử.
Ví dụ chương trình sử dụng một số toán tử.','https://www.youtube.com/embed/niz7Gg8uB-k?si=bnm5v5MPvW2tE1ls');









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



