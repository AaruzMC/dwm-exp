-- Create SalesTable
CREATE TABLE SalesTable (
    Date DATE,
    Product VARCHAR(50),
    Region VARCHAR(50),
    SalesAmount INT
);

-- Insert into SalesTable
INSERT INTO SalesTable (Date, Product, Region, SalesAmount)
VALUES
    ('2023-07-01', 'Product A', 'Region 1', 1000),
    ('2023-07-01', 'Product A', 'Region 2', 1500),
    ('2023-07-01', 'Product B', 'Region 1', 2000),
    ('2023-07-01', 'Product B', 'Region 2', 2500),
    ('2023-07-02', 'Product A', 'Region 1', 1200),
    ('2023-07-02', 'Product A', 'Region 2', 1800),
    ('2023-07-02', 'Product B', 'Region 1', 2200),
    ('2023-07-02', 'Product B', 'Region 2', 2700);

-- Create DateDimension
CREATE TABLE DateDimension (
    Date DATE PRIMARY KEY,
    Month VARCHAR(20),
    Quarter VARCHAR(5),
    Year INT
);

-- Insert into DateDimension
INSERT INTO DateDimension (Date, Month, Quarter, Year)
VALUES
    ('2023-07-01', 'July', 'Q3', 2023),
    ('2023-07-02', 'July', 'Q3', 2023);

-- Create ProductDimension
CREATE TABLE ProductDimension (
    Product VARCHAR(50) PRIMARY KEY,
    Category VARCHAR(50)
);

-- Insert into ProductDimension
INSERT INTO ProductDimension (Product, Category)
VALUES
    ('Product A', 'Category 1'),
    ('Product B', 'Category 2');

-- Create RegionDimension
CREATE TABLE RegionDimension (
    Region VARCHAR(50) PRIMARY KEY,
    City VARCHAR(50)
);

-- Insert into RegionDimension
INSERT INTO RegionDimension (Region, City)
VALUES
    ('Region 1', 'City 1'),
    ('Region 2', 'City 2');

-- Slice
SELECT Date, Product, Region, SalesAmount
FROM SalesTable
WHERE Date = '2023-07-01';

-- Dice
SELECT Date, Product, Region, SalesAmount
FROM SalesTable
WHERE Date IN ('2023-07-01', '2023-07-02') AND Product = 'Product A';

-- Drill-Down (Roll-Down)
SELECT Date, Product, Region, SalesAmount
FROM SalesTable
WHERE Date = '2023-07-01' AND Product = 'Product A';

-- Drill-Up (Roll-Up)
SELECT Product, Region, SUM(SalesAmount) AS TotalSales
FROM SalesTable
WHERE Date IN ('2023-07-01', '2023-07-02')
GROUP BY Product, Region;

-- Pivot (Rotate)
SELECT Product, Region, SUM(SalesAmount) AS TotalSales
FROM SalesTable
WHERE Date IN ('2023-07-01', '2023-07-02')
GROUP BY Product, Region;

-- Slice-and-Dice
SELECT Date, Product, Region, SalesAmount
FROM SalesTable
WHERE Date = '2023-07-01' AND (Product = 'Product A' OR Region = 'Region 1');
