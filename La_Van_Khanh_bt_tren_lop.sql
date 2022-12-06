--	b 1
--	cau 2
alter table SANPHAM add GHICHU varchar(20)
--	cau 3
alter table KHACHHANG add LOAIKH tinyint
-- cau 4
alter table SANPHAM alter column GHICHU varchar(100)
--	cau 5
alter table SANPHAM drop column GHICHU
--	cau 6
alter table KHACHHANG alter column LOAIKH varchar(20)
--	cau 7
alter table SANPHAM add constraint DVT check(DVT='cay' OR DVT='hop' OR DVT='cai' OR DVT='quyen' OR DVT='chuc')
--	cau 8
alter table CTHD alter column SOHD int NOT NULL
alter table CTHD alter column MASP char(4) NOT NULL
alter table CTHD add constraint CTHD primary key (SOHD,MASP)
alter table SANPHAM add constraint C_GIABAN check(GIA>=500)
--	cau 9 
alter table CTHD add constraint C_SLMUA check (SL>0)
--	cau 10
alter table KHACHHANG add constraint C_NGDK_NGSINH check(NGDK>NGSINH)
-- b 3
-- cau 1
SELECT MASP , TENSP
FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc'
-- cau 2
SELECT MASP , TENSP
FROM SANPHAM
WHERE DVT IN ('cay','quyen')
-- cau 3
select masp,tensp from SANPHAM where masp like 'B%01'
-- cau 4
SELECT MASP , TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000
-- cau 5 
SELECT MASP,TENSP
FROM SANPHAM
WHERE (NUOCSX ='Trung Quoc' OR NUOCSX = 'Thai Lan') AND GIA BETWEEN 30000 AND 40000
-- cau 6
SELECT SOHD,TRIGIA
FROM HOADON
WHERE NGHD IN ('01/01/2007','02/01/2007')
-- cau 7
SELECT SOHD,TRIGIA ,NGHD
FROM HOADON
WHERE YEAR(NGHD) = '2007' AND MONTH(NGHD) = '01'
ORDER BY NGHD ASC, TRIGIA DESC
-- CAU 8 
SELECT KHACHHANG.MAKH, HOTEN
FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH= HOADON.MAKH AND NGHD='1/12007'
-- cau 9 
select SOHD,TRIGIA FROM HOADON , NHANVIEN
WHERE HOADON.MANV=NHANVIEN.MANV AND HOTEN= 'Nguyen Van B' and NGHD = '10/28/2006'
-- cau 10 
select SANPHAM.MASP,TENSP
from (KHACHHANG join HOADON ON HOADON.MAKH = KHACHHANG.MAKH) join (SANPHAM join CTHD ON CTHD.MASP = SANPHAM.MASP) ON CTHD.SOHD = HOADON.SOHD
where HOTEN = 'Nguyen Van A' and MONTH(NGHD)=10 and YEAR(NGHD)=2006