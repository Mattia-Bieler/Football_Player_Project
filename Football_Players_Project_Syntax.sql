-- Create a table called players_gamedetails.
CREATE TABLE players_gamedetails (
    id INT PRIMARY KEY,
    overall INT,
    potential INT,
    crossing INT,
    finishing INT,
    heading_accuracy INT,
    short_passing INT,
    volleys INT,
    dribbling INT,
    curve INT,
    fk_accuracy INT,
    long_passing INT,
    ball_control INT,
    acceleration INT,
    sprint_speed INT,
    agility INT,
    reactions INT,
    balance INT,
    shot_power INT,
    jumping INT,
    stamina INT,
    strength INT,
    long_shots INT,
    aggression INT,
    interceptions INT,
    positioning INT,
    vision INT,
    penalties INT,
    composure INT,
    marking INT,
    standing_tackle INT,
    sliding_tackle INT,
    gk_diving INT,
    gk_handling INT,
    gk_kicking INT,
    gk_positioning INT,
    gk_reflexes INT,
    international_reputation INT,
    weak_foot INT,
    skill_moves INT
);

-- View players_gamedetails table.
SELECT * FROM public.players_gamedetails;

-- Check for duplicates.
SELECT ID, COUNT(*) FROM players_gamedetails
GROUP BY ID
HAVING COUNT(*) > 1;

-- Create a view to count the number of NULL values in each column.
CREATE VIEW players_null_counts AS
SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN overall IS NULL THEN 1 ELSE 0 END) AS overall_nulls,
    SUM(CASE WHEN potential IS NULL THEN 1 ELSE 0 END) AS potential_nulls,
    SUM(CASE WHEN crossing IS NULL THEN 1 ELSE 0 END) AS crossing_nulls,
    SUM(CASE WHEN finishing IS NULL THEN 1 ELSE 0 END) AS finishing_nulls,
    SUM(CASE WHEN heading_accuracy IS NULL THEN 1 ELSE 0 END) AS heading_accuracy_nulls,
    SUM(CASE WHEN short_passing IS NULL THEN 1 ELSE 0 END) AS short_passing_nulls,
    SUM(CASE WHEN volleys IS NULL THEN 1 ELSE 0 END) AS volleys_nulls,
    SUM(CASE WHEN dribbling IS NULL THEN 1 ELSE 0 END) AS dribbling_nulls,
    SUM(CASE WHEN curve IS NULL THEN 1 ELSE 0 END) AS curve_nulls,
    SUM(CASE WHEN fk_accuracy IS NULL THEN 1 ELSE 0 END) AS fk_accuracy_nulls,
    SUM(CASE WHEN long_passing IS NULL THEN 1 ELSE 0 END) AS long_passing_nulls,
    SUM(CASE WHEN ball_control IS NULL THEN 1 ELSE 0 END) AS ball_control_nulls,
    SUM(CASE WHEN acceleration IS NULL THEN 1 ELSE 0 END) AS acceleration_nulls,
    SUM(CASE WHEN sprint_speed IS NULL THEN 1 ELSE 0 END) AS sprint_speed_nulls,
    SUM(CASE WHEN agility IS NULL THEN 1 ELSE 0 END) AS agility_nulls,
    SUM(CASE WHEN reactions IS NULL THEN 1 ELSE 0 END) AS reactions_nulls,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS balance_nulls,
    SUM(CASE WHEN shot_power IS NULL THEN 1 ELSE 0 END) AS shot_power_nulls,
    SUM(CASE WHEN jumping IS NULL THEN 1 ELSE 0 END) AS jumping_nulls,
    SUM(CASE WHEN stamina IS NULL THEN 1 ELSE 0 END) AS stamina_nulls,
    SUM(CASE WHEN strength IS NULL THEN 1 ELSE 0 END) AS strength_nulls,
    SUM(CASE WHEN long_shots IS NULL THEN 1 ELSE 0 END) AS long_shots_nulls,
    SUM(CASE WHEN aggression IS NULL THEN 1 ELSE 0 END) AS aggression_nulls,
    SUM(CASE WHEN interceptions IS NULL THEN 1 ELSE 0 END) AS interceptions_nulls,
    SUM(CASE WHEN positioning IS NULL THEN 1 ELSE 0 END) AS positioning_nulls,
    SUM(CASE WHEN vision IS NULL THEN 1 ELSE 0 END) AS vision_nulls,
    SUM(CASE WHEN penalties IS NULL THEN 1 ELSE 0 END) AS penalties_nulls,
    SUM(CASE WHEN composure IS NULL THEN 1 ELSE 0 END) AS composure_nulls,
    SUM(CASE WHEN marking IS NULL THEN 1 ELSE 0 END) AS marking_nulls,
    SUM(CASE WHEN standing_tackle IS NULL THEN 1 ELSE 0 END) AS standing_tackle_nulls,
    SUM(CASE WHEN sliding_tackle IS NULL THEN 1 ELSE 0 END) AS sliding_tackle_nulls,
    SUM(CASE WHEN gk_diving IS NULL THEN 1 ELSE 0 END) AS gk_diving_nulls,
    SUM(CASE WHEN gk_handling IS NULL THEN 1 ELSE 0 END) AS gk_handling_nulls,
    SUM(CASE WHEN gk_kicking IS NULL THEN 1 ELSE 0 END) AS gk_kicking_nulls,
    SUM(CASE WHEN gk_positioning IS NULL THEN 1 ELSE 0 END) AS gk_positioning_nulls,
    SUM(CASE WHEN gk_reflexes IS NULL THEN 1 ELSE 0 END) AS gk_reflexes_nulls,
    SUM(CASE WHEN international_reputation IS NULL THEN 1 ELSE 0 END) AS international_reputation_nulls,
    SUM(CASE WHEN weak_foot IS NULL THEN 1 ELSE 0 END) AS weak_foot_nulls,
    SUM(CASE WHEN skill_moves IS NULL THEN 1 ELSE 0 END) AS skill_moves_nulls
