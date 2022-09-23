update empinfo
set emp_id = 99984
where first_name = 'raghu';

insert into empinfo values ('riya', 'joshi', 99999,23,'haldwani','uk');
select * from empinfo;
set sql_safe_updates=0;


create table project(
project_id int, 
project_name varchar(20),
student_id int);
select * from project ;
insert into project values( 1, 'data anlytics', 99980);
insert into project values( 1, 'data anlytics', 99981);
insert into project values( 1, 'data anlytics', 99983);
insert into project values( 2, 'data anlytics', 99984);
insert into project values( 2, 'data anlytics', 99985);
insert into project values( 3, 'data anlytics', 99980);
insert into project values( 3, 'data anlytics', 99981);
insert into project values( 4, 'data anlytics', 11111);
insert into project values( 4, 'data anlytics', 11112);
insert into project values( 4, 'data anlytics', 11113);

select distinct id from empinfo ;

Alter table  empinfo 
rename column emp_id to id;

select a.* , b.*
from empinfo a right join project b
on a.id = b.student_id;

select a.first_name, a.last_name, a.age, b.project_name, a.id
from empinfo a left join project b
on  a.id = b.student_id ;

select a.first_name, a.last_name, a.age, b.project_name, a.id
from empinfo a inner join project b
on  a.id = b.student_id ;


select a.first_name, a.last_name, a.age, b.project_name, b.student_id
from empinfo a right join project b
on  a.id = b.student_id 
union
select a.first_name, a.last_name, a.age, b.project_name, a.id
from empinfo a left join project b
on  a.id = b.student_id 

create database youutube ;
use youutube 

create table emp_new (
empid int,
emp_name varchar(20),
emp_salary int );

insert into emp_new values ( 1001, 'sumit', 20000);
insert into emp_new values ( 1002, 'jatin', 25000);
insert into emp_new values ( 1003, 'ragini', 28000);
insert into emp_new values ( 1004, 'raghu', 32000);
insert into emp_new values ( 1005, 'naval', 26000);

select * from emp_new ;
select * from emp_new ;

select avg(emp_salary) from emp_new ;

select * from emp_new where emp_salary > (select avg(emp_salary) from emp_new) ;
select max(emp_salary) from emp_new ;
select * from emp_new
where emp_salary < ( select max(emp_salary) from emp_new )
order by emp_salary desc limit 1

show tables ;

select * from emp_new;

create table player_info (
player_id int,
player_name varchar(20) ,
player_con varchar(20),
player_goals int 
);

insert into player_info values (1011,'jatin','ind', 5); 
insert into player_info values (1002,'messi','usa', 5); 
insert into player_info values (1003,'ronaldo','eng', 3); 
insert into player_info values (1004,'rosey','por', 8); 
insert into player_info values (1005,'jerry','china', 1); 
insert into player_info values (1006,'kay','pak', 2); 
insert into player_info values (1007,'jin','uk', 6); 
insert into player_info values (1008,'sam','ger', 4); 
insert into player_info values (1009,'zoro','isl', 9); 
insert into player_info values (1010,'tom','aus', 1); 


select * from player_info ;


select * from player_info where player_goals>4;

delimiter &&
create procedure top_playerss()
begin
select player_name,player_con,player_goals from player_info where player_goals >4;
end &&
delimiter

call top_playerss()

delimiter //
create procedure top_f_players(in var int)
select player_name,player_con,player_goals from player_info order by player_goals desc limit var;
end
//
delimiter

call top_f_players(5)delimiter //
create procedure top_f_players(in var int)
select player_name,player_con,player_goals from player_info order by player_goals desc limit var;
end
//
delimiter


delimiter //
create procedure top_con_play(in var1 varchar(20),var2 int)
select player_name , player_con, player_goals from player_info where player_con = var1 order by player_goals desc limit var2;
end
//
delimiter

select player_name , player_con, player_goals from player_info where player_con = 'ind' order by player_goals limit 1


call top_con_play('ind',1)

update player_info set player_goals = var1 where player_name = var2 ;

delimiter //
create procedure top_con_pla(in var1 varchar(20),var2 int)
update player_info set player_goals = var1 where player_name = var2 ;
end
//
delimiter

call top_con_pla()
\

delimiter //
create procedure top_con_pl(in var1 int, var2 varchar(20))
update player_info set player_goals = var1 where player_name = var2 ;
end
//
delimiter

call top_con_pl(10,'sumit')

set sql_safe_updates=0;

select sum(player_goals) from player_info ;
delimiter //
create procedure total_goals( out total int )
begin
select sum(player_goals) from player_info into total ;
end
//


call total_goals(@total)

