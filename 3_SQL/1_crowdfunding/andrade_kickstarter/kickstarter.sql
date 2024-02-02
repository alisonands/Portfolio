USE kickstarter;

-- average values of failed and successful companies
/*SELECT avg(goal)
FROM campaign as c
WHERE outcome = 'failed'*/

-- top/bottom sub/categories that raised the least/most
/*SELECT c1.name, SUM(c.pledged) as total_backers
FROM campaign as c
LEFT OUTER JOIN sub_category as sc ON c.sub_category_id = sc.id
LEFT OUTER JOIN category AS c1 ON sc.category_id = c1.id 
GROUP BY c1.name			 -- change sc/c1 for sub_category/catogery respectively
ORDER BY total_backers DESC   -- change ASC/DESC accordingly
-- LIMIT 3; */

-- show all subcategories of games
/*SELECT *
FROM CATEGORY as c1
LEFT OUTER JOIN sub_category AS sc ON sc.category_id = c1.id 
WHERE c1.name = 'games'*/

-- most successful board game companies
/*SELECT *, (C.pledged - C.goal)/c.goal*100 as surpassed_goal
FROM Campaign as c
LEFT OUTER JOIN sub_category as sc ON c.sub_category_id = sc.id
LEFT OUTER JOIN category AS c1 ON sc.category_id = c1.id 
WHERE (sc.name = 'Tabletop Games' OR sc.name = 'Playing Cards' OR sc.name = 'Puzzles')
	AND c.outcome = 'successful'
ORDER BY pledged DESC*/

-- country that raised the most
/*SELECT SUM(c.pledged) as total_pledged, cn.id, cn.name
FROM campaign as c
LEFT OUTER JOIN country as cn ON c.country_id = cn.id
LEFT OUTER JOIN currency AS cr ON c.currency_id = cr.id
GROUP BY cn.id
ORDER BY total_pledged DESC*/

-- country that was backed the most
/*SELECT cn.name AS country_name, COUNT(*) AS total_campaigns_backed
FROM Campaign as c
JOIN country as cn ON c.country_id = cn.ID
GROUP BY cn.name
ORDER BY total_campaigns_backed DESC*/

-- length of campaign time in terms of how much was raised
/*SELECT TIMESTAMPDIFF(DAY, launched, deadline) AS days, c.pledged as pledged, c.pledged-c.goal as goal_surpassed
FROM Campaign as c
WHERE outcome = 'successful'
ORDER BY goal_surpassed DESC*/

-- realistic goal
/*SELECT AVG(c.goal)
FROM Campaign as c
LEFT OUTER JOIN sub_category as sc ON c.sub_category_id = sc.id
LEFT OUTER JOIN category AS c1 ON sc.category_id = c1.id 
WHERE (sc.name = 'Tabletop Games' OR sc.name = 'Playing Cards' OR sc.name = 'Puzzles')
	AND c.outcome = 'successful'*/

/*SELECT AVG(pledged/backers)
FROM campaign*/
-- WHERE outcome = 'failed';*/
/*SELECT c.outcome, COUNT(*)
FROM Campaign as c
LEFT OUTER JOIN sub_category as sc ON c.sub_category_id = sc.id
LEFT OUTER JOIN category AS c1 ON sc.category_id = c1.id 
WHERE (sc.name = 'Tabletop Games' OR sc.name = 'Playing Cards' OR sc.name = 'Puzzles') 
GROUP BY c.outcome
 -- AND outcome = 'successful'*/
 
/*SELECT cr.name AS currency_name, COUNT(*) AS campaign_count, c.outcome
FROM Campaign AS c
JOIN currency AS cr ON c.country_id = cr.ID
GROUP BY cr.name, c.outcome;*/