FROM players_gamedetails;

-- Show the counts of NULL values.
SELECT * FROM players_null_counts;
   
-- Delete rows from players_gamedetails where crossing is NULL.
DELETE FROM players_gamedetails
WHERE crossing IS NULL;

-- Show the counts of NULL values.
SELECT * FROM players_null_counts;

-- Drop players_null_counts.
DROP VIEW IF EXISTS players_null_counts;

-- Check if columns have values outside of 0 to 100.
SELECT *
FROM players_gamedetails
WHERE NOT (
    overall BETWEEN 0 AND 100 AND
    potential BETWEEN 0 AND 100 AND
    crossing BETWEEN 0 AND 100 AND
    finishing BETWEEN 0 AND 100 AND
    heading_accuracy BETWEEN 0 AND 100 AND
    short_passing BETWEEN 0 AND 100 AND
    volleys BETWEEN 0 AND 100 AND
    dribbling BETWEEN 0 AND 100 AND
    curve BETWEEN 0 AND 100 AND
    fk_accuracy BETWEEN 0 AND 100 AND
    long_passing BETWEEN 0 AND 100 AND
    ball_control BETWEEN 0 AND 100 AND
    acceleration BETWEEN 0 AND 100 AND
    sprint_speed BETWEEN 0 AND 100 AND
    agility BETWEEN 0 AND 100 AND
    reactions BETWEEN 0 AND 100 AND
    balance BETWEEN 0 AND 100 AND
    shot_power BETWEEN 0 AND 100 AND
    jumping BETWEEN 0 AND 100 AND
    stamina BETWEEN 0 AND 100 AND
    strength BETWEEN 0 AND 100 AND
    long_shots BETWEEN 0 AND 100 AND
    aggression BETWEEN 0 AND 100 AND
    interceptions BETWEEN 0 AND 100 AND
    positioning BETWEEN 0 AND 100 AND
    vision BETWEEN 0 AND 100 AND
    penalties BETWEEN 0 AND 100 AND
    composure BETWEEN 0 AND 100 AND
    marking BETWEEN 0 AND 100 AND
    standing_tackle BETWEEN 0 AND 100 AND
    sliding_tackle BETWEEN 0 AND 100 AND
    gk_diving BETWEEN 0 AND 100 AND
    gk_handling BETWEEN 0 AND 100 AND
    gk_kicking BETWEEN 0 AND 100 AND
    gk_positioning BETWEEN 0 AND 100 AND
    gk_reflexes BETWEEN 0 AND 100
);
   
-- Check if international_reputation, weak_foot, or skill_moves have values outside of 0 to 5.
SELECT *
FROM players_gamedetails
WHERE NOT (
    international_reputation BETWEEN 0 AND 5 AND
    weak_foot BETWEEN 0 AND 5 AND
    skill_moves BETWEEN 0 AND 5
);
   
