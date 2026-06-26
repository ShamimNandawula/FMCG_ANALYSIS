-- 1. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),  -- e.g., 'Beverages', 'Snacks', 'Dairy'
    subcategory VARCHAR(50),
    pack_size VARCHAR(20),  -- e.g., '500ml', '200g'
    unit_price DECIMAL(10,2),
    cost_per_unit DECIMAL(10,2),
    launch_date DATE,
    is_active BOOLEAN
);

select * from products

-- 2. Stores Table
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    region VARCHAR(50),     -- 'North', 'South', 'East', 'West'
    city VARCHAR(50),
    store_type VARCHAR(50), -- 'Supermarket', 'Hypermarket', 'Convenience'
    store_size_sqft INT,
    open_date DATE
);

select * from stores 

-- 3. Customers Table (simplified for analysis)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    loyalty_tier VARCHAR(20), -- 'Bronze', 'Silver', 'Gold', 'Platinum'
    signup_date DATE,
    birth_year INT,
    gender VARCHAR(10),
    preferred_store_id INT,
    FOREIGN KEY (preferred_store_id) REFERENCES stores(store_id)
);

-- 4. Sales Transactions Table (main fact table)
CREATE TABLE sales (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    store_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    discount_percent DECIMAL(5,2),
    payment_method VARCHAR(30), -- 'Cash', 'Card', 'Mobile Wallet'
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

select * from sales
-- 5. Inventory Table (track stock levels)
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    store_id INT,
    product_id INT,
    date DATE,
    stock_on_hand INT,
    reorder_level INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 6. Promotions Table
CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    promotion_name VARCHAR(100),
    product_id INT,
    start_date DATE,
    end_date DATE,
    discount_rate DECIMAL(5,2),
    promotion_type VARCHAR(50), -- 'BOGO', 'Percentage', 'Fixed Amount'
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO products VALUES
(1, 'Cola Max', 'BevCo', 'Beverages', 'Carbonated', '500ml', 1.50, 0.60, '2023-01-15', TRUE),
(2, 'Orange Juice', 'FreshFarms', 'Beverages', 'Juice', '1L', 3.20, 1.80, '2022-06-10', TRUE),
(3, 'Potato Chips', 'CrunchCo', 'Snacks', 'Chips', '150g', 2.50, 1.10, '2022-11-20', TRUE),
(4, 'Chocolate Bar', 'SweetTreats', 'Snacks', 'Candy', '50g', 1.20, 0.50, '2023-03-05', TRUE),
(5, 'Greek Yogurt', 'DairyBest', 'Dairy', 'Yogurt', '200g', 2.80, 1.40, '2023-08-12', TRUE),
(6, 'Cheddar Cheese', 'DairyBest', 'Dairy', 'Cheese', '250g', 4.50, 2.50, '2022-09-18', TRUE),
(7, 'Energy Drink', 'BevCo', 'Beverages', 'Energy', '250ml', 2.90, 1.30, '2023-10-01', TRUE),
(8, 'Pretzel Sticks', 'CrunchCo', 'Snacks', 'Baked', '200g', 2.20, 0.90, '2023-02-14', TRUE),
(9, 'Almond Milk', 'FreshFarms', 'Beverages', 'Plant-Based', '1L', 3.80, 2.10, '2023-12-01', TRUE),
(10, 'Ice Cream', 'DairyBest', 'Dairy', 'Frozen', '500ml', 5.00, 2.80, '2022-07-22', TRUE),
(11, 'Popcorn', 'CrunchCo', 'Snacks', 'Microwave', '100g', 1.80, 0.70, '2023-04-30', TRUE),
(12, 'Fruit Snacks', 'SweetTreats', 'Snacks', 'Gummies', '150g', 2.30, 1.00, '2023-06-15', TRUE),
(13, 'Sparkling Water', 'BevCo', 'Beverages', 'Carbonated', '1L', 1.90, 0.80, '2023-09-20', TRUE),
(14, 'Cottage Cheese', 'DairyBest', 'Dairy', 'Cheese', '300g', 3.50, 1.90, '2022-10-05', TRUE),
(15, 'Trail Mix', 'CrunchCo', 'Snacks', 'Nuts', '250g', 4.20, 2.20, '2023-11-11', TRUE),
(16, 'Iced Tea', 'BevCo', 'Beverages', 'Ready-to-Drink', '500ml', 2.10, 1.00, '2023-05-25', TRUE),
(17, 'Butter', 'DairyBest', 'Dairy', 'Spread', '200g', 3.00, 1.60, '2022-12-03', TRUE),
(18, 'Rice Cakes', 'CrunchCo', 'Snacks', 'Healthy', '100g', 1.70, 0.65, '2023-07-08', TRUE),
(19, 'Lemonade', 'FreshFarms', 'Beverages', 'Juice', '500ml', 2.40, 1.20, '2023-01-30', TRUE),
(20, 'Protein Bar', 'SweetTreats', 'Snacks', 'Protein', '60g', 2.70, 1.40, '2023-10-15', TRUE);



INSERT INTO stores VALUES
(101, 'QuickMart Downtown', 'North', 'Chicago', 'Supermarket', 15000, '2020-03-15'),
(102, 'QuickMart Westside', 'West', 'Los Angeles', 'Hypermarket', 35000, '2019-11-20'),
(103, 'QuickMart East', 'East', 'New York', 'Supermarket', 18000, '2021-01-10'),
(104, 'QuickMart South', 'South', 'Houston', 'Convenience', 5000, '2022-06-01'),
(105, 'QuickMart Midtown', 'North', 'Chicago', 'Hypermarket', 40000, '2018-09-05'),
(106, 'QuickMart Beach', 'West', 'San Diego', 'Supermarket', 12000, '2021-08-22'),
(107, 'QuickMart Capital', 'East', 'Washington DC', 'Convenience', 4500, '2023-02-14'),
(108, 'QuickMart LoneStar', 'South', 'Dallas', 'Supermarket', 20000, '2020-10-30');



INSERT INTO customers VALUES
(1001, 'Gold', '2022-01-15', 1985, 'M', 101),
(1002, 'Silver', '2022-03-20', 1990, 'F', 103),
(1003, 'Platinum', '2021-06-10', 1978, 'M', 105),
(1004, 'Bronze', '2023-02-01', 1995, 'F', 104),
(1005, 'Gold', '2022-08-12', 1982, 'M', 102),
(1006, 'Silver', '2022-11-05', 1988, 'F', 106),
(1007, 'Platinum', '2021-12-18', 1975, 'M', 108),
(1008, 'Bronze', '2023-01-25', 2000, 'F', 101),
(1009, 'Gold', '2022-05-30', 1980, 'M', 103),
(1010, 'Silver', '2022-09-14', 1992, 'F', 107);
-- (continues to 1050 - but for brevity, assume 50 customers exist)


-- =====================================================
-- CUSTOMERS TABLE - 50 customers (1001 to 1050)
-- =====================================================

INSERT INTO customers (customer_id, loyalty_tier, signup_date, birth_year, gender, preferred_store_id) VALUES
(1011, 'Bronze', '2023-03-10', 1998, 'M', 104),
(1012, 'Gold', '2022-02-28', 1983, 'F', 105),
(1013, 'Silver', '2022-07-19', 1987, 'M', 102),
(1014, 'Platinum', '2021-10-01', 1972, 'F', 106),
(1015, 'Bronze', '2023-04-12', 2001, 'M', 108),
(1016, 'Gold', '2022-12-03', 1984, 'F', 101),
(1017, 'Silver', '2022-04-22', 1991, 'M', 103),
(1018, 'Bronze', '2023-01-08', 1997, 'F', 107),
(1019, 'Platinum', '2021-08-14', 1976, 'M', 104),
(1020, 'Gold', '2022-10-25', 1981, 'F', 105),
(1021, 'Silver', '2022-06-17', 1989, 'M', 102),
(1022, 'Bronze', '2023-02-14', 1999, 'F', 106),
(1023, 'Gold', '2022-03-05', 1986, 'M', 108),
(1024, 'Silver', '2022-11-30', 1993, 'F', 101),
(1025, 'Platinum', '2021-09-09', 1974, 'M', 103),
(1026, 'Bronze', '2023-03-22', 2002, 'F', 107),
(1027, 'Gold', '2022-01-20', 1982, 'M', 104),
(1028, 'Silver', '2022-08-08', 1990, 'F', 105),
(1029, 'Bronze', '2023-05-01', 1996, 'M', 102),
(1030, 'Platinum', '2021-11-11', 1977, 'F', 106),
(1031, 'Gold', '2022-04-15', 1985, 'M', 108),
(1032, 'Silver', '2022-12-22', 1988, 'F', 101),
(1033, 'Bronze', '2023-01-30', 2000, 'M', 103),
(1034, 'Gold', '2022-07-07', 1983, 'F', 107),
(1035, 'Silver', '2022-10-10', 1991, 'M', 104),
(1036, 'Platinum', '2021-05-20', 1979, 'F', 105),
(1037, 'Bronze', '2023-03-15', 1998, 'M', 102),
(1038, 'Gold', '2022-09-25', 1984, 'F', 106),
(1039, 'Silver', '2022-02-14', 1989, 'M', 108),
(1040, 'Bronze', '2023-04-05', 2001, 'F', 101),
(1041, 'Platinum', '2021-07-30', 1973, 'M', 103),
(1042, 'Gold', '2022-11-18', 1981, 'F', 107),
(1043, 'Silver', '2022-05-12', 1992, 'M', 104),
(1044, 'Bronze', '2023-06-01', 1997, 'F', 105),
(1045, 'Gold', '2022-03-28', 1986, 'M', 102),
(1046, 'Silver', '2022-08-19', 1990, 'F', 106),
(1047, 'Platinum', '2021-10-22', 1975, 'M', 108),
(1048, 'Bronze', '2023-02-28', 1999, 'F', 101),
(1049, 'Gold', '2022-12-12', 1980, 'M', 103),
(1050, 'Silver', '2022-06-25', 1994, 'F', 107);



INSERT INTO sales VALUES
(5001, '2024-01-05', 101, 1001, 1, 2, 0.00, 'Card'),
(5002, '2024-01-05', 101, 1004, 3, 1, 10.00, 'Cash'),
(5003, '2024-01-06', 102, 1005, 2, 1, 0.00, 'Mobile Wallet'),
(5004, '2024-01-06', 103, 1002, 5, 3, 5.00, 'Card'),
(5005, '2024-01-07', 105, 1003, 7, 2, 15.00, 'Card'),
(5006, '2024-01-07', 104, 1008, 4, 5, 0.00, 'Cash'),
(5007, '2024-01-08', 106, 1006, 6, 1, 0.00, 'Mobile Wallet'),
(5008, '2024-01-08', 108, 1007, 10, 1, 20.00, 'Card'),
(5009, '2024-01-09', 101, 1009, 8, 2, 0.00, 'Card'),
(5010, '2024-01-10', 102, 1010, 9, 1, 0.00, 'Cash'),
(5011, '2024-01-10', 103, 1001, 11, 3, 5.00, 'Mobile Wallet'),
(5012, '2024-01-11', 105, 1003, 12, 2, 10.00, 'Card'),
(5013, '2024-01-12', 104, 1004, 13, 4, 0.00, 'Cash'),
(5014, '2024-01-12', 106, 1006, 14, 1, 0.00, 'Card'),
(5015, '2024-01-13', 107, 1002, 15, 1, 0.00, 'Mobile Wallet'),
(5016, '2024-01-14', 108, 1007, 16, 2, 0.00, 'Card'),
(5017, '2024-01-15', 101, 1005, 17, 1, 0.00, 'Cash'),
(5018, '2024-01-15', 102, 1008, 18, 3, 0.00, 'Card'),
(5019, '2024-01-16', 103, 1009, 19, 2, 10.00, 'Mobile Wallet'),
(5020, '2024-01-17', 105, 1010, 20, 1, 0.00, 'Card');
-- (continues to transaction 5500 across Jan-Mar 2024)




-- Continuing from transaction 5020
-- JANUARY 2024 (continued)
INSERT INTO sales VALUES
(5021, '2024-01-17', 106, 1011, 1, 3, 0.00, 'Card'),
(5022, '2024-01-18', 107, 1012, 2, 2, 5.00, 'Cash'),
(5023, '2024-01-18', 108, 1013, 3, 1, 0.00, 'Mobile Wallet'),
(5024, '2024-01-18', 101, 1014, 4, 4, 0.00, 'Card'),
(5025, '2024-01-19', 102, 1015, 5, 2, 10.00, 'Card'),
(5026, '2024-01-19', 103, 1016, 6, 1, 0.00, 'Cash'),
(5027, '2024-01-19', 104, 1017, 7, 3, 0.00, 'Mobile Wallet'),
(5028, '2024-01-20', 105, 1018, 8, 2, 5.00, 'Card'),
(5029, '2024-01-20', 106, 1019, 9, 1, 0.00, 'Card'),
(5030, '2024-01-20', 107, 1020, 10, 4, 0.00, 'Cash'),
(5031, '2024-01-21', 108, 1021, 11, 2, 10.00, 'Mobile Wallet'),
(5032, '2024-01-21', 101, 1022, 12, 1, 0.00, 'Card'),
(5033, '2024-01-21', 102, 1023, 13, 3, 0.00, 'Card'),
(5034, '2024-01-22', 103, 1024, 14, 2, 5.00, 'Cash'),
(5035, '2024-01-22', 104, 1025, 15, 1, 0.00, 'Mobile Wallet'),
(5036, '2024-01-22', 105, 1026, 16, 4, 0.00, 'Card'),
(5037, '2024-01-23', 106, 1027, 17, 2, 15.00, 'Card'),
(5038, '2024-01-23', 107, 1028, 18, 1, 0.00, 'Cash'),
(5039, '2024-01-23', 108, 1029, 19, 3, 0.00, 'Mobile Wallet'),
(5040, '2024-01-24', 101, 1030, 20, 2, 5.00, 'Card'),
(5041, '2024-01-24', 102, 1031, 1, 1, 0.00, 'Card'),
(5042, '2024-01-24', 103, 1032, 2, 4, 0.00, 'Cash'),
(5043, '2024-01-25', 104, 1033, 3, 2, 10.00, 'Mobile Wallet'),
(5044, '2024-01-25', 105, 1034, 4, 1, 0.00, 'Card'),
(5045, '2024-01-25', 106, 1035, 5, 3, 0.00, 'Card'),
(5046, '2024-01-26', 107, 1036, 6, 2, 5.00, 'Cash'),
(5047, '2024-01-26', 108, 1037, 7, 1, 0.00, 'Mobile Wallet'),
(5048, '2024-01-26', 101, 1038, 8, 5, 0.00, 'Card'),
(5049, '2024-01-27', 102, 1039, 9, 2, 10.00, 'Card'),
(5050, '2024-01-27', 103, 1040, 10, 1, 0.00, 'Cash'),
(5051, '2024-01-27', 104, 1041, 11, 3, 0.00, 'Mobile Wallet'),
(5052, '2024-01-28', 105, 1042, 12, 2, 5.00, 'Card'),
(5053, '2024-01-28', 106, 1043, 13, 1, 0.00, 'Card'),
(5054, '2024-01-28', 107, 1044, 14, 4, 0.00, 'Cash'),
(5055, '2024-01-29', 108, 1045, 15, 2, 15.00, 'Mobile Wallet'),
(5056, '2024-01-29', 101, 1046, 16, 1, 0.00, 'Card'),
(5057, '2024-01-29', 102, 1047, 17, 3, 0.00, 'Card'),
(5058, '2024-01-30', 103, 1048, 18, 2, 5.00, 'Cash'),
(5059, '2024-01-30', 104, 1049, 19, 1, 0.00, 'Mobile Wallet'),
(5060, '2024-01-30', 105, 1050, 20, 4, 0.00, 'Card'),
(5061, '2024-01-31', 106, 1001, 1, 2, 10.00, 'Card'),
(5062, '2024-01-31', 107, 1002, 2, 1, 0.00, 'Cash'),
(5063, '2024-01-31', 108, 1003, 3, 3, 0.00, 'Mobile Wallet'),
-- FEBRUARY 2024 (Days 1-29)
(5064, '2024-02-01', 101, 1004, 4, 2, 5.00, 'Card'),
(5065, '2024-02-01', 102, 1005, 5, 1, 0.00, 'Card'),
(5066, '2024-02-01', 103, 1006, 6, 4, 0.00, 'Cash'),
(5067, '2024-02-02', 104, 1007, 7, 2, 10.00, 'Mobile Wallet'),
(5068, '2024-02-02', 105, 1008, 8, 1, 0.00, 'Card'),
(5069, '2024-02-02', 106, 1009, 9, 3, 0.00, 'Card'),
(5070, '2024-02-03', 107, 1010, 10, 2, 5.00, 'Cash'),
(5071, '2024-02-03', 108, 1011, 11, 1, 0.00, 'Mobile Wallet'),
(5072, '2024-02-03', 101, 1012, 12, 4, 0.00, 'Card'),
(5073, '2024-02-04', 102, 1013, 13, 2, 15.00, 'Card'),
(5074, '2024-02-04', 103, 1014, 14, 1, 0.00, 'Cash'),
(5075, '2024-02-04', 104, 1015, 15, 3, 0.00, 'Mobile Wallet'),
(5076, '2024-02-05', 105, 1016, 16, 2, 5.00, 'Card'),
(5077, '2024-02-05', 106, 1017, 17, 1, 0.00, 'Card'),
(5078, '2024-02-05', 107, 1018, 18, 4, 0.00, 'Cash'),
(5079, '2024-02-06', 108, 1019, 19, 2, 10.00, 'Mobile Wallet'),
(5080, '2024-02-06', 101, 1020, 20, 1, 0.00, 'Card'),
(5081, '2024-02-06', 102, 1021, 1, 3, 0.00, 'Card'),
(5082, '2024-02-07', 103, 1022, 2, 2, 5.00, 'Cash'),
(5083, '2024-02-07', 104, 1023, 3, 1, 0.00, 'Mobile Wallet'),
(5084, '2024-02-07', 105, 1024, 4, 5, 0.00, 'Card'),
(5085, '2024-02-08', 106, 1025, 5, 2, 10.00, 'Card'),
(5086, '2024-02-08', 107, 1026, 6, 1, 0.00, 'Cash'),
(5087, '2024-02-08', 108, 1027, 7, 3, 0.00, 'Mobile Wallet'),
(5088, '2024-02-09', 101, 1028, 8, 2, 5.00, 'Card'),
(5089, '2024-02-09', 102, 1029, 9, 1, 0.00, 'Card'),
(5090, '2024-02-09', 103, 1030, 10, 4, 0.00, 'Cash'),
(5091, '2024-02-10', 104, 1031, 11, 2, 15.00, 'Mobile Wallet'),
(5092, '2024-02-10', 105, 1032, 12, 1, 0.00, 'Card'),
(5093, '2024-02-10', 106, 1033, 13, 3, 0.00, 'Card'),
(5094, '2024-02-11', 107, 1034, 14, 2, 5.00, 'Cash'),
(5095, '2024-02-11', 108, 1035, 15, 1, 0.00, 'Mobile Wallet'),
(5096, '2024-02-11', 101, 1036, 16, 4, 0.00, 'Card'),
(5097, '2024-02-12', 102, 1037, 17, 2, 10.00, 'Card'),
(5098, '2024-02-12', 103, 1038, 18, 1, 0.00, 'Cash'),
(5099, '2024-02-12', 104, 1039, 19, 3, 0.00, 'Mobile Wallet'),
(5100, '2024-02-13', 105, 1040, 20, 2, 5.00, 'Card'),
(5101, '2024-02-13', 106, 1041, 1, 1, 0.00, 'Card'),
(5102, '2024-02-13', 107, 1042, 2, 4, 0.00, 'Cash'),
(5103, '2024-02-14', 108, 1043, 3, 2, 20.00, 'Mobile Wallet'),
(5104, '2024-02-14', 101, 1044, 4, 1, 0.00, 'Card'),
(5105, '2024-02-14', 102, 1045, 5, 3, 0.00, 'Card'),
(5106, '2024-02-15', 103, 1046, 6, 2, 10.00, 'Cash'),
(5107, '2024-02-15', 104, 1047, 7, 1, 0.00, 'Mobile Wallet'),
(5108, '2024-02-15', 105, 1048, 8, 5, 0.00, 'Card'),
(5109, '2024-02-16', 106, 1049, 9, 2, 5.00, 'Card'),
(5110, '2024-02-16', 107, 1050, 10, 1, 0.00, 'Cash'),
(5111, '2024-02-16', 108, 1001, 11, 3, 0.00, 'Mobile Wallet'),
(5112, '2024-02-17', 101, 1002, 12, 2, 15.00, 'Card'),
(5113, '2024-02-17', 102, 1003, 13, 1, 0.00, 'Card'),
(5114, '2024-02-17', 103, 1004, 14, 4, 0.00, 'Cash'),
(5115, '2024-02-18', 104, 1005, 15, 2, 5.00, 'Mobile Wallet'),
(5116, '2024-02-18', 105, 1006, 16, 1, 0.00, 'Card'),
(5117, '2024-02-18', 106, 1007, 17, 3, 0.00, 'Card'),
(5118, '2024-02-19', 107, 1008, 18, 2, 10.00, 'Cash'),
(5119, '2024-02-19', 108, 1009, 19, 1, 0.00, 'Mobile Wallet'),
(5120, '2024-02-19', 101, 1010, 20, 4, 0.00, 'Card'),
(5121, '2024-02-20', 102, 1011, 1, 2, 5.00, 'Card'),
(5122, '2024-02-20', 103, 1012, 2, 1, 0.00, 'Cash'),
(5123, '2024-02-20', 104, 1013, 3, 3, 0.00, 'Mobile Wallet'),
(5124, '2024-02-21', 105, 1014, 4, 2, 15.00, 'Card'),
(5125, '2024-02-21', 106, 1015, 5, 1, 0.00, 'Card'),
(5126, '2024-02-21', 107, 1016, 6, 4, 0.00, 'Cash'),
(5127, '2024-02-22', 108, 1017, 7, 2, 5.00, 'Mobile Wallet'),
(5128, '2024-02-22', 101, 1018, 8, 1, 0.00, 'Card'),
(5129, '2024-02-22', 102, 1019, 9, 3, 0.00, 'Card'),
(5130, '2024-02-23', 103, 1020, 10, 2, 10.00, 'Cash'),
(5131, '2024-02-23', 104, 1021, 11, 1, 0.00, 'Mobile Wallet'),
(5132, '2024-02-23', 105, 1022, 12, 4, 0.00, 'Card'),
(5133, '2024-02-24', 106, 1023, 13, 2, 5.00, 'Card'),
(5134, '2024-02-24', 107, 1024, 14, 1, 0.00, 'Cash'),
(5135, '2024-02-24', 108, 1025, 15, 3, 0.00, 'Mobile Wallet'),
(5136, '2024-02-25', 101, 1026, 16, 2, 15.00, 'Card'),
(5137, '2024-02-25', 102, 1027, 17, 1, 0.00, 'Card'),
(5138, '2024-02-25', 103, 1028, 18, 4, 0.00, 'Cash'),
(5139, '2024-02-26', 104, 1029, 19, 2, 5.00, 'Mobile Wallet'),
(5140, '2024-02-26', 105, 1030, 20, 1, 0.00, 'Card'),
(5141, '2024-02-26', 106, 1031, 1, 3, 0.00, 'Card'),
(5142, '2024-02-27', 107, 1032, 2, 2, 10.00, 'Cash'),
(5143, '2024-02-27', 108, 1033, 3, 1, 0.00, 'Mobile Wallet'),
(5144, '2024-02-27', 101, 1034, 4, 5, 0.00, 'Card'),
(5145, '2024-02-28', 102, 1035, 5, 2, 5.00, 'Card'),
(5146, '2024-02-28', 103, 1036, 6, 1, 0.00, 'Cash'),
(5147, '2024-02-28', 104, 1037, 7, 3, 0.00, 'Mobile Wallet'),
(5148, '2024-02-29', 105, 1038, 8, 2, 15.00, 'Card'),
(5149, '2024-02-29', 106, 1039, 9, 1, 0.00, 'Card'),
(5150, '2024-02-29', 107, 1040, 10, 4, 0.00, 'Cash'),
-- MARCH 2024 (Days 1-31)
(5151, '2024-03-01', 108, 1041, 11, 2, 5.00, 'Mobile Wallet'),
(5152, '2024-03-01', 101, 1042, 12, 1, 0.00, 'Card'),
(5153, '2024-03-01', 102, 1043, 13, 3, 0.00, 'Card'),
(5154, '2024-03-02', 103, 1044, 14, 2, 10.00, 'Cash'),
(5155, '2024-03-02', 104, 1045, 15, 1, 0.00, 'Mobile Wallet'),
(5156, '2024-03-02', 105, 1046, 16, 4, 0.00, 'Card'),
(5157, '2024-03-03', 106, 1047, 17, 2, 5.00, 'Card'),
(5158, '2024-03-03', 107, 1048, 18, 1, 0.00, 'Cash'),
(5159, '2024-03-03', 108, 1049, 19, 3, 0.00, 'Mobile Wallet'),
(5160, '2024-03-04', 101, 1050, 20, 2, 15.00, 'Card'),
(5161, '2024-03-04', 102, 1001, 1, 1, 0.00, 'Card'),
(5162, '2024-03-04', 103, 1002, 2, 4, 0.00, 'Cash'),
(5163, '2024-03-05', 104, 1003, 3, 2, 5.00, 'Mobile Wallet'),
(5164, '2024-03-05', 105, 1004, 4, 1, 0.00, 'Card'),
(5165, '2024-03-05', 106, 1005, 5, 3, 0.00, 'Card'),
(5166, '2024-03-06', 107, 1006, 6, 2, 10.00, 'Cash'),
(5167, '2024-03-06', 108, 1007, 7, 1, 0.00, 'Mobile Wallet'),
(5168, '2024-03-06', 101, 1008, 8, 5, 0.00, 'Card'),
(5169, '2024-03-07', 102, 1009, 9, 2, 5.00, 'Card'),
(5170, '2024-03-07', 103, 1010, 10, 1, 0.00, 'Cash'),
(5171, '2024-03-07', 104, 1011, 11, 3, 0.00, 'Mobile Wallet'),
(5172, '2024-03-08', 105, 1012, 12, 2, 15.00, 'Card'),
(5173, '2024-03-08', 106, 1013, 13, 1, 0.00, 'Card'),
(5174, '2024-03-08', 107, 1014, 14, 4, 0.00, 'Cash'),
(5175, '2024-03-09', 108, 1015, 15, 2, 5.00, 'Mobile Wallet'),
(5176, '2024-03-09', 101, 1016, 16, 1, 0.00, 'Card'),
(5177, '2024-03-09', 102, 1017, 17, 3, 0.00, 'Card'),
(5178, '2024-03-10', 103, 1018, 18, 2, 10.00, 'Cash'),
(5179, '2024-03-10', 104, 1019, 19, 1, 0.00, 'Mobile Wallet'),
(5180, '2024-03-10', 105, 1020, 20, 4, 0.00, 'Card'),
(5181, '2024-03-11', 106, 1021, 1, 2, 5.00, 'Card'),
(5182, '2024-03-11', 107, 1022, 2, 1, 0.00, 'Cash'),
(5183, '2024-03-11', 108, 1023, 3, 3, 0.00, 'Mobile Wallet'),
(5184, '2024-03-12', 101, 1024, 4, 2, 15.00, 'Card'),
(5185, '2024-03-12', 102, 1025, 5, 1, 0.00, 'Card'),
(5186, '2024-03-12', 103, 1026, 6, 4, 0.00, 'Cash'),
(5187, '2024-03-13', 104, 1027, 7, 2, 5.00, 'Mobile Wallet'),
(5188, '2024-03-13', 105, 1028, 8, 1, 0.00, 'Card'),
(5189, '2024-03-13', 106, 1029, 9, 3, 0.00, 'Card'),
(5190, '2024-03-14', 107, 1030, 10, 2, 10.00, 'Cash'),
(5191, '2024-03-14', 108, 1031, 11, 1, 0.00, 'Mobile Wallet'),
(5192, '2024-03-14', 101, 1032, 12, 4, 0.00, 'Card'),
(5193, '2024-03-15', 102, 1033, 13, 2, 5.00, 'Card'),
(5194, '2024-03-15', 103, 1034, 14, 1, 0.00, 'Cash'),
(5195, '2024-03-15', 104, 1035, 15, 3, 0.00, 'Mobile Wallet'),
(5196, '2024-03-16', 105, 1036, 16, 2, 15.00, 'Card'),
(5197, '2024-03-16', 106, 1037, 17, 1, 0.00, 'Card'),
(5198, '2024-03-16', 107, 1038, 18, 4, 0.00, 'Cash'),
(5199, '2024-03-17', 108, 1039, 19, 2, 5.00, 'Mobile Wallet'),
(5200, '2024-03-17', 101, 1040, 20, 1, 0.00, 'Card'),
(5201, '2024-03-17', 102, 1041, 1, 3, 0.00, 'Card'),
(5202, '2024-03-18', 103, 1042, 2, 2, 10.00, 'Cash'),
(5203, '2024-03-18', 104, 1043, 3, 1, 0.00, 'Mobile Wallet'),
(5204, '2024-03-18', 105, 1044, 4, 5, 0.00, 'Card'),
(5205, '2024-03-19', 106, 1045, 5, 2, 5.00, 'Card'),
(5206, '2024-03-19', 107, 1046, 6, 1, 0.00, 'Cash'),
(5207, '2024-03-19', 108, 1047, 7, 3, 0.00, 'Mobile Wallet'),
(5208, '2024-03-20', 101, 1048, 8, 2, 15.00, 'Card'),
(5209, '2024-03-20', 102, 1049, 9, 1, 0.00, 'Card'),
(5210, '2024-03-20', 103, 1050, 10, 4, 0.00, 'Cash'),
(5211, '2024-03-21', 104, 1001, 11, 2, 5.00, 'Mobile Wallet'),
(5212, '2024-03-21', 105, 1002, 12, 1, 0.00, 'Card'),
(5213, '2024-03-21', 106, 1003, 13, 3, 0.00, 'Card'),
(5214, '2024-03-22', 107, 1004, 14, 2, 10.00, 'Cash'),
(5215, '2024-03-22', 108, 1005, 15, 1, 0.00, 'Mobile Wallet'),
(5216, '2024-03-22', 101, 1006, 16, 4, 0.00, 'Card'),
(5217, '2024-03-23', 102, 1007, 17, 2, 5.00, 'Card'),
(5218, '2024-03-23', 103, 1008, 18, 1, 0.00, 'Cash'),
(5219, '2024-03-23', 104, 1009, 19, 3, 0.00, 'Mobile Wallet'),
(5220, '2024-03-24', 105, 1010, 20, 2, 15.00, 'Card'),
(5221, '2024-03-24', 106, 1011, 1, 1, 0.00, 'Card'),
(5222, '2024-03-24', 107, 1012, 2, 4, 0.00, 'Cash'),
(5223, '2024-03-25', 108, 1013, 3, 2, 5.00, 'Mobile Wallet'),
(5224, '2024-03-25', 101, 1014, 4, 1, 0.00, 'Card'),
(5225, '2024-03-25', 102, 1015, 5, 3, 0.00, 'Card'),
(5226, '2024-03-26', 103, 1016, 6, 2, 10.00, 'Cash'),
(5227, '2024-03-26', 104, 1017, 7, 1, 0.00, 'Mobile Wallet'),
(5228, '2024-03-26', 105, 1018, 8, 5, 0.00, 'Card'),
(5229, '2024-03-27', 106, 1019, 9, 2, 5.00, 'Card'),
(5230, '2024-03-27', 107, 1020, 10, 1, 0.00, 'Cash'),
(5231, '2024-03-27', 108, 1021, 11, 3, 0.00, 'Mobile Wallet'),
(5232, '2024-03-28', 101, 1022, 12, 2, 15.00, 'Card'),
(5233, '2024-03-28', 102, 1023, 13, 1, 0.00, 'Card'),
(5234, '2024-03-28', 103, 1024, 14, 4, 0.00, 'Cash'),
(5235, '2024-03-29', 104, 1025, 15, 2, 5.00, 'Mobile Wallet'),
(5236, '2024-03-29', 105, 1026, 16, 1, 0.00, 'Card'),
(5237, '2024-03-29', 106, 1027, 17, 3, 0.00, 'Card'),
(5238, '2024-03-30', 107, 1028, 18, 2, 10.00, 'Cash'),
(5239, '2024-03-30', 108, 1029, 19, 1, 0.00, 'Mobile Wallet'),
(5240, '2024-03-30', 101, 1030, 20, 4, 0.00, 'Card'),
(5241, '2024-03-31', 102, 1031, 1, 2, 5.00, 'Card'),
(5242, '2024-03-31', 103, 1032, 2, 1, 0.00, 'Cash'),
(5243, '2024-03-31', 104, 1033, 3, 3, 0.00, 'Mobile Wallet'),
(5244, '2024-03-31', 105, 1034, 4, 2, 15.00, 'Card'),
(5245, '2024-03-31', 106, 1035, 5, 1, 0.00, 'Card');


INSERT INTO inventory VALUES
(1, 101, 1, '2024-01-01', 500, 100),
(2, 101, 2, '2024-01-01', 200, 80),
(3, 102, 1, '2024-01-01', 750, 150),
(4, 102, 3, '2024-01-01', 300, 120),
(5, 103, 5, '2024-01-01', 150, 60),
(6, 104, 4, '2024-01-01', 400, 100),
(7, 105, 7, '2024-01-01', 600, 200),
(8, 106, 10, '2024-01-01', 100, 50),
(9, 107, 15, '2024-01-01', 80, 40),
(10, 108, 20, '2024-01-01', 250, 90);

-- Step 1: Delete existing inventory data
DELETE FROM inventory;

-- Step 2: Reset auto-increment (MySQL only)
ALTER TABLE inventory AUTO_INCREMENT = 1;

-- Step 3: Insert ALL 40 inventory records (complete set)
INSERT INTO inventory (inventory_id, store_id, product_id, date, stock_on_hand, reorder_level) VALUES
-- Store 101
(1, 101, 1, '2024-01-01', 500, 100),
(2, 101, 2, '2024-01-01', 200, 80),
(3, 101, 3, '2024-01-01', 350, 120),
(4, 101, 4, '2024-01-01', 450, 100),
(5, 101, 5, '2024-01-01', 150, 60),
-- Store 102
(6, 102, 1, '2024-01-01', 750, 150),
(7, 102, 2, '2024-01-01', 300, 100),
(8, 102, 3, '2024-01-01', 600, 150),
(9, 102, 6, '2024-01-01', 250, 80),
(10, 102, 7, '2024-01-01', 400, 120),
-- Store 103
(11, 103, 1, '2024-01-01', 450, 100),
(12, 103, 4, '2024-01-01', 300, 90),
(13, 103, 5, '2024-01-01', 500, 120),
(14, 103, 8, '2024-01-01', 200, 70),
(15, 103, 9, '2024-01-01', 150, 50),
-- Store 104
(16, 104, 2, '2024-01-01', 200, 60),
(17, 104, 3, '2024-01-01', 350, 100),
(18, 104, 4, '2024-01-01', 400, 100),
(19, 104, 10, '2024-01-01', 100, 40),
(20, 104, 11, '2024-01-01', 250, 80),
-- Store 105
(21, 105, 1, '2024-01-01', 600, 150),
(22, 105, 5, '2024-01-01', 300, 100),
(23, 105, 7, '2024-01-01', 500, 150),
(24, 105, 12, '2024-01-01', 180, 60),
(25, 105, 13, '2024-01-01', 220, 70),
-- Store 106
(26, 106, 3, '2024-01-01', 280, 90),
(27, 106, 6, '2024-01-01', 150, 50),
(28, 106, 8, '2024-01-01', 320, 100),
(29, 106, 10, '2024-01-01', 200, 70),
(30, 106, 14, '2024-01-01', 120, 40),
-- Store 107
(31, 107, 2, '2024-01-01', 180, 60),
(32, 107, 4, '2024-01-01', 250, 80),
(33, 107, 9, '2024-01-01', 100, 40),
(34, 107, 11, '2024-01-01', 300, 90),
(35, 107, 15, '2024-01-01', 80, 30),
-- Store 108
(36, 108, 1, '2024-01-01', 550, 120),
(37, 108, 5, '2024-01-01', 200, 70),
(38, 108, 7, '2024-01-01', 350, 100),
(39, 108, 16, '2024-01-01', 150, 50),
(40, 108, 20, '2024-01-01', 250, 80);


INSERT INTO promotions VALUES
(201, 'New Year Sparkle', 1, '2024-01-01', '2024-01-15', 15.00, 'Percentage'),
(202, 'Healthy Start', 9, '2024-01-10', '2024-02-10', 10.00, 'Percentage'),
(203, 'Valentine Sweet', 4, '2024-02-01', '2024-02-14', 20.00, 'Percentage'),
(204, 'Winter Warmers', 10, '2024-01-15', '2024-01-31', 5.00, 'Fixed Amount'),
(205, 'Snack Attack', 3, '2024-02-15', '2024-03-15', 10.00, 'Percentage'),
(206, 'BevCo BOGO', 13, '2024-03-01', '2024-03-31', 0.00, 'BOGO'),
(207, 'Dairy Week', 5, '2024-03-10', '2024-03-20', 15.00, 'Percentage');




#Q1: What are the top 5 best-selling products by total quantity sold in January 2024?

SELECT 
s.product_id,
p.product_name,
SUM(s.quantity) AS cnt
FROM SALES s
LEFT JOIN products p 
ON s.product_id = p.product_id
WHERE s.transaction_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP by s.transaction_id,s.product_id, p.product_name
order by cnt desc limit 5;


#Q2: Which store had the highest total revenue (after discount) in February 2024?
select A.store_id,st.store_name,sum(revenue)rev,(sum(revenue)*(A.discount_percent/100)) discount,
SUM(A.revenue - (A.revenue * (A.discount_percent / 100))) AS total_revenue_after_discount from
(SELECT sale.transaction_date,product.product_id,
sum(product.unit_price*product.cost_per_unit*sale.quantity) revenue,discount_percent,
sale.store_id
FROM sales sale
LEFT JOIN products product
on sale.product_id = product.product_id
group by sale.transaction_date,product.product_id,sale.store_id)A
left join 
stores st 
on A.store_id = st.store_id
WHERE transaction_date BETWEEN '2024-02-01' AND '2024-02-29'
GROUP by st.store_id, st.store_name
order BY  total_revenue_after_discount desc limit 1

#Q3: List all products in "Beverages" category with price, cost, and profit margin
select product_id, product_name,category, sum(s.revenue/s.quantity) cost,s.revenue,(s.revenue -sum(s.revenue/s.quantity))profit_margin from
(select sale.product_id,product.product_name,category,sum(sale.quantity)quantity,
sum(product.unit_price*product.cost_per_unit*sale.quantity) revenue
from sales sale
left join products product
on sale.product_id = product.product_id
where category = 'Beverages'
group by product_id)s
group by product_id, product_name

#Q4:	Show total sales quantity and revenue for March 2024 grouped by store region
select store.region,quantity,SUM(A.revenue - (A.revenue * (A.discount_percent / 100))) AS total_revenue_after_discount
FROM
(select store_id,sum(discount_percent)discount_percent,sum(sale.quantity)quantity,
sum(product.unit_price*product.cost_per_unit*sale.quantity) revenue
from sales sale
left join products product
on sale.product_id = product.product_id
WHERE transaction_date BETWEEN '2024-03-01' AND '2024-03-31'
group by store_id)A
left join stores store
on A.store_id = store.store_id
group by region

SELECT * FROM CUSTOMERS

#Q5	Find top 5 customers by total spending with loyalty tier and signup date
select A.customer_id,SUM(A.revenue - (A.revenue * (A.discount_percent / 100))) AS total_revenue_after_discount,
customer.loyalty_tier,signup_date from
(select customer_id,sum(discount_percent)discount_percent,sum(sale.quantity)quantity,
sum(product.unit_price*product.cost_per_unit*sale.quantity) revenue
from sales sale
left join products product
on sale.product_id = product.product_id
group by customer_id )A
left join customers customer
on a.customer_id = customer.customer_id
group by customer_id,signup_date
order by total_revenue_after_discount desc,signup_date asc
limit 5

select * from inventory 

#Q6	Identify stores with inventory stock below reorder level (show store name, product name, current stock, reorder level)
select store.store_name,p.product_name,stock_on_hand,reorder_level
from inventory inventory
left join products p 
on inventory.product_id = p.product_id 
left join stores store
on inventory.store_id = store.store_id
where (stock_on_hand < reorder_level)

#Q7	Calculate average discount percentage given per store - which store offers highest average discount?

select A.store_id,store_name,average_discount
FROM
(select store_id,(sum(product.unit_price*product.cost_per_unit*sale.quantity)/sum(sale.quantity))average_discount
from sales sale
left join products product
on sale.product_id = product.product_id
group by store_id)A
left join stores store
on A.store_id = store.store_id
ORDER BY average_discount DESC
LIMIT 1;

#Intermediate Level

#Q8	For each product category: total revenue, total quantity sold, average discount, rank by revenue
select category,quantity,average_discount,
RANK() over(order by revenue - (revenue * (discount_percent / 100))desc) AS total_revenue_after_discount_rnk
from
(select category,
sum(sale.quantity)quantity,sum(discount_percent)discount_percent,
(sum(product.unit_price*product.cost_per_unit*sale.quantity)/sum(sale.quantity))average_discount,
sum(product.unit_price*product.cost_per_unit*sale.quantity)revenue
from sales sale
left join products product
on sale.product_id = product.product_id
group by category)A
group by category 

#Q9	Month-over-month sales growth percentage for Q1 2024 (Jan, Feb, Mar) - show month, revenue, growth %
select case when TRANSACTION_DATE between date '2024-01-01' and date '2024-01-31' then 'JANUARY'
when TRANSACTION_DATE between date '2024-02-01' and date '2024-02-29' then 'FEBRUARY'
when TRANSACTION_DATE between date '2024-03-01' and date '2024-03-31' then 'MARCH' end TXN_MTH,
SUM(revenue) REV
from
(select TRANSACTION_DATE,
sum(sale.quantity)quantity,sum(discount_percent)discount_percent,
sum(product.unit_price*product.cost_per_unit*sale.quantity)revenue
from sales sale
left join products product
on sale.product_id = product.product_id
group by transaction_date)A
group by  
case when TRANSACTION_DATE between date '2024-01-01' and date '2024-01-31' then 'JANUARY'
when TRANSACTION_DATE between date '2024-02-01' and date '2024-02-29' then 'FEBRUARY'
when TRANSACTION_DATE between date '2024-03-01' and date '2024-03-31' then 'MARCH' end

