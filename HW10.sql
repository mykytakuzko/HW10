-- створення БД
CREATE DATABASE Hospital

-- створення таблиці Departments
CREATE TABLE Departments
(
	Id INT IDENTITY,
	Building INT NOT NULL,
	Financing DECIMAL(19,4) NOT NULL DEFAULT 0,
	Name NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_Departments_Id PRIMARY KEY (Id),
	CONSTRAINT CK_Departments_Building CHECK (Building >= 1 AND Building <= 5),
	CONSTRAINT CK_Departments_Financing CHECK (Financing >= 0),
	CONSTRAINT UQ_Departments_Name UNIQUE (Name),
	CONSTRAINT CK_Departments_Name CHECK (LEN(Name) > 0)
)

-- створення таблиці Diseases
CREATE TABLE Diseases
(
	Id INT IDENTITY,
	Name NVARCHAR(100) NOT NULL,
	Severity INT NOT NULL DEFAULT 1,
	CONSTRAINT PK_Diseases_Id PRIMARY KEY (Id),
	CONSTRAINT CK_Diseases_Name CHECK (LEN(Name) > 0),
	CONSTRAINT UQ_Diseases_Name UNIQUE (Name),
	CONSTRAINT CK_Diseases_Severity CHECK (Severity >= 1)
)

-- створення таблиці Doctors
CREATE TABLE Doctors
(
	Id INT IDENTITY,
	Name NVARCHAR(MAX) NOT NULL,
	Phone CHAR(10),
	Salary DECIMAL(19,4) NOT NULL,
	Surname NVARCHAR(MAX) NOT NULL,
	CONSTRAINT PK_Doctors_Id PRIMARY KEY (Id),
	CONSTRAINT CK_Doctors_Name CHECK (LEN(Name) > 0),
	CONSTRAINT CK_Doctors_Salary CHECK (Salary > 0),
	CONSTRAINT CK_Doctors_Surname CHECK (LEN(Surname) > 0)
)

-- створення таблиці Examinations
CREATE TABLE Examinations
(
	Id INT IDENTITY,
	DayOfWeek INT NOT NULL,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_Examinations_Id PRIMARY KEY (Id),
	CONSTRAINT CK_Examinations_DayOfWeek CHECK (DayOfWeek >= 1 AND DayOfWeek <= 7),
	CONSTRAINT CK_Examinations_StartTime CHECK (StartTime BETWEEN '08:00:00' AND '18:00:00'),
	CONSTRAINT CK_Examinations_EndTime CHECK (EndTime > StartTime),
	CONSTRAINT CK_Examinations_Name CHECK (LEN(Name) > 0),
	CONSTRAINT UQ_Examinations_Name UNIQUE (Name)
)

-- створення таблиці Wards
CREATE TABLE Wards
(
	Id INT IDENTITY,
	Building INT NOT NULL,
	Floor INT NOT NULL,
	Name NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_Wards_Id PRIMARY KEY (Id),
	CONSTRAINT CK_Wards_Building CHECK (Building >= 1 AND Building <= 5),
	CONSTRAINT CK_Wards_Floor CHECK (Floor >= 1),
	CONSTRAINT CK_Wards_Name CHECK (LEN(Name) > 0),
	CONSTRAINT UQ_Wards_Name UNIQUE (Name)
)

-- Наповнення таблиць тестовими даними
INSERT INTO Departments (Building, Financing, Name)
VALUES 
(1, 10000, 'Cardiology'),
(2, 25000, 'Neurology'),
(3, 13000, 'Oncology'),
(4, 5000,  'Dermatology'),
(5, 20000, 'Pediatrics'),
(3, 14500, 'Gastroenterology'),
(5, 28000, 'Urology'),
(3, 12500, 'Nephrology'),
(4, 27000, 'Orthopedics'),
(2, 11000, 'Endocrinology'),
(1, 30000, 'Psychiatry'),
(3, 8000,  'Hematology'),
(5, 29999, 'Rheumatology'),
(5, 30500, 'Pulmonology'),
(3, 9000,  'Immunology'),
(4, 4000,  'Genetics'),
(5, 10000, 'Virology'),
(2, 5000,  'Pathology'),
(4, 12000, 'Toxicology'),
(1, 15000, 'Ophthalmology');

