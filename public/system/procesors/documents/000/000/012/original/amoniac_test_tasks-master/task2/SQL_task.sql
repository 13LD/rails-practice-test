--Tables creating:
CREATE TABLE table1 (
  id bigserial,
  name varchar(250),
  type smallint,
  value text
);

CREATE TABLE table2 (
  id bigserial,
  type smallint,
  options text[]
);

--Simple data inserting:
INSERT INTO table1 (name, type, value) 
VALUES ('Some name #1', 10, 'Some value text'),
('Some name #2', 2, 'Some other value text'),
('Some name #3', 11, 'Some new value text'),
('Some name #4', 10, 'Some great value text');

INSERT INTO table2 (type, options) 
VALUES (10, '{new, nice, cool}'), 
(11, '{great, awesome, incredible}'), 
(5, '{cute, great, cool}'),
(10, '{amazing, outstanding, impressive}');

--The first query:
SELECT concat_ws('|', t1.table_one_id, t2.table_two_id, t1.type, t1.name, 
  t2.options, t1.value) AS tuple
FROM
  (SELECT type, array_agg(id) AS table_one_id, array_agg(name) AS name, 
    array_agg(value) AS value
  FROM table1
  GROUP BY type) t1
LEFT OUTER JOIN
  (SELECT type, array_agg(id) AS table_two_id, array_agg(options) AS options
  FROM table2
  GROUP BY type) t2
ON t2.type = t1.type;

--The second query
SELECT first.type, first.value, second.options
FROM
  (SELECT type, array_agg(value) AS value
  FROM table1
  GROUP BY type) first
LEFT OUTER JOIN
  (SELECT type, array_agg(unnest) AS options
  FROM table2, unnest(options) 
  GROUP BY type) second
ON first.type = second.type
ORDER BY first.type ASC;