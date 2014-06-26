use Travel

--trigger Auto-update Rating cho ThongTinDuLich
create trigger Travel_Rating
on Travel_Comment_Rating
for insert, update
as begin
declare @Travel_ID int
declare @Rating int
select @Travel_ID=Travel_ID from inserted
set @Rating=(select sum(TR.Rating) as Total
from Travel_Comment_Rating TR
where TR.Travel_ID=@Travel_ID)/(select count(TR.Comment_ID) as Number
from Travel_Comment_Rating TR
where TR.Travel_ID=@Travel_ID)

update ThongTinDuLich
set Rating=@Rating
where Travel_ID=@Travel_ID
end

--trigger Auto-update Rating cho ThongTinNhaHang
create trigger Rest_Rating
on Rest_Comment_Rating
for insert, update
as begin
declare @Rest_ID int
declare @Rating int
select @Rest_ID=Rest_ID from inserted
set @Rating=(select sum(RR.Rating) as Total
from Rest_Comment_Rating RR
where RR.Rest_ID=@Rest_ID)/(select count(RR.Comment_ID) as Number
from Rest_Comment_Rating RR
where RR.Rest_ID=@Rest_ID)

update ThongTinNhaHang
set Rating=@Rating
where Rest_ID=@Rest_ID
end

--trigger Auto-update Rating cho ThongTinKhachSan
create trigger Hotel_Rating
on Hotel_Comment_Rating
for insert, update
as begin
declare @Hotel_ID int
declare @Rating int
select @Hotel_ID=Hotel_ID from inserted
set @Rating=(select sum(HR.Rating) as Total
from Hotel_Comment_Rating HR
where HR.Hotel_ID=@Hotel_ID)/(select count(HR.Comment_ID) as Number
from Hotel_Comment_Rating HR
where HR.Hotel_ID=@Hotel_ID)

update ThongTinKhachSan
set Rating=@Rating
where Hotel_ID=@Hotel_ID
end

--trigger Auto-update Rating cho ThongTinAmThuc
create trigger AmThuc_Rating
on AmThuc_Comment_Rating
for insert, update
as begin
declare @AmThuc_ID int
declare @Rating int
select @AmThuc_ID=AmThuc_ID from inserted
set @Rating=(select sum(ATR.Rating) as Total
from AmThuc_Comment_Rating ATR
where ATR.AmThuc_ID=@AmThuc_ID)/(select count(ATR.Comment_ID) as Number
from AmThuc_Comment_Rating ATR
where ATR.AmThuc_ID=@AmThuc_ID)

update ThongTinAmThuc
set Rating=@Rating
where AmThuc_ID=@AmThuc_ID
end

--trigger Auto-update Rating cho Event
create trigger Event_Rating
on Event
for insert, update
as begin
declare @Event_ID int
declare @Rating int
select @Event_ID=Event_ID from inserted
set @Rating=(select sum(ER.Rating) as Total
from Event_Comment_Rating ER
where ER.Event_ID=@Event_ID)/(select count(ER.Comment_ID) as Number
from Event_Comment_Rating ER
where ER.Event_ID=@Event_ID)

update Event
set Rating=@Rating
where Event_ID=@Event_ID
end

--trigger Auto-update so luong comment cho ThongTinDuLich
create trigger Travel_Comm
on Travel_Comment_Rating
for insert, update
as begin
declare @Travel_ID int
declare @Comm int
select @Travel_ID=Travel_ID from inserted
set @Comm=(select count(TR.Comment_ID) as Total
from Travel_Comment_Rating TR
where TR.Travel_ID=@Travel_ID and TR.Content!='')

update ThongTinDuLich
set CommentNum=@Comm
where Travel_ID=@Travel_ID
end

--trigger Auto-update so luong comment cho ThongTinKhachSan
create trigger Hotel_Comm
on Hotel_Comment_Rating
for insert, update
as begin
declare @Hotel_ID int
declare @Comm int
select @Hotel_ID=Hotel_ID from inserted
set @Comm=(select count(HR.Comment_ID) as Total
from Hotel_Comment_Rating HR
where HR.Hotel_ID=@Hotel_ID and HR.Content!='')

update ThongTinKhachSan
set CommentNum=@Comm
where Hotel_ID=@Hotel_ID
end

--trigger Auto-update so luong comment cho ThongTinNhaHang
create trigger Rest_Comm
on Rest_Comment_Rating
for insert, update
as begin
declare @Rest_ID int
declare @Comm int
select @Rest_ID=Rest_ID from inserted
set @Comm=(select count(RR.Comment_ID) as Total
from Rest_Comment_Rating RR
where RR.Rest_ID=@Rest_ID and RR.Content!='')

update ThongTinNhaHang
set CommentNum=@Comm
where Rest_ID=@Rest_ID
end

--trigger Auto-update so luong comment cho ThongTinAmThuc
create trigger AmThuc_Comm
on AmThuc_Comment_Rating
for insert, update
as begin
declare @AmThuc_ID int
declare @Comm int
select @AmThuc_ID=AmThuc_ID from inserted
set @Comm=(select count(ATR.Comment_ID) as Total
from AmThuc_Comment_Rating ATR
where ATR.AmThuc_ID=@AmThuc_ID and ATR.Content!='')

update ThongTinAmThuc
set CommentNum=@Comm
where AmThuc_ID=@AmThuc_ID
end

--trigger Auto-update so luong comment cho Event
create trigger Event_Comm
on Event_Comment_Rating
for insert, update
as begin
declare @Event_ID int
declare @Comm int
select @Event_ID=Event_ID from inserted
set @Comm=(select count(ER.Comment_ID) as Total
from Event_Comment_Rating ER
where ER.Event_ID=@Event_ID and ER.Content!='')

update Event
set CommentNum=@Comm
where Event_ID=@Event_ID
end

--trigger Auto-update so luong LIKE cho ThongTinDuLich
create trigger Travel_LikeNum
on Travel_Like
for insert, update
as begin
declare @Travel_ID int
declare @Like int
select @Travel_ID=Travel_ID from inserted
set @Like=(select count(TL.Like_ID) as Total
from Travel_Like TL
where TL.Travel_ID=@Travel_ID and TL.Like_Status=1)

update ThongTinDuLich
set LikeNum=@Like
where Travel_ID=@Travel_ID
end