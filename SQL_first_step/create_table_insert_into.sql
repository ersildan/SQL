CREATE TABLE students (
	StudentID INTEGER PRIMARY KEY,
	First_name VARCHAR(100) NOT NULL, 
	Last_name VARCHAR(100) NOT NULL,
	COUNTRY VARCHAR(50) NOT NULL,
	Language VARCHAR(50) NOT NULL,
	Date_birth DATE NOT NULL
);

INSERT INTO students (StudentID, First_name, Last_name, COUNTRY, Language, Date_birth)  
	VALUES 
	(1, 'Ivan', 'Ivanov', 'Rus', 'Ru', '1991-11-06'),
	(2, 'Aleksandr', 'Aleksandrov', 'Rus', 'Ru', '1995-11-08'), 
	(3, 'Olga', 'Petrova', 'UA', 'UA', '1995-11-08'),
	(4, 'Roma', 'Zayceva', 'UK', 'ENG', '2000-08-06'),
	(5, 'Ivan', 'Lomov', 'USA', 'ENG', '1998-01-01');
