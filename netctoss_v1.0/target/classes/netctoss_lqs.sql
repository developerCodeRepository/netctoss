--资费信息表
create table cost_lqs(
  	cost_id		number(4) primary key,
  	name 			varchar(50)  not null,
  	base_duration 	number(11),
  	base_cost 		number(7,2),
  	unit_cost 		number(7,4),
  	status 			char(1),
  	descr 			varchar2(100),
  	creatime 		date default sysdate ,
  	startime 		date,
	cost_type		char(1)
  );

create sequence cost_seq_lqs start with 100;

INSERT INTO cost_lqs VALUES (1,'5.9元套餐',20,5.9,0.4,0,'5.9元20小时/月,超出部分0.4元/时',DEFAULT,DEFAULT,'2');
INSERT INTO cost_lqs VALUES (2,'6.9元套餐',40,6.9,0.3,0,'6.9元40小时/月,超出部分0.3元/时',DEFAULT,DEFAULT,'2');
INSERT INTO cost_lqs VALUES (3,'8.5元套餐',100,8.5,0.2,0,'8.5元100小时/月,超出部分0.2元/时',DEFAULT,DEFAULT,'2');
INSERT INTO cost_lqs VALUES (4,'10.5元套餐',200,10.5,0.1,0,'10.5元200小时/月,超出部分0.1元/时',DEFAULT,DEFAULT,'2');
INSERT INTO cost_lqs VALUES (5,'计时收费',null,null,0.5,0,'0.5元/时,不使用不收费',DEFAULT,DEFAULT,'3');
INSERT INTO cost_lqs VALUES (6,'包月',null,20,null,0,'每月20元,不限制使用时间',DEFAULT,DEFAULT,'1');
COMMIT;

--管理员表
create table admin_info_lqs(
   	admin_id 	number(8) primary key not null,
   	admin_code 	varchar2(30) not null,
   	password 	varchar2(30) not null,
   	name 		varchar2(30) not null,
   	telephone 	varchar2(15),
   	email 		varchar2(50),
   	enrolldate 	date default sysdate not null
);

create sequence admin_seq_lqs start with 10000;

--管理员表
insert into admin_info_lqs values(2000,'admin','123','ADMIN','123456789','admin@tarena.com.cn',sysdate);
insert into admin_info_lqs values(3000,'zhangfei','123','ZhangFei','123456789','zhangfei@tarena.com.cn',sysdate);
insert into admin_info_lqs values(4000,'liubei','123','LiuBei','123456789','liubei@tarena.com.cn',sysdate);
insert into admin_info_lqs values(5000,'caocao','123','CaoCao','123456789','caocao@tarena.com.cn',sysdate);
insert into admin_info_lqs values(6000,'aaa','123','AAA','123456789','aaa@tarena.com.cn',sysdate);
insert into admin_info_lqs values(7000,'bbb','123','BBB','123456789','bbb@tarena.com.cn',sysdate);
COMMIT;

