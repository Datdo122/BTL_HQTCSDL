CREATE DATABASE BTL_CSDL
use BTL_CSDL

admin(name, pass)(có thể nhiều account)
duy nhất
->truy cập quyền cấp cao

create table users(
	id int identity(1,1) primary key,
	fullname
	diachi
	email
	namsinh
	sdt
	...
	...
)->thanh toán(xem menu, thêm khách hàng), xem đơn trong ngày, doanh thu trong ca

customer(id, name, sdt, points) /// thêm vào khi thanh toán, admin form sửa khách hàng(vd tên, sdt)

create table ban(
	id int identity(1,1) primary key,
	tablename nvarchar(10), // 
	tablestatus nvarchar(255) // trống, có ng ngồi
)

create table nguyenlieu(
	id int identity(1,1) primary key,
	ten nvarchar(50),
	slton int,
	gianhap int
)
create table chi(
	idphieuchi
	idnguyenlieu -- nhập từng cái một ? 
	tien -- mua hết bao nhiêu
	note -- chi làm gì, 
	date -- chi ngày bao nhiêu
	idnhanvien -- ng đi mua
	1, nhập phiếu chi-> + nguyên liệu
	2, phiếu nhập nguyên liệu ->
)

create table danhmuc_menu(
	id int identity(1,1) primary key,
	tendanhmuc nvarchar(20) -- cà phê, nước ép ???
)
create table menu(
	id int identity(1,1) primary key,
	tenmon nvarchar(50),
	dongia int,
	chitietmon text
	iddanhmuc//////////////
)

order lấy từ menu (tên món, số lượng)

order - thanh toán luôn -> thanhtoan

create table thanhtoan( ->in bill
	id int identity(1,1) primary key,
	customername nvarchar(50),
	tableid,.....
	ngay date(getdate)
	danh sach mon(soluong)/ don gia,
	phuongthucthanhtoan ,
	thanhtien,
	voucher,
	0 1 (mang ve, ko mang ve)//////////////
)



create table doanhthu(filter theo ngay, thang, nam) (*ko chia ca*)
	id->thanhtoan    
	doanhthu(tu ngay xyz den xzy) = sum(thanhtien) ====>dgv(ngay, tongtien)

	date để làm gì? -> 

	doanh thu chỉ có cột ngày và tổng tiền th /// thu - chi

	vd: 24/12 thu xxxx chi xzzzz 
	doanh thu = thu - chi;

	1/1 -> 31/12

	1/1 -> 30 đơn
	chi tiết đơn nnao /// tên kh, sl món, món gì , giá từng món
	tổng món

	=>thanhtoan



	ngày , tháng, năm


	
)

admin: bao gồm quyền user, chỉnh menu, ...


/// lương : -ca làm
			-tiền phạt
			- làm ot(8 tiếng +)
create table lương( //từng nhân viên một, theo ngày
	idnhanvien
	date // làm vào ngày nào
	lương(20k, 25k,...)-- nhân viên table
	hệ số lương( làm bnh giờ)
	trừ tiền?

	nếu ko ca làm -> làm từ bnh giờ -> bnh giờ
	or làm 8 tiếng

	-- lương theo tháng, ko cố định, ko ràng buộc?
	-- count của nhân viên, từ ngày x đến ngày y
	count(date) (nhân viên làm bnh ngày)
	từng ngày một, làm bnh tiếng (select(select))
	lương chưa phạt - phạt   

	ngày  lương  phạt
	1	 100k
	2	 200k
	3	 300k
	4	 0k
	5	 100k	40k

	-> đi làm 4 ngày

)


/// có nên thêm 1 table lương cho admin xem ko????

-- menu: thêm sửa xóa
order-> nhân viên order, 
admin, chủ, quản lý

quản lý 100%
nhân viên? order




