USE MASTER
GO
DROP DATABASE IF EXISTS AKGraph
GO
CREATE DATABASE AKGraph
GO
USE AKGraph
GO

-- �������� ������� ���������
CREATE TABLE Supplier (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    products VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
) AS NODE;

-- �������� ������� ��������
CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    cuisine_type VARCHAR(50) NOT NULL
) AS NODE;

-- �������� ������� �����
CREATE TABLE Dish (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    dish_type VARCHAR(50) NOT NULL
) AS NODE;


CREATE TABLE Supplies AS EDGE
CREATE TABLE Serves AS EDGE
CREATE TABLE Collaborates AS EDGE

-- ������� ������ � ������� ���������
INSERT INTO Supplier (id, name, products, address) VALUES
(1, 'Fresh Ingredients Ltd', '�����, �������� ��������', '456 Market St'),
(2, 'Baker Supplies Co', '����, ������, �����', '789 Baker St'),
(3, 'Meat Lovers Inc', '��������, �������, ������', '123 Butcher Ave'),
(4, 'Seafood World', '����, ������������', '321 Fisherman Rd'),
(5, 'Fruit Paradise', '������, �����', '654 Orchard Blvd'),
(6, 'Dairy Best', '������, ���, ������', '987 Dairy Ln'),
(7, 'Spice Masters', '������, �����', '741 Spice St'),
(8, 'Vegetable King', '�����', '159 Vegetable Rd'),
(9, 'Pasta Perfect', '��������, �����', '753 Pasta Ave'),
(10, 'Bakery Essentials', '����, ����, �����', '852 Bakery Blvd');

-- ������� ������ � ������� ��������
INSERT INTO Restaurant (id, name, address, cuisine_type) VALUES
(1, 'La Bella', '123 Main St', '�����������'),
(2, 'Sushi World', '456 Ocean Ave', '��������'),
(3, 'Burger Palace', '789 Burger Rd', '������������'),
(4, 'Curry House', '321 Spice St', '���������'),
(5, 'Taco Fiesta', '654 Fiesta Ln', '������������'),
(6, 'Noodle Heaven', '987 Noodle Blvd', '���������'),
(7, 'BBQ Pit', '741 Smoke St', '������������'),
(8, 'Veggie Delight', '159 Green Rd', '��������������'),
(9, 'Pizza Perfect', '753 Pizza Ave', '�����������'),
(10, 'Seafood Shack', '852 Fisherman Rd', '�������');

-- ������� ������ � ������� �����
INSERT INTO Dish (id, name, price, dish_type) VALUES
(1, '����� ���������', 10.99, '��������'),
(2, '���� � �������', 12.99, '��������'),
(3, '������ � �������', 9.99, '��������'),
(4, '����� � �������', 11.99, '��������'),
(5, '���� � ���������', 8.99, '��������'),
(6, '����� � �������', 7.99, '��������'),
(7, '�������� BBQ', 14.99, '��������'),
(8, '����� ������', 6.99, '�������'),
(9, '����� ���������', 11.49, '��������'),
(10, '�������� �� �����', 13.99, '��������');



INSERT INTO Collaborates ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Supplier WHERE id = 1),
 (SELECT $node_id FROM Supplier WHERE id = 2)),
 ((SELECT $node_id FROM Supplier WHERE id = 10),
 (SELECT $node_id FROM Supplier WHERE id = 5)),
 ((SELECT $node_id FROM Supplier WHERE id = 2),
 (SELECT $node_id FROM Supplier WHERE id = 9)),
 ((SELECT $node_id FROM Supplier WHERE id = 3),
 (SELECT $node_id FROM Supplier WHERE id = 1)),
 ((SELECT $node_id FROM Supplier WHERE id = 3),
 (SELECT $node_id FROM Supplier WHERE id = 6)),
 ((SELECT $node_id FROM Supplier WHERE id = 4),
 (SELECT $node_id FROM Supplier WHERE id = 2)),
 ((SELECT $node_id FROM Supplier WHERE id = 5),
 (SELECT $node_id FROM Supplier WHERE id = 4)),
 ((SELECT $node_id FROM Supplier WHERE id = 6),
 (SELECT $node_id FROM Supplier WHERE id = 7)),
 ((SELECT $node_id FROM Supplier WHERE id = 6),
 (SELECT $node_id FROM Supplier WHERE id = 8)),
 ((SELECT $node_id FROM Supplier WHERE id = 8),
 (SELECT $node_id FROM Supplier WHERE id = 3));

