use BTL
CREATE PROCEDURE TinhLuongNhanVien
    @IdNhanVien INT,
    @Thang INT,
    @Nam INT
AS
BEGIN
    DECLARE @LuongCoBan INT, @Thuong INT, @Phat INT, @PhuCap INT, @TongLuong INT, @TongGioLam INT;

    -- Lấy lương cơ bản
    SELECT @LuongCoBan = luongcoban FROM nhanvien WHERE id = @IdNhanVien;

    -- Lấy thông tin thưởng, phạt, phụ cấp
    SELECT @Thuong = ISNULL(thuong, 0), 
           @Phat = ISNULL(phat, 0), 
           @PhuCap = ISNULL(phucap, 0) 
    FROM luong 
    WHERE idnhanvien = @IdNhanVien;

    -- Tính tổng giờ làm
    SELECT @TongGioLam = SUM(DATEDIFF(HOUR, giovao, giora))
    FROM chamcong
    WHERE idnhanvien = @IdNhanVien AND MONTH(ngaylam) = @Thang AND YEAR(ngaylam) = @Nam;

    -- Tính tổng lương
    SET @TongLuong = @LuongCoBan + @Thuong + @PhuCap - @Phat;

    PRINT 'Tổng lương của nhân viên: ' + CAST(@TongLuong AS NVARCHAR);
END;
exec TinhLuongNhanVien @IdNhanVien = 1, @Thang = 12, @Nam = 2024;


--view bang luong cua nhan vien
CREATE VIEW BangLuongChiTiet AS
SELECT 
    nv.id AS IdNhanVien,
    nv.fullname AS TenNhanVien,
    nv.luongcoban AS LuongCoBan,
    ISNULL(l.thuong, 0) AS Thuong,
    ISNULL(l.phat, 0) AS Phat,
    ISNULL(l.phucap, 0) AS PhuCap,
    (nv.luongcoban + ISNULL(l.thuong, 0) + ISNULL(l.phucap, 0) - ISNULL(l.phat, 0)) AS TongLuong
FROM nhanvien nv
LEFT JOIN luong l ON nv.id = l.idnhanvien;
drop view BangLuongChiTiet
