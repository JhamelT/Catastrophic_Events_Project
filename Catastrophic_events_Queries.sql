-- $Billion disasters--
DROP VIEW IF EXISTS $billion_disasters;
CREATE VIEW  $billion_disasters AS
SELECT event_type,
   instrument_name,
   occurence_date,
   event_city,
   event_state,
   casualties,
   CONCAT('$', FORMAT(damages, 0)) AS damages,
     affected_areas
FROM catastrophic_events
JOIN catastrophic_events_instruments USING(catastrophic_event_id)
    JOIN instruments USING(instruments_id)
JOIN event_types USING(event_id)
WHERE damages IN
(SELECT damages 
        FROM catastrophic_events
        WHERE damages >= 1000000000)
ORDER BY damages;
SELECT * FROM $billion_disasters;
-- High Casualty--
DROP VIEW IF EXISTS High_casualty;
CREATE VIEW High_Casualty AS
SELECT e.event_type, occurence_date, 
CONCAT(event_city, ', ', event_state) AS location, casualties
FROM catastrophic_events
JOIN event_types e USING (event_id)
WHERE casualties > 1000;
SELECT * FROM high_casualty;
-- Avg cost vy state --
DROP VIEW IF EXISTS Avg_cost_by_state;
CREATE VIEW Avg_cost_by_state AS
SELECT event_state, CONCAT('$', FORMAT(AVG(damages), 0)) AS damages
FROM catastrophic_events
JOIN event_types e USING (event_id)
GROUP BY event_state
ORDER BY AVG(damages) ASC;
SELECT * FROM Avg_cost_by_state;
-- Low Damage --
DROP VIEW IF EXISTS low_damage;
CREATE VIEW low_damage AS
SELECT e.event_type, occurence_date, event_city,event_state, damages
FROM catastrophic_events
JOIN event_types e USING (event_id)
WHERE damages < 1000000;
SELECT * FROM low_damage;
-- Max caus by event -- 
DROP VIEW IF EXISTS Max_caus_by_event;
CREATE VIEW Max_caus_by_event AS
Keaunna Cleveland
You should not include special characters in the name of your views as we can't be sure how this might work across machines and with different SQL versions.

(no points taken off)
[...]
SELECT e.event_type, MAX(casualties) as casualties
FROM catastrophic_events
JOIN event_types e USING (event_id)
GROUP BY event_type
ORDER BY casualties ASC;
SELECT * FROM Max_caus_by_event;