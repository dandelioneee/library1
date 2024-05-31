create table lend_record
(
    reader_id   bigint       not null comment '读者id',
    isbn        varchar(255) not null comment '图书编号',
    bookname    varchar(255) null comment '图书名',
    lend_time   datetime     null comment '借书日期',
    return_time datetime     null comment '还书日期',
    status      varchar(1)   null comment '0：未归还 1：已归还',
    borrownum   int          not null comment '此书被借阅次数'
)
    collate = utf8mb4_unicode_ci
    row_format = DYNAMIC;

INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '12341541321', 'ow从入门到超神', '2024-03-26 21:26:50', '2024-03-26 21:27:12', '1', 14);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '2312315132131', '篮球进阶教学', '2024-03-26 21:26:51', '2024-03-26 21:27:14', '1', 7);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '25213121232', '如何成为瓦洛兰特高手', '2024-03-26 21:26:51', '2024-03-26 21:27:16', '1', 7);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '3213123123', '提瓦特大陆的不解之谜', '2024-03-26 21:26:52', '2024-03-26 21:27:17', '1', 10);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '345621212321', 'Java高手的爱好', '2024-03-26 21:26:52', '2024-03-26 21:27:19', '1', 11);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '54112312321', '从成为赛马娘高手开始编程', '2024-03-26 21:27:20', '2024-03-26 21:27:24', '1', 4);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '1234554321', '计算机组成原理', '2024-03-26 21:27:21', '2024-03-26 21:27:25', '1', 3);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '1234567890', 'Java圣经', '2024-03-26 21:27:21', '2024-03-26 21:27:26', '1', 1);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '11111111111', '操作系统', '2024-03-26 21:27:22', '2024-03-26 21:27:28', '1', 1);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '22222222222', '数据结构', '2024-03-26 21:27:22', '2024-03-26 21:27:29', '1', 1);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '1234567890', 'Java圣经', '2024-03-26 21:27:38', '2024-04-27 13:25:03', '1', 2);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (19, '345621212321', 'Java高手的爱好', '2024-03-26 21:32:25', null, '0', 12);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (23, '25213121232', '如何成为瓦洛兰特高手', '2024-03-26 22:08:30', null, '0', 8);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '3213123123', '提瓦特大陆的不解之谜', '2024-04-27 13:25:15', '2024-04-27 13:25:36', '1', 11);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (20, '54112312321', '从成为赛马娘高手开始编程', '2024-05-27 09:35:50', null, '0', 2);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (20, '3213123123', '提瓦特大陆的不解之谜', '2024-05-27 09:36:02', null, '0', 12);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '25213121232', '如何成为瓦洛兰特高手', '2024-05-27 20:25:27', '2024-05-30 16:38:17', '1', 9);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (20, '1234567890', 'Java圣经', '2024-05-30 16:36:53', '2024-05-30 17:09:31', '1', 3);
INSERT INTO lib.lend_record (reader_id, isbn, bookname, lend_time, return_time, status, borrownum) VALUES (21, '22222222222', '数据结构', '2024-05-30 16:38:00', null, '0', 2);
