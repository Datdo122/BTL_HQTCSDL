use BTL

----------------------
-----------------------
-- insert thêm
INSERT INTO nguyenlieu (ten, slton, gianhap, ngaynhap) VALUES
(N'Cafe Robusta', 50, 45000, '2024-12-24'),
(N'Cafe Arabica', 30, 60000, '2024-08-05'),
(N'Ðuờng kính', 100, 10000, '2024-08-10'),
(N'Sữa tuoi Vinamilk', 70, 25000, '2024-08-12'),
(N'Sữa đặc Ông Thọ', 40, 20000, '2024-08-15'),
(N'Kem tuoi Whipping', 20, 30000, '2024-08-18'),
(N'Bột cacao', 15, 35000, '2024-08-20'),
(N'Syrup đường mía', 60, 18000, '2024-08-22'),
(N'Chanh tươi', 80, 5000, '2024-08-25'),
(N'Ðá viên', 200, 2000, '2024-08-28');





-- view1: hiển thị danh sách nguyên liệu còn ít
CREATE VIEW view1 AS
SELECT
    id,
    ten,
    slton,
    gianhap
FROM
    nguyenlieu
WHERE
    slton < 10; -- Ngưỡng số lượng tồn
select * from view1

-- proc1: tra cứu nhập nguyên liệu trong khoảng thời gian cụ thể
CREATE PROCEDURE proc1 (
    @StartDate DATETIME,
    @EndDate DATETIME
)
AS
BEGIN
    SELECT
        id,
        ten,
        slton,
        gianhap,
        ngaynhap
    FROM
        nguyenlieu
    WHERE
        ngaynhap BETWEEN @StartDate AND @EndDate;
END;
GO 

EXEC proc1 '20240801', '20240815';
EXEC proc1 '20240810', '20240831';
