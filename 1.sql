CREATE TABLE payroll_management.Departments (
    DepartmentID INT,
    DepartmentName VARCHAR(50),
   Primary Key (DepartmentID)
);


CREATE TABLE payroll_management.Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    DepartmentID INT,
	Phone_Number VARCHAR(20),
	Employee_Position VARCHAR(50),
	LWOP INT,  --Leave Without Pay
	Primary key (EmployeeID),
	constraint fk_department
	foreign key (DepartmentID)
	References payroll_management.Departments(DepartmentID)
);


CREATE TABLE payroll_management.TaxRates (
    TaxRateID INT ,
    MinIncome DECIMAL(10, 2),
    MaxIncome DECIMAL(10, 2),
    TaxRate DECIMAL(5, 2),
	Primary Key (TaxRateID)
    
);


CREATE TABLE payroll_management.Attendence (
    AttendenceID INT,
    EmployeeID INT,
    AttendanceDate DATE,
    Status VARCHAR(20),
	Primary key (AttendenceID),
	Constraint fk_attendance
	FOREIGN KEY (EmployeeID) 
	REFERENCES payroll_management.Employees(EmployeeID)
	 
);

CREATE TABLE payroll_management.EmployeeSalary (
    SalaryID INT,
    EmployeeID INT,
	TaxRateID INT,
    BasicSalary DECIMAL(10, 2),
    OtherAllowances DECIMAL(10, 2),
	GrossSalary DECIMAL (10,2),
    Deductions DECIMAL(10, 2),
    NetSalary DECIMAL(10, 2),
	primary key (SalaryID),
	constraint fk_employee
	FOREIGN KEY (EmployeeID) 
	REFERENCES payroll_management.Employees(EmployeeID),
	constraint fk_TaxRate
	FOREIGN KEY (TaxRateID) 
	REFERENCES payroll_management.TaxRates(TaxRateID)
);


CREATE TABLE payroll_management.PaymentHistory (
    PaymentID INT,
    EmployeeID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
	Primary Key (PaymentID),
	constraint fk_PaymentHistory
    FOREIGN KEY (EmployeeID)
	REFERENCES payroll_management.Employees(EmployeeID)
);

-- insersion 

--  Departments
INSERT INTO payroll_management.Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT'),
    (4, 'Marketing');

