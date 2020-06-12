create table Hotel
(
	Hotel_No varchar2(5) not null primary key, 
	Name varchar2(20), 
	Address varchar2(15)
);

create table Room 
(
	Room_No varchar2(5) not null,
	Hotel_No varchar2(5) references Hotel(Hotel_No),
	Room_Type varchar2(20),
	Price Number(4),
	primary key (Room_No, Hotel_No)
);

create table Guest
(
	Guest_No varchar2(5) primary key not null,
	Name varchar2(10),
	Address varchar2(15)
);

create table Booking
(
	Hotel_No varchar2(6) not null,
	Room_No varchar2(5) not null,
	Guest_No varchar2(5) not null references Guest(Guest_No) on delete cascade,
	Date_From Date,
	Date_To Date,
	foreign key (Room_No, Hotel_No) references Room
);

--------------------------------------------------------------------------------------------------------------

insert into Hotel values ('H001', 'Hotel Grosvenor', 'London');
insert into Hotel values ('H002', 'Hotel Taj', 'Mumbai');
insert into Hotel values ('H003', 'The Happy Place', 'Paris');
insert into Hotel values ('H004', 'Sanctorium', 'Tokyo');
insert into Hotel values ('H005', 'The Melody Hotel', 'Las Vegas');
insert into Hotel values ('H006', 'ITC', 'Kolkata');
insert into Hotel values ('H007', 'Hotel Grande', 'New York City');

insert into Room values ('R001', 'H001', 'Single Bed', 25);
insert into Room values ('R002', 'H002', 'Single Bed', 18);
insert into Room values ('R003', 'H003', 'Deluxe Suit', 60);
insert into Room values ('R004', 'H004', 'Dormitory', 15);
insert into Room values ('R005', 'H005', 'Deluxe Suit', 100);
insert into Room values ('R006', 'H006', 'Double Bed', 38);
insert into Room values ('R007', 'H007', 'Family', 80);
insert into Room values ('R008', 'H002', 'Double Bed', 70);
insert into Room values ('R010', 'H001', 'Deluxe Suit', 70);
insert into Room values ('R011', 'H001', 'Family', 35);

insert into Guest values ('G001', 'Rityo', 'Delhi');
insert into Guest values ('G002', 'Sneha', 'Kolkata');
insert into Guest values ('G003', 'Julia', 'London');
insert into Guest values ('G004', 'Pratt', 'Las Vegas');
insert into Guest values ('G005', 'Jimmy', 'London');
insert into Guest values ('G006', 'Karla', 'Victoria');
insert into Guest values ('G007', 'Priya', 'Mumbai');
insert into Guest values ('G008', 'James', 'Sacramento');
insert into Guest values ('G009', 'Frank', 'Kinshasa');
insert into Guest values ('G0010', 'Shyam', 'Paris');

insert into Booking values ('H001','R001','G001',to_date('02-08-2017','DD-MM-YYYY'),to_date('20-08-2017','DD-MM-YYYY'));
insert into Booking values ('H002','R002','G002',to_date('04-01-2018','DD-MM-YYYY'),to_date('06-01-2018','DD-MM-YYYY'));
insert into Booking values ('H003','R003','G003',to_date('06-08-2018','DD-MM-YYYY'),to_date('08-08-2018','DD-MM-YYYY'));
insert into Booking values ('H004','R004','G004',to_date('11-02-2019','DD-MM-YYYY'),to_date('14-02-2019','DD-MM-YYYY'));
insert into Booking values ('H005','R005','G005',to_date('17-04-2019','DD-MM-YYYY'),to_date('21-04-2019','DD-MM-YYYY'));
insert into Booking values ('H006','R006','G006',to_date('26-05-2020','DD-MM-YYYY'),to_date('30-05-2020','DD-MM-YYYY'));
insert into Booking values ('H007','R007','G007',to_date('26-05-2020','DD-MM-YYYY'),null);
insert into Booking values ('H001','R010','G008',to_date('26-05-2020','DD-MM-YYYY'),null);
insert into Booking values ('H002','R008','G009',to_date('26-05-2020','DD-MM-YYYY'),to_date('01-06-2020','DD-MM-YYYY'));

--------------------------------------------------------------------------------------------------------------

select * from Hotel;
select * from Room;
select * from Guest;
select * from Booking;

--------------------------------------------------------------------------------------------------------------

/* Names and Addresses of all guests in London, alphabetically ordered by name */
select Name, Address
from Guest
where Address = 'London'
order by Name;

/* All double or family rooms with a price below $40.00 per night, in asc order of price */
select *
from Room
where Room_Type in ('Double Bed', 'Family') and Price < 40
order by Price;

/* All bookings for which no date_to has been specified */
select *
from Booking
where Date_To is null;

/* number of hotels */
select count (*) from Hotel;

/* average price of a room */
select avg (Price) from Room;

/* total revenue per night from all double rooms */
select sum (Price)
from Room
where Room_Type = 'Double Bed';

/* number of different guests who have bookings for August */
select count (distinct(Guest_No))
from Booking
where to_char(Date_From, 'MONTH') = '08';

/* details of all rooms at the Grosvenor Hotel */
select Booking.Room_No, Hotel.Name, Guest.Name
from Booking, Hotel, Guest
where Booking.Guest_No=Guest.Guest_No and Hotel.Hotel_No=Booking.Hotel_No
and Hotel.Name='Hotel Grosvenor';

/* total income from bookings for Gosvenor Hotel today */
select sum (Price)
from Hotel, Booking, Room
where Hotel.Name='Hotel Grosvenor' and Hotel.Hotel_No=Booking.Hotel_No and Room.Room_No=Booking.Room_No
and Date_From = to_date('26-05-2020','DD-MM-YYYY');

/* the rooms that are currently unoccupied at the Grosvenor Hotel */
select distinct(Room.Room_No)
from Room, Hotel, Booking
where Room.Hotel_No=Hotel.Hotel_No and Hotel.Name='Hotel Grosvenor'
and Room.Room_No not in (
							select Booking.Room_No
							from Booking, Hotel
							where Booking.Hotel_No=Hotel.Hotel_No
							and Hotel.Name='Hotel Grosvenor'
						);

--------------------------------------------------------------------------------------------------------------

drop table Booking;
drop table Guest;
drop table Room;
drop table Hotel;