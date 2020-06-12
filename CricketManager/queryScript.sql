-- query i
select match_id 
from MATCH M natural join BATTING B
where B.p_id = '27001' and B.nruns > 
									(select max(BATTING.nruns) 
									from BATTING natural join MATCH 
									where MATCH.ground = 'Sydney'and BATTING.p_id = '27001');

-- query ii
select distinct(p_id) 
from BATTING 
where p_id not in 
			(select p_id 
			from BATTING 
			where nruns < 30);    

-- query iii
select p_id 
from BATTING 
group by p_id 
having avg(nruns) > 
				(select avg(B.nruns) 
				from MATCH M natural join BATTING B 
				group by M.ground 
				having M.ground = 'Sri Lanka');