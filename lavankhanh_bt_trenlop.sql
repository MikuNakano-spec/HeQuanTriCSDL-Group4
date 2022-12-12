-- 16
SELECT MASP, TENSP FROM SANPHAM
WHERE NOT EXISTS (
		SELECT MASP FROM CTHD
		INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
		WHERE SANPHAM.MASP = CTHD.MASP AND YEAR(HOADON.NGHD) = 2006
	 )
-- 17
SELECT MASP, TENSP FROM SANPHAM
WHERE NOT EXISTS (
		SELECT MASP FROM CTHD
		INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
		WHERE  (SANPHAM.MASP = CTHD.MASP AND YEAR(HOADON.NGHD) = 2006)
		)
		and (SANPHAM.NUOCSX = 'Trung Quoc')
-- 18
select SOHD
from HOADON
where not exists (
select masp
from sanpham
where nuocsx='Singapore' and not exists (
select SOHD
from CTHD where HOADON.sohd=CTHD.sohd and CTHD.masp=SANPHAM.masp) )
--19
--20
select Count(*) as 'so khach hang k phai tv mua'
from HOADON
where MAKH is null
--21
SELECT COUNT(DISTINCT MASP) as 'san pham khacnhau bans trong nam 2003'
FROM HOADON 
INNER JOIN CTHD ON HOADON.SOHD = CTHD.SOHD
WHERE YEAR(NGHD) = '2006'
--22
SELECT MIN(TRIGIA) AS 'HD thap nhat' , MAX (TRIGIA) AS 'HD cao nhat'
FROM HOADON
--23
SELECT AVG(TRIGIA) AS 'AVG tong HD 2006'
FROM HOADON
WHERE YEAR(NGHD) ='2006'
--24
SELECT SUM(TRIGIA) AS 'DoanhThu'
from HOADON
WHERE YEAR(NGHD) = '2006'
--25
SELECT SOHD
FROM HOADON
WHERE TRIGIA= (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD) = '2006' )
--26
SELECT HOTEN
FROM KHACHHANG
inner join HOADON on HOADON.MAKH = KHACHHANG.MAKH
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR (NGHD)=2006)
--27
select TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--28
select MASP,TENSP FROM SANPHAM
WHERE GIA in (select top 3 GIA from SANPHAM order by GIA desc)
--29
SELECT MASP ,TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' and GIA IN (SELECT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)
--30
SELECT MASP ,TENSP
FROM SANPHAM
WHERE nuocsx = 'Trung Quoc' and GIA IN (SELECT TOP 3 GIA FROM SANPHAM Where NUOCSX = 'Trung Quoc' ORDER BY GIA DESC)
--31
select * from khachhang
where DOANHSO in ( select top 3 DOANHSO FROM KHACHHANG ORDER BY DOANHSO DESC)
--32
SELECT COUNT (*) AS 'TONG SO SP'
FROM SANPHAM
WHERE NUOCSX='Trung Quoc'
--33
SELECT NUOCSX , COUNT (*) AS SOSP
FROM SANPHAM
GROUP BY NUOCSX 
--34 
SELECT NUOCSX , MAX(GIA) AS 'GIA CAO NHAT' , MIN(GIA) AS 'GIATHAP NHAT' , AVG(GIA) AS 'GIA TRUNG BINH'
FROM SANPHAM
GROUP BY NUOCSX
--35
SELECT NGHD , SUM(TRIGIA) AS DOANHTHU
FROM HOADON
GROUP BY NGHD