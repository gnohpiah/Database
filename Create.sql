
drop database QuanLyNhanSu
create database QuanLyNhanSu
use QuanLyNhanSu
create table tTrinhDo(
	MaTD nvarchar(10),
	TrinhDoHocVan nvarchar(15) null,
	TrinhDoNgoaiNgu nvarchar(20) null,
	constraint pk_tTrinhDo primary key (MaTD)
)

create table tBaoHiemYTe(
	SoBH nvarchar(10),
	NoiCap nvarchar(20) null,
	NoiKham nvarchar(40) null,
	constraint pk_tBaoHiemYTe primary key (SoBH)	
)

create table tPhongBan(
	MaPB nvarchar(10),
	TenPB nvarchar(40) null,
	MaTruongPhong nvarchar(10) null,
	constraint pk_tPhongBan primary key (MaPB)
	
)


create table tHopDongLaoDong(
	SoHD nvarchar(10),
	NgayKy date null,
	ThoiGian int null,
	SoDTUV nvarchar(15) null,
	constraint pk_tHopDongLaoDong primary key (SoHD)
	
)

create table tUngVien(
	SoDTUV nvarchar(15),
	TuoiUV int null,
	TenUV nvarchar(30) null,
	ChuyenMon nvarchar(30) null,
	constraint pk_tUngVien primary key (SoDTUV)
)

create table tNhanVien_ChucVu(
	MaCV nvarchar(10),
	MaNV nvarchar(10),
	TBatDau date null,
	TKetThuc date null,
	constraint pk_tNhanVien_ChucVu primary key (MaCV,MaNV)
)



create table tNhanVien(
	MaNV nvarchar(10),
	CCCD nvarchar(10) null,
	MaPB nvarchar(10) null,
	STKNhan nvarchar(15) null,
	MaTD nvarchar(10) null,
	SoBH nvarchar(10) null,
	SoHD nvarchar(10) null,
	constraint pk_tNhanVien primary key (MaNV)
)


create table tChiTietNV(
	CCCD nvarchar(10),
	HoTen nvarchar(30) null,
	GioiTinh nvarchar(5) null,
	NgaySinh date null,
	DiaChi nvarchar(20) null,
	QueQuan nvarchar(20) null,
	SDT nvarchar(15) null,
	constraint pk_tChiTietNV primary key (CCCD)
)

create table tNhanVien_DuAn(
	MaDA nvarchar(10),
	MaNV nvarchar(10),
	constraint pk_tNhanVien_DuAn primary key (MaDA,MaNV)
)


create table tDuAn(
	MaDA nvarchar(10),
	TenDA nvarchar(50) null,
	NgayBD date null,
	NgayKT date null,
	MaQLDA nvarchar(10) null,
	constraint pk_tDuAn primary key (MaDA)
)


create table tLuong(
	STKNhan nvarchar(15),
	LuongHD money null,
	ThucLanh money null,
	MaDA nvarchar(10),
	MaCV nvarchar(10),
	constraint pk_tLuong primary key (STKNhan)
)

create table tPhuCap(
	MaCV nvarchar(10),
	PhuCap money null,
	constraint pk_tPhuCap primary key (MaCV)
)

create table tThuongDuAn(
	MaDA nvarchar(10),
	Thuong money null,
	constraint pk_tThuongDuAn primary key (MaDA)
)

create table tChucVu(
	MaCV nvarchar(10),
	TenCV nvarchar(50) null,
	constraint pk_tChucVu primary key (MaCV)
)

alter table tPhongBan
add constraint fk_tPhongBan_tNhanVien foreign key(MaTruongPhong) references tNhanVien(MaNV)

alter table tHopDongLaoDong
add constraint fk_tHopDongLaoDong_tUngVien foreign key(SoDTUV) references tUngVien(SoDTUV)

alter table tNhanVien_ChucVu
add constraint fk_tNhanVien_ChucVu_tChucVu foreign key(MaCV) references tChucVu(MaCV)

alter table tNhanVien_ChucVu
add constraint fk_tNhanVien_ChucVu_tNhanVien foreign key(MaNV) references tNhanVien(MaNV)

alter table tDuAn
add constraint fk_tDuAn_tNhanVien foreign key(MaQLDA) references tNhanVien(MaNV)

alter table tLuong
add constraint fk_tLuong_tDuAn foreign key(MaDA) references tDuAn(MaDA)

