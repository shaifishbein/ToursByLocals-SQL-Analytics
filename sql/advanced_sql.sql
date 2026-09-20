-- ToursByLocals Sample Data
-- Sample dataset compatible with the final database schema


-- =====================================================
-- USERS
-- =====================================================

INSERT INTO USERS (User_ID, Name, Email)
VALUES
(101, 'Nir Zioni', 'nirzioni@gmail.com'),
(102, 'Shai Fishbein', 'shaif@gmail.com'),
(103, 'Nadav Shlomo', 'nadavs@gmail.com'),
(104, 'Yuval Or', 'yuvalor@gmail.com'),
(105, 'Adir Even', 'adireven@gmail.com'),
(106, 'Boaz Gordon', 'boazg@gmail.com');


-- =====================================================
-- GUIDES
-- =====================================================

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


-- =====================================================
-- TRAVELLERS
-- =====================================================

INSERT INTO TRAVELLERS (User_ID, Emergency_contact, Nationality)
VALUES
(104, '+1-555-0199', 'American'),
(105, '+44-20-7946', 'British'),
(106, '+972-52-111', 'Israeli');


-- =====================================================
-- DESTINATIONS
-- =====================================================

INSERT INTO DESTINATIONS
(Destination, Destination_Name, Country, City)
VALUES
(1, 'Eiffel Tower & Louvre', 'France', 'Paris'),
(2, 'Shibuya & Asakusa', 'Japan', 'Tokyo'),
(3, 'Colosseum & Vatican', 'Italy', 'Rome');


-- =====================================================
-- CREDIT CARDS
-- =====================================================

INSERT INTO CREDIT_CARDS
(Card_Num, Expiry_date, Type, CVV)
VALUES
('1111222233334444', '2029-12-01', 'VISA', '123'),
('5555666677778888', '2028-06-01', 'MasterCard', '456'),
('9999000011112222', '2030-01-01', 'AmericanExpress', '789');


INSERT INTO OWNS (User_ID, Card_Num)
VALUES
(104, '1111222233334444'),
(105, '5555666677778888'),
(106, '9999000011112222');


-- =====================================================
-- TOURS
-- =====================================================

INSERT INTO TOURS
(
    Tour_ID,
    Title,
    Tour_Type,
    Price,
    Duration,
    Accessibility,
    Description,
    Max_Participants,
    Destination,
    User_ID
)
VALUES
(
    501,
    'Louvre Museum Private Tour',
    'Museum Tour',
    250.00,
    3,
    'Wheelchair accessible',
    'Private guided tour of the Louvre Museum.',
    10,
    1,
    101
),
(
    502,
    'Parisian Wine & Cheese Tasting',
    'Culinary Tour',
    180.00,
    2,
    'Limited accessibility',
    'Food experience featuring local wine and cheese.',
    12,
    1,
    101
),
(
    503,
    'Tokyo Hidden Street Food Tour',
    'Culinary Tour',
    120.00,
    4,
    'Walking required',
    'Guided street food experience through Tokyo.',
    15,
    2,
    102
),
(
    504,
    'Ancient Rome & Colosseum Walk',
    'Historical Tour',
    210.00,
    5,
    'Walking required',
    'Historical walking tour of Ancient Rome.',
    12,
    3,
    103
);


-- =====================================================
-- TOUR CATEGORIES
-- =====================================================

INSERT INTO TOUR_CATEGORIES (Tour_ID, Category)
VALUES
(501, 'Museum'),
(502, 'Food'),
(503, 'Food'),
(504, 'History');


-- =====================================================
-- BOOKINGS
-- =====================================================

INSERT INTO BOOKINGS
(
    Booking_Num,
    TourDate,
    Participants,
    Special_Requests,
    Booking_Date,
    Tour_Time,
    Meeting_Point,
    Tour_ID,
    User_ID,
    Card_Num
)
VALUES
(
    9001,
    '2026-07-15',
    2,
    'One participant is vegetarian',
    '2026-06-10',
    '10:00',
    'Louvre Main Entrance',
    502,
    104,
    '1111222233334444'
),
(
    9002,
    '2026-08-20',
    4,
    'No special requests',
    '2026-06-15',
    '12:00',
    'Shibuya Station',
    503,
    105,
    '5555666677778888'
),
(
    9003,
    '2026-09-10',
    1,
    'Needs wheelchair accessibility',
    '2026-06-20',
    '09:00',
    'Colosseum Entrance',
    504,
    106,
    '9999000011112222'
);


-- =====================================================
-- REVIEWS
-- =====================================================

INSERT INTO REVIEWS
(Booking_Num, Review_Num, Rating, Comment)
VALUES
(9001, 1, 5, 'Amazing experience! The wine selection was outstanding.'),
(9002, 1, 4, 'Great food and a very enjoyable tour.'),
(9003, 1, 5, 'Unforgettable experience in Rome. Highly recommended!');


-- =====================================================
-- SEARCHES
-- =====================================================

INSERT INTO SEARCHES
(Search_ID, Search_Date, Country, City, Tour_Type, User_ID)
VALUES
(1001, '2026-05-20', 'France', 'Paris', 'Culinary Tour', 104),
(1002, '2026-05-25', 'Japan', 'Tokyo', 'Culinary Tour', 105),
(1003, '2026-06-01', 'Italy', 'Rome', 'Historical Tour', 106);

GO
