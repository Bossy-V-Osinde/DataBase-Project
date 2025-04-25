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
