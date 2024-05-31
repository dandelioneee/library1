create table bookwithuser
(
    id        bigint       not null comment '读者id',
    isbn      varchar(255) null comment '图书编号',
    book_name varchar(255) not null comment '图书名'
        primary key,
    nick_name varchar(255) null comment '读者姓名',
    lendtime  datetime     null comment '借阅时间',
    deadtime  datetime     null comment '应归还时间',
    prolong   int          null comment '续借次数'
)
    collate = utf8mb4_unicode_ci
    row_format = DYNAMIC;

create index id
    on bookwithuser (id);

INSERT INTO lib.bookwithuser (id, isbn, book_name, nick_name, lendtime, deadtime, prolong) VALUES (19, '345621212321', 'Java高手的爱好', 'liaojunxin', '2024-03-26 21:32:25', '2024-04-25 21:32:25', 1);
INSERT INTO lib.bookwithuser (id, isbn, book_name, nick_name, lendtime, deadtime, prolong) VALUES (20, '54112312321', '从成为赛马娘高手开始编程', 'liangzhijian', '2024-05-27 09:35:50', '2024-06-26 09:35:50', 1);
INSERT INTO lib.bookwithuser (id, isbn, book_name, nick_name, lendtime, deadtime, prolong) VALUES (20, '3213123123', '提瓦特大陆的不解之谜', 'liangzhijian', '2024-05-27 09:36:02', '2024-06-26 09:36:02', 1);
INSERT INTO lib.bookwithuser (id, isbn, book_name, nick_name, lendtime, deadtime, prolong) VALUES (21, '22222222222', '数据结构', 'linweirui', '2024-05-30 16:38:00', '2024-06-29 16:38:00', 1);
