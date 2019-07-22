SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS career;
DROP TABLE IF EXISTS pickjob;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS pickuser;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS haveskill;
DROP TABLE IF EXISTS LL;
DROP TABLE IF EXISTS portfolio;
DROP TABLE IF EXISTS CV;
DROP TABLE IF EXISTS resumecomment;
DROP TABLE IF EXISTS resumeEdit;
DROP TABLE IF EXISTS resume;
DROP TABLE IF EXISTS jemok;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE activity
(
	acno int(100) unsigned NOT NULL,
	cvno int(100) unsigned NOT NULL,
	actype varchar(20),
	aclocation varchar(1000),
	acperiod varchar(50),
	accontent varchar(1000),
	PRIMARY KEY (acno)
);


CREATE TABLE board
(
	bno int(10) NOT NULL,
	userno int(100) unsigned NOT NULL,
	bname varchar(10),
	subject varchar(20),
	content varchar(1000),
	file varchar(100),
	regdate date,
	readcnt int(20),
	ref int(20),
	reflevel int(20),
	refstep int(20),
	PRIMARY KEY (bno)
);


CREATE TABLE career
(
	careerno int(100) unsigned NOT NULL,
	cvno int(100) unsigned NOT NULL,
	ename varchar(20),
	workstart date,
	workend date,
	reason varchar(1000),
	position varchar(10),
	pyear int(10),
	worktype varchar(20),
	worklocation varchar(20),
	dept varchar(20),
	salary int(10) unsigned,
	task varchar(1000),
	PRIMARY KEY (careerno)
);


CREATE TABLE company
(
	comno int(100) unsigned NOT NULL,
	comid varchar(20) NOT NULL,
	compass varchar(400) NOT NULL,
	bussno varchar(100) NOT NULL,
	-- 솔루션, si 등등
	-- 
	comtype varchar(100) NOT NULL,
	-- 대기업, 중소기업
	comsize varchar(100),
	managername varchar(20) NOT NULL,
	-- 
	-- 
	managerphone varchar(100) NOT NULL,
	manageremail varchar(50) NOT NULL,
	comcontent varchar(1000),
	compic varchar(50),
	comhomepage varchar(50),
	-- 
	-- 
	-- 
	comwelfare varchar(1000),
	comname varchar(100),
	combrand varchar(50),
	comboss varchar(20),
	comaddr varchar(100),
	comphone varchar(50),
	comstaffnum int(10),
	combirth varchar(30),
	comsales int(100),
	PRIMARY KEY (comno)
);


CREATE TABLE CV
(
	cvno int(100) unsigned NOT NULL,
	userno int(100) unsigned NOT NULL,
	subject varchar(20),
	name varchar(20),
	birth varchar(30),
	email varchar(20),
	phone varchar(20),
	addr varchar(50),
	picture varchar(30),
	-- 셀렉트박스
	school varchar(20),
	schoolname varchar(20),
	-- 셀렉트
	schoollocation varchar(20),
	major varchar(50),
	-- 라디오박스
	-- 
	daynight varchar(20),
	-- 입력 4.5기준
	-- 
	score double(5,5),
	skillcontent varchar(3000),
	bohun varchar(30),
	army varchar(20),
	armytype varchar(30),
	armyclass varchar(20),
	armyreason varchar(1000),
	bohunreason varchar(1000),
	cdtsalary varchar(30),
	cdtlocation1 varchar(10),
	cdtlocation2 varchar(10),
	cdtlocation3 varchar(10),
	cdtjob1 varchar(10),
	cdtjob2 varchar(10),
	cdtjob3 varchar(10),
	cdtjob4 varchar(10),
	cdtjob5 varchar(10),
	publicornot int(1),
	date date,
	resumeno int(20) NOT NULL,
	PRIMARY KEY (cvno)
);