INSERT INTO Diseases (Name, Severity)
VALUES 
('Influenza', 2),
('COVID-19', 5),
('Diabetes', 3),
('Hypertension', 2),
('Asthma', 3),
('Tuberculosis', 4),
('Cancer', 5),
('Hepatitis', 3),
('Arthritis', 2),
('Migraine', 1),
('Depression', 3),
('Epilepsy', 4),
('Parkinson''s', 4),
('Alzheimer''s', 5),
('Cholera', 3),
('Leukemia', 5),
('Pneumonia', 4),
('Gastritis', 2),
('Appendicitis', 3),
('Stroke', 5);

INSERT INTO Doctors (Name, Phone, Salary, Surname)
VALUES
('Anna', '0501234567', 1200, 'Nelson'),
('John', '0501234568', 1600, 'Smith'),
('Emily', '0501234569', 1800, 'Clark'),
('Michael', '0501234570', 2000, 'Norris'),
('Sarah', '0501234571', 900, 'Nguyen'),
('Robert', '0501234572', 2500, 'Brown'),
('Jessica', '0501234573', 1500, 'Davis'),
('Daniel', '0501234574', 1700, 'Miller'),
('Laura', '0501234575', 1900, 'Wilson'),
('Kevin', '0501234576', 2200, 'Moore'),
('Olivia', '0501234577', 800, 'Taylor'),
('James', '0501234578', 1000, 'Anderson'),
('Emma', '0501234579', 2100, 'Thomas'),
('William', '0501234580', 1300, 'Jackson'),
('Linda', '0501234581', 1750, 'White'),
('Steven', '0501234582', 900, 'Nash'),
('Barbara', '0501234583', 1450, 'Martin'),
('Joshua', '0501234584', 1850, 'Lee'),
('Samantha', '0501234585', 1600, 'Hall'),
('Anthony', '0501234586', 2400, 'Nelson');

INSERT INTO Examinations (DayOfWeek, StartTime, EndTime, Name)
VALUES
(1, '12:00', '13:00', 'MRI'),
(2, '12:30', '13:30', 'CT Scan'),
(3, '13:00', '14:00', 'Ultrasound'),
(1, '10:00', '11:00', 'X-ray'),
(2, '09:00', '10:00', 'Blood Test'),
(3, '14:00', '15:00', 'Urine Test'),
(4, '12:00', '13:00', 'Eye Exam'),
(5, '15:00', '16:00', 'Dental Check'),
(6, '13:00', '14:00', 'Skin Biopsy'),
(7, '16:00', '17:00', 'Endoscopy'),
(1, '12:15', '13:15', 'Cardiac Test'),
(2, '14:30', '15:30', 'Hearing Test'),
(3, '12:45', '13:45', 'Lung Function Test'),
(4, '11:00', '12:00', 'Colonoscopy'),
(5, '08:30', '09:30', 'Mammography'),
(6, '09:45', '10:45', 'Thyroid Scan'),
(7, '10:00', '11:00', 'Allergy Test'),
(2, '12:00', '13:00', 'EKG'),
(3, '14:30', '15:30', 'Blood Pressure Test'),
(1, '13:30', '14:30', 'Vision Test');

INSERT INTO Wards (Building, Floor, Name)
VALUES
(4, 1, 'Ward A'),
(5, 1, 'Ward B'),
(2, 2, 'Ward C'),
(3, 3, 'Ward D'),
(1, 1, 'Ward E'),
(5, 2, 'Ward F'),
(4, 3, 'Ward G'),
(2, 1, 'Ward H'),
(3, 1, 'Ward I'),
(4, 2, 'Ward J'),
(1, 2, 'Ward K'),
(2, 3, 'Ward L'),
(3, 2, 'Ward M'),
(5, 3, 'Ward N'),
(4, 1, 'Ward O'),
(3, 4, 'Ward P'),
(2, 4, 'Ward Q'),
(1, 3, 'Ward R'),
(5, 1, 'Ward S'),
(3, 1, 'Ward T');

-- Вивести вміст таблиці палат
SELECT *
FROM Wards

-- Вивести прізвища та телефони усіх лікарів
SELECT Surname, Phone
FROM Doctors

-- Вивести усі поверхи без повторень, де розміщуються палати
SELECT DISTINCT Floor
FROM Wards

-- Вивести назви захворювань під назвою «Name of Disease» та ступінь їхньої тяжкості під назвою «Severity of Disease»
SELECT Name AS [Name of Disease], Severity AS [Severity of Disease]
FROM Diseases

-- Застосувати вираз FROM для будь-яких трьох таблиць бази даних, використовуючи псевдоніми
SELECT *
FROM Doctors AS d

