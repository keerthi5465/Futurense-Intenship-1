
CREATE DATABASE CompanyDB;


USE CompanyDB;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    HireDate DATE
);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    StartDate DATE,
    EndDate DATE
);


CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);


INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');


INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate) VALUES
(1, 'John', 'Doe', 2, '2021-01-15'),
(2, 'Jane', 'Smith', 1, '2019-07-23'),
(3, 'Mike', 'Johnson', 2, '2020-03-10'),
(4, 'Emily', 'Davis', 3, '2022-05-21');


INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate) VALUES
(1, 'Project Alpha', '2022-01-01', '2022-12-31'),
(2, 'Project Beta', '2023-01-01', '2023-12-31');


INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES
(1, 1),
(3, 1),
(2, 2),
(4, 2);



SELECT e.FirstName, e.LastName, d.DepartmentName, p.ProjectName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID;


SELECT e.FirstName, e.LastName, p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID;


SELECT e.FirstName, e.LastName
FROM Employees e
WHERE e.EmployeeID IN (
    SELECT ep.EmployeeID
    FROM EmployeeProjects ep
    GROUP BY ep.EmployeeID
    HAVING COUNT(ep.ProjectID) > 1
);


SELECT d.DepartmentName
FROM Departments d
WHERE d.DepartmentID = (
    SELECT e.DepartmentID
    FROM Employees e
    GROUP BY e.DepartmentID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);



SELECT e.FirstName, e.LastName, DATEDIFF(CURDATE(), e.HireDate) AS DaysWithCompany
FROM Employees e;

SELECT p.ProjectName
FROM Projects p
WHERE CURDATE() BETWEEN p.StartDate AND p.EndDate;


SELECT e.FirstName, e.LastName, DATE_ADD(e.HireDate, INTERVAL 1 YEAR) AS NewHireDate
FROM Employees e;


SELECT e.FirstName, e.LastName, DATEDIFF(CURDATE(), e.HireDate) AS DaysWithCompany
FROM Employees e;


SELECT p.ProjectName
FROM Projects p
WHERE CURDATE() BETWEEN p.StartDate AND p.EndDate;


SELECT e.FirstName, e.LastName, DATE_ADD(e.HireDate, INTERVAL 1 YEAR) AS NewHireDate
FROM Employees e;
