----------------------------------------------------------------------------------
-- select ------------------------------------------------------------------------
----------------------------------------------------------------------------------

-- select all
SELECT * FROM table_name;

-- select column
SELECT attribute_name_1, attribute_name_2 FROM table_name;

-- select all many table
SELECT * FROM table_name_1, table_name_2;

-- select column many table
SELECT attribute_name_1, attribute_name_2 FROM table_name_1, table_name_2; -- in the same line

----------------------------------------------------------------------------------
-- where -------------------------------------------------------------------------
----------------------------------------------------------------------------------

-- select 1 condition
SELECT * FROM table_name
WHERE condition;

-- select many condition (AND)
SELECT * FROM table_name
WHERE (condition_1) AND (condition_2); -- if there are many condition pls use ()

----------------------------------------------------------------------------------
-- order -------------------------------------------------------------------------
----------------------------------------------------------------------------------

-- select group
SELECT * FROM table_name
GROUP BY group_1, group_2;

----------------------------------------------------------------------------------
-- having ------------------------------------------------------------------------
----------------------------------------------------------------------------------

-- select having
SELECT * FROM table_name
HAVING condition;

-- select many having
SELECT * FROM table_name
HAVING (condition_1) AND (condition_2);

-- select having with sub-query
SELECT * FROM table_name
HAVING ex_condition >= ALL(
  SELECT * FROM table_name
  GROUP BY group;
); -- pls using tap

----------------------------------------------------------------------------------
-- order -------------------------------------------------------------------------
----------------------------------------------------------------------------------

-- select order
SELECT * FROM table_name
ORDER BY condition_1 ASC/DESC;

-- select many order
SELECT * FROM table_name
ORDER BY condition_1 ASC/DESC, condition_2 ASC/DESC;

----------------------------------------------------------------------------------
-- full example ------------------------------------------------------------------
----------------------------------------------------------------------------------

SELECT * FROM table_name
WHERE (condition_1) AND (condition_2)
GROUP BY group_1, group_2
HAVING condition_1
ORDER BY condition_1 ASC/DESC;