-- Check whether players have a potential lower than their overall.
SELECT *
FROM players_gamedetails
WHERE potential < overall;

/*************************************************
players_gamedetails data checks completed.
*************************************************/

-- Create a table called players_personal.
CREATE TABLE players_personal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    nationality VARCHAR(100),
    club VARCHAR(100),
    position VARCHAR(10),
    height VARCHAR(10),
    weight VARCHAR(10),
    preferred_foot VARCHAR(10),
    work_rate VARCHAR(20),
    body_type VARCHAR(20),
    joined DATE,
    loaned_from VARCHAR(100),
    contract_valid_until INT,
    value VARCHAR(20),
    release_clause VARCHAR(20),
    wage VARCHAR(20)
);

-- View players_personal table.
SELECT * FROM public.players_personal;

-- Check for duplicates.
SELECT ID, COUNT(*) FROM players_personal
GROUP BY ID
HAVING COUNT(*) > 1;
   
-- Create a view to count the number of NULL values in each column.
CREATE VIEW players_null_counts AS
SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_null,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_null,
    SUM(CASE WHEN nationality IS NULL THEN 1 ELSE 0 END) AS nationality_null,
    SUM(CASE WHEN club IS NULL THEN 1 ELSE 0 END) AS club_null,
    SUM(CASE WHEN position IS NULL THEN 1 ELSE 0 END) AS position_null,
    SUM(CASE WHEN height IS NULL THEN 1 ELSE 0 END) AS height_null,
    SUM(CASE WHEN weight IS NULL THEN 1 ELSE 0 END) AS weight_null,
    SUM(CASE WHEN preferred_foot IS NULL THEN 1 ELSE 0 END) AS preferred_foot_null,
    SUM(CASE WHEN work_rate IS NULL THEN 1 ELSE 0 END) AS work_rate_null,
    SUM(CASE WHEN body_type IS NULL THEN 1 ELSE 0 END) AS body_type_null,
    SUM(CASE WHEN joined IS NULL THEN 1 ELSE 0 END) AS joined_null,
    SUM(CASE WHEN loaned_from IS NULL THEN 1 ELSE 0 END) AS loaned_from_null,
    SUM(CASE WHEN contract_valid_until IS NULL THEN 1 ELSE 0 END) AS contract_valid_until_null,
    SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) AS value_null,
    SUM(CASE WHEN release_clause IS NULL THEN 1 ELSE 0 END) AS release_clause_null,
    SUM(CASE WHEN wage IS NULL THEN 1 ELSE 0 END) AS wage_null
FROM players_personal;

-- Show the counts of NULL values.
SELECT * FROM players_null_counts;

-- Delete rows from players_personal where height is NULL.
DELETE FROM players_personal
WHERE height IS NULL;

-- Show the counts of NULL values.
SELECT * FROM players_null_counts;

-- Show players on loan.
SELECT *
FROM players_personal
WHERE loaned_from IS NOT NULL;

-- Replace NULL in loaned_from with N/A.
UPDATE players_personal
SET loaned_from = 'N/A'
WHERE loaned_from IS NULL;

-- Show players not on loan.
SELECT *
FROM players_personal
WHERE loaned_from = 'N/A';

-- Show players on loan.
SELECT *
FROM players_personal
WHERE loaned_from <> 'N/A';

-- Show players_null_counts.
SELECT * FROM players_null_counts;

-- Replace NULL values in the club column with 'No Club'.
UPDATE players_personal
SET club = 'No Club'
WHERE club IS NULL;

-- Show all players with NULL in the position column.
SELECT *
FROM players_personal
WHERE position IS NULL;

-- Delete players with NULL in the position column.
DELETE FROM players_personal
WHERE position IS NULL;

-- Show players_null_counts.
SELECT * FROM players_null_counts;

-- Keep NULL values in the joined, contract_valid_until, and, release_clause.

-- Drop players_null_counts.
DROP VIEW IF EXISTS players_null_counts;

/*************************************************
players_personal data checks completed.
*************************************************/

