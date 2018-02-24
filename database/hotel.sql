PRAGMA foreign_keys = ON;

--Customers table

CREATE TABLE Customers 
(
    id        integer primary key,
    title     varchar,
    firstname varchar,
    surname   varchar,
    email     varchar
);

insert into Customers (title, firstname, surname, email) values ('Mr', 'Donald', 'Trump', 'Donaldo@gmail.com');
insert into Customers (title, firstname, surname, email) values ('Mr', 'Pat', 'leChat', 'chaton@gmail.com');
insert into Customers(title, firstname, surname, email) values ('Ms', 'Eyenga', 'Obama', 'obama@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Gaston', 'Mollo', 'gaston@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Malono', 'Mollo', 'malone@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Eben', 'Will', 'mokobe9@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Raoul', 'Samson', 'kollo@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Wasekwa', 'Mondor', 'fadiga@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Henry', 'Grerinac', 'conan@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Barry', 'Luke', 'santos@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Alex', 'Edouard', 'edouard@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Fulbert', 'Sango', 'sango@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Gontrand', 'Mollo', 'gontrand@gmail.com');
insert into Customers(title, firstname, surname, email) values('Mr', 'Fefe', 'Manganda', 'mangada@gmail.com');


-- -- Room_types table

create table rooms_types(
    id               integer primary key,
    type_name        varchar,
    original_price   number,
    current_price    number   
);
 
