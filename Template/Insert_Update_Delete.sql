----------------------------------------------------------------------------------
-- insert ------------------------------------------------------------------------
----------------------------------------------------------------------------------

INSERT INTO table_name(column2_1, column2_2,...)
VALUE ('value_1', 'value_2',...);

----------------------------------------------------------------------------------
-- update ------------------------------------------------------------------------
----------------------------------------------------------------------------------

UPDATE table_name
SET column1 = 'value1', column2 = 'value2', ...
WHERE condition;

UPDATE table_name
SET column1 = 'value1', column2 = 'value2', ...
WHERE (condition_1) AND (condition_2);

----------------------------------------------------------------------------------
-- delete ------------------------------------------------------------------------
----------------------------------------------------------------------------------

DELETE FROM table_name WHERE condition;

DELETE FROM table_name WHERE (condition_1) AND (condition_2);