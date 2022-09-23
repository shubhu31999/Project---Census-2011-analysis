create database project_census_analysis 

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



