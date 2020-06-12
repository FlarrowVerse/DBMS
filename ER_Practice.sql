create table composer
(
	CompID varchar2(5) not null,
	FirstName varchar2(15),
	LastName varchar2(15),
	primary key (CompID)
);

create table RecordingArtists
(
	RName varchar2(30) not null primary key,
	RType varchar2(4)
);

create table Song
(
	SongNo varchar2(5) not null primary key check (substr(SongNo, 1, 1) = 'S'),
	Title varchar2(30) not null,
	CompDate Date
);

create table CD
(
	RCNo varchar2(6) not null primary key check (substr(RCNo, 1, 2) = 'RC'),
	RName varchar2(30) references RecordingArtists(RName),
	Title varchar2(30) not null,
	Producer varchar2(30) not null
);

create table ComposedBy
(
	CompID varchar2(5) references composer(CompID),
	SongNo varchar2(5) references Song(SongNo),
	primary key (CompID, SongNo)
);

create table Recordings
(
	RName varchar2(30) references RecordingArtists(RName),
	SongNo varchar2(5) references Song(SongNo),
	primary key (RName, SongNo)
);

create table Tracks
(
	SongNo varchar2(5) references Song(SongNo),
	RCNo varchar2(6) references CD(RCNo),
	RDate Date,
	TrackNo Number(5),
	primary key (SongNo, RCNo)
);

create table Release
(
	RCNo varchar2(6) references CD(RCNo),
	RDate Date,
	SalesAmt Number(10),
	primary key (RCNo, RDate)
);

------------------------------------------------------------------------------------------------------------

insert into composer values ('C0001','Anupam','Roy');
insert into composer values ('C0002','Shyamal','Mitra');
insert into composer values ('C0003','Allahrakka','Rahman');
insert into composer values ('C0004','Hemanta','Mukherjee');
insert into composer values ('C0005','Olli','Tukiainen');
insert into composer values ('C0006', 'Rupam','Islam');
insert into composer values ('C0007','Ram','Sampath');

insert into RecordingArtists values ('Manna De', 'Solo');
insert into RecordingArtists values ('Shaan', 'Solo');
insert into RecordingArtists values ('Fossils', 'Band');
insert into RecordingArtists values ('Hemanta Mukherjee', 'Solo');
insert into RecordingArtists values ('Poets of The Fall', 'Band');

insert into Song values ('S0001','Late Goodbye',null);
insert into Song values ('S0002','Bharot Amar Bharotborsho',null);
insert into Song values ('S0003','Aro Ekbaar',null);
insert into Song values ('S0004','Tanha Dil', to_date('02-01-2020','DD-MM-YYYY'));
insert into Song values ('S0005','Lift',null);

insert into CD values ('RC0001','Shaan','Tanha Dil','Ram Sampath');
insert into CD values ('RC0002','Poets of The Fall','Signs of Life','Markus Kaarlonen');
insert into CD values ('RC0003','Manna De','Chaarmurti','Ram Sharma');
insert into CD values ('RC0004','Fossils','Hashnuhana','Rupam Islam');

insert into ComposedBy values ('C0005','S0001');
insert into ComposedBy values ('C0005','S0005');
insert into ComposedBy values ('C0002','S0002');
insert into ComposedBy values ('C0006','S0003');
insert into ComposedBy values ('C0007','S0004');

insert into Recordings values ('Poets of The Fall','S0001');
insert into Recordings values ('Poets of The Fall','S0005');
insert into Recordings values ('Manna De','S0002');
insert into Recordings values ('Fossils','S0003');
insert into Recordings values ('Shaan','S0004');

insert into Tracks values ('S0001','RC0002',to_date('20-02-2004','DD-MM-YYYY'),1);
insert into Tracks values ('S0002','RC0003',to_date('20-01-1998','DD-MM-YYYY'),1);
insert into Tracks values ('S0003','RC0004',to_date('10-05-2004','DD-MM-YYYY'),1);
insert into Tracks values ('S0004','RC0001',to_date('21-10-2000','DD-MM-YYYY'),1);
insert into Tracks values ('S0005','RC0002',to_date('20-02-2004','DD-MM-YYYY'),2);

insert into Release values ('RC0002',to_date('20-04-2004','DD-MM-YYYY'),50000);
insert into Release values ('RC0003',to_date('20-03-1998','DD-MM-YYYY'),40000);
insert into Release values ('RC0004',to_date('10-07-2004','DD-MM-YYYY'),30000);
insert into Release values ('RC0001',to_date('21-12-2010','DD-MM-YYYY'),45000);

------------------------------------------------------------------------------------------------------------

select * from composer;
select * from RecordingArtists;
select * from Song;
select * from CD;
select * from ComposedBy;
select * from Recordings;
select * from Tracks;
select * from Release;

------------------------------------------------------------------------------------------------------------

drop table Release;
drop table Tracks;
drop table Recordings;
drop table ComposedBy;
drop table CD;
drop table Song;
drop table RecordingArtists;
drop table composer;