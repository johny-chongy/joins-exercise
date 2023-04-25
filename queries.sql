-- Join two tables so that every column and record appears regardless of owner_id
SELECT *
    FROM owners AS o
    LEFT JOIN vehicles as v
        ON o.id = v.owner_id;


-- Count number of cars for each owner who has a vehicles; display first_name and count
-- first_name is ASC order
SELECT first_name, count(*)
    FROM owners AS o
    JOIN vehicles AS v
        ON o.id = v.owner_id
    GROUP BY o.id
    ORDER BY first_name;


--Count number of cars for each owner and display avg price and count
--only show where avg price > 10000 and count > 1
SELECT first_name, ROUND(AVG(price),0) AS average_price, count(*)
    FROM owners
    JOIN vehicles
        ON owners.id = vehicles.owner_id
    GROUP BY owners.id
    HAVING AVG(price) > 10000 AND count(*) > 1
    ORDER BY first_name DESC;