CREATE DATABASE IF NOT EXISTS quan_ly_cong_trinh;
USE quan_ly_cong_trinh;

CREATE TABLE architect (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    birthday INT(4),
    sex TINYINT(1) DEFAULT 0 COMMENT '1: Nam - 0: Nữ',
    place VARCHAR(255),
    address VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO architect (id, name, birthday, sex, place, address) VALUES
(1, 'le thanh tung', 1956, 1, 'tp hcm', '25 duong 3/2 tp bien hoa'),
(2, 'le kim dung', 1952, 0, 'ha noi', '18/5 phan van tri tp can tho'),
(3, 'nguyen anh thu', 1970, 0, 'new york', 'khu 2 dhct tp can tho'),
(4, 'nguyen song do quyen', 1970, 0, 'can tho', '73 tran hung dao tp hcm'),
(5, 'truong minh thai', 1950, 1, 'paris france', '12/2/5 tran phu tp hanoi');


CREATE TABLE contractor (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    phone VARCHAR(45),
    address VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO contractor (id, name, phone, address) VALUES
(1, 'cty xd so 6', '567456', '5 phan chu trinh'),
(2, 'phong dich vu so xd', '206481', '2 le van sy'),
(3, 'le van son', '028374', '12 tran nhan ton'),
(4, 'tran khai hoan', '658432', '20 nguyen thai hoc');



CREATE TABLE `host` (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    address VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO host (id, name, address) VALUES
(1, 'so t mai du lich', '54 xo viet nghe tinh'),
(2, 'so van hoa thong tin', '101 hai ba trung'),
(3, 'so giao duc', '29 duong 3/2'),
(4, 'dai hoc can tho', '56 duong 30/4'),
(5, 'cty bitis', '29 phan dinh phung'),
(6, 'nguyen thanh ha', '45 de tham'),
(7, 'phan thanh liem', '48/6 huynh thuc khan');



CREATE TABLE building (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    cost FLOAT,
    start DATE,
    host_id INT NOT NULL,
    contractor_id INT NOT NULL,
    PRIMARY KEY (id),

    FOREIGN KEY (host_id) REFERENCES host(id),
    FOREIGN KEY (contractor_id) REFERENCES contractor(id)
);

INSERT INTO building (id, name, address, city, cost, start, host_id, contractor_id) VALUES
(1, 'khach san quoc te', '5 nguyen an ninh', 'can tho', 450, '1994-12-13', 1, 1),
(2, 'cong vien thieu nhi', '100 nguyen thai hoc', 'can tho', 200, '1994-05-08', 2, 1),
(3, 'hoi cho nong nghiep', 'bai cat', 'vinh long', 1000, '1994-06-10', 1, 1),
(4, 'truong mg mang non', '48 cm thang 8', 'can tho', 30, '1994-07-10', 3, 3),
(5, 'khoa trong trot dhct', 'khu ii dhct', 'can tho', 3000, '1994-06-19', 4, 3),
(6, 'van phong bitis', '25 phan dinh phung', 'ha noi', 40, '1994-05-10', 5, 3),
(7, 'nha rieng 1', '124/5 nguyen trai', 'tp hcm', 65, '1994-11-15', 6, 2),
(8, 'nha rieng 2', '76 chau van liem', 'ha noi', 200, '1994-06-09', 7, 4);



CREATE TABLE worker (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    birthday INT(4),
    year INT(4),
    skill VARCHAR(45),
    PRIMARY KEY (id)
);

INSERT INTO worker (id, name, birthday, year, skill) VALUES
(1, 'nguyen thi suu', 1945, 1960, 'ho'),
(2, 'vi chi a', 1966, 1987, 'moc'),
(3, 'le manh quoc', 1956, 1971, 'son'),
(4, 'vo van chin', 1940, 1952, 'dien'),
(5, 'le quyet thang', 1954, 1974, 'han'),
(6, 'nguyen hong van', 1950, 1970, 'dien'),
(7, 'dang van son', 1948, 1965, 'dien');


CREATE TABLE design (
    building_id INT NOT NULL,
    architect_id INT NOT NULL,
    benefit FLOAT,
    PRIMARY KEY (building_id, architect_id),
    FOREIGN KEY (building_id) REFERENCES building(id),
    FOREIGN KEY (architect_id) REFERENCES architect(id)
);

INSERT INTO design (building_id, architect_id, benefit) VALUES
(1, 1, 25),
(1, 5, 12),
(2, 4, 6),
(3, 3, 12),
(4, 2, 20),
(5, 5, 30),
(6, 2, 40),
(6, 5, 27),
(7, 1, 10),
(8, 2, 18);


CREATE TABLE work (
    building_id INT NOT NULL,
    worker_id INT NOT NULL,
    date DATE,
    total INT(4),
    PRIMARY KEY (building_id, worker_id),
    FOREIGN KEY (building_id) REFERENCES building(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

INSERT INTO work (building_id, worker_id, date, total) VALUES
(1, 1, '1994-12-15', 5),
(1, 3, '1994-12-18', 6),
(1, 6, '1994-09-14', 7),
(2, 1, '1994-05-08', 20),
(2, 4, '1994-05-10', 10),
(2, 5, '1994-12-16', 5),
(3, 4, '1994-10-06', 10),
(3, 7, '1994-10-06', 18),
(4, 1, '1994-09-07', 20),
(4, 6, '1994-05-12', 7);

-- 1. Liên kết bảng CÔNG TRÌNH (building) với bảng CHỦ THẦU (contractor)
ALTER TABLE building
ADD CONSTRAINT fk_building_contractor
FOREIGN KEY (contractor_id) REFERENCES contractor(id);

-- 2. Liên kết bảng CÔNG TRÌNH (building) với bảng KIẾN TRÚC SƯ (architect)
ALTER TABLE building
ADD CONSTRAINT fk_building_architect
FOREIGN KEY (architect_id) REFERENCES architect(id);

-- 3. Liên kết bảng TRUNG GIAN THIẾT KẾ (design) tới bảng KIẾN TRÚC SƯ (architect)
ALTER TABLE design
ADD CONSTRAINT fk_design_architect
FOREIGN KEY (architect_id) REFERENCES architect(id);

-- 4. Liên kết bảng TRUNG GIAN THIẾT KẾ (design) tới bảng CÔNG TRÌNH (building)
ALTER TABLE design
ADD CONSTRAINT fk_design_building
FOREIGN KEY (building_id) REFERENCES building(id);

-- 5. Liên kết bảng CHẤM CÔNG (work) tới bảng CÔNG NHÂN (worker)
ALTER TABLE work
ADD CONSTRAINT fk_work_worker
FOREIGN KEY (worker_id) REFERENCES worker(id);

-- 6. Liên kết bảng CHẤM CÔNG (work) tới bảng CÔNG TRÌNH (building)
ALTER TABLE work
ADD CONSTRAINT fk_work_building
FOREIGN KEY (building_id) REFERENCES building(id);
