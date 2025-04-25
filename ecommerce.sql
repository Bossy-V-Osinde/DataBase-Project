-- Creating Database
CREATE DATABASE ecommerceDB;

-- Using the Database
USE ecommerceDB;

-- Table: product_category
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Table: brand
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL,
    brand_description TEXT
);

-- Table: size_category
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- Table: product
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Table: color
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

-- Table: size_option
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_item
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Table: product_image
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Person 2: Insertion of Data

-- Inserting product categories
INSERT INTO product_category (category_name)
VALUES
('Clothing'), ('Electronics'), ('Footwear');

-- Inserting brands
INSERT INTO brand (brand_name, brand_description) 
VALUES
('TechWear', 'High-performance electronics and gadgets'),
('UrbanStyle', 'Trendy streetwear for all seasons'),
('SneakerVerse', 'The best kicks in the game');

-- Inserting size categories
INSERT INTO size_category (category_name) 
VALUES
('Clothing Sizes'), ('Shoe Sizes');

-- Inserting attribute categories
INSERT INTO attribute_category (category_name) 
VALUES
('Physical Attributes'), ('Technical Attributes');

-- Inserting attribute types
INSERT INTO attribute_type (type_name) 
VALUES
('Text'), ('Number'), ('Boolean');

-- Inserting colors
INSERT INTO color (color_name) 
VALUES
('Red'), ('Black'), ('White');

-- Inserting size options
INSERT INTO size_option (size_category_id, size_name) 
VALUES
(1, 'S'), (1, 'M'), (1, 'L'), -- Clothing sizes
(2, '42'), (2, '44');         -- Shoe sizes

-- Inserting products
INSERT INTO product (product_name, brand_id, category_id, base_price, description) 
VALUES
('Bluetooth Headphones', 1, 2, 49.99, 'Wireless over-ear headphones with noise cancellation.'),
('Graphic T-Shirt', 2, 1, 19.99, '100% cotton T-shirt with printed artwork.'),
('Running Sneakers', 3, 3, 89.99, 'Lightweight shoes designed for comfort and performance.');

-- Inserting product items
INSERT INTO product_item (product_id, color_id, size_id, stock_quantity, price) 
VALUES
(1, 2, 1, 50, 49.99), -- Black Bluetooth Headphones
(2, 1, 2, 100, 19.99), -- Red T-shirt Size M
(3, 3, 4, 30, 89.99);  -- White Sneakers Size 42

-- Inserting product images
INSERT INTO product_image (product_id, image_url, alt_text) 
VALUES
(1, 'https://example.com/images/headphones.jpg', 'Black Bluetooth Headphones'),
(2, 'https://example.com/images/tshirt.jpg', 'Red Graphic T-Shirt'),
(3, 'https://example.com/images/sneakers.jpg', 'White Running Sneakers');

-- Inserting product variations
INSERT INTO product_variation (product_id, color_id, size_id) 
VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 4);

-- Inserting product attributes
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, value) 
VALUES
(1, 2, 1, 'Bluetooth 5.0'),
(1, 1, 2, '250'), -- weight in grams
(2, 1, 1, 'Cotton'),
(3, 1, 2, '300'); -- weight in grams

-- View all data from each table

SELECT * FROM product_category;
SELECT * FROM brand;
SELECT * FROM size_category;
SELECT * FROM attribute_category;
SELECT * FROM attribute_type;
SELECT * FROM product;
SELECT * FROM color;
SELECT * FROM size_option;
SELECT * FROM product_item;
SELECT * FROM product_image;
SELECT * FROM product_variation;
SELECT * FROM product_attribute;