SELECT *
FROM Wards AS w

SELECT *
FROM Examinations AS e

-- Вивести назви відділень, які знаходяться у корпусі 5 з фондом фінансування меншим, ніж 30000
SELECT Name
FROM Departments
WHERE Building = 5 AND Financing < 30000

-- Вивести назви відділень, які знаходяться у корпусі 3 з фондом фінансування у діапазоні від 12000 до 15000
SELECT Name
FROM Departments
WHERE Building = 3 AND (Financing >= 12000 AND Financing <= 15000)

-- Вивести назви палат, які знаходяться у корпусах 4 та 5 на 1-му поверсі
SELECT Name
FROM Wards
WHERE (Building = 4 OR Building = 5) AND Floor = 1

-- Вивести назви, корпуси та фонди фінансування відділень, які знаходяться у корпусах 3 або 6 та мають фонд фінансування менший, ніж 11000 або більший за 25000
SELECT Name, Building, Financing
FROM Departments
WHERE (Building = 3 OR Building = 6) AND (Financing < 11000 OR Financing > 25000)

-- Вивести прізвища лікарів, зарплата (сума ставки та надбавки) яких перевищує 1500
-- Виходить, що треба додати колонку для надбавок
ALTER TABLE Doctors
ADD Bonus DECIMAL(19,4) NOT NULL DEFAULT 0
-- Наповнюю нову колонку в існуючих записах
UPDATE Doctors SET Bonus = 250 WHERE Id = 1;
UPDATE Doctors SET Bonus = 400 WHERE Id = 2;
UPDATE Doctors SET Bonus = 370 WHERE Id = 3;
UPDATE Doctors SET Bonus = 150 WHERE Id = 4;
UPDATE Doctors SET Bonus = 200 WHERE Id = 5;
UPDATE Doctors SET Bonus = 600 WHERE Id = 6;
UPDATE Doctors SET Bonus = 300 WHERE Id = 7;
UPDATE Doctors SET Bonus = 350 WHERE Id = 8;
UPDATE Doctors SET Bonus = 500 WHERE Id = 9;
UPDATE Doctors SET Bonus = 450 WHERE Id = 10;
UPDATE Doctors SET Bonus = 180 WHERE Id = 11;
UPDATE Doctors SET Bonus = 220 WHERE Id = 12;
UPDATE Doctors SET Bonus = 480 WHERE Id = 13;
UPDATE Doctors SET Bonus = 210 WHERE Id = 14;
UPDATE Doctors SET Bonus = 330 WHERE Id = 15;
UPDATE Doctors SET Bonus = 190 WHERE Id = 16;
UPDATE Doctors SET Bonus = 260 WHERE Id = 17;
UPDATE Doctors SET Bonus = 410 WHERE Id = 18;
UPDATE Doctors SET Bonus = 340 WHERE Id = 19;
UPDATE Doctors SET Bonus = 550 WHERE Id = 20;
-- Виконую запит
SELECT Surname
FROM Doctors
WHERE Salary + Bonus > 1500

-- Вивести прізвища лікарів, у яких половина зарплати перевищує триразову надбавку
SELECT Surname
FROM Doctors
WHERE (Salary / 2) > (Bonus * 3)

-- Вивести назви обстежень без повторень, які проводяться у перші три дні тижня з 12:00 до 15:00
SELECT DISTINCT Name
FROM Examinations
WHERE DayOfWeek IN (1, 2, 3) AND (StartTime >= '12:00:00' AND EndTime <= '15:00:00')

-- Вивести назви та номери корпусів відділень, які знаходяться у корпусах 1, 3, 8 або 10
SELECT Name, Building
FROM Departments
WHERE Building in (1, 3, 8, 10) -- але ж для поля Building є обмеження від 1 до 5, тому 8 та 10 взагалі не існують

-- Вивести назви захворювань усіх ступенів тяжкості, крім 1-го та 2-го
SELECT Name
FROM Diseases
WHERE SEVERITY NOT IN (1, 2)

-- Вивести назви відділень, які не знаходяться у 1-му або 3-му корпусі
SELECT Name
FROM Departments
WHERE Building NOT IN (1, 3)

-- Вивести назви відділень, які знаходяться у 1-му або 3-му корпусі
SELECT Name
FROM Departments
WHERE Building IN (1, 3)

-- Вивести прізвища лікарів, що починаються з літери «N»
SELECT Surname
FROM Doctors
WHERE Surname LIKE 'N%'