alter table tLuong
add constraint fk_tLuong_tThuongDuAn foreign key(MaDA) references tThuongDuAn(MaDA)

alter table tLuong
add constraint fk_tLuong_tChucVu foreign key(MaCV) references tChucVu(MaCV)

alter table tLuong
add constraint fk_tLuong_tPhuCap foreign key(MaCV) references tPhuCap(MaCV)

alter table tNhanVien
add constraint fk_tNhanVien_tChiTietNV foreign key(CCCD) references tChiTietNV(CCCD)

alter table tNhanVien
add constraint fk_tNhanVien_tPhongBan foreign key(MaPB) references tPhongBan(MaPB)

alter table tNhanVien
add constraint fk_tNhanVien_tLuong foreign key(STKNhan) references tLuong(STKNhan)

alter table tNhanVien
add constraint fk_tNhanVien_tTrinhDo foreign key(MaTD) references tTrinhDo(MaTD)

alter table tNhanVien
add constraint fk_tNhanVien_tBaoHiemYTe foreign key(SoBH) references tBaoHiemYTe(SoBH)

alter table tNhanVien
add constraint fk_tNhanVien_tHopDongLaoDong foreign key(SoHD) references tHopDongLaoDong(SoHD)

alter table tNhanVien_DuAn
add constraint fk_tNhanVien_DuAn_tNhanVien foreign key(MaNV) references tNhanVien(MaNV)

alter table tNhanVien_DuAn
add constraint fk_tNhanVien_DuAn_tDuAn foreign key(MaDA) references tDuAn(MaDA)


insert into tTrinhDo values('VB01',N'Đại Học',N'Tiếng Anh')
insert into tTrinhDo values('VB02',N'Đại Học',N'Tiếng Nhật')
insert into tTrinhDo values('VB03',N'Thạc Sĩ',N'Tiếng Anh')
insert into tTrinhDo values('VB04',N'Thạc Sĩ',N'Tiếng Đức')

insert into tPhongBan values('PB01',N'Phòng Kỹ Thuật',null)
insert into tPhongBan values('PB02',N'Phòng Nhân Sự',null)
insert into tPhongBan values('PB03',N'Phòng Kế Toán',null)
insert into tPhongBan values('PB04',N'Phòng Điều Hành',null)
insert into tPhongBan values('PB05',N'Phòng Marketing',null)

insert into tDuAn values('DA01',N'Nghiên Cứu Máy Tính','20-JUN-2018','30-JULY-2019',null)
insert into tDuAn values('DA02',N'Nghiên Cứu Thị Trường','12-MAR-2021','30-AUG-2022',null)
insert into tDuAn values('DA03',N'Xây Dựng Cơ Sở Luật','1-FEB-2019','9-JAN-2020',null)
insert into tDuAn values('DA04',N'Phát Triển Nguồn Lực','6-AUG-2021','19-NOV-2021',null)

insert into tPhuCap values('CV01',1000000)
insert into tPhuCap values('CV02',1200000)
insert into tPhuCap values('CV03',1500000)
insert into tPhuCap values('CV04',2000000)
insert into tPhuCap values('CV05',100000)

insert into tThuongDuAn values('DA01',700000)
insert into tThuongDuAn values('DA02',600000)
insert into tThuongDuAn values('DA03',1000000)
insert into tThuongDuAn values('DA04',400000)

insert into tChucVu values('CV01',N'Kỹ Thuật Viên')
insert into tChucVu values('CV02',N'Kế Toán')
insert into tChucVu values('CV03',N'Tuyển Dụng Nhân Sự')
insert into tChucVu values('CV04',N'Ban Điều Hành')
insert into tChucVu values('CV05',N'Thực Tập Sinh')

