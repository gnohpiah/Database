use QuanLyNhanSu
--2 câu lệnh update có điều kiện
--1.Update nơi khám bệnh trong bảo hiểm y tế của nhân viên Vũ Đức Huy thành Bệnh Viện Đại Học Y
	update tBaoHiemYTe
	set NoiKham  = 'Bệnh Viện Đại Học Y'
	from tBaoHiemYTe bh join tNhanVien nv on nv.SoBH = bh.SoBH join tChiTietNV ctnv on ctnv.CCCD = nv.CCCD
	where HoTen = N'Vũ Đức Huy'
	

--2.Update nơi ở của nhân viên Bùi Khánh Hưng thành Đà Nẵng
	update tChiTietNV
	set DiaChi = N'Đà Nẵng'
	where HoTen = N'Bùi Khánh Hưng'
	

-- 2 câu lệnh select trên 1 bảng có điều kiện
--3. Tìm mã nhân viên làm việc ở phòng có mã phòng ban PB01
	select MaNV
	from tNhanVien
	where MaPB = 'PB01'


--4. Tìm tên nhân viên và số điện thoại của nhân viên quê ở Sóc Sơn
	select HoTen,SDT
	from tChiTietNV
	where QueQuan = N'Sóc Sơn'

--3 câu lệnh select trên nhiều bảng có điều kiện
--5. Tìm những mã nhân viên vừa là trưởng phòng vừa là quản lý dự án bắt đầu vào năm 2021
	select MaNV
	from tNhanVien nv join tPhongBan pb on pb.MaTruongPhong = nv.MaNV join tDuAn da on da.MaQLDA = nv.MaNV
	where year(NgayBD) = 2021	

--6. Tìm mã nhân viên và tên nhân viên có giới tính nam
	select MaNV,HoTen
	from tNhanVien nv join tChiTietNV ctnv on nv.CCCD = ctnv.CCCD
	where GioiTinh = N'Nam'

--7. Tìm số CCCD của nhân viên có trình độ đại học
	select CCCD
	from tNhanVien nv join tTrinhDo td on td.MaTD = nv.MaTD
	where TrinhDoHocVan = N'Đại học'

--2 câu lệnh select có where và group by
--8. Tìm tổng tiền phụ cấp của các nhân viên làm dự án Nghiên Cứu Máy Tính theo từng chức vụ
	select sum(PhuCap) as TongPhuCap
	from tLuong l join tDuAn da on da.MaDA = l.MaDA join tPhuCap pc on pc.MaCV = l.MaCV
	where TenDA = N'Nghiên Cứu Máy Tính'
	group by (l.MaCV)

--9. Đếm số nhân viên của từng chức vụ mà thời gian bắt đầu làm vào 2021
	select count(MaNV) as SoNhanVien
	from tNhanVien_ChucVu
	where year(TBatDau) = 2021
	group by MaCV
	
--3 câu lệnh gồm select có where,group by,having
--10.Tìm mã dự án bắt đầu vào năm 2021 có tổng thu nhập của các nhân viên tham gia nhỏ hơn 200.000.000
	select l.MaDA
	from tDuAn da join tLuong l on l.MaDA = da.MaDA
	where year(NgayBD) = 2021
	group by(l.MaDA)
	having sum(ThucLanh) < 200000000

--11. Tìm mã phòng ban có số lượng nhân viên nam có số lượng quê > 5
	select MaPB,count(QueQuan) as Que
	from tNhanVien nv join tChiTietNV ctnv on ctnv.CCCD = nv.CCCD 
	where GioiTinh = N'Nam'
	group by MaPB
	having count(QueQuan) > 5

--12.Tìm những nhân viên có địa chỉ ở Hà Nội làm nhiều chức vụ(Thăng tiến trong công ty từ thực tập sinh)
	select nv.MaNV,HoTen,count(MaCV) as SLCV
	from tNhanVien nv join tChiTietNV ctnv on nv.CCCD = ctnv.CCCD join tNhanVien_ChucVu nvcv on nvcv.MaNV = nv.MaNV
	where DiaChi = N'Hà Nội'
	group by nv.MaNV,HoTen
	having count(MaCV) > 1
	