-- Find IDs in players_personal that are missing in players_gamedetails.
SELECT id, 'missing in players_gamedetails' AS status
FROM players_personal 
WHERE id NOT IN (SELECT id FROM players_gamedetails)
UNION ALL
-- Find IDs in players_gamedetails that are missing in players_personal.
SELECT id, 'missing in players_personal' AS status
FROM players_gamedetails 
WHERE id NOT IN (SELECT id FROM players_personal);

-- Delete players from players_gamedetails that are not in players_personal.
-- These are the players that were just removed for having no position.
DELETE FROM players_gamedetails
WHERE id NOT IN (SELECT id FROM players_personal);

-- View players_personal table.
SELECT * FROM public.players_personal;

-- Create a new table called players_combined by joining players_personal and players_gamedetails on ID.
CREATE TABLE players_combined AS
SELECT 
    p.id,
    p.name,
    p.age,
    p.nationality,
    p.club,
    p.position,
    p.height,
    p.weight,
    p.preferred_foot,
    p.work_rate,
    p.body_type,
    p.joined,
    p.loaned_from,
    p.contract_valid_until,
    p.value,
    p.release_clause,
    p.wage,
    g.overall,
    g.potential,
    g.crossing,
    g.finishing,
    g.heading_accuracy,
    g.short_passing,
    g.volleys,
    g.dribbling,
    g.curve,
    g.fk_accuracy,
    g.long_passing,
    g.ball_control,
    g.acceleration,
    g.sprint_speed,
    g.agility,
    g.reactions,
    g.balance,
    g.shot_power,
    g.jumping,
    g.stamina,
    g.strength,
    g.long_shots,
    g.aggression,
    g.interceptions,
    g.positioning,
    g.vision,
    g.penalties,
    g.composure,
    g.marking,
    g.standing_tackle,
    g.sliding_tackle,
    g.gk_diving,
    g.gk_handling,
    g.gk_kicking,
    g.gk_positioning,
    g.gk_reflexes,
    g.international_reputation,
    g.weak_foot,
    g.skill_moves
FROM players_personal p
LEFT JOIN players_gamedetails g ON p.id = g.id;

-- View players_combined table.
SELECT * FROM public.players_combined;

-- Update value column in players_combined.
UPDATE players_combined
SET value = 
    CASE
        WHEN value LIKE '%M' THEN ROUND(CAST(REPLACE(REPLACE(value, '€', ''), 'M', '') AS NUMERIC) * 1000000)
        WHEN value LIKE '%K' THEN ROUND(CAST(REPLACE(REPLACE(value, '€', ''), 'K', '') AS NUMERIC) * 1000)
        ELSE NULL
    END;
		
-- Update release_clause column in players_combined.
UPDATE players_combined
SET release_clause = 
    CASE
        WHEN release_clause LIKE '%M' THEN ROUND(CAST(REPLACE(REPLACE(release_clause, '€', ''), 'M', '') AS NUMERIC) * 1000000)
        WHEN release_clause LIKE '%K' THEN ROUND(CAST(REPLACE(REPLACE(release_clause, '€', ''), 'K', '') AS NUMERIC) * 1000)
        ELSE NULL
    END;

-- Update wage column in players_combined.
UPDATE players_combined
SET wage = 
    CASE
        WHEN wage = 'Unknown' THEN NULL  -- Set to NULL or handle as needed
        WHEN wage LIKE '%M' THEN ROUND(CAST(REPLACE(REPLACE(wage, '€', ''), 'M', '') AS NUMERIC) * 1000000)
        WHEN wage LIKE '%K' THEN ROUND(CAST(REPLACE(REPLACE(wage, '€', ''), 'K', '') AS NUMERIC) * 1000)
        ELSE NULL
    END;

-- Alter the columns to INTEGER type.
ALTER TABLE players_combined
ALTER COLUMN value TYPE INTEGER USING value::INTEGER,
ALTER COLUMN release_clause TYPE INTEGER USING release_clause::INTEGER,
ALTER COLUMN wage TYPE INTEGER USING wage::INTEGER;

-- View players_combined table.
SELECT * FROM public.players_combined;

