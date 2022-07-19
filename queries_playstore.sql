-- Comments in SQL Start with dash-dash --
-- Playstore

-- Find the app with an ID of 1880.
1. SELECT app_name  FROM analytics WHERE id =1880;
        app_name         
-------------------------
 Web Browser for Android

-- Find the ID and app name for all apps that were last updated on August 01, 2018.
2. SELECT id,app_name FROM analytics WHERE last_updated= 'August 01, 2018'

-- Count the number of apps in each category, e.g. “Family | 1972”.
3. SELECT category, count(*) FROM analytics GROUP BY category;

-- Find the top 5 most-reviewed apps and the number of reviews for each.
4. SELECT app_name, reviews FROM analytics LIMIT 5;
                 app_name                 | reviews  
------------------------------------------+----------
 Facebook                                 | 78158306
 WhatsApp Messenger                       | 78128208
 Instagram                                | 69119316
 Messenger – Text and Video Chat for Free | 69119316
 Clash of Clans                           | 69109672
(5 rows)


-- Find the app that has the most reviews with a rating greater than equal to 4.8.
5. SELECT * FROM analytics WHERE rating > 4.8 LIMIT 1

-- Find the average rating for each category ordered by the highest rated to lowest rated.
6. SELECT category, AVG(rating) AS average_rating FROM analytics GROUP BY category;

-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
7.SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price desc  LIMIT 1;

-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
8.SELECT * FROM analytics WHERE min_installs <= 50 AND rating > 0 ORDER BY rating desc;


-- Find the names of all apps that are rated less than 3 with at least 10000 reviews.
9 SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 1000;

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
10. SELECT app_name, price, reviews FROM analytics WHERE price BETWEEN 0.10  and 1.00 LIMIT 10;

-- Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
11. SELECT app_name, last_updated FROM analytics ORDER BY last_updated asc LIMIT 1;

-- Find the most expensive app (the query is very similar to #11).
SELECT app_name, price  FROM analytics ORDER BY price desc LIMIT 1;

-- Count all the reviews in the Google Play Store.
12. SELECT SUM(reviews) FROM analytics;

-- Find all the categories that have more than 300 apps in them.
13. SELECT category FROM analytics GROUP BY category  HAVING COUNT(*) > 300;

-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews; min_installs/reviews AS proportion FROM analytics WHERE min_installs >= 1000 GROUP BY app_name ORDER BY proportion desc LIMIT 1;