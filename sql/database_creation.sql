-- ToursByLocals Database Schema
-- Final database structure used in the project

DROP TABLE IF EXISTS SEARCHES;
DROP TABLE IF EXISTS REVIEWS;
DROP TABLE IF EXISTS BOOKINGS;
DROP TABLE IF EXISTS TOUR_CATEGORIES;
DROP TABLE IF EXISTS TOURS;
DROP TABLE IF EXISTS OWNS;
DROP TABLE IF EXISTS TRAVELLERS;
DROP TABLE IF EXISTS GUIDE_LANGUAGES;
DROP TABLE IF EXISTS GUIDES;
DROP TABLE IF EXISTS CREDIT_CARDS;
DROP TABLE IF EXISTS DESTINATIONS;
DROP TABLE IF EXISTS USERS;
GO


-- =====================================================
-- USERS
-- =====================================================

CREATE TABLE USERS (
    User_ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,

    CONSTRAINT PK_USERS PRIMARY KEY (User_ID),
    CONSTRAINT CK_USERS_EMAIL CHECK (Email LIKE '%@%.%')
);


-- =====================================================
-- DESTINATIONS
-- =====================================================

CREATE TABLE DESTINATIONS (
    Destination INT NOT NULL,
    Destination_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(40) NOT NULL,
    City VARCHAR(40) NOT NULL,

    CONSTRAINT PK_DESTINATIONS PRIMARY KEY (Destination)
);


-- =====================================================
-- CREDIT CARDS
-- =====================================================

CREATE TABLE CREDIT_CARDS (
    Card_Num VARCHAR(16) NOT NULL,
    Expiry_date DATE NOT NULL,
    Type VARCHAR(20) NOT NULL,
    CVV VARCHAR(4) NOT NULL,

    CONSTRAINT PK_CREDIT_CARDS PRIMARY KEY (Card_Num)
);


-- =====================================================
-- GUIDES
-- =====================================================

CREATE TABLE GUIDES (
    User_ID INT NOT NULL,
    Years_of_experience INT NOT NULL,
    Bio VARCHAR(255) NULL,

    CONSTRAINT PK_GUIDES PRIMARY KEY (User_ID),

    CONSTRAINT FK_GUIDES_USERS
        FOREIGN KEY (User_ID)
        REFERENCES USERS(User_ID),

    CONSTRAINT CK_Guides_Experience
        CHECK (Years_of_experience >= 0)
);


-- =====================================================
-- GUIDE LANGUAGES
-- =====================================================

CREATE TABLE GUIDE_LANGUAGES (
    User_ID INT NOT NULL,
    Language VARCHAR(30) NOT NULL,

    CONSTRAINT PK_GUIDE_LANGUAGES
        PRIMARY KEY (User_ID, Language),

    CONSTRAINT FK_GUIDE_LANGUAGES_GUIDES
        FOREIGN KEY (User_ID)
        REFERENCES GUIDES(User_ID)
);


-- =====================================================
-- TRAVELLERS
-- =====================================================

CREATE TABLE TRAVELLERS (
    User_ID INT NOT NULL,
    Emergency_contact VARCHAR(50) NOT NULL,
    Nationality VARCHAR(40) NOT NULL,

    CONSTRAINT PK_TRAVELLERS PRIMARY KEY (User_ID),

    CONSTRAINT FK_TRAVELLERS_USERS
        FOREIGN KEY (User_ID)
        REFERENCES USERS(User_ID)
);


-- =====================================================
-- CARD OWNERSHIP
-- =====================================================

CREATE TABLE OWNS (
    User_ID INT NOT NULL,
    Card_Num VARCHAR(16) NOT NULL,

    CONSTRAINT PK_OWNS
        PRIMARY KEY (User_ID, Card_Num),

    CONSTRAINT FK_OWNS_TRAVELLERS
        FOREIGN KEY (User_ID)
        REFERENCES TRAVELLERS(User_ID),

    CONSTRAINT FK_OWNS_CARDS
        FOREIGN KEY (Card_Num)
        REFERENCES CREDIT_CARDS(Card_Num)
);


-- =====================================================
-- TOURS
-- =====================================================