-- Create a view to count the number of NULL values in each column.
CREATE VIEW players_null_counts AS
SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_null,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_null,
    SUM(CASE WHEN nationality IS NULL THEN 1 ELSE 0 END) AS nationality_null,
    SUM(CASE WHEN club IS NULL THEN 1 ELSE 0 END) AS club_null,
    SUM(CASE WHEN position IS NULL THEN 1 ELSE 0 END) AS position_null,
    SUM(CASE WHEN height IS NULL THEN 1 ELSE 0 END) AS height_null,
    SUM(CASE WHEN weight IS NULL THEN 1 ELSE 0 END) AS weight_null,
    SUM(CASE WHEN preferred_foot IS NULL THEN 1 ELSE 0 END) AS preferred_foot_null,
    SUM(CASE WHEN work_rate IS NULL THEN 1 ELSE 0 END) AS work_rate_null,
    SUM(CASE WHEN body_type IS NULL THEN 1 ELSE 0 END) AS body_type_null,
    SUM(CASE WHEN joined IS NULL THEN 1 ELSE 0 END) AS joined_null,
    SUM(CASE WHEN loaned_from IS NULL THEN 1 ELSE 0 END) AS loaned_from_null,
    SUM(CASE WHEN contract_valid_until IS NULL THEN 1 ELSE 0 END) AS contract_valid_until_null,
    SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) AS value_null,
    SUM(CASE WHEN release_clause IS NULL THEN 1 ELSE 0 END) AS release_clause_null,
    SUM(CASE WHEN wage IS NULL THEN 1 ELSE 0 END) AS wage_null,
    SUM(CASE WHEN overall IS NULL THEN 1 ELSE 0 END) AS overall_null,
    SUM(CASE WHEN potential IS NULL THEN 1 ELSE 0 END) AS potential_null,
    SUM(CASE WHEN crossing IS NULL THEN 1 ELSE 0 END) AS crossing_null,
    SUM(CASE WHEN finishing IS NULL THEN 1 ELSE 0 END) AS finishing_null,
    SUM(CASE WHEN heading_accuracy IS NULL THEN 1 ELSE 0 END) AS heading_accuracy_null,
    SUM(CASE WHEN short_passing IS NULL THEN 1 ELSE 0 END) AS short_passing_null,
    SUM(CASE WHEN volleys IS NULL THEN 1 ELSE 0 END) AS volleys_null,
    SUM(CASE WHEN dribbling IS NULL THEN 1 ELSE 0 END) AS dribbling_null,
    SUM(CASE WHEN curve IS NULL THEN 1 ELSE 0 END) AS curve_null,
    SUM(CASE WHEN fk_accuracy IS NULL THEN 1 ELSE 0 END) AS fk_accuracy_null,
    SUM(CASE WHEN long_passing IS NULL THEN 1 ELSE 0 END) AS long_passing_null,
    SUM(CASE WHEN ball_control IS NULL THEN 1 ELSE 0 END) AS ball_control_null,
    SUM(CASE WHEN acceleration IS NULL THEN 1 ELSE 0 END) AS acceleration_null,
    SUM(CASE WHEN sprint_speed IS NULL THEN 1 ELSE 0 END) AS sprint_speed_null,
    SUM(CASE WHEN agility IS NULL THEN 1 ELSE 0 END) AS agility_null,
    SUM(CASE WHEN reactions IS NULL THEN 1 ELSE 0 END) AS reactions_null,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS balance_null,
    SUM(CASE WHEN shot_power IS NULL THEN 1 ELSE 0 END) AS shot_power_null,
    SUM(CASE WHEN jumping IS NULL THEN 1 ELSE 0 END) AS jumping_null,
    SUM(CASE WHEN stamina IS NULL THEN 1 ELSE 0 END) AS stamina_null,
    SUM(CASE WHEN strength IS NULL THEN 1 ELSE 0 END) AS strength_null,
    SUM(CASE WHEN long_shots IS NULL THEN 1 ELSE 0 END) AS long_shots_null,
    SUM(CASE WHEN aggression IS NULL THEN 1 ELSE 0 END) AS aggression_null,
    SUM(CASE WHEN interceptions IS NULL THEN 1 ELSE 0 END) AS interceptions_null,
    SUM(CASE WHEN positioning IS NULL THEN 1 ELSE 0 END) AS positioning_null,
    SUM(CASE WHEN vision IS NULL THEN 1 ELSE 0 END) AS vision_null,
    SUM(CASE WHEN penalties IS NULL THEN 1 ELSE 0 END) AS penalties_null,
    SUM(CASE WHEN composure IS NULL THEN 1 ELSE 0 END) AS composure_null,
    SUM(CASE WHEN marking IS NULL THEN 1 ELSE 0 END) AS marking_null,
    SUM(CASE WHEN standing_tackle IS NULL THEN 1 ELSE 0 END) AS standing_tackle_null,
    SUM(CASE WHEN sliding_tackle IS NULL THEN 1 ELSE 0 END) AS sliding_tackle_null,
    SUM(CASE WHEN gk_diving IS NULL THEN 1 ELSE 0 END) AS gk_diving_null,
    SUM(CASE WHEN gk_handling IS NULL THEN 1 ELSE 0 END) AS gk_handling_null,
    SUM(CASE WHEN gk_kicking IS NULL THEN 1 ELSE 0 END) AS gk_kicking_null,
    SUM(CASE WHEN gk_positioning IS NULL THEN 1 ELSE 0 END) AS gk_positioning_null,
    SUM(CASE WHEN gk_reflexes IS NULL THEN 1 ELSE 0 END) AS gk_reflexes_null,
    SUM(CASE WHEN international_reputation IS NULL THEN 1 ELSE 0 END) AS international_reputation_null,
    SUM(CASE WHEN weak_foot IS NULL THEN 1 ELSE 0 END) AS weak_foot_null,
    SUM(CASE WHEN skill_moves IS NULL THEN 1 ELSE 0 END) AS skill_moves_null
