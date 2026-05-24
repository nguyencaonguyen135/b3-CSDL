-- 1. Hiển thị tất cả thông tin của kiến trúc sư "le thanh tung"
SELECT * 
FROM architect 
WHERE name = 'le thanh tung';

-- 2. Hiển thị tên, năm sinh các công nhân có chuyên môn hàn hoặc điện
SELECT name, birthday 
FROM worker 
WHERE skill = 'han' OR skill = 'dien';

-- 3. Hiển thị tên các công nhân có chuyên môn hàn hoặc điện và năm sinh lớn hơn 1948
SELECT name 
FROM worker 
WHERE (skill = 'han' OR skill = 'dien') AND birthday > 1948;

-- 4. Hiển thị những công nhân bắt đầu vào nghề khi dưới 20 (birthday + 20 > year)
SELECT * 
FROM worker 
WHERE birthday + 20 > year;

-- 5. Hiển thị những công nhân có năm sinh 1945, 1940, 1948 (Bằng 2 cách)
-- Cách 1: Dùng toán tử OR
SELECT * FROM worker WHERE birthday = 1945 OR birthday = 1940 OR birthday = 1948;
-- Cách 2: Dùng toán tử IN
SELECT * FROM worker WHERE birthday IN (1945, 1940, 1948);

-- 6. Tìm những công trình có chi phí đầu tư từ 200 đến 500 triệu đồng (Bằng 2 cách)
-- Cách 1: Dùng toán tử so sánh >= và <=
SELECT * FROM building WHERE cost >= 200 AND cost <= 500;
-- Cách 2: Dùng toán tử BETWEEN
SELECT * FROM building WHERE cost BETWEEN 200 AND 500;

-- 7. Tìm kiếm những kiến trúc sư có họ là nguyen
SELECT * FROM architect WHERE name LIKE 'nguyen%';

-- 8. Tìm kiếm những kiến trúc sư có tên đệm là anh
-- Vì tên đệm nằm ở giữa họ và tên nên ta bọc chữ 'anh' bằng hai khoảng trắng ' anh '
SELECT * FROM architect WHERE name LIKE '% anh %';

-- 9. Tìm kiếm những kiến trúc sư có tên bắt đầu th và có 3 ký tự
SELECT * FROM architect WHERE name LIKE '% th_';

-- 10. Tìm chủ thầu không có phone
SELECT * FROM contractor WHERE phone IS NULL OR phone = '';