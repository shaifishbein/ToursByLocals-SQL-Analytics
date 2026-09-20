-- Sample data for the ToursByLocals database

INSERT INTO USERS (User_ID, Name, Email)
VALUES
(101, 'Nir Zioni', 'nirzioni@gmail.com'),
(102, 'Shai Fishbein', 'shaif@gmail.com'),
(103, 'Nadav Shlomo', 'nadavs@gmail.com'),
(104, 'Yuval Or', 'yuvalor@gmail.com'),
(105, 'Adir Even', 'adireven@gmail.com'),
(106, 'Boaz Gordon', 'boazg@gmail.com');

INSERT INTO GUIDES (User_ID, Years_of_experience, Bio)
VALUES
(101, 12, 'Born and raised in Paris. Art historian and wine lover.'),
(102, 5, 'Tokyo certified local guide. Specialized in anime and street food.'),
(103, 8, 'Archaeologist with a passion for showing Ancient Rome secrets.');

INSERT INTO GUIDE_LANGUAGES (User_ID, Language)
VALUES
(101, 'French'),
(101, 'English'),
(102, 'Japanese'),
(102, 'English'),
(103, 'Italian');

INSERT INTO TRAVELLERS (User_ID, Emergency_contact, Nationality)
VALUES
(104, '+1-555-0199', 'American'),
(105, '+44-20-7946', 'British'),
(106, '+972-52-111', 'Israeli');

INSERT INTO DESTINATIONS (Destination, Destination_Name, Country, City)
VALUES
(1, 'Eiffel Tower & Louvre', 'France', 'Paris'),
(2, 'Shibuya & Asakusa', 'Japan', 'Tokyo'),
(3, 'Colosseum & Vatican', 'Italy', 'Rome');

INSERT INTO CREDIT_CARDS (Card_Num, Expiry_date, Type)
VALUES
('1111222233334444', '2029-12-01', 'VISA'),
('5555666677778888', '2028-06-01', 'MasterCard'),
('9999000011112222', '2030-01-01', 'AmericanExpress');

INSERT INTO OWNS (User_ID, Card_Num)
VALUES
(104, '1111222233334444'),
(105, '5555666677778888'),
(106, '9999000011112222');

INSERT INTO TOURS
(Tour_ID, Title, Tour_Type, Price, Duration, Destination, User_ID)
VALUES
(501, 'Louvre Museum Private Tour', 'Museum Tour', 250.00, 3, 1, 101),
(502, 'Parisian Wine & Cheese Tasting', 'Culinary Tour', 180.00, 2, 1, 101),
(503, 'Tokyo Hidden Street Food Tour', 'Culinary Tour', 120.00, 4, 2, 102),
(504, 'Ancient Rome & Colosseum Walk', 'Historical Tour', 210.00, 5, 3, 103);

INSERT INTO BOOKINGS
(Booking_Num, TourDate, Participants, Special_Requests, Tour_ID, User_ID, Card_Num)
VALUES
(9001, '2026-07-15', 2, 'One participant is vegetarian', 502, 104, '1111222233334444'),
(9002, '2026-08-20', 4, 'No special requests', 503, 105, '5555666677778888'),
(9003, '2026-09-10', 1, 'Needs wheelchair accessibility', 504, 106, '9999000011112222');

INSERT INTO REVIEWS (Booking_Num, Review_Num, Rating, Comment)
VALUES
(9001, 1, 5, 'Nir Zioni was amazing! The wine selection was outstanding.'),
(9002, 1, 4, 'Great food, but it was raining a bit. Shai did a wonderful job.'),
(9003, 1, 5, 'Unforgettable experience in Rome. Highly recommended!');

GO