select @total as total_count ;

select sum(player_goals) from player_info where player_con = 'ind' into con_total_goal;

delimiter //
create procedure con_total_goal( in var varchar(20), out con_total int )
begin
select sum(player_goals) from player_info where player_con = var into con_total;
end 
//

call con_total_goal( 'ind', @con_total )

select @con_total as con_total_goal 

select sum(player_goals) from player_info as total_goals where player_con = 'ind' ;

create table demo ( demo_values int) ;

insert into demo values (101),(102),(103),(103),(104),(105),(105),(106);

select * from demo ;

select demo_values ,
rank() over (order by demo_values) as test_rank from demo ;

select * from player_info;

select player_id,player_name,player_con,player_goals,
first_value (player_name) over (order by player_goals desc) as top_players from player_info;

select player_id,player_name,player_con,player_goals,
first_value (player_con) over (partition by player_name order by player_goals desc) as top_con from player_info ;

select mid(player_name,2,3) from player_info ;

select concat(player_name,' ',player_con ) as con_player from player_info;

select concat(left (player_name , 3),'*****') from player_info;
select player_goals from player_info where player_name = 'jatin' ;

select player_name, player_goals from player_info where player_goals > ( select player_goals from player_info where player_name = 'jatin')



CREATE table wifi(
wifi_id int,
wifi_speed varchar(100), 
wifi_latency int,
wifi_date datetime)

INSERT INTO wifi values (1, '500', 10, '2021-01-23');
INSERT INTO wifi values (2, '600', 10, '2021-01-23');
INSERT INTO wifi values (3, '200', 10, '2021-01-23');
INSERT INTO wifi values (4, '100', 10, '2021-01-23');
INSERT INTO wifi values (5, '100', 10, '2021-01-23');

INSERT INTO wifi values (1, '200', 10, '2022-06-19');
INSERT INTO wifi values (2, '300', 10, '2022-06-19');
INSERT INTO wifi values (3, '200', 10, '2022-06-19');
INSERT INTO wifi values (4, '100', 10, '2022-06-19');
INSERT INTO wifi values (5, '100', 10, '2022-06-19');

INSERT INTO wifi values (1, '500', 10, '2021-01-21');
INSERT INTO wifi values (2, '600', 10, '2021-01-21');
INSERT INTO wifi values (3, '200', 10, '2021-01-21');
INSERT INTO wifi values (4, '100', 10, '2021-01-21');
INSERT INTO wifi values (5, '100', 10, '2021-01-21');


select * from wifi ;

select avg(wifi_speed) , wifi_id from wifi group by wifi_id  
order by avg(wifi_speed) desc limit 1

select avg(wifi_speed) , wifi_id from wifi where wifi_date >= '2022-06-19'  
group by wifi_id 



CREATE table worker(
worker_id varchar(10),
first_name varchar(100), 
last_name varchar(100),
salary int,
joining_date datetime,
department varchar(10))

INSERT INTO worker values ("001", "Monika", "Arora", 100000, '2014-02-20 09:00:00', "HR");
INSERT INTO worker values ("002", "Niharika", "Verma", 80000, '2014-06-11 09:00:00', "Admin");
INSERT INTO worker values ("003", "Vishal", "Singhal", 300000, '2014-02-20 09:00:00', "HR");
INSERT INTO worker values ("004", "Amitabh", "Singh", 500000, '2014-02-20 09:00:00', "Admin");
INSERT INTO worker values ("005", "Vivek", "Bhati", 500000, '2014-06-11 09:00:00', "Admin");
INSERT INTO worker values ("006", "Vipul", "Diwan", 200000, '2014-06-11 09:00:00', "Account");
INSERT INTO worker values ("007", "Satish", "Kumar", 75000, '2014-01-20 09:00:00', "Account");
INSERT INTO worker values ("008", "Geetika Chauhan", "Arora", 90000, '2014-04-11 09:00:00', "Admin");

CREATE table bonus(
worker_ref_id int,
bonus_date datetime,
bonus_amt int)

CREATE table title(
worker_ref_id int,
worker_title varchar(100), 
affected_from datetime)

INSERT INTO bonus values (1,'2016-02-20 00:00:00',5000);
INSERT INTO bonus values (2,'2016-06-11 00:00:00',3000);
INSERT INTO bonus values (3,'2016-02-20 00:00:00',4000);
INSERT INTO bonus values (1,'2016-02-20 00:00:00',4500);
INSERT INTO bonus values (2,'2016-06-11 00:00:00',3500);