insert into rooms_types (type_name, original_price, current_price) values ('classic room', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price)  values ('SUPERIOR CITY-VIEW ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('SUPERIOR ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('PRESTIGE ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('classic room', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('LUXOR ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('LUXOR ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('SUPERIOR CITY VIEW ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('LUXOR ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('PRESTIGE ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('LUXOR ROOM', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('classic room', 60, 59.99);
insert into rooms_types (type_name, original_price, current_price) values ('PRESTIGE ROOM', 60, 59.99);


-- --Rooms table

CREATE TABLE rooms(
    id          integer primary key,
    rooms_types_id    integer,
    sea_view          boolean default false,
    foreign key (rooms_types_id) references rooms_types(id)
);

insert into rooms (rooms_types_id, sea_view) values (3, 1);
insert into rooms (rooms_types_id, sea_view) values (5, 1);
insert into rooms (rooms_types_id) values (2);
insert into rooms (rooms_types_id, sea_view) values (1, 1);
insert into rooms (rooms_types_id, sea_view) values (6, 1);
insert into rooms (rooms_types_id) values (8);
insert into rooms (rooms_types_id, sea_view) values (4, 1);
insert into rooms (rooms_types_id) values (7);
insert into rooms (rooms_types_id, sea_view) values (9, 1);
insert into rooms (rooms_types_id, sea_view) values (10, 1);
insert into rooms (rooms_types_id) values (7);

-- Reservations table

CREATE TABLE reservations (
    id                   integer primary key,
    customer_id          integer ,
    room_id              integer , 
    check_in_date        datetime not null,
    check_out_date       datetime,
    price                number not null,
    foreign key (customer_id) references Customers(id),
    foreign key (room_id) references rooms(id)
);

insert into reservations (customer_id, room_id, check_in_date, check_out_date,  price) values (2, 11, '2016-10-05', '2017-02-12', 3070);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (2, 11, '2016-10-05', '2017-02-12', 3040);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (4, 8,  '2017-12-20', '2017-12-30', 2300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (2, 6, '2016-03-05', '2017-05-12', 1300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (2, 1, '2017-08-16', '2017-09-12', 1900);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (5, 11, '2016-09-15', '2017-02-12', 300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (7, 3, '2013-09-10', '2014-02-12', 800);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (7, 9, '2010-09-10', '2011-02-12', 300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (6, 4, '2017-03-14', '2017-04-12', 900);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (8, 2, '2017-09-30', '2017-10-12', 3030);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (8, 5, '2014-09-10', '2014-10-12', 300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (7, 3, '2017-09-10', '2017-12-12', 1300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (5, 5, '2017-01-23', '2017-02-12', 3000);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (1, 4, '2016-12-17', '2017-02-12', 2300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (7, 3, '2018-01-20', '2018-02-12', 5300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (9, 2, '2017-02-10', '2017-02-18', 300);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (4, 5, '2017-11-20', '2017-12-12', 3400);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (4, 5, '2014-11-30', '201-12-12', 3600);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (9, 1, '2016-04-10', '2016-05-12', 3200);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (8, 1, '2017-04-11', '2017-06-12', 3900);
insert into reservations (customer_id, room_id, check_in_date, check_out_date, price) values (2, 3, '2016-07-12', '2017-09-12', 390);



--Invoices table

CREATE TABLE Invoices (
    id                        integer primary key,  
    reservation_id            integer,     
    total                     number,
    surcharges                 number,
    invoice_date_time         datetime not null,
    paid                      boolean default false,
    foreign key (reservation_id) references reservations(id)

);

insert into Invoices ( reservation_id, total, surcharges, invoice_date_time, paid) values (2, 450, 200, '2017-12-20', 1); 
insert into Invoices ( reservation_id, total, surcharges, invoice_date_time) values (2, 70, 400, '2018-11-11');
insert into Invoices (reservation_id, total, surcharges, invoice_date_time) values (4, 55, 300,'2018-01-22'); 
insert into Invoices (reservation_id,  total, surcharges, invoice_date_time) values (4, 40.34,40,'2018-01-20'); 
insert into invoices ( reservation_id, total, surcharges, invoice_date_time, paid) values (3, 143.50, 10, '2018-01-08', 1);
insert into invoices ( reservation_id, total, surcharges, invoice_date_time) values (3, 250.50,70, '2018-02-23');
insert into invoices ( reservation_id, total, surcharges, invoice_date_time) values (1, 431.50, 33, '2018-01-10');
insert into invoices ( reservation_id, total, surcharges, invoice_date_time, paid) values (2, 300.50, 45, '2018-01-09', 1);
insert into invoices (reservation_id, total, surcharges, invoice_date_time, paid) values (1, 284.35, 33, '2018-02-13', 1);
insert into invoices (reservation_id, total, surcharges, invoice_date_time, paid) values (6, 478.99, 180, '2018-01-25', 1);


--reviews
create table reviews (
    id               integer primary key,
    customer_id      integer,
    room_type_id     integer,
    rating           varchar,
    comment          varchar,
    review_date      datetime not null,
    foreign key (customer_id) references customers(id), 
    foreign key (room_type_id) references rooms_types(id)   
);

insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 7, '4 stars', 'amazing', '2018-01-23');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 9, '3 stars', 'fabulous', '2017-11-27');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 3, '3.3 stars', 'amazing', '2017-12-23');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 4, '4 stars', 'love it', '2018-01-23');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 1, '1.3 stars', 'Wow', '2018-01-03');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 9, '3 stars', 'Unbelievable', '2018-01-13');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 3, '4 stars', 'I recommend it', '2018-01-04');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 5, '3.5 stars', 'Lovely personnel', '2018-01-05');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 2, '4 stars', 'hmm... I am coming back!', '2018-01-07');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 6, '5 stars', 'You must see it', '2018-01-12');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 7, '4 stars', 'No comments', '2018-01-28');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 9, '4 stars', 'super', '2018-01-23');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 4, '2 stars', 'disapointed', '2018-02-17');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 3, '4 stars', 'bravo', '2018-01-23');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 10, '2 stars', ' waste of time', '2018-02-13');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 4, '4 stars', 'amazing', '2018-02-16');
insert into reviews (customer_id, room_type_id, rating, comment, review_date) values (3, 1, '4 stars', 'amazing', '2018-02-07');