-- Create the database
CREATE DATABASE sparetrack_db;
USE sparetrack_db;

-- 1. Admin Table
CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    role ENUM('Admin', 'Staff') NOT NULL,
    email VARCHAR(100)
);

-- Sample Admin Data
INSERT INTO Admin (username, password, full_name, role, email) VALUES
('admin01', 'admin123', 'Anupa Silva', 'admin', 'anupa@company.com'),
('staff01', 'staff123', 'Kamal Perera', 'staff', 'kamal@company.com');

-- 2. SpareParts Table
CREATE TABLE SpareParts (
    part_id INT PRIMARY KEY AUTO_INCREMENT,
    part_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    model_number VARCHAR(100),
    brand VARCHAR(50),
    quantity_in_stock INT DEFAULT 0,
    unit_price DECIMAL(10, 2),
    description TEXT
);

-- Sample SpareParts Data
INSERT INTO SpareParts (part_name, category, model_number, brand, quantity_in_stock, unit_price, description) VALUES
('RAM 8GB DDR4', 'Memory', 'HX426C16FB3/8', 'Kingston', 20, 35.50, '8GB DDR4 Desktop RAM'),
('SSD 500GB', 'Storage', 'CT500MX500SSD1', 'Crucial', 15, 65.00, '500GB SATA SSD'),
('Power Supply 450W', 'Power', 'VS450', 'Corsair', 10, 45.75, '450W PSU for desktops'),
('Laptop Battery - HP', 'Battery', 'HT03XL', 'HP', 5, 55.00, 'Battery for HP Pavilion series');

-- 3. Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    contact_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT
);

-- Sample Suppliers
INSERT INTO Suppliers (supplier_name, contact_person, contact_number, email, address) VALUES
('TechDistributors Ltd.', 'Nirosha De Silva', '0771234567', 'sales@techdistributors.lk', 'Colombo 03, Sri Lanka'),
('CompParts Global', 'Arun Fernando', '0712345678', 'info@compparts.com', 'Kandy Road, Kurunegala');

-- 4. PurchaseOrders Table
CREATE TABLE PurchaseOrders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    part_id INT,
    supplier_id INT,
    quantity_ordered INT,
    order_date DATE,
    received_date DATE,
    ordered_by INT,
    FOREIGN KEY (part_id) REFERENCES SpareParts(part_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE,
    FOREIGN KEY (ordered_by) REFERENCES Admin(admin_id) ON DELETE CASCADE
);

-- Sample PurchaseOrders
INSERT INTO PurchaseOrders (part_id, supplier_id, quantity_ordered, order_date, received_date, ordered_by) VALUES
(1, 1, 20, '2025-05-01', '2025-05-04', 1),
(2, 2, 10, '2025-05-03', '2025-05-05', 1);

-- 5. UsageLogs Table
CREATE TABLE UsageLogs (
    usage_id INT PRIMARY KEY AUTO_INCREMENT,
    part_id INT,
    quantity_used INT,
    used_by INT,
    usage_context TEXT,
    usage_date DATE,
    FOREIGN KEY (part_id) REFERENCES SpareParts(part_id) ON DELETE CASCADE,
    FOREIGN KEY (used_by) REFERENCES Admin(admin_id) ON DELETE CASCADE
);

-- Sample UsageLogs
INSERT INTO UsageLogs (part_id, quantity_used, used_by, usage_context, usage_date) VALUES
(1, 2, 2, 'Installed RAM in IT Dept PC - Asset #IT203', '2025-05-06'),
(2, 1, 2, 'SSD upgrade for CEO Laptop', '2025-05-07');

-- View 1: view_usagelogs
CREATE VIEW view_usagelogs AS
SELECT
    ul.usage_id,
    ul.part_id,
    sp.part_name,
    ul.quantity_used,
    ul.used_by,
    a.full_name AS used_by_name,
    ul.usage_context,
    ul.usage_date
FROM UsageLogs ul
JOIN SpareParts sp ON ul.part_id = sp.part_id
JOIN Admin a ON ul.used_by = a.admin_id;

-- View 2: view_purchaseorders
CREATE VIEW view_purchaseorders AS
SELECT
    po.order_id,
    po.part_id,
    sp.part_name,
    po.supplier_id,
    s.supplier_name,
    po.quantity_ordered,
    po.order_date,
    po.received_date,
    po.ordered_by,
    a.full_name AS ordered_by_name
FROM PurchaseOrders po
JOIN SpareParts sp ON po.part_id = sp.part_id
JOIN Suppliers s ON po.supplier_id = s.supplier_id
JOIN Admin a ON po.ordered_by = a.admin_id;