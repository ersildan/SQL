CREATE TABLE employess (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    salary INTEGER
);


INSERT INTO employess (id, name, salary)
VALUES (1, 'Andny', 30000);

INSERT INTO employess (id, name, salary)
VALUES (1, 'Yim', 40000); 

INSERT INTO employess (id, name, salary)
VALUES (1, 'Andny', 50000);


UPDATE employess
SET salary = 5000
WHERE id = 2;
