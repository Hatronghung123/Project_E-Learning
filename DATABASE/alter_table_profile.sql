use [Project Online Learning]
go

drop table Profile
go
create table Profile(
	ProfileId int primary key not null,
	foreign key (ProfileId) references Account(AccountId),
	FullName nvarchar(255),
	Gender int, -- 0 Female, 1 Male, 2 Other
	Avatar varchar(2000),
	Money money,
	ManagedBy int foreign key references Account(AccountId),
);

insert into Profile
values
(1,'Pham Cat Tuong',1,null,99999,null),
(2,'Manager001',2,null,99999,null),
(3,'Mentor001',0,null,100,2),
(4,'Mentee001',0,null,100,null),
(5, 'HowKTeam', 1,null,9999,null);
