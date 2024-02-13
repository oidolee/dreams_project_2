use leedb;
-- 민진 시작
show databases;

drop table if exists DR_Gemes;
create table DR_Gemes(
	DG_No int primary key auto_increment,
    DG_Home varchar(100) comment '홈팀',
    DG_Away varchar(100) comment '원정팀',
    DG_Location varchar(100) comment '경기장',
    DG_Time datetime default current_timestamp comment '경기시간'
);

insert into DR_Gemes(DG_Home, DG_Away, DG_Location, DG_Time)
	values('드림즈', '두산', '고척', '2024-02-04 18:11:11');
insert into DR_Gemes(DG_Home, DG_Away, DG_Location, DG_Time)
	values('드림즈', '두산', '고척', '2024-02-05 19:22:22');
insert into DR_Gemes(DG_Home, DG_Away, DG_Location, DG_Time)
	values('드림즈', '두산', '고척', '2024-02-06 20:33:33');
    
insert into DR_Gemes(DG_Home, DG_Away, DG_Location, DG_Time)
	values('Kia', '드림즈', '광주', '2024-02-07 15:40:00');
insert into DR_Gemes(DG_Home, DG_Away, DG_Location, DG_Time)
	values('Kia', '드림즈', '광주', '2024-03-01 14:50:00');
            
select * from DR_Gemes;

drop table if exists DR_KBOTeams;
create table DR_KBOTeams(
	DK_No int auto_increment primary key,
    DK_TeamName varchar(100) comment '팀이름',
	DK_Location varchar(100) comment '위치'
);
select * from DR_KBOTeams;
insert into DR_KBOTeams(DK_TeamName, DK_Location) values('드림즈','고척');
insert into DR_KBOTeams(DK_TeamName, DK_Location) values('키움','고척');
insert into DR_KBOTeams(DK_TeamName, DK_Location) values('LG','잠실');
insert into DR_KBOTeams(DK_TeamName, DK_Location) values('두산','잠실');
insert into DR_KBOTeams(DK_TeamName, DK_Location) values('한화','대전');
insert into DR_KBOTeams(DK_TeamName, DK_Location) values('kia','광주');
-- 민진 시작
    