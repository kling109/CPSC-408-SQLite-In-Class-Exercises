-- Question 1
-------------
-- Part 1
CREATE TABLE Player
(
    pID INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    teamName TEXT
);

-- Part 2
ALTER TABLE Player
ADD COLUMN age INTEGER;

-- Part 3
INSERT INTO Player
VALUES (1,'Player 1', 'Team A', 23);

INSERT INTO Player(pID, name, teamName)
VALUES (2,'Player 2','Team A');

INSERT INTO Player
VALUES (3,'Player 3','Team B',28);

INSERT INTO Player(pid, name, teamname)
VALUES (4,'Player 4','Team B');

-- Part 4
DELETE FROM Player
WHERE pID = 2;

-- Part 5
UPDATE Player
SET age = 25
WHERE age IS NULL;

-- Part 6
SELECT count(*), avg(age)
FROM Player;

-- Part 7
DROP TABLE Player;

-- Question 2
-------------
-- Part 8
SELECT avg(Total)
FROM Invoice
WHERE BillingCountry = 'Brazil';

-- Part 9
SELECT BillingCity, avg(Total) AverageBill
FROM Invoice
WHERE BillingCountry = 'Brazil'
GROUP BY BillingCity;

-- Part 10
SELECT Title
FROM Album
INNER JOIN Track T on Album.AlbumId = T.AlbumId
GROUP BY T.AlbumId
HAVING count(*) > 20;

-- Part 11
SELECT substr(InvoiceDate, 1, 4) Year, count(*) Invoices
FROM Invoice
WHERE substr(InvoiceDate, 1, 4) = '2010';

-- Part 12
SELECT BillingCountry, count(DISTINCT BillingCity) Districts
FROM Invoice
GROUP BY BillingCountry;

-- Part 13
SELECT A.Title AlbumName, T.Name TrackName, M.Name MediaType
FROM Album A
INNER JOIN Track T on A.AlbumId = T.AlbumId
INNER JOIN MediaType M on M.MediaTypeId = T.MediaTypeId
ORDER BY AlbumName;

-- Part 14
SELECT count(*) JanePeacockSales
FROM Invoice
WHERE CustomerId IN
    (
    SELECT CustomerId
    FROM Customer
    INNER JOIN Employee E on E.EmployeeId = Customer.SupportRepId
    WHERE E.EmployeeId = 3
    );

-- Bonus
--------
SELECT sqrt(sum(xi)/N) stdev
FROM
(
    SELECT power((Total - mu), 2) xi, N
    FROM Invoice
    JOIN (
         SELECT count(*) N, avg(Total) mu FROM Invoice
         )
);

SELECT stdev(Total)
FROM Invoice;

-- Seems like there might be some slight disparity in rounding errors due to the
-- step-wise computation of the nested select statements.