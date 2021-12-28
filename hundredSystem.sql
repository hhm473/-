drop database if exists hundredSystem;
create database hundredSystem;
use hundredSystem;
# 创建数据库
-- 用户表
create table `user` (
        -- 主键
        id bigint auto_increment,
        -- 证件类型
        label int,
        -- 身份证号
        card_id varchar(40),
        -- 姓名
        name varchar(64),
        -- 手机号
        phone_number varchar(30),
        -- 密码
        password varchar(100),
        -- 是否为管理员
        isAdmin boolean,
        primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 提交的作者信息表
create table `author_info` (
        -- 主键
        id bigint auto_increment,
        -- 申报方式
        mode boolean,
        -- 榜样名称
        work_name varchar(100),
        -- 作者姓名
        author_name varchar(100),
        -- 证件类型
        card_type int,
        -- 证件号（加上性别）
        card_id varchar(100),
        -- 手机号
        phone_number varchar(100),
        -- 邮箱
        email varchar(64),
        -- 头像
        avatar varchar(255),
        -- 推荐组织（工作单位）
        group_name varchar(255),
        -- 组织类型（单位类型）
        group_tpye int,
        -- 组织所在地（工作地区）
        group_location varchar(255),
        -- 组织联系电话（区号）
        group_phone1 long,
        -- 组织联系电话（电话号）
        group_phone2 long,
        -- 组织联系电话（分机号）
        group_phone3 long,
        -- 联系地址
        connect_location varchar(255),
        -- 联系地址（详细）
        connect_location_detail varchar(255),
        -- 紧急联系人电话
        connect_phone varchar(64),
        primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 提交的作品信息表
create table `work_info` (
        -- 主键
        id bigint auto_increment,
        -- 推荐类别
        type int,
        -- 作品标题
        title varchar(255),
        -- 作品链接 (事迹相关链接)
        link varchar(255),
        -- 作品相关链接(多)
        connect_link varchar(255),
        -- 作品截图 （活动截图&作品内容）
        picture varchar(255),
        -- 作品上传(视频)
        work varchar(255),
        -- 首发平台
        platform varchar(100),
        -- 作者简介 （主要网络事迹）
        auth_abstract longtext,
        -- 作品简介
        work_abstract longtext,
        -- 社会效果（作品影响）
        influence longtext,
        -- 单位意见
        opinion longtext,
        primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 作品表
create table report (
    -- 主键
    id bigint auto_increment,
    -- 类型
    type int(5),
    -- 用户
    user_id bigint ,
    -- 作者信息id
    a_info_id bigint,
    -- 作品信息id
    w_info_id bigint,
    -- 标题（作品名称）
    title1 varchar(255),
    -- 标题（榜样名称）
    title2 varchar(255),
    -- 创建时间
    birth_date date,
    -- 最后一次编辑时间
    last_motifyed date,
    -- 身份证正面
    card1 varchar(255),
    -- 身份证背面
    card2 varchar(255),
    -- 盖章推荐表
    g_table varchar(255),
    -- 当前状态 ->草稿，待审核，审核通过
    state int(3),
    primary key (id),
    foreign key (user_id) references user(id),
    foreign key (a_info_id) references author_info(id),
    foreign key (w_info_id) references work_info(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