-- Employees
INSERT INTO payroll_management.Employees (EmployeeID, FirstName, LastName, Email, HireDate, DepartmentID, Phone_Number, Employee_Position, LWOP)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '2022-12-31', 1, '1234567890', 'Manager', 0),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-12-31', 1, '9876543210', 'Assistant', 0),
    (3, 'Mike', 'Johnson', 'mike.johnson@example.com', '2022-12-31', 2, '5556667777', 'Manager', 0),
    (4, 'Emily', 'Davis', 'emily.davis@example.com', '2022-12-31', 2, '3332221111', 'Accountant', 0),
    (5, 'David', 'Lee', 'david.lee@example.com', '2022-12-31', 3, '7778889999', 'Developer', 0),
    (6, 'Sarah', 'Brown', 'sarah.brown@example.com', '2022-12-31', 3, '1112223333', 'Manager', 0),
    (7, 'Alex', 'Wilson', 'alex.wilson@example.com', '2022-12-31', 3, '4445556666', 'Data Engineer', 0),
    (8, 'Olivia', 'Moore', 'olivia.moore@example.com', '2022-12-31', 3, '8889990000', 'Developer', 0),
    (9, 'William', 'Johnson', 'william.johnson@example.com', '2022-12-31', 4, '6665554444', 'Manager', 0),
    (10, 'Ava', 'Taylor', 'ava.taylor@example.com', '2022-12-31', 4, '2223334444', 'Salesperson', 0),
    (11, 'Ethan', 'Anderson', 'ethan.anderson@example.com', '2022-12-31', 4, '3334445555', 'Manager', 0),
    (12, 'Mia', 'Martinez', 'mia.martinez@example.com', '2022-12-31', 4, '5554443333', 'Analyst', 0),
    (13, 'James', 'Harris', 'james.harris@example.com', '2022-12-31', 1, '9998887777', 'Assistant', 0),
    (14, 'Sophia', 'Clark', 'sophia.clark@example.com', '2022-12-31', 1, '7778889999', 'Manager', 0),
    (15, 'Logan', 'White', 'logan.white@example.com', '2022-12-31', 2, '1112223333', 'Auditor', 0),
    (16, 'Chloe', 'Adams', 'chloe.adams@example.com', '2022-12-31', 2, '3332221111', 'Accountant', 0),
    (17, 'Liam', 'Thomas', 'liam.thomas@example.com', '2022-12-31', 3, '5556667777', 'Manager', 0),
    (18, 'Ella', 'Walker', 'ella.walker@example.com', '2022-12-31', 3, '4445556666', 'Developer', 0),
    (19, 'Noah', 'Hall', 'noah.hall@example.com', '2022-12-31', 4, '8889990000', 'Salesperson', 0),
    (20, 'Avery', 'Parker', 'avery.parker@example.com', '2022-12-31', 4, '5554443333', 'Analyst', 0),
    (21, 'Jackson', 'Hill', 'jackson.hill@example.com', '2022-12-31', 1, '1234567890', 'HR', 0),
    (22, 'Scarlett', 'Baker', 'scarlett.baker@example.com', '2022-12-31', 1, '9876543210', 'HR', 0),
    (23, 'Lucas', 'Young', 'lucas.young@example.com', '2022-12-31', 2, '5556667777', 'Finance', 0),
    (24, 'Lily', 'Wright', 'lily.wright@example.com', '2022-12-31', 2, '3332221111', 'Finance', 0),
    (25, 'Henry', 'King', 'henry.king@example.com', '2022-12-31', 3, '7778889999', 'IT', 0),
    (26, 'Grace', 'Scott', 'grace.scott@example.com', '2022-12-31', 3, '1112223333', 'IT', 0),
    (27, 'Benjamin', 'Evans', 'benjamin.evans@example.com', '2022-12-31', 3, '4445556666', 'IT', 0),
    (28, 'Aria', 'Turner', 'aria.turner@example.com', '2022-12-31', 3, '8889990000', 'IT', 0),
    (29, 'Daniel', 'Brown', 'daniel.brown@example.com', '2022-12-31', 4, '6665554444', 'Marketing', 0),
    (30, 'Zoe', 'Cooper', 'zoe.cooper@example.com', '2022-12-31', 4, '2223334444', 'Marketing', 0),
    (31, 'Matthew', 'Harris', 'matthew.harris@example.com', '2022-12-31', 4, '3334445555', 'Marketing', 0),
    (32, 'Hannah', 'Collins', 'hannah.collins@example.com', '2022-12-31', 4, '5554443333', 'Marketing', 0),
    (33, 'Samuel', 'Bell', 'samuel.bell@example.com', '2022-12-31', 1, '9998887777', 'HR', 0),
    (34, 'Addison', 'Perez', 'addison.perez@example.com', '2022-12-31', 1, '7778889999', 'HR', 0),
    (35, 'Gabriel', 'Cook', 'gabriel.cook@example.com', '2022-12-31', 2, '1112223333', 'Finance', 0),
    (36, 'Natalie', 'Bennett', 'natalie.bennett@example.com', '2022-12-31', 2, '3332221111', 'Finance', 0),
    (37, 'Christopher', 'Gray', 'christopher.gray@example.com', '2022-12-31', 3, '5556667777', 'IT', 0),
    (38, 'Violet', 'James', 'violet.james@example.com', '2022-12-31', 3, '4445556666', 'IT', 0),
    (39, 'Andrew', 'Turner', 'andrew.turner@example.com', '2022-12-31', 4, '8889990000', 'Marketing', 0),
    (40, 'Sofia', 'Ward', 'sofia.ward@example.com', '2022-12-31', 4, '5554443333', 'Marketing', 0),
    (41, 'William', 'Gonzalez', 'william.gonzalez@example.com', '2022-12-31', 1, '1234567890', 'HR', 0),
    (42, 'Evelyn', 'Rivera', 'evelyn.rivera@example.com', '2022-12-31', 1, '9876543210', 'HR', 0),
    (43, 'Daniel', 'Stewart', 'daniel.stewart@example.com', '2022-12-31', 2, '5556667777', 'Finance', 0),
    (44, 'Madison', 'Flores', 'madison.flores@example.com', '2022-12-31', 2, '3332221111', 'Finance', 0),
    (45, 'Joseph', 'Price', 'joseph.price@example.com', '2022-12-31', 3, '7778889999', 'IT', 0),
    (46, 'Aubrey', 'Morris', 'aubrey.morris@example.com', '2022-12-31', 3, '1112223333', 'IT', 0),
    (47, 'Emma', 'Baker', 'emma.baker@example.com', '2022-12-31', 3, '4445556666', 'IT', 0),
    (48, 'Liam', 'Reed', 'liam.reed@example.com', '2022-12-31', 3, '8889990000', 'IT', 0),
    (49, 'Olivia', 'Hayes', 'olivia.hayes@example.com', '2022-12-31', 4, '6665554444', 'Marketing', 0),
    (50, 'Noah', 'Turner', 'noah.turner@example.com', '2022-12-31', 4, '2223334444', 'Marketing', 0);


