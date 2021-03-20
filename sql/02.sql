/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT
    country,
    count(customer_id)
FROM
    customer
INNER JOIN
    address USING (address_id)
INNER JOIN
    city USING (city_id)
INNER JOIN
    country USING (country_id)
GROUP BY
    country
ORDER BY
    count DESC
LIMIT
    1;
