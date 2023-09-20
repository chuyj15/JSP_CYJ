create table `user` (		--`로 써야하나봐 테이블이름을.. 
	id varchar(10) not null,
	password varchar(10) not null,
	name varchar(10) not null,
	gender varchar(5),
	birth varchar(10),
	mail varchar(30),
	phone varchar(20),
	address varchar(90),
	regist_day varchar(50),
	primary key(id)
);