-- Tax Rates
INSERT INTO payroll_management.TaxRates (TaxRateID, MinIncome, MaxIncome, TaxRate)
VALUES
    (1, 0.00, 10000.00, 0.10),
    (2, 10001.00, 25000.00, 0.12),
    (3, 25001.00, 50000.00, 0.15),
    (4, 50001.00, 100000.00, 0.20),
    (5, 100001.00, NULL, 0.25);

-- Attendence
WITH date_series AS (
    SELECT generate_series(
        date '2023-01-01',
        date '2023-04-30',
        interval '1 day'
    ) AS attendance_date
)

INSERT INTO payroll_management.Attendence (AttendenceID, EmployeeID, AttendanceDate, Status)
SELECT
    ROW_NUMBER() OVER () AS AttendenceID, 
    employees.EmployeeID,
    ds.attendance_date,
    CASE WHEN random() < 0.90 THEN 'Present' ELSE 'Absent' END 
FROM
    (SELECT generate_series(1, 50) AS EmployeeID) AS employees
CROSS JOIN
    date_series ds;

   

UPDATE payroll_management.Employees
SET LWOP = (subquery.leave_count - 15) 
FROM (
    SELECT
        EmployeeID,
        COUNT(Status) AS leave_count
    FROM payroll_management.Attendence
    WHERE Status = 'Absent'
    GROUP BY EmployeeID
	HAVING COUNT(Status) > 15
) AS subquery
WHERE payroll_management.Employees.EmployeeID = subquery.EmployeeID;



-- EmployeeSalary
INSERT INTO payroll_management.EmployeeSalary (SalaryID, EmployeeID, TaxRateID, BasicSalary, OtherAllowances, GrossSalary, Deductions, NetSalary)
VALUES
    (1, 1, NULL, 87000.00, 0.00, 0.00, 0.00, 0.00),
    (2, 2, NULL, 25000.00, 0.00, 0.00, 0.00, 0.00),
    (3, 3, NULL, 90000.00, 0.00, 0.00, 0.00, 0.00),
    (4, 4, NULL, 80000.00, 0.00, 0.00, 0.00, 0.00),
    (5, 5, NULL, 70000.00, 0.00, 0.00, 0.00, 0.00),
    (6, 6, NULL, 82000.00, 0.00, 0.00, 0.00, 0.00),
    (7, 7, NULL, 65000.00, 0.00, 0.00, 0.00, 0.00),
    (8, 8, NULL, 90000.00, 0.00, 0.00, 0.00, 0.00),
    (9, 9, NULL, 95000.00, 0.00, 0.00, 0.00, 0.00),
    (10, 10, NULL, 20000.00, 0.00, 0.00, 0.00, 0.00),
    (11, 11, NULL, 85000.00, 0.00, 0.00, 0.00, 0.00),
    (12, 12, NULL, 65000.00, 0.00, 0.00, 0.00, 0.00),
    (13, 13, NULL, 30000.00, 0.00, 0.00, 0.00, 0.00),
    (14, 14, NULL, 90000.00, 0.00, 0.00, 0.00, 0.00),
    (15, 15, NULL, 65000.00, 0.00, 0.00, 0.00, 0.00),
    (16, 16, NULL, 75000.00, 0.00, 0.00, 0.00, 0.00),
    (17, 17, NULL, 80000.00, 0.00, 0.00, 0.00, 0.00),
    (18, 18, NULL, 70000.00, 0.00, 0.00, 0.00, 0.00),
    (19, 19, NULL, 25000.00, 0.00, 0.00, 0.00, 0.00),
    (20, 20, NULL, 60000.00, 0.00, 0.00, 0.00, 0.00),
    (21, 21, NULL, 95000.00, 0.00, 0.00, 0.00, 0.00),
    (22, 22, NULL, 70000.00, 0.00, 0.00, 0.00, 0.00),
    (23, 23, NULL, 85000.00, 0.00, 0.00, 0.00, 0.00),
    (24, 24, NULL, 72000.00, 0.00, 0.00, 0.00, 0.00),
    (25, 25, NULL, 80000.00, 0.00, 0.00, 0.00, 0.00),
    (26, 26, NULL, 75000.00, 0.00, 0.00, 0.00, 0.00),
    (27, 27, NULL, 90000.00, 0.00, 0.00, 0.00, 0.00),
    (28, 28, NULL, 65000.00, 0.00, 0.00, 0.00, 0.00),
    (29, 29, NULL, 58000.00, 0.00, 0.00, 0.00, 0.00),
    (30, 30, NULL, 22000.00, 0.00, 0.00, 0.00, 0.00),
    (31, 31, NULL, 76000.00, 0.00, 0.00, 0.00, 0.00),
    (32, 32, NULL, 52000.00, 0.00, 0.00, 0.00, 0.00),
    (33, 33, NULL, 30000.00, 0.00, 0.00, 0.00, 0.00),
    (34, 34, NULL, 84000.00, 0.00, 0.00, 0.00, 0.00),
    (35, 35, NULL, 67000.00, 0.00, 0.00, 0.00, 0.00),
    (36, 36, NULL, 72000.00, 0.00, 0.00, 0.00, 0.00),
    (37, 37, NULL, 89000.00, 0.00, 0.00, 0.00, 0.00),
    (38, 38, NULL, 60000.00, 0.00, 0.00, 0.00, 0.00),
    (39, 39, NULL, 25000.00, 0.00, 0.00, 0.00, 0.00),
    (40, 40, NULL, 62000.00, 0.00, 0.00, 0.00, 0.00),
    (41, 41, NULL, 92000.00, 0.00, 0.00, 0.00, 0.00),
    (42, 42, NULL, 67000.00, 0.00, 0.00, 0.00, 0.00),
    (43, 43, NULL, 72000.00, 0.00, 0.00, 0.00, 0.00),
    (44, 44, NULL, 55000.00, 0.00, 0.00, 0.00, 0.00),
    (45, 45, NULL, 88000.00, 0.00, 0.00, 0.00, 0.00),
    (46, 46, NULL, 63000.00, 0.00, 0.00, 0.00, 0.00),
    (47, 47, NULL, 76000.00, 0.00, 0.00, 0.00, 0.00),
    (48, 48, NULL, 84000.00, 0.00, 0.00, 0.00, 0.00),
    (49, 49, NULL, 67000.00, 0.00, 0.00, 0.00, 0.00),
    (50, 50, NULL, 80000.00, 0.00, 0.00, 0.00, 0.00);

