/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */

SELECT
    DISTINCT first_name, last_name
FROM
    (
        SELECT
            actor_id
        FROM
            film_actor
        INNER JOIN
            film USING (film_id)
        INNER JOIN
            film_category USING (film_id)
        INNER JOIN
            category USING (category_id)
        WHERE
            category.name = 'Children' AND
            actor_id NOT IN
            (
                SELECT
                    actor_id
                FROM
                    film_actor
                INNER JOIN
                    film USING (film_id)
                INNER JOIN
                    film_category USING (film_id)
                INNER JOIN
                    category USING (category_id)
                WHERE
                    category.name = 'Horror'
            )
    ) AS t2
INNER JOIN
    actor USING (actor_id);
