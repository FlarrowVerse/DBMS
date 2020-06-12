/* Find total no of people who owned cars that were involved in accidents in 2010*/
select count(distinct customer_master.CustomerId)
from customer_master, car_list, accident_records
where customer_master.CustomerId = car_list.CustomerId and car_list.PlateNo = accident_records.PlateNo 
and to_char(AccidentDate, 'YYYY') = '2010';

/*find no of accidents in which the cars belonging to "XYZ" were involved*/
select count(distinct accident_records.FIRNo) as num_of_acc
from accident_records, car_list
where accident_records.PlateNo = car_list.PlateNo and CustomerId = 'XYZ';

/*Add new accident to the table,and display the table*/
insert into accident_records values('&FIRno','&PlateNo',to_date('&AccidentDate','DD-MM-YYYY'),'&Location',&Damage);
select * from accident_records;

/*delete the model Scorpio belonging to "ABC" and display the table*/
delete from car_list
where Model = 'Scorpio' and CustomerId = 'ABC';
select * from car_list;

/*update the damage amount for the car with plateno "AIBPC2019" in accident "FIR271" to Rs.5000*/
update accident_records
set Damage = 5000.00
where PlateNo = 'AIBPC2019' and FIRNo = 'FIR271';
select * from accident_records;