-------------------------------
UPDATE payroll_management.EmployeeSalary
SET OtherAllowances = BasicSalary*0.10;

UPDATE payroll_management.EmployeeSalary
SET GrossSalary = BasicSalary + OtherAllowances;


UPDATE payroll_management.EmployeeSalary
SET TaxRateID =
    CASE
        WHEN BasicSalary <= 10000.00 THEN 1
        WHEN BasicSalary <= 25000.00 THEN 2
        WHEN BasicSalary <= 50000.00 THEN 3
        WHEN BasicSalary <= 100000.00 THEN 4
        ELSE 5
    END;
	
	
UPDATE payroll_management.EmployeeSalary ES
SET Deductions = 
    BasicSalary * (
        SELECT TaxRate
        FROM payroll_management.TaxRates TR
        WHERE ES.TaxRateID = TR.TaxRateID
    ) +
    ((BasicSalary / 30) * (
	select LWOP
	FROM payroll_management.Employees E
    WHERE ES.EmployeeID = E.EmployeeID)) +
    (0.12 * BasicSalary); 


UPDATE payroll_management.EmployeeSalary
SET NetSalary = GrossSalary - Deductions;


-- PaymentHistory
INSERT INTO payroll_management.PaymentHistory (PaymentID, EmployeeID, PaymentDate, Amount, PaymentMethod)
SELECT
    ROW_NUMBER() OVER () AS PaymentID,
    es.EmployeeID,
    d.attendance_date AS PaymentDate,
    es.NetSalary AS Amount,
    CASE 
        WHEN random() < 0.20 THEN 'Cash'
        WHEN random() < 0.95 THEN 'Bank Transfer'
        ELSE 'Cheque'
    END AS PaymentMethod
FROM
    payroll_management.EmployeeSalary es
CROSS JOIN (
    SELECT generate_series(
        date '2023-01-01',
        date '2023-04-30',
        interval '1 month'
    ) AS attendance_date
) d;

----------- final data---------------
SELECT
    e.EmployeeID,
    e.FirstName || ' ' || e.LastName as EmployeeName,
    e.Email,
    e.HireDate,
    e.Phone_Number,
    e.Employee_Position,
	d.DepartmentName,
    e.LWOP as leave_without_pay,
    es.BasicSalary,
    es.OtherAllowances,
    es.GrossSalary,
	es.Deductions,
    es.NetSalary
FROM
    payroll_management.Employees e
JOIN
    payroll_management.EmployeeSalary es 
ON e.EmployeeID = es.EmployeeID
JOIN
    payroll_management.Departments d
ON e.DepartmentID = d.DepartmentID
ORDER BY EmployeeId;








