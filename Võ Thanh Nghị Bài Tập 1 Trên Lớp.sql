--Câu 1
--Bài 1.2
alter table SANPHAM add GHICHU varchar(20)
--Bài 1.3
alter table KHACHHANG add LOAIKH tinyint
--Bài 1.4
alter table SANPHAM alter column GHICHU varchar(100)
--Bài 1.5
alter table SANPHAM drop column GHICHU
--Bài 1.6
alter table KHACHHANG alter column LOAIKH varchar(20)
--Bài 1.7
alter table SANPHAM add constraint DVT check(DVT='cay' OR DVT='hop' OR DVT='cai' OR DVT='quyen' OR DVT='chuc')
--Bài1.8
alter table CTHD alter column SOHD int NOT NULL
alter table CTHD alter column MASP char(4) NOT NULL
alter table CTHD add constraint CTHD primary key (SOHD,MASP)
alter table SANPHAM add constraint C_GIABAN check(GIA>=500)
--Bài 1.9 
alter table CTHD add constraint C_SLMUA check (SL>0)
--Bài 1.10
alter table KHACHHANG add constraint C_NGDK_NGSINH check(NGDK>NGSINH)
--Câu 2
--Bài 2.2 
SELECT * 
INTO SANPHAM1
FROM  SANPHAM

SELECT * 
INTO KHACHHANG1
FROM  KHACHHANG
--Bài 2.3 
update SANPHAM1 
set GIA=GIA*1.05 
where NUOCSX='Thai Lan'
--Bài 2.4  
update SANPHAM1 
set GIA=GIA*0.95 
where NUOCSX='Trung Quoc' AND GIA<=10000
--Bài 2.5 
update KHACHHANG1 
set LOAIKH = 'Vip' 
where ( NGDK < '1/1/2007' AND DOANHSO >=10000000 ) OR ( NGDK >='1/1/2007' AND DOANHSO >= 2000000 )
--Câu 3
--Bài 3.1
SELECT MASP , TENSP
FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc'
--Bài 3.2 
SELECT MASP , TENSP
FROM SANPHAM
WHERE DVT IN ('cay','quyen')
--Bài 3.3
select masp,tensp from SANPHAM where masp like 'B%01'
--Bài 3.4
SELECT MASP , TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000
--Bài 3.5
SELECT MASP,TENSP
FROM SANPHAM
WHERE (NUOCSX ='Trung Quoc' OR NUOCSX = 'Thai Lan') AND GIA BETWEEN 30000 AND 40000
--Bài 3.6
SELECT SOHD,TRIGIA
FROM HOADON
WHERE NGHD IN ('01/01/2007','02/01/2007')
--Bài 3.7
SELECT SOHD,TRIGIA , NGHD
FROM HOADON
WHERE YEAR(NGHD) = '2007' AND MONTH(NGHD) = '01'
ORDER BY NGHD ASC , TRIGIA DESC
--Bài 3.8
SELECT KHACHHANG.MAKH, HOTEN 
FROM KHACHHANG
inner join HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE  NGHD = '1/1/2007'
--Bài 3.9
select SOHD,TRIGIA
From HOADON
inner join NHANVIEN ON HOADON.MANV = NHANVIEN.MANV
where HOTEN = 'Nguyen Van B' and NGHD= '10/28/2006'
--Bài 3.10
select SANPHAM.MASP,TENSP
from (KHACHHANG join HOADON ON HOADON.MAKH = KHACHHANG.MAKH) join (SANPHAM join CTHD ON CTHD.MASP = SANPHAM.MASP) ON CTHD.SOHD = HOADON.SOHD
where HOTEN = 'Nguyen Van A' and MONTH(NGHD)=10 and YEAR(NGHD)=2006
--Bài 3.11