FROM players_combined;

-- Show the counts of NULL values.
SELECT * FROM players_null_counts;

-- Find the number of players with no club.
SELECT COUNT(*)
FROM players_combined
WHERE club = 'No Club';
-- Answer: 229.

-- Find the number of players on loan.
SELECT COUNT(*)
FROM players_combined
WHERE loaned_from <> 'N/A';
-- Answer: 1264.
-- Total: 1264 + 229 = 1493.

-- Find out how many of the 1493 players with a NULL value in the joined column are either on loan or have no club.
SELECT COUNT(*)
FROM players_combined
WHERE joined IS NULL
  AND (loaned_from <> 'N/A' OR club = 'No Club');
-- Answer: 1493. Therefore, keep NULL values in the joined column.

-- Find out how many of the 1493 players with a NULL value in the contract_valid_until column are either on loan or have no club.
SELECT COUNT(*)
FROM players_combined
WHERE contract_valid_until IS NULL
  AND (loaned_from <> 'N/A' OR club = 'No Club');
-- Answer: 1493. Therefore, keep NULL values in the contract_valid_until column.

-- Find out how many of the 240 players with a NULL value in the value column are either on loan or have no club.
SELECT COUNT(*)
FROM players_combined
WHERE value IS NULL
  AND (loaned_from <> 'N/A' OR club = 'No Club');
-- Answer: 229. Therefore, take a closer look.

-- Show players not on loan that have a NULL value in the value column.
SELECT *
FROM players_combined
WHERE value IS NULL
  AND loaned_from = 'N/A';

-- Show players that play for a club but have a NULL value in the value column.
SELECT *
FROM players_combined
WHERE value IS NULL
  AND club <> 'No Club';
-- Answer: 11.

-- Delete rows where value is NULL and the player plays for a club.
DELETE FROM players_combined
WHERE value IS NULL
  AND club <> 'No Club';
  
-- Find out how many of the 1493 players with a NULL value in the release_clause column are either on loan or have no club.
SELECT COUNT(*)
FROM players_combined
WHERE release_clause IS NULL
  AND (loaned_from <> 'N/A' OR club = 'No Club');
-- Answer: 1493. Therefore, keep NULL values in the release_clause column.

-- Find out how many of the 229 players with a NULL value in the wage column are either on loan or have no club.
SELECT COUNT(*)
FROM players_combined
WHERE wage IS NULL
  AND (loaned_from <> 'N/A' OR club = 'No Club');
-- Answer: 229. Therefore, keep NULL values in the wage column.

-- Show players_null_counts.
SELECT * FROM players_null_counts;

-- Drop players_null_counts.
DROP VIEW IF EXISTS players_null_counts;

/*************************************************
players_combined data checks completed.
*************************************************/

-- Total number of players per nationality.
SELECT nationality,
    COUNT(*) AS player_count
FROM players_combined
GROUP BY nationality
ORDER BY player_count DESC;

-- Total number of players per club.
SELECT club,
    COUNT(*) AS player_count
FROM players_combined
GROUP BY club
ORDER BY player_count DESC;

