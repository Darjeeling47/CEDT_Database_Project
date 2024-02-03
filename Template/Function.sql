----------------------------------------------------------------------------------
-- function return variable ------------------------------------------------------
----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION name(parameter_1 DATA_TYPE, ...)
  RETURNS DATA_TYPE
  LANGUAGE plpgsql
  AS 
$$
DECLARE 
  data_name DATA_TYPE;

BEGIN
  SELECT * FROM table_name
  WHERE condition;

  RETURN data_name;

END
$$

----------------------------------------------------------------------------------
-- function return table ---------------------------------------------------------
----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION name(parameter_1 DATA_TYPE, ...)
  RETURNS TABLE(
    column_1 DATA_TYPE,
    column_2 DATA_TYPE
  )
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  RETURN QUERY 
  SELECT * FROM table_name
  WHERE condition;

END
$$