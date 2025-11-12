CREATE TABLE IF NOT EXISTS supply (
    supply_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT
);
