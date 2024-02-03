----------------------------------------------------------------------------------
-- function return variable ------------------------------------------------------
----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION name(parameter_1 DATA_TYPE, ...)
  RETURN DATA_TYPE
  LANGUAGE plpgsql
  AS 
$$
DECLARE 
  data_name DATA_TYPE;

BEGIN
  SELECT * FROM table_name
  WHERE condition;

  return data_name;

END
$$

----------------------------------------------------------------------------------
-- function return table ---------------------------------------------------------
----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION name(parameter_1 DATA_TYPE, ...)
  RETURN TABLE(
    column_1 DATA_TYPE,
    column_2 DATA_TYPE
  )
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  SELECT * FROM table_name
  WHERE condition;

  RETURN query;

END
$$