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
-- loi o day ne, sua di
	 
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


-- Thêm dữ liệu mẫu cho bảng admin
INSERT INTO admin (username, password) VALUES
('admin', 'admin')


-- Thêm dữ liệu mẫu cho bảng nhanvien
INSERT INTO nhanvien (fullname, namsinh, diachi, sdt, luongcoban) VALUES
('Nguyen Van A', 1985, 'Hanoi', '0123456789', 5000000),
('Tran Thi B', 1990, 'HCM City', '0987654321', 6000000),
('Le Van C', 1995, 'Danang', '0912345678', 5500000),
('Pham Thi D', 1988, 'Hue', '0908765432', 5800000),
('Hoang Van E', 1992, 'Haiphong', '0934567890', 6200000);

-- Thêm dữ liệu mẫu cho bảng customer
INSERT INTO customer (name, sdt, diemtichluy) VALUES
('Customer A', '0901234567', 100),
('Customer B', '0912345678', 200),
('Customer C', '0923456789', 150),
('Customer D', '0934567890', 250),
('Customer E', '0945678901', 300);

-- Thêm dữ liệu mẫu cho bảng ban
INSERT INTO ban (ten, tinhtrang) VALUES
('Ban 1', 1),
('Ban 2', 1),
('Ban 3', 1),
('Ban 4', 1),
('Ban 5', 1);

-- Thêm dữ liệu mẫu cho bảng nguyenlieu
INSERT INTO nguyenlieu (ten, slton, gianhap) VALUES
('Nguyen Lieu 1', 100, 10000),
('Nguyen Lieu 2', 200, 15000),
('Nguyen Lieu 3', 300, 20000),
('Nguyen Lieu 4', 400, 25000),
('Nguyen Lieu 5', 500, 30000);

-- Thêm dữ liệu mẫu cho bảng chi
INSERT INTO chi (idnguyenlieu, idnhanvien, tienchi, ghichu, ngaychi) VALUES
(1, 1, 100000, 'Mua Nguyen Lieu 1', '2024-01-01'),
(2, 2, 150000, 'Mua Nguyen Lieu 2', '2024-01-02'),
(3, 3, 200000, 'Mua Nguyen Lieu 3', '2024-01-03'),
(4, 4, 250000, 'Mua Nguyen Lieu 4', '2024-01-04'),
(5, 5, 300000, 'Mua Nguyen Lieu 5', '2024-01-05');

-- Thêm dữ liệu mẫu cho bảng danhmuc_menu
INSERT INTO danhmuc_menu (tendanhmuc) VALUES
('Danh Muc 1'),
('Danh Muc 2'),
('Danh Muc 3'),
('Danh Muc 4'),
('Danh Muc 5');

-- Thêm dữ liệu mẫu cho bảng menu
INSERT INTO menu (tenmon, dongia, iddanhmuc) VALUES
('Mon 1', 50000, 1),
('Mon 2', 60000, 2),
('Mon 3', 70000, 3),
('Mon 4', 80000, 4),
('Mon 5', 90000, 5);

-- Thêm dữ liệu mẫu cho bảng bill
INSERT INTO bill (idmon, soluong, tongtien) VALUES
(1, 2, 100000),
(2, 3, 180000),
(3, 1, 70000),
(4, 4, 320000),
(5, 2, 180000);

-- Thêm dữ liệu mẫu cho bảng thanhtoan
INSERT INTO thanhtoan (customername, tableid, ngaythanhtoan, phuongthucthanhtoan, thanhtien, giamgia) VALUES
('Customer A', 1, '2024-01-01', 'Cash', 100000, 5000),
('Customer B', 2, '2024-01-02', 'Card', 200000, 10000),
('Customer C', 3, '2024-01-03', 'Cash', 150000, 7500),
('Customer D', 4, '2024-01-04', 'Card', 250000, 12500),
('Customer E', 5, '2024-01-05', 'Cash', 300000, 15000);

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
