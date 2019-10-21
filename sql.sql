-- YET ANOTHER CASE WHEN PROBLEM :D

-- Return the titles and descriptions of all films, with a new column "Holiday",
-- that contains the holiday referenced in the film, if any, otherwise is blank.
-- all holiday's welcome :) 

-- EXAMPLE: 
-- title: "Fiction Christmas" -> 'Christmas'
-- description: "The story of a chritmas elf who ...." --> 'Christmas'
-- "Something About Mary" --> ""

-- BONUS: return all of the holiday films first, and sort all films with their 
-- respective holiday category in alphabetical order.

-- BONUS BONUS:
-- Our marketing team is doing a holiday promo. All holiday films 1/2.
-- Can you return the same results, but with the price reflecting the discount?

-- Feel free to peek at your previous warmup to remind yourself of the syntax.

WITH film_and_holiday AS (
    SELECT title, description, rental_rate,
                        CASE
                        WHEN title ILIKE '%Christmas%' OR description ILIKE '%Christmas%' THEN 'Christmas'
                        WHEN title ILIKE '%Easter%' OR description  ILIKE '%Easter%' THEN 'Easter'
                        WHEN title ILIKE '%Thanksgiving%' OR description ILIKE '%Thanksgiving%' THEN 'Thanksgiving'
                        WHEN title ILIKE '%New%Year%' OR description ILIKE '%New%Year%' THEN 'New Year'
                        WHEN title ILIKE '%Halloween%' OR description ILIKE '%Halloween%' THEN 'Halloween'
                        WHEN title ILIKE '%St.%Patrick%' or description ILIKE '%St.%Patrick%' THEN 'Saint Patrick'
                        WHEN title ILIKE '%Independence%' AND title ILIKE '%day%' THEN 'Independence Day'
                        WHEN description ILIKE '%Independence%' AND title ILIKE '%day%' THEN 'Independence Day'
                        WHEN title ILIKE '%Epiphany%' OR description ILIKE '%Epiphany%' THEN 'Epiphany'
                        WHEN title ILIKE '%Hanukkah%' OR description ILIKE '%Hanukkah%' THEN 'Hanukkah'
                        WHEN title ILIKE '%Passover%' OR description ILIKE '%Passover%' THEN 'Passover'
                        WHEN title ILIKE '%Ramadan%' OR description ILIKE '%Ramadan%' THEN 'Ramadan'
                        ELSE ''
                        END AS Holiday
FROM film
) SELECT title, holiday, ROUND(rental_rate/2, 2) AS discount_price, description
    FROM film_and_holiday
    WHERE holiday != ''
ORDER BY holiday;

