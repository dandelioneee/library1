create table book
(
    id          bigint auto_increment comment 'id'
        primary key,
    isbn        varchar(255)   not null comment '图书编号',
    name        varchar(255)   null comment '名称',
    price       decimal(10, 2) null comment '价格',
    author      varchar(255)   null comment '作者',
    publisher   varchar(255)   null comment '出版社',
    create_time date           null comment '出版时间',
    status      varchar(1)     not null comment '0：未归还 1：已归还',
    borrownum   int            not null comment '此书被借阅次数'
)
    collate = utf8mb4_unicode_ci
    row_format = DYNAMIC;

INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (9, '12341541321', 'ow从入门到超神', 15.00, '廖峻新', '广东财经大学出版社', '2024-03-26', '1', 14);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (10, '2312315132131', '篮球进阶教学', 99.00, '梁永乐', '广东财经大学出版社', '2024-03-26', '1', 7);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (11, '25213121232', '如何成为瓦洛兰特高手', 88.00, '雷袁', '广东财经大学出版社', '2024-03-26', '1', 9);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (12, '3213123123', '提瓦特大陆的不解之谜', 77.00, '林伟锐', '广东财经大学出版社', '2024-03-26', '0', 12);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (13, '345621212321', 'Java高手的爱好', 66.00, '刘超伟', '广东财经大学出版社', '2024-03-26', '0', 12);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (15, '54112312321', '从成为赛马娘高手开始编程', 55.00, '梁志健', '广东财经大学出版社', '2024-03-26', '0', 2);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (16, '1234554321', '计算机组成原理', 9999.00, '全民制作人', '广东财经大学出版社', '2024-03-26', '1', 1);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (17, '1234567890', 'Java圣经', 0.00, '土木工程', '广东财经大学出版社', '2024-03-26', '1', 3);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (18, '11111111111', '操作系统', null, '信息学院', '广东财经大学出版社', '2024-03-26', '1', 1);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (19, '22222222222', '数据结构', null, '罗勇', '广东财经大学出版社', '2024-03-26', '0', 2);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (20, '33333333333', '算法设计与分析', null, '冯俊健', '广东财经大学出版社', '2024-03-26', '1', 0);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (21, '4444444444', '零基础速通原神保姆教程（上）', 666.00, '峻哥', '提瓦特大陆出版社', '2024-03-26', '1', 0);
INSERT INTO lib.book (id, isbn, name, price, author, publisher, create_time, status, borrownum) VALUES (22, '55555555555', '计算机导论', null, '杨创新', '广东财经大学出版社', '2024-03-26', '1', 0);
