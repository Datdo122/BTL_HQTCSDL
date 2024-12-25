CREATE DATABASE BTL
USE BTL

CREATE TABLE admin(
	id int identity(1,1) primary key,
	username nvarchar(50),
	password nvarchar(255)
)

CREATE TABLE nhanvien(
	id int identity(1,1) primary key,
	fullname nvarchar(50),
	namsinh int,
	diachi nvarchar(200),
	sdt nvarchar(10),
	luongcoban int --cân nhắc để vào nhanvien hay ko ?
)

CREATE TABLE customer(
	id int identity(1,1) primary key,
	name nvarchar(20),
	sdt nvarchar(10),
	diemtichluy int
)

CREATE TABLE ban( -- bàn
	id int identity(1,1) primary key,
	ten nvarchar(50), --tên bàn
	tinhtrang bit -- bàn trống or ko 1 là trống 0 là có ng
)

CREATE TABLE nguyenlieu(
	id int identity(1,1) primary key,
	ten nvarchar(50), -- tên nguyên liệu
	slton int, -- tồn bao nhiêu( quy chung 1 đơn vị đo)
	gianhap int -- giá nhập vào
)

CREATE TABLE chi( -- danh mục chi
	id int identity(1,1) primary key,
	idnguyenlieu int,
	idnhanvien int,
	tienchi int, -- chi hết bao nhiêu
	ghichu nvarchar(200), -- chi mua cái gì, làm gì
	ngaychi date,
	foreign key (idnguyenlieu) references nguyenlieu(id),
	foreign key (idnhanvien) references nhanvien(id)
)

CREATE TABLE danhmuc_menu(
	id int identity(1,1) primary key,
	tendanhmuc nvarchar(20),
)

CREATE TABLE menu(
	id int identity(1,1) primary key,
	tenmon nvarchar(20),
	dongia int,
	iddanhmuc int,
	foreign key (iddanhmuc) references danhmuc_menu(id)
)

CREATE TABLE bill(
	id int identity(1,1) primary key,
	idmon int foreign key references menu(id),
	soluong int default 1,
	tongtien int
)

CREATE TABLE thanhtoan(
	id int identity(1,1) primary key,
	customername nvarchar(50),
	tableid int,
	ngaythanhtoan date,
	phuongthucthanhtoan nvarchar(20),
	thanhtien int,
	giamgia int
)

CREATE TABLE luong(
	idnhanvien int,
	thuong int,
	phat int,
	phucap int,
	foreign key (idnhanvien) references nhanvien(id)
)

CREATE TABLE chamcong(
	id int identity(1,1) primary key,
	idnhanvien int foreign key references nhanvien(id),
	ngaylam date,
	giovao time,
	giora time
)

CREATE TABLE doanhthu(
	id int identity(1,1) primary key,
	idthu int foreign key references thanhtoan(id),
	idchi int foreign key references chi(id)
)

-- Thêm dữ liệu mẫu cho bảng admin
INSERT INTO admin (username, password) VALUES
('admin', 'admin')


-- Thêm dữ liệu mẫu cho bảng nhanvien
INSERT INTO nhanvien (fullname, namsinh, diachi, sdt, luongcoban) VALUES
('Nguyen Van A', 1985, 'Hanoi', '0123456789', 20000),
('Tran Thi B', 1990, 'HCM City', '0987654321', 25000),
('Le Van C', 1995, 'Danang', '0912345678', 10000),
('Pham Thi D', 1988, 'Hue', '0908765432', 14000),
('Hoang Van E', 1992, 'Haiphong', '0934567890', 6000);

-- Thêm dữ liệu mẫu cho bảng customer
INSERT INTO customer (name, sdt, diemtichluy) VALUES
(N'Trần Tiến Đạt', '0832182014', 100),
(N'Đinh Quang Đạt', '0868318883', 0),
(N'Nguyễn Thành Đồng', '0971548175', 150),
(N'Đỗ Văn Đạt', '0971386410', 250),
(N'Bùi Khắc Huy', '0837607568', 1000);

-- Thêm dữ liệu mẫu cho bảng ban
INSERT INTO ban (ten, tinhtrang) VALUES
('Ban 1', 1),
('Ban 2', 1),
('Ban 3', 1),
('Ban 4', 1),
('Ban 5', 1);

-- Thêm dữ liệu mẫu cho bảng nguyenlieu
INSERT INTO nguyenlieu (ten, slton, gianhap) VALUES
(N'Cà phê', 100, 10000),
(N'Quả cam', 200, 15000),
(N'Xoài', 300, 20000),
(N'Mít', 400, 25000),
(N'Sầu riêng', 500, 30000);

-- Thêm dữ liệu mẫu cho bảng chi
INSERT INTO chi (idnguyenlieu, idnhanvien, tienchi, ghichu, ngaychi) VALUES
(1, 1, 100000, N'mua Cà phê', '2024-01-01'),
(2, 2, 150000, N'mua Quả cam', '2024-01-02'),
(3, 3, 200000, N'mua Xoài', '2024-01-03'),
(4, 4, 250000, N'mua Sầu riêng', '2024-01-04'),
(5, 5, 300000, N'mua Mít', '2024-01-05');

-- Thêm dữ liệu mẫu cho bảng danhmuc_menu
INSERT INTO danhmuc_menu (tendanhmuc) VALUES
('Cafe'),
('Nước ép'),
('Sinh tố'),
('Sữa chua'),
('Trà');

-- Thêm dữ liệu mẫu cho bảng menu
INSERT INTO menu (tenmon, dongia, iddanhmuc) VALUES
(N'Trà sầu riêng', 50000, 1),
(N'Sinh tố rau má', 60000, 2),
(N'Mít dầm sữa chua', 70000, 3),
(N'Nước cam kẹp nách', 80000, 4),
(N'Nước ép cà phê', 90000, 5);

-- Thêm dữ liệu mẫu cho bảng bill
INSERT INTO bill (idmon, soluong, tongtien) VALUES
(1, 2, 100000),
(2, 3, 180000),
(3, 1, 70000),
(4, 4, 320000),
(5, 2, 180000);

-- Thêm dữ liệu mẫu cho bảng thanhtoan
INSERT INTO thanhtoan (customername, tableid, ngaythanhtoan, phuongthucthanhtoan, thanhtien, giamgia) VALUES
(N'Trần Tiến Đạt', 1, '2024-01-01', 'Cash', 100000, 5000),
(N'Đinh Quang Đạt', 2, '2024-01-02', 'Card', 200000, 10000),
(N'Nguyễn Thành Đồng', 3, '2024-01-03', 'Cash', 150000, 7500),
((N'Đỗ Văn Đạt', 4, '2024-01-04', 'Card', 250000, 12500),
(N'Bùi Khắc Huy', 5, '2024-01-05', 'Cash', 300000, 15000);

-- Thêm dữ liệu mẫu cho bảng luong
INSERT INTO luong (idnhanvien, thuong, phat, phucap) VALUES
(1, 500000, 0, 200000),
(2, 300000, 50000, 150000),
(3, 400000, 100000, 100000),
(4, 200000, 0, 250000),
(5, 350000, 50000, 300000);

-- Thêm dữ liệu mẫu cho bảng chamcong
INSERT INTO chamcong (idnhanvien, ngaylam, giovao, giora) VALUES
(1, '2024-01-01', '08:00:00', '17:00:00'),
(2, '2024-01-02', '08:30:00', '17:30:00'),
(3, '2024-01-03', '09:00:00', '18:00:00'),
(4, '2024-01-04', '08:00:00', '17:00:00'),
(5, '2024-01-05', '09:00:00', '18:00:00');

