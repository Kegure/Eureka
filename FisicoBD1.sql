/* LógicoBD1: */

CREATE TABLE Store (
    store_id INTEGER PRIMARY KEY,
    store_name VARCHAR,
    location VARCHAR,
    description VARCHAR,
    total_reviews INTEGER
);

CREATE TABLE User (
    user_id INTEGER PRIMARY KEY,
    username VARCHAR,
    email VARCHAR,
    password VARCHAR
);

CREATE TABLE Search (
    search_id INTEGER PRIMARY KEY,
    search_term VARCHAR,
    search_time TIME,
    fk_User_user_id INTEGER
);

CREATE TABLE Review (
    review_id INTEGER PRIMARY KEY,
    rating INTEGER,
    comment VARCHAR,
    review_date TIMESTAMP,
    fk_user_id INTEGER,
    fk_store_id INTEGER
);

CREATE TABLE Product (
    product_id NUMERIC PRIMARY KEY,
    product_name VARCHAR,
    price FLOAT,
    description VARCHAR,
    search_count INTEGER,
    fk_store_id INTEGER
);
 
ALTER TABLE Search ADD CONSTRAINT FK_Search_2
    FOREIGN KEY (fk_User_user_id)
    REFERENCES User (user_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Review ADD CONSTRAINT FK_Review_2
    FOREIGN KEY (fk_user_id)
    REFERENCES User (user_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Review ADD CONSTRAINT FK_Review_3
    FOREIGN KEY (fk_store_id)
    REFERENCES Store (store_id)
    ON DELETE RESTRICT;
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_2
    FOREIGN KEY (fk_store_id)
    REFERENCES Store (store_id)
    ON DELETE RESTRICT;