--1
insert into tBaoHiemYTe values('90876',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('1222','8-JUN-2021',4,null)
insert into tChiTietNV values('0000008',N'Chu Hải Phong',N'Nam','11/7/2003',N'Hà Nội',N'Thái Bình','71233444')
insert into tLuong values('12345678',8000000,null,'DA01','CV01')
insert into tNhanVien values('NV01','0000008','PB01','12345678','VB01','90876','1222')
insert into tNhanVien_DuAn values('DA01','NV01')
insert into tNhanVien_ChucVu values('CV01','NV01','10-JUN-2021','10-JUN-2025')

--2
insert into tBaoHiemYTe values('90123',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('6372','11-JUN-2022',3,null)
insert into tChiTietNV values('0000009',N'Trịnh Quang Dương',N'Nam','04-MAR-1995',N'Hà Nội',N'Hà Nội','71557069')
insert into tLuong values('12356756',5000000,null,'DA01','CV01')
insert into tNhanVien values('NV02','0000009','PB01','12356756','VB02','90123','6372')
insert into tNhanVien_DuAn values('DA01','NV02')
insert into tNhanVien_ChucVu values('CV01','NV02','12-JUN-2022','12-JUN-2025')

--3
insert into tBaoHiemYTe values('90234',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('6571','8-JUN-2021',4,null)
insert into tChiTietNV values('0000010',N'Nguyễn Tiến Thịnh',N'Nam','07-JUN-1999',N'Hà Nội',N'Đà Lạt','71954781')
insert into tLuong values('12397434',6000000,null,'DA02','CV03')
insert into tNhanVien values('NV03','0000010','PB02','12397434','VB03','90234','6571')
insert into tNhanVien_DuAn values('DA02','NV03')
insert into tNhanVien_ChucVu values('CV03','NV03','13-AUG-2021','13-AUG-2026')

--4
insert into tBaoHiemYTe values('90345',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('4381','23-MAY-2022',5,null)
insert into tChiTietNV values('0000011',N'Bùi Khánh Hưng',N'Nam','13-AUG-2000',N'Hà Nội',N'Hải Dương','68139409')
insert into tLuong values('12349594',6500000,null,'DA03','CV04')
insert into tNhanVien values('NV04','0000011','PB04','12349594','VB02','90345','4381')
insert into tNhanVien_DuAn values('DA03','NV04')
insert into tNhanVien_ChucVu values('CV04','NV04','14-AUG-2021','14-AUG-2026')

--5
insert into tBaoHiemYTe values('90456',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('2613','20-NOV-2021',2,null)
insert into tChiTietNV values('0000012',N'Nguyễn Anh Thư',N'Nữ','23-FEB-2001',N'Hà Nội',N'Huế','37078094')
insert into tLuong values('12398949',5500000,null,'DA04','CV02')
insert into tNhanVien values('NV05','0000012','PB03','12398949','VB04','90456','2613')
insert into tNhanVien_DuAn values('DA04','NV05')
insert into tNhanVien_ChucVu values('CV02','NV05','23-NOV-2021','23-NOV-2023')

--6
insert into tBaoHiemYTe values('90457',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('3366','31-DEC-2022',3,null)
insert into tChiTietNV values('0000013',N'Nguyễn Thanh Đạt',N'Nam','12-OCT-2000',N'Hà Nội',N'Lạng Sơn','60259129')
insert into tLuong values('12334985',7000000,null,'DA04','CV05')
insert into tNhanVien values('NV06','0000013','PB05','12334985','VB04','90457','3366')
insert into tNhanVien_DuAn values('DA04','NV06')
insert into tNhanVien_ChucVu values('CV05','NV06','2-JAN-2023','2-JAN-2026')

--7
insert into tBaoHiemYTe values('90567',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('3770','19-MAY-2020',4,null)
insert into tChiTietNV values('0000014',N'Nguyễn Hoàng Việt',N'Nam','19-DEC-1998',N'Hà Nội',N'Lào Cai','59725100')
insert into tLuong values('12378594',7500000,null,'DA03','CV02')
insert into tNhanVien values('NV07','0000014','PB03','12378594','VB03','90567','3770')
insert into tNhanVien_DuAn values('DA03','NV07')
insert into tNhanVien_ChucVu values('CV02','NV07','21-MAY-2020','21-MAY-2024')

--8
insert into tBaoHiemYTe values('90678',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('5724','29-FEB-2020',5,null)
insert into tChiTietNV values('0000015',N'Trần Thành An',N'Nam','23-NOV-1997',N'Hà Nội',N'Nha Trang','57430601')
insert into tLuong values('12340506',7200000,null,'DA02','CV03')
insert into tNhanVien values('NV08','0000015','PB02','12340506','VB03','90678','5724')
insert into tNhanVien_DuAn values('DA02','NV08')
insert into tNhanVien_ChucVu values('CV03','NV08','29-MAR-2020','29-MAR-2025')

--9
insert into tBaoHiemYTe values('90789',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('3995','15-JAN-2023',4,null)
insert into tChiTietNV values('0000016',N'Phạm Thiên An',N'Nữ','31-JUL-2003',N'Hà Nội',N'Sa Đéc','32346676')
insert into tLuong values('12312060',4000000,null,'DA01','CV05')
insert into tNhanVien values('NV09','0000016','PB04','12312060','VB01','90789','3995')
insert into tNhanVien_DuAn values('DA01','NV09')
insert into tNhanVien_ChucVu values('CV05','NV09','17-JAN-2023','17-JAN-2027')

--10
insert into tBaoHiemYTe values('35456',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('2324','14-MAR-2022',4,null)
insert into tChiTietNV values('0000017',N'Đặng Tuấn Anh',N'Nam','09-JUL-2001',N'Hà Nội',N'Bình Dương','45794533')
insert into tLuong values('43543536',5500000,null,'DA03','CV04')
insert into tNhanVien values('NV10','0000017','PB04','43543536','VB03','35456','2324')
insert into tNhanVien_DuAn values('DA03','NV10')
insert into tNhanVien_ChucVu values('CV04','NV10','11-JAN-2022','10-JUL-2026')

--11
insert into tBaoHiemYTe values('56688',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('3554','16-JUL-2023',6,null)
insert into tChiTietNV values('0000018',N'Đỗ Hoàng Gia Bảo',N'Nam','03-MAR-2000',N'Hà Nội',N'Kiên Giang','22134859')
insert into tLuong values('23423553',7000000,null,'DA02','CV01')
insert into tNhanVien values('NV11','0000018','PB01','23423553','VB01','56688','3554')
insert into tNhanVien_DuAn values('DA02','NV11')
insert into tNhanVien_ChucVu values('CV01','NV11','01-DEc-2021','18-JUL-2029')

--12
insert into tBaoHiemYTe values('21325',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('7588','19-FEB-2020',7,null)
insert into tChiTietNV values('0000019',N'Trần Tuấn Hưng',N'Nam','07-FEB-1998',N'Hà Nội',N'Thái Bình','23434234')
insert into tLuong values('24243255',7500000,null,'DA01','CV02')
insert into tNhanVien values('NV12','0000019','PB02','24243255','VB02','21325','7588')
insert into tNhanVien_DuAn values('DA01','NV12')
insert into tNhanVien_ChucVu values('CV02','NV12','19-MAR-2020','11-FEB-2026')

--13
insert into tBaoHiemYTe values('24345',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('3445','25-OCT-2022',22,null)
insert into tChiTietNV values('0000020',N'Lê Khánh Vy',N'Nữ','18-JUN-1997',N'Hà Nội',N'Cần Thơ','34247292')
insert into tLuong values('65464646',7200000,null,'DA03','CV03')
insert into tNhanVien values('NV13','0000020','PB05','65464646','VB04','24345','3445')
insert into tNhanVien_DuAn values('DA03','NV13')
insert into tNhanVien_ChucVu values('CV03','NV13','20-MAR-2020','15-AUG-2026')

--14
insert into tBaoHiemYTe values('23576',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('9878','28-JAN-2021',33,null)
insert into tChiTietNV values('0000021',N'Đỗ Thùy Linh',N'Nữ','21-AUG-1999',N'Hà Nội',N'Hải Phòng','34923497')
insert into tLuong values('54524346',30000000,null,'DA04','CV05')
insert into tNhanVien values('NV14','0000021','PB03','54524346','VB01','23576','9878')
insert into tNhanVien_DuAn values('DA04','NV14')
insert into tNhanVien_ChucVu values('CV05','NV14','20-MAR-2020','19-JAN-2025')

--15
insert into tBaoHiemYTe values('12345',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('2456','08-JUL-2022',10,null)
insert into tChiTietNV values('0000022',N'Đào Tuấn Phong',N'Nam','24-FEB-1999',N'Hà Nội',N'Thanh Hóa','21934904')
insert into tLuong values('43568564',55000000,null,'DA04','CV04')
insert into tNhanVien values('NV15','0000022','PB01','43568564','VB04','12345','2456')
insert into tNhanVien_DuAn values('DA04','NV15')
insert into tNhanVien_ChucVu values('CV04','NV15','25-FEB-2021','18-MAR-2025')

--16
insert into tBaoHiemYTe values('87897',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('6888','09-JUN-2019',11,null)
insert into tChiTietNV values('0000023',N'Nguyễn Ngọc Anh',N'Nữ','30-JUL-2001',N'Hà Nội',N'Hưng Yên','32342349')
insert into tLuong values('65756556',60000000,null,'DA03','CV05')
insert into tNhanVien values('NV16','0000023','PB02','65756556','VB03','87897','6888')
insert into tNhanVien_DuAn values('DA03','NV16')
insert into tNhanVien_ChucVu values('CV05','NV16','04-JUL-2023','22-MAR-2025')

--17
insert into tBaoHiemYTe values('23642',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('3555','11-AUG-2021',2,null)
insert into tChiTietNV values('0000024',N'Vũ Đức Huy',N'Nam','16-OCT-2003',N'Hà Nội',N'Mỹ Tho','80283303')
insert into tLuong values('86876955',100000000,null,'DA04','CV01')
insert into tNhanVien values('NV17','0000024','PB04','86876955','VB03','23642','3555')
insert into tNhanVien_DuAn values('DA04','NV17')
insert into tNhanVien_ChucVu values('CV01','NV17','07-AUG-2022','24-OCT-2026')

--18
insert into tBaoHiemYTe values('19023',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('1910','19-OCT-2012',5,null)
insert into tChiTietNV values('0000025',N'Nguyễn Công Sơn',N'Nam','27-MAR-2003',N'Hà Nội',N'Thái Nguyên','19006886')
insert into tLuong values('98765432',10000000,null,'DA04','CV05')
insert into tNhanVien values('NV18','0000025','PB05','98765432','VB04','19023','1910')
insert into tNhanVien_DuAn values('DA04','NV18')
insert into tNhanVien_ChucVu values('CV05','NV18','01-JUN-2012','01-JUN-2017')

--19
insert into tBaoHiemYTe values('19034',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('7020','17-SEP-2013',4,null)
insert into tChiTietNV values('0000026',N'Bùi Văn Nam',N'Nam','26-NOV-1994',N'Hà Nội',N'Phú Thọ','16578897')
insert into tLuong values('89674521',15000000,null,'DA02','CV04')
insert into tNhanVien values('NV19','0000026','PB04','89674521','VB02','19034','7020')
insert into tNhanVien_DuAn values('DA02','NV19')
insert into tNhanVien_ChucVu values('CV04','NV19','02-FEB-2013','02-FEB-2017')

--20
insert into tBaoHiemYTe values('19045',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('9101','16-APR-2014',6,null)
insert into tChiTietNV values('0000027',N'Nguyễn Thùy Linh',N'Nữ','19-OCT-2002',N'Hà Nội',N'Sóc Sơn','29571408')
insert into tLuong values('56437281',25000000,null,'DA03','CV02')
insert into tNhanVien values('NV20','0000027','PB03','56437281','VB03','19045','9101')
insert into tNhanVien_DuAn values('DA03','NV20')
insert into tNhanVien_ChucVu values('CV02','NV20','03-MAR-2014','3/3/2020')

--21
insert into tBaoHiemYTe values('19056',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('2023','15-DEC-2015',3,null)
insert into tChiTietNV values('0000028',N'Nguyễn Thị Thảo',N'Nữ','7-APR-1999',N'Hà Nội',N'Bắc Giang','29687523')
insert into tLuong values('19102003',30000000,null,'DA01','CV03')
insert into tNhanVien values('NV21','0000028','PB02','19102003','VB01','19056','2023')
insert into tNhanVien_DuAn values('DA01','NV21')
insert into tNhanVien_ChucVu values('CV03','NV21','04-APR-2015','4/4/2018')

--22
insert into tBaoHiemYTe values('19067',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('1996','29-JUN-2016',7,null)
insert into tChiTietNV values('0000029',N'Bùi Xuân Dũng',N'Nam','16-AUG-1996',N'Hà Nội',N'Cao Bằng','30849106')
insert into tLuong values('70202003',55000000,null,'DA03','CV01')
insert into tNhanVien values('NV22','0000029','PB01','70202003','VB02','19067','1996')
insert into tNhanVien_DuAn values('DA03','NV22')
insert into tNhanVien_ChucVu values('CV01','NV22','05-MAY-2016','05-MAY-2023')

--23
insert into tBaoHiemYTe values('19078',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('3749','30-JUL-2017',2,null)
insert into tChiTietNV values('0000030',N'Nguyễn Văn Lực',N'Nam','21-SEP-2000',N'Hà Nội',N'Ninh Bình','30112238')
insert into tLuong values('91995281',60000000,null,'DA04','CV02')
insert into tNhanVien values('NV23','0000030','PB02','91995281','VB04','19078','3749')
insert into tNhanVien_DuAn values('DA04','NV23')
insert into tNhanVien_ChucVu values('CV02','NV23','06-JUN-2017','06-JUN-2019')

--24
insert into tBaoHiemYTe values('19089',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('6996','10-MAR-2018',8,null)
insert into tChiTietNV values('0000031',N'Trần Thị Lan',N'Nữ','30-JAN-1998',N'Hà Nội',N'Bắc Ninh','41527896')
insert into tLuong values('91659478',100000000,null,'DA02','CV05')
insert into tNhanVien values('NV24','0000031','PB04','91659478','VB03','19089','6996')
insert into tNhanVien_DuAn values('DA02','NV24')
insert into tNhanVien_ChucVu values('CV05','NV24','07-OCT-2018','07-OCT-2026')

--25
insert into tBaoHiemYTe values('12342',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('1825','8-JUN-1990',40,null)
insert into tChiTietNV values('11223344',N'Trương Gia Bình',N'Nam','02-JAN-1976',N'Hà Nội',N'Hà Nội','98765432')
insert into tLuong values('99999999',50000000,null,'DA01','CV01')
insert into tNhanVien values('NV25','11223344','PB01','99999999','VB03','12342','1825')
insert into tNhanVien_DuAn values('DA01','NV25')
insert into tNhanVien_ChucVu values('CV01','NV25','10-JUN-1990','10-JUN-2030')

--26
insert into tBaoHiemYTe values('11223',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('2827','25-MAY-2010',30,null)
insert into tChiTietNV values('22334455',N'Lương Thùy Linh',N'Nữ','02-MAR-1990',N'Hà Nội',N'Hà Nam','98765433')
insert into tLuong values('99999998',38000000,null,'DA01','CV01')
insert into tNhanVien values('NV26','22334455','PB01','99999998','VB04','11223','2827')
insert into tNhanVien_DuAn values('DA01','NV26')
insert into tNhanVien_ChucVu values('CV01','NV26','25-MAY-2010','25-MAY-2040')

-- 27
insert into tBaoHiemYTe values('11224',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('3228','18-AUG-2018',10,null)
insert into tChiTietNV values('22335566',N'Chu Thuật Toán',N'Nam','23-JUN-1988',N'Hà Nội',N'Hồ Chí Minh','98765444')
insert into tLuong values('99999997',20000000,null,'DA04','CV04')
insert into tNhanVien values('NV27','22335566','PB04','99999997','VB03','11224','3228')
insert into tNhanVien_DuAn values('DA04','NV27')
insert into tNhanVien_ChucVu values('CV04','NV27','20-AUG-2018','20-AUG-2028')

--28
insert into tBaoHiemYTe values('11225',N'Hà Nội',N'Bệnh Viện Quân Y 103')
insert into tHopDongLaoDong values('4829','19-MAY-2018',6,null)
insert into tChiTietNV values('22336677',N'Ngô Sỹ Liên',N'Nữ','15-MAY-1995',N'Hà Nội',N'Ninh Bình','98765555')
insert into tLuong values('99999996',3000000,null,'DA04','CV05')
insert into tNhanVien values('NV28','22336677','PB05','99999996','VB01','11225','4829')
insert into tNhanVien_DuAn values('DA04','NV28')
insert into tNhanVien_ChucVu values('CV05','NV28','20-MAY-2018','20-MAY-2024')

--29
insert into tBaoHiemYTe values('11226',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('4330','2-NOV-2021',5,null)
insert into tChiTietNV values('22223333',N'Nguyễn Văn Cao',N'Nam','8-AUG-2000',N'Hà Nội',N'Thanh Hóa','1234567')
insert into tLuong values('99999995',3000000,null,'DA02','CV05')
insert into tNhanVien values('NV29','22223333','PB05','99999995','VB01','11226','4330')
insert into tNhanVien_DuAn values('DA02','NV29')
insert into tNhanVien_ChucVu values('CV05','NV29','5-NOV-2021','5-NOV-2026')

--30
insert into tBaoHiemYTe values('11228',N'Hà Nội',N'Bệnh Viện Đại Học Y')
insert into tHopDongLaoDong values('3331','7-JAN-2022',2,null)
insert into tChiTietNV values('23232323',N'Trần Tiểu Vy	',N'Nữ','28-NOV-2001',N'Hà Nội',N'Cà Mau','1234568')
insert into tLuong values('99999994',2500000,null,'DA02','CV05')
insert into tNhanVien values('NV30','23232323','PB05','99999994','VB01','11228','3331')
insert into tNhanVien_DuAn values('DA02','NV30')
insert into tNhanVien_ChucVu values('CV05','NV30','9-JAN-2022','9-JAN-2024')

--31
insert into tBaoHiemYTe values('11229',N'Hà Nội',N'Bệnh Viện Bạch Mai')
insert into tHopDongLaoDong values('8932','21-MAR-2022',2,null)
insert into tChiTietNV values('56712399',N'Bùi Trường Giang',N'Nam','07-JAN-1999',N'Hà Nội',N'Đà Nẵng','1234569		')
insert into tLuong values('99999991',19000000,null,'DA03','CV03')
insert into tNhanVien values('NV31','56712399','PB03','99999991','VB02','11229','8932')
insert into tNhanVien_DuAn values('DA03','NV31')
insert into tNhanVien_ChucVu values('CV03','NV31','22-MAR-2022','22-MAR-2024')

--32
insert into tNhanVien_DuAn values('DA01','NV05')

--33
insert into tNhanVien_ChucVu values('CV05','NV07','12-AUG-2019','3-MAR-2020')

--34
insert into tNhanVien_DuAn values('DA03','NV12')

--35
insert into tNhanVien_ChucVu values('CV05','NV13','04-JAN-2020','12-FEB-2020')

--36
insert into tNhanVien_DuAn values('DA01','NV03')

--37
insert into tNhanVien_ChucVu values('CV05','NV15','01-NOV-2020','19-JAN-2021')

--38
insert into tNhanVien_DuAn values('DA03','NV18')

--39
insert into tNhanVien_ChucVu values('CV05','NV20','01-NOV-2013','19-FEB-2014')

--40
insert into tNhanVien_DuAn values('DA01','NV15')

--41
insert into tNhanVien_ChucVu values('CV05','NV22','01-NOV-2015','29-APR-2021')

--42
insert into tUngVien values('22334499',20,N'Nguyễn Văn Sơn',N'Kế Toán')
insert into tHopDongLaoDong values('4442',null,2,'22334499')

--43
insert into tUngVien values('12030300',18,N'Trần Uyển Nhi',N'Kỹ Thuật Viên')
insert into tHopDongLaoDong values('2345',null,5,'12030300')

--44
insert into tUngVien values('42357098',22,N'Nguyễn Ngọc Quân',N'Kỹ Thuật Viên')
insert into tHopDongLaoDong values('1235',null,5,'42357098')

--45
insert into tUngVien values('554657567',23,N'Nguyễn Văn Toàn',N'Kế Toán')
insert into tHopDongLaoDong values('5439',null,3,'554657567')

--46
insert into tUngVien values('12398722',19,N'Nông Đức Mạnh',N'Kế Toán')
insert into tHopDongLaoDong values('8437',null,3,'12398722')

--47
insert into tUngVien values('67218472',25,N'Nguyễn Viết Huy',N'Tuyển Dụng Nhân Sự')
insert into tHopDongLaoDong values('1232',null,2,'67218472')


--UPDATE--------------------------------
update tPhongBan
set MaTruongPhong = 
case
	when MaPB = 'PB01' then 'NV15'
	when MaPB = 'PB02' then 'NV21'
	when MaPB = 'PB03' then 'NV24'
	when MaPB = 'PB04' then 'NV03'
	when MaPB = 'PB05' then 'NV12'
end
where MaPB in ('PB01','PB02','PB03','PB04','PB05')

update tDuAn
set MaQLDA = 
case 
	when MaDA = 'DA01' then 'NV13'
	when MaDA = 'DA02' then 'NV08'
	when MaDA = 'DA03' then 'NV26'
	when MaDA = 'DA04' then 'NV15'
end
where MaDA in ('DA01','DA02','DA03','DA04')

update tLuong  
set ThucLanh = a.Tien from (select STKNhan,sum(LuongHD + PhuCap + Thuong) as Tien
from tLuong l join tPhuCap pc on l.MaCV = pc.MaCV join tThuongDuAn tda on tda.MaDA = l.MaDA
group by (STKNhan)) a
where tLuong.STKNhan = a.STKNhan 
----------------------------
















