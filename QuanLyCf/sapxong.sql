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
	sdt nvarchar(10)
	luong int --cân nhắc để vào nhanvien hay ko ?
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
	tinhtrang bit -- bàn trống or ko 
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
	noidung text, -- ghi mô tả về danh mục(cân nhắc thêm vào hay ko)
)

CREATE TABLE menu(
	id int identity(1,1) primary key,
	tenmon nvarchar(20),
	dongia int,
	iddanhmuc int,
	foreign key (iddanhmuc) references danhmuc_menu(id)
)

CREATE TABLE thanhtoan(
	id int identity(1,1) primary key,
	customername nvarchar(50),
	tableid int,
	--danh sách món chưa rõ cách tạo
	ngaythanhtoan date,
	phuongthucthanhtoan nvarchar(20),
	thanhtien int,
	giamgia int
)

CREATE TABLE doanhthu( 
	idthanhtoan int,
	foreign key (idthanhtoan) references thanhtoan(id)
)

CREATE TABLE luong( --lương
	idnhanvien int,
	foreign key (idnhanvien) references nhanvien(id)
)