CREATE TABLE haveskill
(
	haveno int(100) unsigned NOT NULL,
	cvno int(100) unsigned NOT NULL,
	ability varchar(100),
	level varchar(10),
	content varchar(1000),
	PRIMARY KEY (haveno)
);


CREATE TABLE jemok
(
	jemokno int(100) unsigned NOT NULL,
	userno int(100) unsigned NOT NULL,
	jemok varchar(1000),
	PRIMARY KEY (jemokno)
);


CREATE TABLE job
(
	jobno int(100) unsigned NOT NULL,
	comno int(100) unsigned NOT NULL,
	subject varchar(100) NOT NULL,
	duty varchar(30),
	career varchar(30),
	employ varchar(30),
	education varchar(30),
	major varchar(10),
	likecdt varchar(100),
	language varchar(100),
	skill varchar(100),
	gender varchar(10),
	startage varchar(10),
	endage varchar(10),
	salary varchar(50),
	industry varchar(400),
	worklocation varchar(100),
	workday varchar(100),
	worktime varchar(50),
	startdate datetime,
	enddate datetime,
	receivetype varchar(30),
	name varchar(30),
	phone varchar(30),
	mobile varchar(30),
	email varchar(30),
	num int(10),
	field varchar(30),
	task varchar(1000),
	dept varchar(30),
	position varchar(50),
	PRIMARY KEY (jobno)
);


CREATE TABLE LL
(
	no int(10) unsigned NOT NULL,
	cvno int(100) unsigned NOT NULL,
	type varchar(10),
	name varchar(20),
	place varchar(1000),
	lang varchar(10),
	testtype varchar(10),
	score int(10),
	level varchar(10),
	pass varchar(20),
	passdate date,
	PRIMARY KEY (no)
);


CREATE TABLE pickjob
(
	pickjobno int(100) unsigned NOT NULL,
	userno int(100) unsigned NOT NULL,
	jobno int(100) unsigned NOT NULL,
	readornot int(1),
	apply int(1),
	pick int(1),
	PRIMARY KEY (pickjobno)
);


CREATE TABLE pickuser
(
	pickuserno int(20) NOT NULL,
	comno int(100) unsigned NOT NULL,
	userno int(20),
	calluser int(2),
	PRIMARY KEY (pickuserno)
);


CREATE TABLE portfolio
(
	portno int(100) unsigned NOT NULL,
	cvno int(100) unsigned NOT NULL,
	porturl varchar(100),
	portcontent varchar(3000),
	PRIMARY KEY (portno)
);


CREATE TABLE resume
(
	resumeno int(20) NOT NULL,
	jemokno int(100) unsigned NOT NULL,
	subject varchar(30) NOT NULL,
	content varchar(1000) NOT NULL,
	date date NOT NULL,
	PRIMARY KEY (resumeno)
);


CREATE TABLE resumecomment
(
	commentno int(20) unsigned NOT NULL,
	editno int(10) unsigned NOT NULL,
	userno int(100) unsigned NOT NULL,
	-- id로
	name varchar(30),
	content varchar(1000),
	date date,
	-- editno번호를 받아옴
	ref int(100),
	refstep int(100),
	reflevel int(100),
	PRIMARY KEY (commentno)
);


CREATE TABLE resumeEdit
(
	editno int(10) unsigned NOT NULL,
	resumeno int(20) NOT NULL,
	userno int(100) unsigned NOT NULL,
	subject varchar(20),
	name varchar(20),
	date date,
	content varchar(1000),
	count int(20) unsigned,
	PRIMARY KEY (editno)
);


CREATE TABLE user
(
	userno int(100) unsigned NOT NULL,
	name varchar(20) NOT NULL,
	id varchar(20) NOT NULL,
	pass varchar(400) NOT NULL,
	age int(10) unsigned NOT NULL,
	gender int(2) NOT NULL,
	phone varchar(20) NOT NULL,
	email varchar(400) NOT NULL,
	emailkey int(10),
	emailkeycheck int(10),
	PRIMARY KEY (userno)
);



