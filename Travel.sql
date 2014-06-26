create database Travel
use Travel
-- use master
-- drop database Travel

create table Account
(
	User_ID uniqueidentifier primary key,
	UserName varchar(20),
	Pass varchar(255),
	Name nvarchar(20),
	Email varchar(30),
	Phone varchar(15),
	Address nvarchar(50),
	Type bit,
	Active bit
)

create table ThongTinDuLich
(
	Travel_ID int primary key,
	Name nvarchar(20),
	Address nvarchar(50),
	Phone varchar(15),
	ShortDescription nvarchar(1000),
	Content ntext,
	Rating int,
	InsertDay char(2),
	InsertMonth char(3),
	CommentNum int,
	CoverPic nvarchar(255),
	Pic1 nvarchar(255),
	Pic2 nvarchar(255),
	Pic3 nvarchar(255),
	Pic4 nvarchar(255),
	Pic5 nvarchar(255),
	Pic6 nvarchar(255),
	LikeNum int
)

create table ThongTinKhachSan
(
	Hotel_ID int primary key,
	Name nvarchar(20),
	Address nvarchar(50),
	Phone varchar(15),
	ShortDescription nvarchar(1000),
	Content ntext,
	Rating int,
	InsertDay char(2),
	InsertMonth char(3),
	CommentNum int,
	CoverPic nvarchar(255),
	Pic1 nvarchar(255),
	Pic2 nvarchar(255),
	Pic3 nvarchar(255),
	Pic4 nvarchar(255),
	Pic5 nvarchar(255),
	Pic6 nvarchar(255),
	LikeNum int
)

create table ThongTinNhaHang
(
	Rest_ID int primary key,
	Name nvarchar(20),
	Address nvarchar(50),
	Phone varchar(15),
	ShortDescription nvarchar(1000),
	Content ntext,
	Rating int,
	InsertDay char(2),
	InsertMonth char(3),
	CommentNum int,
	CoverPic nvarchar(255),
	Pic1 nvarchar(255),
	Pic2 nvarchar(255),
	Pic3 nvarchar(255),
	Pic4 nvarchar(255),
	Pic5 nvarchar(255),
	Pic6 nvarchar(255),
	LikeNum int
)

create table ThongTinAmThuc
(
	AmThuc_ID int primary key,
	Title nvarchar(100),
	Content ntext,
	Rating int,
	InsertDay char(2),
	InsertMonth char(3),
	CommentNum int,
	CoverPic nvarchar(255),
	Pic1 nvarchar(255),
	Pic2 nvarchar(255),
	Pic3 nvarchar(255),
	Pic4 nvarchar(255),
	Pic5 nvarchar(255),
	Pic6 nvarchar(255),
	LikeNum int
)

create table Event
(
	Event_ID int primary key,
	Title nvarchar(100),
	Content ntext,
	Rating int,
	InsertDay char(2),
	InsertMonth char(3),
	CommentNum int,
	CoverPic nvarchar(255),
	Pic1 nvarchar(255),
	Pic2 nvarchar(255),
	Pic3 nvarchar(255),
	Pic4 nvarchar(255),
	Pic5 nvarchar(255),
	Pic6 nvarchar(255),
	LikeNum int
)

create table Travel_Comment_Rating
(
	Comment_ID int primary key,
	User_ID uniqueidentifier foreign key references Account(User_ID),
	Travel_ID int foreign key references ThongTinDuLich(Travel_ID),
	Content nvarchar(250),
	Rating int
)

create table Rest_Comment_Rating
(
	Comment_ID int primary key,
	User_ID uniqueidentifier foreign key references Account(User_ID),
	Rest_ID int foreign key references ThongTinNhaHang(Rest_ID),
	Content nvarchar(250),
	Rating int
)

create table Hotel_Comment_Rating
(
	Comment_ID int primary key,
	User_ID uniqueidentifier foreign key references Account(User_ID),
	Hotel_ID int foreign key references ThongTinKhachSan(Hotel_ID),
	Content nvarchar(250),
	Rating int
)

create table AmThuc_Comment_Rating
(
	Comment_ID int primary key,
	User_ID uniqueidentifier foreign key references Account(User_ID),
	AmThuc_ID int foreign key references ThongTinAmThuc(AmThuc_ID),
	Content nvarchar(250),
	Rating int
)

create table Event_Comment_Rating
(
	Comment_ID int primary key,
	User_ID uniqueidentifier foreign key references Account(User_ID),
	Event_ID int foreign key references Event(Event_ID),
	Content nvarchar(250),
	Rating int
)

create table Travel_Like
(
	Like_ID int primary key,
	User_ID uniqueidentifier foreign key references Account(User_ID),
	Travel_ID int foreign key references ThongTinDuLich(Travel_ID),
	Like_Status bit
)


97d22396-eeff-4dd8-8768-4a7fb6fde522	phokienhuy	1B3B7A6A202D238CE15BB79C5258F6FB	Phó Kiến Huy	phokienhuy@gmail.com	0989991268	220/14	False	True
1	ĐÀ LẠT	Lâm Đồng vn	123123123	Ở Việt Nam, Đà Lạt từ lâu đã là một thành phố du lịch nổi tiếng. Khí hậu mát mẻ, tài nguyên thiên nhiên và nhân văn phong phú giúp thành phố mỗi năm thu hút hàng triệu du khách tới thăm viếng và nghỉ dưỡng. Sau một thời gian trầm lắng của thập niên 1980, du lịch Đà Lạt thay đổi mạnh mẽ trong những năm gần đây.	Thành phố Đà Lạt là tỉnh lỵ của tỉnh Lâm Đồng, nằm trên cao nguyên Lâm Viên, thuộc vùng Tây Nguyên, Việt Nam. Từ xa xưa, vùng đất này vốn là địa bàn cư trú của những cư dân người Lạch, người Chil và người Srê thuộc dân tộc Cơ Ho. Cuối thế kỷ 19, khi tìm kiếm một địa điểm để xây dựng trạm nghỉ dưỡng dành cho người Pháp ở Đông Dương, Toàn quyền Paul Doumer đã quyết định chọn cao nguyên Lâm Viên theo đề nghị của bác sỹ Alexandre Yersin, người từng thám hiểm tới nơi đây vào năm 1893. Trong nửa đầu thế kỷ 20, từ một địa điểm hoang vu, những người Pháp đã quy hoạch và xây dựng lên một thành phố xinh đẹp với những biệt thự, công sở, khách sạn và trường học, một trung tâm du lịch và giáo dục của Đông Dương khi đó. Trải qua những khoảng thời gian thăng trầm của hai cuộc chiến tranh cùng giai đoạn khó khăn những thập niên 1970–1980, Đà Lạt ngày nay là một thành phố 211 ngàn dân, đô thị loại I trực thuộc tỉnh, giữ vai trò trung tâm chính trị, kinh tế và văn hóa của tỉnh Lâm Đồng.	4	01	APR	1         	resource/images/page5_img1.jpg	NULL	NULL	NULL	NULL	NULL	NULL