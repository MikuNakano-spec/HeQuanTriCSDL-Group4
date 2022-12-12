-- III
--Bài 3.16
SELECT MASP , TENSP
FROM SANPHAM 
WHERE NOT EXISTS (
	SELECT MASP
	FROM CTHD 
	INNER JOIN HOADON ON CTHD.SOHD = HOADON.SOHD
	WHERE SANPHAM.MASP = CTHD.MASP AND YEAR(HOADON.NGHD) = 2006
	)
--Bài 3.17
select masp,tensp
from SANPHAM
where NUOCSX='Trung Quoc' and not exists (
		select MASP
		FROM CTHD join HOADON on CTHD.SOHD = HOADON.SOHD
		WHERE SANPHAM.MASP = CTHD.MASP AND YEAR(HOADON.NGHD) = 2006
	)
--Bài 3.18
select SOHD
from HOADON
where not exists (
			select masp
			from sanpham
			where nuocsx='Singapore' and not exists (
				select SOHD
				from CTHD 
				where HOADON.sohd=CTHD.sohd and CTHD.masp=SANPHAM.masp) )
--Bài 3.19
