create database Travel
use Travel

create table Account
(
	User_ID int primary key,
	UserName varchar(20),
	Pass varchar(20),
	Name nvarchar(20),
	Email varchar(30),
	Phone varchar(15),
	Address nvarchar(50),
	Type bit,
	Active bit,
)

create table ThongTinDuLich
(
	Travel_ID int primary key,
	Name nvarchar(20),
	Address nvarchar(50),
	Phone varchar(15)
)

create table ThongTinKhachSan
(
	Hotel_ID int primary key,
	Name nvarchar(20),
	Address nvarchar(50),
	Phone varchar(15)
)

create table ThongTinNhaHang
(
	Rest_ID int primary key,
	Name nvarchar(20),
	Address nvarchar(50),
	Phone varchar(15)
)

create table ThongTinAmThuc
(
	AmThuc_ID int primary key,
	Topic nvarchar(100),
	Content nvarchar(2000)
)

create table Event
(
	Event_ID int primary key,
	Topic nvarchar(100),
	Content nvarchar(2000)
)

create table Travel_Comment_Rating
(
	Comment_ID int primary key,
	User_ID int foreign key references Account(User_ID),
	Travel_ID int foreign key references ThongTinDuLich(Travel_ID),
	Content nvarchar(250),
	Rating int
)

create table Rest_Comment_Rating
(
	Comment_ID int primary key,
	User_ID int foreign key references Account(User_ID),
	Rest_ID int foreign key references ThongTinNhaHang(Rest_ID),
	Content nvarchar(250),
	Rating int
)

create table Hotel_Comment_Rating
(
	Comment_ID int primary key,
	User_ID int foreign key references Account(User_ID),
	Hotel_ID int foreign key references ThongTinKhachSan(Hotel_ID),
	Content nvarchar(250),
	Rating int
)

create table AmThuc_Comment_Rating
(
	Comment_ID int primary key,
	User_ID int foreign key references Account(User_ID),
	AmThuc_ID int foreign key references ThongTinAmThuc(AmThuc_ID),
	Content nvarchar(250),
	Rating int
)

create table Event_Comment_Rating
(
	Comment_ID int primary key,
	User_ID int foreign key references Account(User_ID),
	Event_ID int foreign key references Event(Event_ID),
	Content nvarchar(250),
	Rating int
)

create trigger Travel_Rating
on Travel_Comment_Rating
for insert, update
as begin
	declare @u_rating int, @t_rating int, @User_ID int, @Comment_ID int
	select @u_rating=Rating from inserted
	where @User_ID=(select User_ID from Account)
	and @Comment_ID=(select Comment_ID from Travel_Comment_Rating)

end