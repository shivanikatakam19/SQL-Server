-- transaction is a single unit of statements. either whole statements pass or fail
-- if any one of the statements fail whole transaction will be failed.
use tickets_booking;

CREATE TABLE if not exists users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if not exists movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(50),
    duration INT,
    language VARCHAR(50),
    release_date DATE,
    rating DECIMAL(2,1)
);

CREATE TABLE if not exists theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    location VARCHAR(255) NOT NULL,
    total_screens INT NOT NULL
);

CREATE TABLE if not exists screens (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    theater_id INT,
    screen_number INT NOT NULL,
    total_seats INT NOT NULL,
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id) ON DELETE CASCADE
);

CREATE TABLE if not exists seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT,
    seat_number VARCHAR(10) NOT NULL, -- e.g. A1, A2
    seat_type ENUM('Regular', 'Premium', 'VIP') DEFAULT 'Regular',
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id) ON DELETE CASCADE
);

CREATE TABLE if not exists shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    screen_id INT,
    show_time DATETIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id) ON DELETE CASCADE
);

INSERT INTO users (name, email, phone, password) VALUES
('Alice Johnson', 'alice@example.com', '9876543210', 'hashed_pwd1'),
('Bob Smith', 'bob@example.com', '9123456780', 'hashed_pwd2'),
('Charlie Brown', 'charlie@example.com', '9988776655', 'hashed_pwd3');

INSERT INTO movies (title, genre, duration, language, release_date, rating) VALUES
('Inception', 'Sci-Fi', 148, 'English', '2010-07-16', 8.8),
('RRR', 'Action', 182, 'Telugu', '2022-03-25', 9.0),
('Interstellar', 'Sci-Fi', 169, 'English', '2014-11-07', 8.6),
('3 Idiots', 'Comedy/Drama', 171, 'Hindi', '2009-12-25', 8.4);

INSERT INTO theaters (name, location, total_screens) VALUES
('PVR Cinemas', 'Hyderabad', 5),
('INOX', 'Bangalore', 3),
('Cinepolis', 'Mumbai', 4);

INSERT INTO screens (theater_id, screen_number, total_seats) VALUES
(1, 1, 100),
(1, 2, 120),
(2, 1, 150),
(3, 1, 80),
(3, 2, 90);

INSERT INTO seats (screen_id, seat_number, seat_type) VALUES
(1, 'A1', 'Regular'),
(1, 'A2', 'Regular'),
(2, 'A3', 'Premium'),
(2, 'A4', 'VIP'),
(3, 'B1', 'Regular'),
(4, 'B2', 'Premium');

INSERT INTO shows (movie_id, screen_id, show_time, price) VALUES
(1, 1, '2025-09-12 18:30:00', 250.00), 
(2, 2, '2025-09-12 20:00:00', 300.00), 
(3, 3, '2025-09-13 16:00:00', 200.00), 
(4, 4, '2025-09-13 19:00:00', 180.00);

CREATE TABLE if not exists bookings(
    booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    user_id int,
    show_id int,
    seat_id int,
    theater_id int,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    booking_status ENUM('Confirmed', 'Cancelled') DEFAULT 'Confirmed',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES shows(show_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id) ON DELETE CASCADE,
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id) ON DELETE CASCADE,
);

DELIMITER //

create procedure book_ticket( in p_user_id int, in p_show_id int, in p_seat_id int )

begin
    declare seat_count int default 0;
    declare user_exists int default 0;
    declare show_exists int default 0;
    declare valid_seat_for_show int default 0;

    start transaction;

    select count(*) into user_exists from users where user_id = p_user_id;

    select count(*) into show_exists from shows where show_id = p_show_id;

    select count(*) into valid_seat_for_show
    from seats s
    join shows sh on s.screen_id = sh.screen_id
    where s.seat_id = p_seat_id
      and sh.show_id = p_show_id;

    if user_exists = 0 then
        rollback;
        select 'Error: Invalid user_id!' as status;
    else if show_exists = 0 THEN
        rollback;
        select 'Error: Invalid show_id!' as status;
    else if valid_seat_for_show = 0 THEN
        rollback;
        Select 'Error: Seat does not belong to this show’s screen!'as status;
    else
        select count(*) INTO seat_count
        from bookings
        where show_id = p_show_id
          and seat_id = p_seat_id
          and booking_status = 'Confirmed';

        if seat_count > 0 then
            rollback;
            select 'Error: Seat is already booked for this showtime!' as status;
        else
            insert into bookings(user_id, show_id, seat_id, booking_status)
            values(p_user_id, p_show_id, p_seat_id, 'Confirmed');
            select 'Seats booked successfully!' as status;
            commit;
        end if;
    end if;
end;

DELIMITER ;

call book_ticket(1, 2, 3);

-- shows recent bookings at first
select * from bookings order by booking_time desc;

