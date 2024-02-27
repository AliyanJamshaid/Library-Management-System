CREATE DATABASE LMS;
USE LMS;

-- structure of the tables.

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
	BooksWritten INT
);

-- Publishers Table
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL,
	BooksPublished INT
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    Status VARCHAR(40),
    PurchaseDate DATE,
	Stock Int,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
ALTER TABLE Books
ADD Stock INT;
-- Members Table
CREATE TABLE Members (
    MemberID VARCHAR(12) PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL,
	Address VARCHAR(255),
	PhoneNo VARCHAR(100),
	DOB DATE,
	JoiningDate DATE,
	IsFined BIT NOT NULL DEFAULT 0,
);


-- Fines Table
CREATE TABLE Fines (
    FineID INT PRIMARY KEY identity(1,1),
    MemberID VARCHAR(12),
    Amount DECIMAL(10, 2) NOT NULL,
    DueDate DATE NOT NULL,
    IsPaid BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

drop table fines
--  Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL,
	Address VARCHAR(255),
	PhoneNo VARCHAR(100),
	DOB DATE,
	HireDate DATE,
);

-- BorrowBooks Table
CREATE TABLE BorrowBooks (
    BorrowID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    StaffID INT,
    MemberID VARCHAR(12),
    IssueDate DATE,
	ReturnDate DATE,
	ReturnStatus BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    StaffID INT,
    OrderDate DATE,
	NoOfBooks INT,
	Price DECIMAL(10,2),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


-- structure of the inserting data in the  tables.

-- Inserting data into the Members table
INSERT INTO Members
VALUES
    ('FA21-BCE-002', 'HAMZA UMER', 'FA21-BCE-002@cuilahore.edu.pk', 'House No. 23, Street 5, G-7/2, Islamabad, ICT, Pakistan', '+92 300 1234567', '2000-01-05', '2022-09-12', 0), 
    ('FA21-BCE-006', 'QAMAR MOEEN', 'FA21-BCE-006@cuilahore.edu.pk', 'Flat No. 12, Al-Karam Square, Clifton, Karachi, Sindh, Pakistan', '+92 302 3456789', '2000-05-18', '2022-11-18', 0),
    ('FA21-BCE-008', 'RAFEY MAHMOOD', 'FA21-BCE-008@cuilahore.edu.pk', '87, Officers Colony, Chaklala, Rawalpindi, Punjab, Pakistan', '+92 303 4567890', '2000-07-22', '2022-12-02', 0),
    ('FA21-BCE-010', 'HASSAAN MALIK', 'FA21-BCE-010@cuilahore.edu.pk', '15-A, Model Town, Faisalabad, Punjab, Pakistan', '+92 304 5678901', '2000-09-30', '2023-01-15', 0),
    ('FA21-BCE-012', 'MUHAMMAD ALI HAIDER', 'FA21-BCE-012@cuilahore.edu.pk', 'House No. 31, Gulshan Colony, Multan, Punjab, Pakistan', '+92 305 6789012', '2001-02-08', '2023-02-09', 0),
    ('FA21-BCE-014', 'MUHAMMAD UMER RIAZ', 'FA21-BCE-014@cuilahore.edu.pk', 'Apartment 3B, Peshawar Towers, University Road, Peshawar, Khyber Pakhtunkhwa, Pakistan', '+92 306 7890123', '2001-04-15', '2023-03-24', 0),
    ('FA21-BCE-016', 'MUHAMMAD SAAD SHAFIQ', 'FA21-BCE-016@cuilahore.edu.pk', 'Street No. 15, Quetta Housing Society, Quetta, Balochistan, Pakistan', '+92 307 8901234', '2001-06-21', '2023-04-11', 0),
    ('FA21-BCE-018', 'MANAHIL KHAN', 'FA21-BCE-018@cuilahore.edu.pk', '56-C, Sialkot Cantt, Sialkot, Punjab, Pakistan', '+92 308 9012345', '2001-08-27', '2023-05-28', 0),
    ('FA21-BCE-022', 'ABDUL SABOOR', 'FA21-BCE-022@cuilahore.edu.pk', '22-D, Jalalabad Housing Scheme, Abbottabad, Khyber Pakhtunkhwa, Pakistan', '+92 310 1234567', '2002-01-11', '2023-07-02', 0),
    ('FA21-BCE-028', 'SAAD GHULAM RASOOL', 'FA21-BCE-028@cuilahore.edu.pk', '3rd Floor, Al-Madina Heights, Rahim Yar Khan, Punjab, Pakistan', '+92 313 4567890', '2002-07-29', '2023-10-08', 0),
    ('FA21-BCE-030', 'AHSAN JAVED', 'FA21-BCE-030@cuilahore.edu.pk', 'Street No. 8, Satellite Town, Jhang, Punjab, Pakistan', '+92 314 5678901', '2002-09-06', '2023-11-01', 0),
    ('FA21-BCE-032', 'FATIMA SAQIB', 'FA21-BCE-032@cuilahore.edu.pk', '112, Sheikhupura Housing Society, Sheikhupura, Punjab, Pakistan', '+92 315 6789012', '2002-11-12', '2023-12-09', 0),
    ('FA21-BCE-034', 'YAMNA REHMAN', 'FA21-BCE-034@cuilahore.edu.pk', 'House No. 14, Block C, Mehran Housing Society, Mirpur Khas, Sindh, Pakistan', '+92 316 7890123', '2003-02-18', '2023-12-15', 0),
    ('FA21-BCE-040', 'ABDUL MOEEZ', 'FA21-BCE-040@cuilahore.edu.pk', '17-B, Sahiwal Gardens, Sahiwal, Punjab, Pakistan', '+92 319 0123456', '2003-08-07', '2022-11-18', 0),
    ('FA21-BCE-042', 'ALIYAN JAMSHAID', 'FA21-BCE-042@cuilahore.edu.pk', '9th Floor, Ocean View Apartments, Clifton, Karachi, Sindh, Pakistan', '+92 320 1234567', '2000-02-04', '2022-12-02', 0);


    -- Insert sample data
INSERT INTO Authors
 VALUES
(1, 'J.K. Rowling', 7),
(2, 'George R.R. Martin', 5),
(3, 'Haruki Murakami', 14),
(4, 'Stephen King', 61),
(5, 'J.R.R. Tolkien', 12),
(6, 'Agatha Christie', 66),
(7, 'Jane Austen', 6),
(8, 'Ernest Hemingway', 10),
(9, 'Gabriel Garcia Marquez', 12),
(10, 'Toni Morrison', 11);

-- Insert sample data for Publishers
INSERT INTO Publishers 
 VALUES
(1, 'Publisher Alpha', 30),    
(2, 'Publisher Beta', 18),     
(3, 'Publisher Gamma', 45),    
(4, 'Publisher Delta', 12),    
(5, 'Publisher Epsilon', 27),  
(6, 'Publisher Zeta', 22),     
(7, 'Publisher Eta', 35),      
(8, 'Publisher Theta', 16),    
(9, 'Publisher Iota', 20),     
(10, 'Publisher Kappa', 28);  


-- Insert sample data for Categories
INSERT INTO Categories
 VALUES
(1, 'Fiction'),
(2, 'Mystery'),
(3, 'Science Fiction'),
(4, 'Fantasy'),
(5, 'Romance'),
(6, 'Thriller'),
(7, 'Non-Fiction'),
(8, 'Biography'),
(9, 'Historical Fiction'),
(10, 'Self-Help');

-- Insert sample data for Books
INSERT INTO Books 
 VALUES
(1, 'The Hobbit', 5, 1, 4, 'Available', '2023-01-01'),
(2, 'To Kill a Mockingbird', 7, 4, 1, 'Checked Out', '2023-02-15'),
(3, '1984', 3, 2, 3, 'Available', '2023-03-20'),
(4, 'Pride and Prejudice', 7, 1, 5, 'Available', '2023-04-10'),
(5, 'The Da Vinci Code', 6, 3, 6, 'Checked Out', '2023-05-05'),
(6, 'The Great Gatsby', 8, 1, 1, 'Available', '2023-06-12'),
(7, 'One Hundred Years of Solitude', 9, 5, 7, 'Available', '2023-07-08'),
(8, 'The Catcher in the Rye', 8, 2, 1, 'Checked Out', '2023-08-22'),
(9, 'The Girl on the Train', 2, 4, 2, 'Available', '2023-09-17');

-- Insert sample data for Staff with Pakistani names and addresses
INSERT INTO Staff VALUES
(1, 'Ali Khan', 'ali.khan@example.com', 'House No. 123, Street 5, Gulberg, Lahore', '555-1234', '1990-05-15', '2022-01-10'),
(2, 'Ayesha Ahmed', 'ayesha.ahmed@example.com', 'Apartment 456, Phase 2, DHA, Karachi', '555-5678', '1985-08-22', '2022-03-05'),
(3, 'Muhammad Iqbal', 'muhammad.iqbal@example.com', 'Flat No. 789, Model Town, Islamabad', '555-9876', '1993-02-28', '2022-05-20'),
(4, 'Saba Farooq', 'saba.farooq@example.com', 'Street 101, F-8, Blue Area, Rawalpindi', '555-4321', '1988-11-10', '2022-07-15'),
(5, 'Imran Malik', 'imran.malik@example.com', 'House No. 202, Johar Town, Lahore', '555-8765', '1995-04-03', '2022-09-08'),
(6, 'Fatima Abbas', 'fatima.abbas@example.com', 'Plot No. 303, Sector G-9, Islamabad', '555-1111', '1992-07-18', '2022-11-12'),
(7, 'Saad Hassan', 'saad.hassan@example.com', 'House No. 505, Block C, Gulshan-e-Iqbal, Karachi', '555-2222', '1991-01-25', '2023-01-15'),
(8, 'Nadia Ali', 'nadia.ali@example.com', 'Apartment 707, Clifton, Karachi', '555-3333', '1987-04-30', '2023-03-20'),
(9, 'Ahmed Raza', 'ahmed.raza@example.com', 'Street 404, Satellite Town, Rawalpindi', '555-4444', '1994-09-05', '2023-05-25'),
(10, 'Saima Malik', 'saima.malik@example.com', 'House No. 606, Phase 4, Bahria Town, Lahore', '555-5555', '1989-12-12', '2023-07-30');


-- Insert sample data for BorrowBooks
INSERT INTO BorrowBooks 
 VALUES
(1, 1, 1, 'FA21-BCE-002', '2023-01-10', '2023-02-10', 1),
(2, 3, 2, 'FA21-BCE-016', '2023-03-05', '2023-04-05', 1),
(3, 5, 3, 'FA21-BCE-006', '2023-05-20', '2023-06-20', 1),
(4, 7, 4, 'FA21-BCE-008', '2023-07-15', '2023-08-15', 0),
(5, 9, 5, 'FA21-BCE-010', '2023-09-08', '2023-10-08', 0),
(6, 2, 1, 'FA21-BCE-012', '2023-11-12', '2023-12-12', 1),
(7, 8, 2, 'FA21-BCE-014', '2024-01-15', '2024-02-15', 0),
(8, 9, 3, 'FA21-BCE-016', '2024-03-20', '2024-04-20', 1),
(9, 7, 4, 'FA21-BCE-028', '2024-05-25', '2024-06-25', 0),
(10,3, 5, 'FA21-BCE-042', '2024-07-30', '2024-08-30', 0);


-- Insert sample data for Fines
INSERT INTO Fines  VALUES
(1, 'FA21-BCE-002', 15.00, '2023-02-10', 1),
(2, 'FA21-BCE-016', 20.50, '2023-04-05', 1),
(3, 'FA21-BCE-006', 10.00, '2023-06-20', 0),
(4, 'FA21-BCE-008', 5.75, '2023-08-15', 0),
(5, 'FA21-BCE-010', 30.25, '2023-10-08', 0),
(6, 'FA21-BCE-012', 12.50, '2023-12-12', 1),
(7, 'FA21-BCE-014', 18.75, '2024-02-15', 0),
(8, 'FA21-BCE-016', 25.30, '2024-04-20', 1),
(9, 'FA21-BCE-028', 15.00, '2024-06-25', 0),
(10, 'FA21-BCE-042', 20.50, '2024-08-30', 0);


-- Insert sample data for Orders
INSERT INTO Orders
 VALUES
(1, 1, '2023-01-15', 5, 120.00),
(2, 2, '2023-02-20', 3, 75.50),
(3, 3, '2023-03-25', 8, 200.00),
(4, 4, '2023-04-10', 2, 45.75),
(5, 5, '2023-05-05', 6, 150.25),
(6, 1, '2023-06-12', 4, 100.50),
(7, 2, '2023-07-08', 7, 175.75),
(8, 3, '2023-08-22', 1, 25.30),
(9, 4, '2023-09-17', 3, 70.00),
(10, 5, '2023-10-30', 5, 120.50);

-----TRIGGERS----------------------------------------------------------------------------------------------------------------------------
-- Create a trigger to update book status based on stock level
CREATE TRIGGER UpdateBookStatus
ON Books
AFTER UPDATE
AS
BEGIN
    DECLARE @BookID INT, @Stock INT;

    SELECT @BookID = BookID, @Stock = Stock
    FROM INSERTED;

    IF @Stock = 0
    BEGIN
        -- If stock is 0, set book status to unavailable
        UPDATE Books
        SET Status = 'Unavailable'
        WHERE BookID = @BookID;
    END
    ELSE
    BEGIN
        -- If stock is greater than 0, set book status to available
        UPDATE Books
        SET Status = 'Available'
        WHERE BookID = @BookID;
    END
END;
----------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------------------

-- Authors Table
SELECT * FROM Authors;

-- Publishers Table
SELECT * FROM Publishers;

-- Categories Table
SELECT * FROM Categories;

-- Books Table
SELECT * FROM Books;

-- Members Table
SELECT * FROM Members;

-- Fines Table
SELECT * FROM Fines;

-- Staff Table
SELECT * FROM Staff;

-- BorrowBooks Table
SELECT * FROM BorrowBooks;

-- Orders Table
SELECT * FROM Orders;
---------------------------------------------------------------------------------------------------

CREATE PROCEDURE AddBorrowedBook
    @BookID INT,
    @StaffID INT,
    @MemberID VARCHAR(12)
AS
BEGIN
    DECLARE @IssueDate DATE = GETDATE();
    DECLARE @ReturnDate DATE = DATEADD(DAY, 7, @IssueDate);

    -- Check if the stock is greater than 0 before updating
    IF EXISTS (SELECT 1 FROM Books WHERE BookID = @BookID AND Stock > 0)
    BEGIN
        -- Update Stock in Books table
        UPDATE Books
        SET Stock = Stock - 1
        WHERE BookID = @BookID;

        -- Insert into BorrowBooks table
        INSERT INTO BorrowBooks (BookID, StaffID, MemberID, IssueDate, ReturnDate)
        VALUES (@BookID, @StaffID, @MemberID, @IssueDate, @ReturnDate);
    END
    ELSE
    BEGIN
        -- Handle the case where stock is 0 (book not available)
        PRINT 'Book not available for borrowing. Stock is zero.';
    END
END;

DROP PROCEDURE AddBorrowedBook
EXEC AddBorrowedBook 
    @BookID = 1,
    @StaffID = 1,
    @MemberID = 'FA21-BCE-002';

SELECT * FROM BorrowBooks;
SELECT * FROM Books;
-----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE ReturnBorrowedBook
    @BorrowID INT
AS
BEGIN
    -- Check if the book is borrowed (ReturnStatus is false)
    IF EXISTS (SELECT 1 FROM BorrowBooks WHERE BorrowID = @BorrowID AND ReturnStatus = 0)
    BEGIN
        -- Update Stock in Books table
        UPDATE Books
        SET Stock = Stock + 1
        WHERE BookID = (SELECT BookID FROM BorrowBooks WHERE BorrowID = @BorrowID);

        -- Update ReturnStatus in BorrowBooks table
        UPDATE BorrowBooks
        SET ReturnStatus = 1
        WHERE BorrowID = @BorrowID;

        PRINT 'Book returned successfully.';
    END
    ELSE
    BEGIN
        -- Handle the case where the book is not borrowed or already returned
        PRINT 'Book is not borrowed or has already been returned.';
    END
END;

EXEC ReturnBorrowedBook @BorrowID = 1;
SELECT * FROM BorrowBooks;
SELECT * FROM Books;
-------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE AddFixedFinesAndUpdateMembers
AS
BEGIN
    -- Set the fixed fine amount
    DECLARE @FixedFineAmount DECIMAL(10, 2)
    SET @FixedFineAmount = 20.00

    -- Insert fixed fines for overdue books
    INSERT INTO Fines (MemberID, Amount, DueDate)
    SELECT 
        bb.MemberID,
        @FixedFineAmount AS Amount,
        GETDATE() AS DueDate
    FROM 
        BorrowBooks bb
    WHERE 
        bb.ReturnStatus = 0; -- Not returned

    -- Update Members table and set IsFined to true
    UPDATE Members
    SET IsFined = 1
    WHERE MemberID IN (SELECT MemberID FROM Fines WHERE IsPaid = 0);
END;
----------------------------------------------------------------------------------------------------------------------
INSERT INTO BorrowBooks 
VALUES
( 6, 6, 'FA21-BCE-014', '2023-12-01', '2020-12-31', 0),
(2, 7, 'FA21-BCE-008', '2023-12-05', '2020-01-05', 0),
(4, 8, 'FA21-BCE-016', '2023-11-15', '2020-12-15', 0),
(8, 9, 'FA21-BCE-028', '2023-12-20', '2020-01-20', 0),
(10, 10, 'FA21-BCE-042', '2024-01-02', '2020-02-02', 0);
EXEC AddFixedFinesAndUpdateMembers;
select * from members
select * from fines
------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE MarkFineAsPaid
    @FineID INT
AS
BEGIN
    -- Update Fines table and set IsPaid to true for the specified FineID
    UPDATE Fines
    SET IsPaid = 1
    WHERE FineID = @FineID;

    -- Update Members table and set IsFined to false for the corresponding MemberID
    UPDATE Members
    SET IsFined = 0
    WHERE MemberID = (SELECT MemberID FROM Fines WHERE FineID = @FineID);
END;

EXEC MarkFineAsPaid @FineID = 1; 
-------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE IncreaseStock
    @BookID INT,
    @NoOfBooksToAdd INT
AS
BEGIN
    -- Check if the book exists
    IF EXISTS (SELECT 1 FROM Books WHERE BookID = @BookID)
    BEGIN
        -- Increase Stock in Books table
        UPDATE Books
        SET Stock = Stock + @NoOfBooksToAdd
        WHERE BookID = @BookID;

        PRINT 'Stock increased successfully.';
    END
    ELSE
    BEGIN
        -- Handle the case where the book does not exist
        PRINT 'Book does not exist.';
    END
END;
EXEC IncreaseStock @BookID = 1, @NoOfBooksToAdd = 5;
select * from Books
----------------------------------------------------------------------------------------------------
CREATE PROCEDURE DecreaseStock
    @BookID INT,
    @NoOfBooksToRemove INT
AS
BEGIN
    -- Check if the book exists
    IF EXISTS (SELECT 1 FROM Books WHERE BookID = @BookID)
    BEGIN
        -- Check if there are enough books in stock to remove
        IF (SELECT Stock FROM Books WHERE BookID = @BookID) >= @NoOfBooksToRemove
        BEGIN
            -- Decrease Stock in Books table
            UPDATE Books
            SET Stock = Stock - @NoOfBooksToRemove
            WHERE BookID = @BookID;

            PRINT 'Stock decreased successfully.';
        END
        ELSE
        BEGIN
            -- Handle the case where there are not enough books in stock
            PRINT 'Not enough books in stock to remove.';
        END
    END
    ELSE
    BEGIN
        -- Handle the case where the book does not exist
        PRINT 'Book does not exist.';
    END
END;

EXEC DecreaseStock @BookID = 1, @NoOfBooksToRemove = 3;
select * from Books
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE GetTopBorrowersAndStaff
    @TopMembersCount INT,
    @TopStaffCount INT
AS
BEGIN
    -- Get top members who borrowed the most books
    SELECT TOP (@TopMembersCount) 
        m.MemberID,
        m.MemberName,
        COUNT(*) AS TotalBooksBorrowed
    FROM BorrowBooks bb
    JOIN Members m ON bb.MemberID = m.MemberID
    GROUP BY m.MemberID, m.MemberName
    ORDER BY TotalBooksBorrowed DESC;

    -- Get staff members who gave away the most books
    SELECT TOP (@TopStaffCount) 
        s.StaffID,
        s.StaffName,
        COUNT(*) AS TotalBooksIssued
    FROM BorrowBooks bb
    JOIN Staff s ON bb.StaffID = s.StaffID
    GROUP BY s.StaffID, s.StaffName
    ORDER BY TotalBooksIssued DESC;
END;
EXEC GetTopBorrowersAndStaff @TopMembersCount = 5, @TopStaffCount = 3;
---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertMember
    @MemberID VARCHAR(12),
    @MemberName VARCHAR(100),
    @Email VARCHAR(255),
    @Address VARCHAR(255),
    @PhoneNo VARCHAR(100),
    @DOB DATE
AS
BEGIN
    DECLARE @JoiningDate DATE = GETDATE();

    INSERT INTO Members (MemberID, MemberName, Email, Address, PhoneNo, DOB, JoiningDate)
    VALUES (@MemberID, @MemberName, @Email, @Address, @PhoneNo, @DOB, @JoiningDate);
END;
drop procedure InsertMember
EXEC InsertMember
    @MemberID = 'FA22-BCS-016',
    @MemberName = 'ABDUL REHMAN',
    @Email = 'abdulrehman@gmail',
    @Address = 'pakistan',
    @PhoneNo = '12345678',
    @DOB = '2020-10-10'
	
SELECT * FROM MEMBERS WHERE MemberID = 'FA22-BCS-016'
---------------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertBook
    @BookID INT,
    @Title VARCHAR(255),
    @AuthorID INT,
    @PublisherID INT,
    @CategoryID INT,
    @Status VARCHAR(40),
    @PurchaseDate DATE,
    @Stock INT
AS
BEGIN
    INSERT INTO Books (BookID, Title, AuthorID, PublisherID, CategoryID, Status, PurchaseDate, Stock)
    VALUES (@BookID, @Title, @AuthorID, @PublisherID, @CategoryID, @Status, @PurchaseDate, @Stock);
END;* 
EXEC InsertBook
    @BookID = 20,
    @Title = 'Sample Book',
    @AuthorID = 4,
    @PublisherID = 4,
    @CategoryID = 4,
    @Status = 'Available',
    @PurchaseDate = '2023-01-01',
    @Stock = 20;
select * from books where bookid=20
----------------------------------------------------------------------------------------------------
CREATE PROCEDURE InsertStaff
    @StaffID INT,
    @StaffName VARCHAR(100),
    @Email VARCHAR(255),
    @Address VARCHAR(255),
    @PhoneNo VARCHAR(100),
    @DOB DATE,
    @HireDate DATE
AS
BEGIN
    INSERT INTO Staff (StaffID, StaffName, Email, Address, PhoneNo, DOB, HireDate)
    VALUES (@StaffID, @StaffName, @Email, @Address, @PhoneNo, @DOB, @HireDate);
END; 
-- Example usage of the InsertStaff stored procedure
EXEC InsertStaff
    @StaffID = 20,
    @StaffName = 'John Doe',
    @Email = 'john.doe@example.com',
    @Address = '123 Main Street, Cityville',
    @PhoneNo = '555-1234',
    @DOB = '1990-01-15',
    @HireDate = '2022-05-01';

select * from staff where staffid =20


-----------------------------views----------------------------------------------------------------
CREATE VIEW BooksNoBorrowersView
AS
SELECT Books.BookID, Title
FROM Books
LEFT JOIN BorrowBooks ON Books.BookID = BorrowBooks.BookID
WHERE BorrowBooks.BookID IS NULL;
SELECT * FROM BooksNoBorrowersView;

CREATE VIEW BooksInfoView
AS
SELECT
    B.BookID,
    B.Title,
    A.AuthorName,
    P.PublisherName,
    C.CategoryName,
    B.Status,
    B.PurchaseDate,
    B.Stock
FROM
    Books B
    INNER JOIN Authors A ON B.AuthorID = A.AuthorID
    INNER JOIN Publishers P ON B.PublisherID = P.PublisherID
    INNER JOIN Categories C ON B.CategoryID = C.CategoryID;


CREATE VIEW MemberBorrowDetails AS
SELECT
    m.MemberID,m.MemberName,m.Email,m.Address,m.PhoneNo,
    bb.IssueDate AS BorrowDate,bb.ReturnDate AS DueDate, bb.ReturnStatus,
    f.Amount AS FineAmount,f.DueDate AS FineDueDate, f.IsPaid AS FinePaid
FROM Members m
LEFT JOIN BorrowBooks bb ON m.MemberID = bb.MemberID
LEFT JOIN Fines f ON m.MemberID = f.MemberID;

CREATE VIEW StaffOrderSummary AS
SELECT s.StaffID,s.StaffName,s.Email,s.Address,s.PhoneNo,o.OrderDate,
o.NoOfBooks, o.Price
FROM Staff s
LEFT JOIN Orders o ON s.StaffID = o.StaffID;


CREATE VIEW StaffOrderSummary AS
SELECT s.StaffID,s.StaffName,s.Email,s.Address,s.PhoneNo,o.OrderDate,
o.NoOfBooks, o.Price
FROM Staff s
LEFT JOIN Orders o ON s.StaffID = o.StaffID;


CREATE VIEW TotalFinesCollected AS
SELECT SUM(Amount) AS TotalFines
FROM Fines
WHERE IsPaid = 1; 
select * from TotalFinesCollected


CREATE VIEW LowStockBooks AS
SELECT
    b.BookID,
    b.Title,
    b.Stock
FROM Books b
WHERE
    b.Stock < 10; 

select * from LowStockBooks

CREATE VIEW GroupedMembers AS
SELECT
    LEFT(MemberID, 8) AS MemberIDPrefix,
    COUNT(MemberID) AS GroupCount
FROM
    Members
GROUP BY
    LEFT(MemberID, 8);

CREATE VIEW BorrowedBooksDetails AS
SELECT
    bb.BorrowID, b.Title AS BookTitle, a.AuthorName,
    p.PublisherName c.CategoryName,bb.IssueDate, bb.ReturnDate,
    m.MemberID, m.MemberName AS MemberName,
    s.StaffID,
    s.StaffName AS StaffName,
    bb.ReturnStatus
FROM
    BorrowBooks bb
    JOIN Books b ON bb.BookID = b.BookID
    JOIN Authors a ON b.AuthorID = a.AuthorID
    JOIN Publishers p ON b.PublisherID = p.PublisherID
    JOIN Categories c ON b.CategoryID = c.CategoryID
    JOIN Members m ON bb.MemberID = m.MemberID
    JOIN Staff s ON bb.StaffID = s.StaffID;

select * from BorrowedBooksDetails


CREATE VIEW PublisherBookCounts AS
SELECT
    p.PublisherID,
    p.PublisherName,
    ISNULL(b.TotalBooksPublished, 0) AS TotalBooksPublished
FROM
    Publishers p
LEFT JOIN (
    SELECT
        PublisherID,
        COUNT(*) AS TotalBooksPublished
    FROM
        Books
    GROUP BY
        PublisherID
) b ON p.PublisherID = b.PublisherID;
select * from BorrowedBooksDetails
























