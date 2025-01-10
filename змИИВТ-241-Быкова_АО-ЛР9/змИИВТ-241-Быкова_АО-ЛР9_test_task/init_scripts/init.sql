CREATE TABLE IF NOT EXISTS Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT references Customers (CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL
);

CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT references Orders (OrderID),
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL
);

INSERT INTO Customers VALUES (1, 'Антон', 'Иванов', 'antonivanov23@gmail.com'), 
(2, 'Иван', 'Волков', 'ivanvolkov45@gmail.com'),
(3, 'Олег', 'Романов', 'olegromanov34@gmail.com'),
(4, 'Сергей', 'Табаков', 'isergeytabakov22@gmail.com'),
(5, 'Никита', 'Сысоев', 'nikitasusoev55@mail.ru'),
(6, 'Ольга', 'Ершова', 'olgaershova2234@gmail.com'),
(7, 'Анастасия', 'Иванова', 'anasivan889@gmail.com'),
(8, 'Руслан', 'Троцюк', 'rustrok87@mail.ru'),
(9, 'Кристина', 'Кац', 'kriskak34@gmail.com'),
(10, 'Мария', 'Кузина', 'mariskuzina11@gmail.com'),
(11, 'Марина', 'Никулина', 'marianikulina22@icloud.com'),
(12, 'Антон', 'Бедарев', 'bedarexanton66@icloud.com'),
(13, 'Юлия', 'Мещерякова', 'olmesh0987@gmail.com'),
(14, 'Дарья', 'Маркова', 'darmark0922@mail.ru'),
(15, 'Алексей', 'Ворон', 'alexvoron2099@gmail.com'),
(16, 'Данила', 'Кутейников', 'dankutt0987@gmail.com'),
(17, 'Екатерина', 'Рогова', 'katkatrog@icloud.com'),
(18, 'Дарья', 'Еремеева', 'darermer5500@mail.ru'),
(19, 'Полина', 'Мишина', 'polinish@gmail.com'),
(20, 'Александр', 'Васильев', 'ialexsid@gmail.com');

INSERT INTO Orders VALUES (01, 1, '2022-12-31', 10.0),
(02, 1, '2023-12-31', 15000.0),
(03, 3, '2024-01-01', 25000.0),
(04, 3, '2024-12-31', 10033.0),
(05, 5, '2023-03-01', 13009.5),
(06, 7, '2023-04-04', 10000.6),
(07, 7, '2023-10-05', 20067.3),
(08, 8, '2023-12-11', 12000.0),
(09, 8, '2023-10-30', 15000.0),
(010, 9, '2019-12-31', 30000.5),
(011, 10, '2020-12-31', 45000.75),
(012, 10, '2018-06-13', 34000.0),
(013, 12, '2021-09-25', 20088.8),
(014, 12, '2023-01-31', 24000.0),
(015, 12, '2022-11-29', 44000.75),
(016, 13, '2017-08-20', 13400.0),
(017, 14, '2018-05-17', 10033.9),
(018, 14, '2020-12-10', 15045.0),
(019, 14, '2017-06-01', 16222.7),
(020, 14, '2021-12-31', 30555.0),
(021, 16, '2023-04-27', 10500.2),
(022, 17, '2023-11-24', 78000.1),
(023, 17, '2021-05-05', 56000.4),
(024, 17, '2023-12-31', 15000.7),
(025, 18, '2024-07-08', 67000.08),
(026, 18, '2023-12-31', 15000.89),
(027, 19, '2020-12-07', 15000.7),
(028, 20, '2017-12-09', 54000.0),
(029, 10, '2023-12-31', 56000.98),
(030, 20, '2020-03-30', 76000.123);

INSERT INTO OrderDetails VALUES (0111, 01, 9001, 15976, 234.0),
(0222, 01, 9002, 16098, 245.9),
(0333, 01, 9003, 15, 577.5),
(0444, 02, 9004, 20, 900.4),
(0555, 03, 9005, 123, 666.9),
(0666, 03, 9003, 28, 600.8),
(0777, 05, 9003, 115, 166.5),
(0888, 05, 9006, 150, 344.5),
(0999, 06, 9007, 154, 400.5),
(1000, 06, 9008, 145, 600.0),
(1111, 08, 9003, 159, 700.5),
(1222, 09, 9009, 145, 800.5),
(1333, 011, 9010, 12, 300.2),
(1444, 014, 9011, 151, 400.1),
(1555, 015, 9012, 137, 900.5),
(1666, 018, 9004, 89, 200.0),
(1777, 019, 9004, 153, 745.5),
(1888, 022, 9013, 67, 209.8),
(1999, 023, 9014, 154, 707.5),
(2000, 025, 9014, 156, 309.5),
(2111, 027, 9015, 198, 800.5),
(2222, 028, 9016, 199, 400.5),
(2333, 028, 9017, 198, 800.5),
(2444, 028, 9018, 199,1800.5),
(2555, 030, 9015, 23, 990.5);


--Сформировала SQL-запрос, который возвращает список клиентов (имя и фамилия) и суммарную стоимость заказов каждого клиента¬¬:
SELECT firstname, lastname, SUM(totalamount) as sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname;

--Отсортировала полученный список по убыванию суммарной стоимости заказов клиента:
SELECT firstname, lastname, SUM(totalamount) as sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  ORDER by SUM(totalamount);

--Добавила столбец со средней суммарной стоимостью заказов:
SELECT firstname, lastname, SUM(totalamount) as sumtotalamount, AVG(totalamount) as avgtotalamoun 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  ORDER by SUM(totalamount);

--Вывела список клиентов с наибольшей суммарной стоимостью заказов (имя, фамилия, стоимость):
SELECT firstname, lastname, SUM(totalamount) as sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  HAVING SUM(totalamount) = (SELECT MAX(sumtotalamount) 
  FROM (SELECT SUM(totalamount) AS sumtotalamount FROM orders 
     GROUP BY customerid));

--Для каждого клиента с наибольшей суммарной стоимостью заказов вывела список его заказов (номер заказа и стоимость) в порядке возрастания стоимости заказа:
SELECT firstname, lastname, orderid, totalamount 
 FROM customers JOIN orders ON customers.customerid = orders.customerid
  WHERE customers.customerid = (SELECT customerid FROM orders GROUP BY customerid
   HAVING SUM(totalamount) = (SELECT MAX(sumtotalamount) 
    FROM (SELECT SUM(totalamount) AS sumtotalamount FROM orders GROUP BY customerid)))
 ORDER BY totalamount DESC;

--Вывела только тех клиентов, у которых суммарная стоимость заказов превышает среднюю суммарную стоимость заказов клиентов:
 SELECT firstname, lastname, SUM(totalamount) AS sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  HAVING SUM(totalamount) > (SELECT avg(totalamount) FROM orders) ORDER BY sumtotalamount;

