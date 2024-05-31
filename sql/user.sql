create table user
(
    id        bigint auto_increment comment 'ID'
        primary key,
    username  varchar(255) null comment '用户名',
    password  varchar(255) null comment '密码',
    nick_name varchar(255) null comment '姓名',
    phone     varchar(255) null comment '电话号码',
    sex       varchar(255) null comment '性别',
    address   varchar(255) null comment '地址',
    role      int          not null comment '角色、1：管理员 2：普通用户'
)
    comment '用户信息表' collate = utf8mb4_unicode_ci
                         row_format = DYNAMIC;

INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (19, 'liaojunxin', '123456', '廖峻新', '12345678901', '男', '广东财经大学', 2);
INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (20, 'liangzhijian', '123456', '梁志健', '13456789002', '男', '广东财经大学', 2);
INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (21, 'linweirui', '123456', '林伟锐', '13456789003', '男', '广东财经大学', 2);
INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (22, 'liuchaowei', '123456', '刘超伟', null, null, '广东财经大学', 2);
INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (23, 'leiyuan', '123456', '雷袁', null, null, '广东财经大学', 2);
INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (24, 'liangyonle', '123456', '梁永乐', null, null, '广东财经大学', 2);
INSERT INTO lib.user (id, username, password, nick_name, phone, sex, address, role) VALUES (25, 'admin', '123456', '管理员', null, null, '广东财经大学', 1);