INSERT INTO Supplies ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Supplier WHERE ID = 1),
 (SELECT $node_id FROM Restaurant WHERE ID = 1)),
 ((SELECT $node_id FROM Supplier WHERE ID = 5),
 (SELECT $node_id FROM Restaurant WHERE ID = 1)),
 ((SELECT $node_id FROM Supplier WHERE ID = 8),
 (SELECT $node_id FROM Restaurant WHERE ID = 1)),
 ((SELECT $node_id FROM Supplier WHERE ID = 2),
 (SELECT $node_id FROM Restaurant WHERE ID = 2)),
 ((SELECT $node_id FROM Supplier WHERE ID = 3),
 (SELECT $node_id FROM Restaurant WHERE ID = 3)),
 ((SELECT $node_id FROM Supplier WHERE ID = 4),
 (SELECT $node_id FROM Restaurant WHERE ID = 3)),
 ((SELECT $node_id FROM Supplier WHERE ID = 6),
 (SELECT $node_id FROM Restaurant WHERE ID = 4)),
 ((SELECT $node_id FROM Supplier WHERE ID = 7),
 (SELECT $node_id FROM Restaurant WHERE ID = 4)),
 ((SELECT $node_id FROM Supplier WHERE ID = 1),
 (SELECT $node_id FROM Restaurant WHERE ID = 9)),
 ((SELECT $node_id FROM Supplier WHERE ID = 9),
 (SELECT $node_id FROM Restaurant WHERE ID = 4)),
 ((SELECT $node_id FROM Supplier WHERE ID = 10),
 (SELECT $node_id FROM Restaurant WHERE ID = 9));


INSERT INTO Serves ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Restaurant WHERE ID = 1),
 (SELECT $node_id FROM Dish WHERE ID = 6)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 5),
 (SELECT $node_id FROM Dish WHERE ID = 1)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 8),
 (SELECT $node_id FROM Dish WHERE ID = 7)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 2),
 (SELECT $node_id FROM Dish WHERE ID = 2)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 3),
 (SELECT $node_id FROM Dish WHERE ID = 5)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 4),
 (SELECT $node_id FROM Dish WHERE ID = 3)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 6),
 (SELECT $node_id FROM Dish WHERE ID = 4)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 7),
 (SELECT $node_id FROM Dish WHERE ID = 2)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 1),
 (SELECT $node_id FROM Dish WHERE ID = 9)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 9),
 (SELECT $node_id FROM Dish WHERE ID = 8)),
 ((SELECT $node_id FROM Restaurant WHERE ID = 10),
 (SELECT $node_id FROM Dish WHERE ID = 9));

 SELECT S1.name, S2.name
FROM Supplier AS S1
	, Collaborates AS c
	, Supplier AS S2
WHERE MATCH(S1-(c)->S2)
	AND S1.name = 'Meat Lovers Inc';

SELECT s.name, r.name
FROM Supplier AS s
	, Supplies AS ss
	, Restaurant AS r
WHERE MATCH(s-(ss)->r)
AND s.name = 'Fresh Ingredients Ltd';

SELECT s.name, r.name
FROM Supplier AS s
	, Supplies AS ss
	, Restaurant AS r
WHERE MATCH(s-(ss)->r)
AND r.name = 'La Bella';

SELECT r.name, d.name
FROM Dish AS d
	, serves AS s
	, Restaurant AS r
WHERE MATCH(r-(s)->d)
AND r.name = 'La Bella';

SELECT r.name, d.name
FROM Dish AS d
	, serves AS s
	, Restaurant AS r
WHERE MATCH(r-(s)->d)
AND d.name = '���� � �������';

SELECT S1.name
	, STRING_AGG(S2.name, '->') WITHIN GROUP (GRAPH PATH)
FROM Supplier AS S1
	, Collaborates FOR PATH AS c
	, Supplier FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(c)->S2)+))
	AND S1.name = 'Dairy Best';

	
SELECT S1.name
	, STRING_AGG(S2.name, '->') WITHIN GROUP (GRAPH PATH)
FROM Supplier AS S1
	, Collaborates FOR PATH AS c
	, Supplier FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(c)->S2){1,2}))
	AND S1.name = 'Dairy Best';

SELECT S1.ID AS IdFirst
	, S1.name AS First
	, CONCAT(N'supplier (', S1.id, ')') AS [First image name]
	, S2.ID AS IdSecond
	, S2.name AS Second
	, CONCAT(N'supplier (', S2.id, ')') AS [Second image name]
FROM Supplier AS S1
	, Collaborates AS c
	, Supplier AS S2
WHERE MATCH(S1-(c)->S2)

SELECT S.ID AS IdFirst
	, S.name AS First
	, CONCAT(N'supplier (', S.id, ')') AS [First image name]
	, R.ID AS IdSecond
	, R.name AS Second
	, CONCAT(N'restaurant (', R.id, ')') AS [Second image name]
FROM Supplier AS s
	, Supplies AS ss
	, Restaurant AS r
WHERE MATCH(s-(ss)->r)

SELECT D.ID AS IdFirst
	, D.name AS First
	, CONCAT(N'dish (', D.id, ')') AS [First image name]
	, R.ID AS IdSecond
	, R.name AS Second
	, CONCAT(N'restaurant (', R.id, ')') AS [Second image name]
FROM Dish AS d
	, serves AS s
	, Restaurant AS r
WHERE MATCH(r-(s)->d)

select @@servername