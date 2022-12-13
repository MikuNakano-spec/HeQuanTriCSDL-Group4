use master
go
create DATABASE QLBANHANG
GO
CREATE TABLE VatTu(
	MaVT char(9) not null primary key,
	TenVT varchar(20) not null,
	DVTinh char(10),
	SLCon int 
	
)
create table HDBan(
	MaHD char(9) not null primary key,
	NgayXuat smalldatetime,
	HoTenKhach nvarchar(40)
)

create table HangXuat(
	MaHD char(9) foreign key references HDBan(MaHD),
	MaVT char(9) foreign key references VatTu(MaVT),
	DonGia int,
	SLBan int
	
)
--------------------------------------------------------------
insert into VatTu values ('B01','But Chi','Dong',1000),('B02','But Bi','Dong',1000)
insert into HDBan values ('KH01','10-10-2022','Nguyen Van A'),('KH02','11-11-2022','Nguyen Van B')
insert into HangXuat values ('KH01','B01','5000',200),('KH01','B01','5000',250),('KH02','B01','5000',500),('KH02','B02','5000',200)
------------------------------------------------------------2
declare @Tong as table(
	MaHD char(9),
	TongTien int	
)
declare @TInhTong float;
select @TInhTong = (select SLBan from HangXuat)
insert into @Tong 
	select MaHD, MAX(DonGia*@TInhTong) from HangXuat 
------------------------------------------------------------

-----------------------------------------------------------4
Create function lst (@MaHD char(9))
returns int 
as
begin
	return(select HangXuat.MaHD,HDBan.NgayXuat,MaVT,DonGia,SLBan, CONVERT(varchar, datename(HDBan.NgayXuat)) from HangXuat join HDBan on HDBan.MaHD= HangXuat.MaHD where @MaHD = HangXuat.MaHD)
end 
go
--------------------------------------------------------------3
create function tlist (@mahd nvarchar(10))
returns table
as
	return (select a.MaHD, b.NgayXuat, c.MaVT, a.DonGia, a.SLBan, DATENAME(WEEKDAY,b.NgayXuat) as 'NgayThu'
			from HangXuat a, HDBan b, VatTu c
			where a.MaHD = b.MaHD and a.MaVT = c.MaVT and b.MaHD = @mahd)

select * from tlist('KH01')