CREATE TABLE TOURS (
    Tour_ID INT NOT NULL,
    Title VARCHAR(80) NOT NULL,
    Tour_Type VARCHAR(30) NOT NULL,
    Price MONEY NOT NULL,
    Duration INT NOT NULL,

    Accessibility VARCHAR(100) NULL,
    Description VARCHAR(500) NULL,
    Max_Participants INT NOT NULL,

    Destination INT NOT NULL,
    User_ID INT NOT NULL,

    CONSTRAINT PK_TOURS PRIMARY KEY (Tour_ID),

    CONSTRAINT FK_TOURS_DESTINATIONS
        FOREIGN KEY (Destination)
        REFERENCES DESTINATIONS(Destination),

    CONSTRAINT FK_TOURS_GUIDES
        FOREIGN KEY (User_ID)
        REFERENCES GUIDES(User_ID),

    CONSTRAINT CK_TourPrice
        CHECK (Price > 0),

    CONSTRAINT CK_TourDuration
        CHECK (Duration > 0),

    CONSTRAINT CK_MaxParticipants
        CHECK (Max_Participants > 0)
);


-- =====================================================
-- TOUR CATEGORIES
-- =====================================================

CREATE TABLE TOUR_CATEGORIES (
    Tour_ID INT NOT NULL,
    Category VARCHAR(50) NOT NULL,

    CONSTRAINT PK_TOUR_CATEGORIES
        PRIMARY KEY (Tour_ID, Category),

    CONSTRAINT FK_TOUR_CATEGORIES_TOURS
        FOREIGN KEY (Tour_ID)
        REFERENCES TOURS(Tour_ID)
);


-- =====================================================
-- BOOKINGS
-- =====================================================

CREATE TABLE BOOKINGS (
    Booking_Num INT NOT NULL,
    TourDate DATE NOT NULL,
    Participants TINYINT NOT NULL,
    Special_Requests VARCHAR(255) NULL,

    Booking_Date DATE NOT NULL,
    Tour_Time TIME NOT NULL,
    Meeting_Point VARCHAR(255) NOT NULL,

    Tour_ID INT NOT NULL,
    User_ID INT NOT NULL,
    Card_Num VARCHAR(16) NOT NULL,

    CONSTRAINT PK_BOOKINGS PRIMARY KEY (Booking_Num),

    CONSTRAINT FK_BOOKINGS_TOURS
        FOREIGN KEY (Tour_ID)
        REFERENCES TOURS(Tour_ID),

    CONSTRAINT FK_BOOKINGS_TRAVELLERS
        FOREIGN KEY (User_ID)
        REFERENCES TRAVELLERS(User_ID),

    CONSTRAINT FK_BOOKINGS_CARDS
        FOREIGN KEY (Card_Num)
        REFERENCES CREDIT_CARDS(Card_Num),

    CONSTRAINT CK_BookingParticipants
        CHECK (Participants > 0)
);


-- =====================================================
-- REVIEWS
-- =====================================================

CREATE TABLE REVIEWS (
    Booking_Num INT NOT NULL,
    Review_Num INT NOT NULL,
    Rating TINYINT NOT NULL,
    Comment VARCHAR(255) NULL,

    CONSTRAINT PK_REVIEWS
        PRIMARY KEY (Booking_Num, Review_Num),

    CONSTRAINT FK_REVIEWS_BOOKINGS
        FOREIGN KEY (Booking_Num)
        REFERENCES BOOKINGS(Booking_Num),

    CONSTRAINT CK_REVIEWS_RATING
        CHECK (Rating BETWEEN 1 AND 5)
);


-- =====================================================
-- SEARCHES
-- =====================================================

CREATE TABLE SEARCHES (
    Search_ID INT NOT NULL,
    Search_Date DATE NOT NULL,
    Country VARCHAR(40) NULL,
    City VARCHAR(40) NULL,
    Tour_Type VARCHAR(30) NULL,
    User_ID INT NOT NULL,

    CONSTRAINT PK_SEARCHES PRIMARY KEY (Search_ID),

    CONSTRAINT FK_SEARCHES_TRAVELLERS
        FOREIGN KEY (User_ID)
        REFERENCES TRAVELLERS(User_ID)
);

GO
