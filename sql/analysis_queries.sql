-- ToursByLocals - Analytical SQL Queries
-- Examples of SQL queries used to analyze bookings,
-- guides, tours, revenue and customer activity.


-- =====================================================
-- Query 1: Bookings for tours in France
-- Business purpose:
-- Analyze tourism activity for a specific destination.
-- =====================================================

SELECT
    B.Booking_Num,
    U.Name AS Traveller_Name,
    T.Title AS Tour_Title,
    D.Country,
    D.City,
    B.TourDate,
    B.Participants
FROM BOOKINGS AS B
JOIN TOURS AS T
    ON B.Tour_ID = T.Tour_ID
JOIN DESTINATIONS AS D
    ON T.Destination = D.Destination
JOIN USERS AS U
    ON B.User_ID = U.User_ID
WHERE D.Country = 'France'
ORDER BY B.TourDate;


-- =====================================================
-- Query 2: Active guides with at least one booking
-- Business purpose:
-- Identify active guides and evaluate booking activity.
-- =====================================================

SELECT
    U.Name AS Guide_Name,
    COUNT(B.Booking_Num) AS Total_Bookings
FROM USERS AS U
JOIN GUIDES AS G
    ON U.User_ID = G.User_ID
JOIN TOURS AS T
    ON G.User_ID = T.User_ID
JOIN BOOKINGS AS B
    ON T.Tour_ID = B.Tour_ID
WHERE B.TourDate >= '2026-01-01'
GROUP BY U.Name
HAVING COUNT(B.Booking_Num) >= 1
ORDER BY Total_Bookings DESC;


-- =====================================================
-- Query 3: Tours priced above the average
-- Business purpose:
-- Identify premium tours priced above the platform average.
-- =====================================================

SELECT
    T.Tour_ID,
    T.Title AS Tour_Title,
    T.Tour_Type,
    D.Country,
    D.City,
    T.Price
FROM TOURS AS T
JOIN DESTINATIONS AS D
    ON T.Destination = D.Destination
WHERE T.Price >
(
    SELECT AVG(Price)
    FROM TOURS
)
ORDER BY T.Price DESC;


-- =====================================================
-- Query 4: Guide ranking by bookings and revenue
-- Business purpose:
-- Compare guide performance based on booking volume
-- and generated revenue.
-- =====================================================

SELECT
    U.Name AS Guide_Name,
    COUNT(B.Booking_Num) AS Total_Bookings,
    SUM(T.Price * B.Participants) AS Total_Revenue,
    RANK() OVER (
        ORDER BY COUNT(B.Booking_Num) DESC
    ) AS Booking_Rank,
    DENSE_RANK() OVER (
        ORDER BY SUM(T.Price * B.Participants) DESC
    ) AS Revenue_Rank
FROM USERS AS U
JOIN GUIDES AS G
    ON U.User_ID = G.User_ID
JOIN TOURS AS T
    ON G.User_ID = T.User_ID
JOIN BOOKINGS AS B
    ON T.Tour_ID = B.Tour_ID
GROUP BY U.Name
ORDER BY Booking_Rank;


-- =====================================================
-- Query 5: Booking activity over time
-- Business purpose:
-- Analyze the time gaps between consecutive bookings.
-- =====================================================

SELECT
    B.Booking_Num,
    U.Name AS Traveller_Name,
    B.TourDate,
    LAG(B.TourDate) OVER (
        ORDER BY B.TourDate
    ) AS Previous_Booking,
    LEAD(B.TourDate) OVER (
        ORDER BY B.TourDate
    ) AS Next_Booking,
    DATEDIFF(
        DAY,
        LAG(B.TourDate) OVER (ORDER BY B.TourDate),
        B.TourDate
    ) AS Days_From_Previous,
    DATEDIFF(
        DAY,
        B.TourDate,
        LEAD(B.TourDate) OVER (ORDER BY B.TourDate)
    ) AS Days_To_Next
FROM BOOKINGS AS B
JOIN USERS AS U
    ON B.User_ID = U.User_ID
ORDER BY B.TourDate;