-- Average age of players per nationality.
SELECT nationality,
    ROUND(AVG(age), 2) AS average_age
FROM players_combined
GROUP BY nationality
ORDER BY average_age DESC;

-- Average age of players per club.
SELECT club,
    ROUND(AVG(age), 2) AS average_age
FROM players_combined
GROUP BY club
ORDER BY average_age DESC;

-- Average overall of players per nationality.
SELECT nationality,
    ROUND(AVG(overall), 2) AS average_overall
FROM players_combined
GROUP BY nationality
ORDER BY average_overall DESC;

-- Average overall of players per club.
SELECT club,
    ROUND(AVG(overall), 2) AS average_overall
FROM players_combined
GROUP BY club
ORDER BY average_overall DESC;

-- Number of players per nationality with an overall score greater than or equal to 75.
SELECT nationality,
    COUNT(*) AS player_count
FROM players_combined
WHERE overall >= 75
GROUP BY nationality
ORDER BY player_count DESC;

-- Number of players per club with an overall score greater than or equal to 75.
SELECT club,
    COUNT(*) AS player_count
FROM players_combined
WHERE overall >= 75
GROUP BY club
ORDER BY player_count DESC;

-- Total value of players in euros by nationality.
SELECT nationality,
    SUM(value) AS total_value
FROM players_combined
GROUP BY nationality 
ORDER BY total_value DESC; 

-- Total value of players in euros by club.
SELECT club,
    SUM(value) AS total_value
FROM players_combined
GROUP BY club
ORDER BY total_value DESC;

-- Top 5 players with the highest release clause.
SELECT *
FROM players_combined
WHERE release_clause IS NOT NULL
ORDER BY release_clause DESC
LIMIT 5;

-- Top 5 players with the lowest release clause.
SELECT *
FROM players_combined
WHERE release_clause IS NOT NULL
ORDER BY release_clause ASC
LIMIT 5;

-- Step 1: Identify the top nationalities by total player value.
WITH NationalityTotals AS (
    SELECT nationality,
        SUM(value) AS total_value
    FROM players_combined
    GROUP BY nationality
    ORDER BY total_value DESC
    LIMIT 11),
-- Step 2: Rank players within these top nationalities and exclude players with NULL value.
RankedPlayers AS (
    SELECT p.nationality, p.name, p.value,
        ROW_NUMBER() OVER (PARTITION BY p.nationality ORDER BY p.value DESC) AS rank
    FROM players_combined p
    JOIN NationalityTotals nt
    ON p.nationality = nt.nationality
    WHERE p.value IS NOT NULL)
-- Step 3: Select top 5 players per nationality and order results.
SELECT nationality, name, value
FROM RankedPlayers
WHERE rank <= 5
ORDER BY nationality, rank;

-- Step 1: Identify the top nationalities by total player value.
WITH NationalityTotals AS (
    SELECT nationality AS nationality, SUM(value) AS total_value
    FROM players_combined
    GROUP BY nationality
    ORDER BY total_value DESC
    LIMIT 11),
-- Step 2: Rank players within these top nationalities based on wage and exclude players with wage = 0.
RankedPlayers AS (
    SELECT p.nationality, p.name, p.wage,
           ROW_NUMBER() OVER (PARTITION BY p.nationality ORDER BY p.wage DESC) AS rank
    FROM players_combined p
    JOIN NationalityTotals nt
      ON p.nationality = nt.nationality
    WHERE p.wage > 0)
-- Step 3: Select top 5 players per nationality based on wage and order results.
SELECT nationality, name, wage
FROM RankedPlayers
WHERE rank <= 5
ORDER BY nationality, rank;

-- Step 1: Identify the highest potential for each position.
WITH MaxPotential AS (
    SELECT position, MAX(potential) AS max_potential
    FROM players_combined
    GROUP BY position)
-- Step 2: Select players with the highest potential, including their overall rating.
SELECT p.position, p.name, p.age, p.overall, p.potential
FROM players_combined p
JOIN MaxPotential mp
ON p.position = mp.position 
AND p.potential = mp.max_potential
ORDER BY p.position;

-- Top 100 players with the biggest difference between their overall and potential ratings.
SELECT name, age, overall, potential, (potential - overall) AS difference
FROM players_combined
ORDER BY difference DESC
LIMIT 100;

-- View players_combined table as a final check before exporting the dataset.
SELECT * FROM public.players_combined;