--2 câu lệnh gồm select có where,group by,having và order by
--13.  Tìm mã phòng ban và số lượng nhân viên biết nói tiếng Anh nhiều nhất nhưng ít hơn 5
	select distinct top 1 MaPB,count(MaNV) as SL
	from tNhanVien nv join tTrinhDo td on td.MaTD = nv.MaTD
	where TrinhDoNgoaiNgu = N'Tiếng Anh'
	group by MaPB
	having count(MaNV) < 5
	order by count(MaNV) desc

--14. Đưa ra mã dự án và tổng tiền thu nhập của nhan viên nữ làm trong dự án đó sao cho tổng tiền  > 100.000.000 theo thứ tự giảm dần
	select MaDA,sum(ThucLanh) as TongTien
	from tNhanVien nv join tChiTietNV ctnv on nv.CCCD = ctnv.CCCD join tLuong l on l.STKNhan = nv.STKNhan
	where GioiTinh = N'Nữ'
	group by MaDA
	having sum(ThucLanh) > 100000000
	order by sum(ThucLanh) desc

--2 câu lệnh gồm select có where,group by,having và truy vấn con 
--15. Tìm chức vụ có trung bình thu nhập không phụ cấp của nhân viên nam lớn hơn mức trung bình của tất cả nhân viên nam
	select pc.MaCV
	from tLuong l join tNhanVien nv on nv.STKNhan = l.STKNhan join tChiTietNV ctnv on ctnv.CCCD = nv.CCCD join tPhuCap pc on pc.MaCV = l.MaCV
	where GioiTinh = 'Nam'
	group by pc.MaCV
	having avg(ThucLanh - PhuCap) > 
	(select avg(ThucLanh - PhuCap)
	from tLuong l join tNhanVien nv on nv.STKNhan = l.STKNhan join tChiTietNV ctnv on ctnv.CCCD = nv.CCCD join tPhuCap pc on pc.MaCV = l.MaCV
	where GioiTinh = 'Nam')
	
--16 Tìm mã phòng ban có nhân viên học Thạc sĩ > 3
	select MaPB
	from (select MaPB,count(MaNV) as SL
	from tNhanVien nv join tTrinhDo td on td.MaTD = nv.MaTD
	where TrinhDoHocVan = N'Thạc Sĩ'
	group by MaPB
	having count(MaNV) > 3) a
	

--2 câu lệnh insert có điều kiện
--17. Insert thông tin về ứng viên Nguyễn Văn A 26 tuổi chuyên môn Kỹ Thuật Viên nếu không có số điện thoại nào là 89534743
	insert into tUngVien
	select '89534743',26,N'Nguyễn Văn A',N'Kỹ Thuật Viên'
	where not exists (select * from tUngVien)

--18.Insert thông tin về hợp đồng của một ứng viên bất kì chưa được tạo hợp đồng nếu có 3 năm với mã hợp đồng là 4235 
	insert into tHopDongLaoDong
	values('4325',null,3,(select top 1 SoDTUV
	from tUngVien
	where SoDTUV not in (select uv.SoDTUV
	from tHopDongLaoDong hd join tUngVien uv on uv.SoDTUV = hd.SoDTUV)))

--2 câu delete có điều kiện
--19. Xóa hợp đồng của ứng viên cố chuyên môn kỹ thuật viên
	delete from tHopDongLaoDong
	where SoDTUV in (select SoDTUV
	from tUngVien 
	where ChuyenMon = N'Kỹ Thuật Viên')

--20. Xóa thông tin ứng viên của những ứng viên không được tạo hợp đồng
	delete from tUngVien
	where SoDTUV not in(select SoDTUV
	from tHopDongLaoDong)



--Mỗi trình độ tính lương
select MaTD,sum(ThucLanh) as TongTien
from tLuong l join tNhanVien nv on l.STKNhan = nv.STKNhan 
group by(MaTD)

--Mỗi trình độ ngoại ngữ tính lương
select TrinhDoNgoaiNgu,sum(ThucLanh) as TongTien
from tLuong l join tNhanVien nv on l.STKNhan = nv.STKNhan join tTrinhDo td on td.MaTD = nv.MaTD
group by (TrinhDoNgoaiNgu)

--Mỗi trình độ học vấn tính lương
select TrinhDoHocVan,sum(ThucLanh) as TongTien
from tLuong l join tNhanVien nv on l.STKNhan = nv.STKNhan join tTrinhDo td on td.MaTD = nv.MaTD
group by (TrinhDoHocVan)

	