INSERT INTO title values (1,'Manager','2016-02-20 00:00:00');
INSERT INTO title values (2,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (8,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (5,'Manager','2016-06-11 00:00:00');
INSERT INTO title values (4,'Asst. Manager','2016-06-11 00:00:00');
INSERT INTO title values (7,'Executive','2016-06-11 00:00:00');
INSERT INTO title values (6,'Lead','2016-06-11 00:00:00');
INSERT INTO title values (3,'Lead','2016-06-11 00:00:00');


select * from bonus 


select * from title

select * from worker

select upper(first_name) from worker 

select distinct department from worker 

select left(first_name, 3 ) from worker 

select instr(first_name , 't') from worker where first_name = 'Amitabh' 

select distinct department , length(department) from worker

select * from worker where first_name like '%a%'

select * from worker where first_name like '%h' and length(first_name) = 6 ;

select  department , count(worker_id) as num_of_worker from worker 
group by department
order by count(worker_id) desc

select * from title

select *   
from  worker w inner join title t 
on w.worker_id = t.worker_ref_id 
and t.worker_title = 'Manager'

select * from worker w inner join title t
on w.worker_id = t.worker_ref_id
and t.worker_title = 'Manager'

select * from worker where mod(worker_id,2) = 0;

select now()

select * from  worker 
order by salary desc limit 2,1

select salary, 
rank () over (order by salary) from worker 

select max(salary) from worker 
where salary <> (select max(salary) from worker ) 

select * from worker where worker_id limit 3

select department , count(worker_id) from worker 
group by department having count(worker_id) <= 3

select count(worker_id)/2 from worker 



create database project 

use project 

show tables

select count(*) from project_data1

select * from project_data2 ;




select * from project_data1 where state in ('Uttar Pradesh' , 'Gujarat');

select * from project_data2

select sum(population) as total_population from project_data2

select avg(growth) as avg_growth from project_data1

select distinct state , round(avg(growth)) from project_data1 
group by state 
order by avg(growth) desc


select distinct state , avg(growth) from project_data1 
group by state 
having avg(growth) > 40
order by avg(growth) desc

select distinct state ,round(avg(sex_ratio)), round(avg(growth)) from project_data1 
group by state 
order by avg(sex_ratio) desc

select * from project_data1

ques 1- list of top 5 state with highest average literacy rate

select state, avg(literacy) from project_data1 
group by state 
order by avg(literacy) desc
limit 5

ques 2- list of state with  average literacy rate above 90

select state, avg(literacy) from project_data1 
group by state 
having avg(literacy) > 90
order by avg(literacy) desc

ques 3- list of top 1 state with  average literacy rate above 90

select state, avg(literacy) from project_data1 
group by state 
having avg(literacy) > 90
order by avg(literacy) desc
limit 1

ques 4 list of 5 state with lover average literacy rate

select state, avg(literacy) from project_data1 
group by state 
order by avg(literacy) asc
limit 5

ques 5 - create a list of top and bottom 5 states with average literacy rate


drop table if exists top_literacy_rate
create table top_literacy_rate(
state varchar (20),
avg_literacy float )

insert into top_literacy_rate 
select state, avg(literacy) from project_data1 
group by state 
order by avg(literacy) desc
limit 3

select * from top_literacy_rate 

drop table if exists bottom_avg_literacy
create table bottom_avg_literacy(
state varchar (20),
avg_literacy float )


insert into bottom_avg_literacy
select state, avg(literacy) from project_data1 
group by state 
order by avg(literacy) asc
limit 3

select * from top_literacy_rate 
union
select * from bottom_avg_literacy 


Ques 6 - state name starting from a

select distinct state  from project_data1 where state like 'a%'

Ques 7 - state name starting from a or u

select distinct state  from project_data1 where state like 'u%' or state like 'a%'

select distinct state  from project_data1 where state like 'u%' and state like '%d'

select distinct state  from project_data1 where state like 'a%' or state like '%d'

select * from project_data1

use project
select * from project_data2

select a.district , a.state ,a.sex_ratio/1000 sex_ratio, b.population from 
project_data1 a left join project_data2 b 
on a.district = b.district 
order by a.district 


select c.district, c.state, round(c.population/(c.sex_ratio+1),0) male, round((c.population*c.sex_ratio)/(c.sex_ratio+1),0)female from
(select a.district , a.state ,a.sex_ratio/1000 sex_ratio, b.population from 
project_data1 a left join project_data2 b 
on a.district = b.district) c


select d.district, d.state,d.male, d.female, (d.male+d.female) total_population from
(select c.district, c.state, round(c.population/(c.sex_ratio+1),0) male, round((c.population*c.sex_ratio)/(c.sex_ratio+1),0)female from
(select a.district , a.state ,a.sex_ratio/1000 sex_ratio, b.population from 
project_data1 a left join project_data2 b 
on a.district = b.district
order by a.district) c) d


use project

select d. state, sum(d.male) total_male, sum(d.female) total_female from
(select c.district, c.state, round(c.population/(c.sex_ratio+1),0) male, round((c.population*c.sex_ratio)/(c.sex_ratio+1),0)female from
(select a.district , a.state ,a.sex_ratio/1000 sex_ratio, b.population from 
project_data1 a left join project_data2 b 
on a.district = b.district) c) d
group by d.state 
order by d.state 


select e.state, sum(e.male) total_male ,sum(female) total_female  , sum(e.total_population) from 
(select d.district, d.state,d.male, d.female, (d.male+d.female) total_population from
(select c.district, c.state, round(c.population/(c.sex_ratio+1),0) male, round((c.population*c.sex_ratio)/(c.sex_ratio+1),0)female from
(select a.district , a.state ,a.sex_ratio/1000 sex_ratio, b.population from 
project_data1 a left join project_data2 b 
on a.district = b.district
order by a.district) c) d) e
group by e.state
order by e.state

select a.district, a.state, a.literacy , b.population from project_data1 a left join project_data2 b 
on a.district = b.district 
order by a.district 

select d.state, d.district , d.literate_people, d.illiterate_people, ( d.literate_people+d.illiterate_people) total_population from
(select c.district, c.state , round(c.literacy_ratio*c.population,0) literate_people , round((1-c.literacy_ratio)*c.population,0) illiterate_people from
(select a.district, a.state, a.literacy/100 literacy_ratio , b.population from project_data1 a left join project_data2 b 
on a.district = b.district 
order by a.district) c) d


select e.state , sum(e.literate_people) total_literate_people, sum(e.illiterate_people) total_illiterate_people   from
(select d.state, d.district , d.literate_people, d.illiterate_people, ( d.literate_people+d.illiterate_people) total_population from
(select c.district, c.state , round(c.literacy_ratio*c.population,0) literate_people , round((1-c.literacy_ratio)*c.population,0) illiterate_people from
(select a.district, a.state, a.literacy/100 literacy_ratio , b.population from project_data1 a left join project_data2 b 
on a.district = b.district 
order by a.district) c) d) e
group by e.state 
order by e.state 



select * from project_data2
where state = 'madhya pradesh' and district like 'c%'


select * from project_data1
use project 

select * from project_data1

select * from project_data2

select district, state, growth from project_data1

select a.district, a.state, round(a.growth/100,2) growth ,b.population from project_data1 a inner join project_data2 b
 on a.district = b.district 
 
select c.district , c.state , c.growth, round(c.population/(c.growth+1),0) previous_population , c.population new_population from
(select a.district, a.state, round(a.growth/100,4) growth ,b.population from project_data1 a inner join project_data2 b
 on a.district = b.district) c
 
 
select sum(e.total_previous_population), sum(e.total_new_population) from 
(select d.state , sum(d.previous_population) total_previous_population, sum(d.new_population) total_new_population from 
(select c.district , c.state , c.growth, round(c.population/(c.growth+1),0) previous_population , c.population new_population from
(select a.district, a.state, round(a.growth/100,4) growth ,b.population from project_data1 a inner join project_data2 b
 on a.district = b.district) c) d ) e
 group by d.state 
 order by d.state 
 
 use roject

select * from project_data1

select * from project_data2


select t.sum_area/t.sum_pre_pop pre_per_area , t.sum_area/t.sum_new_pop new_per_area from
(select q.*,r.sum_area from
(select '1' as keyy, g.* from
(select sum(e.total_previous_population) sum_pre_pop , sum(e.total_new_population)sum_new_pop from 
(select d.state , sum(d.previous_population) total_previous_population, sum(d.new_population) total_new_population from 
(select c.district , c.state , c.growth, round(c.population/(c.growth+1),0) previous_population , c.population new_population from
(select a.district, a.state, round(a.growth/100,4) growth ,b.population from project_data1 a inner join project_data2 b
 on a.district = b.district) c) d ) e) g) q
 inner join (
 select '1' as keyy, h.* from
 (select sum(area_km2) sum_area from project_data2) h) r
 on q.keyy = r.keyy) t


select a.* from
(select district, state, literacy, rank() over(partition by state order by literacy desc)rnk
from project_data1) a
where a.rnk in (1,2,3) 
order by a.state 

select a.* from
(select district, state, literacy, rank() over(partition by state order by literacy desc)rnk
from project_data1) a
where a.rnk in (1,2,3) 
order by a.state 



