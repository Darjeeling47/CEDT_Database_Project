-- view reserves form user_id : ดูการจองที่ต้องการของ user นั้น
SELECT U.user_name, T.timeslot_date, T.start_time, T.end_time, RS.restaurant_name, B.branch_id, BT.table_number FROM reserves R
NATURAL JOIN users U
NATURAL JOIN timeslots T
NATURAL JOIN branch_tables BT
NATURAL JOIN branches B
NATURAL JOIN restaurants RS
WHERE U.user_id = 1;

-- view reserves form branch_id : ดูการจองที่ต้องการของ branch นั้น
SELECT U.prefer_name, T.timeslot_date, T.start_time, T.end_time, BT.table_number FROM reserves R
NATURAL JOIN users U
NATURAL JOIN timeslots T
NATURAL JOIN branch_tables BT
NATURAL JOIN branches B
WHERE B.branch_id = 1;

-- restaurant_manager_view_branches from user_id : Restaurant manager ข้อมูล branch ทั้งหมดที่ดูแลอยู่
SELECT RS.restaurant_name, B.*, BL.* FROM restaurants RS
NATURAL JOIN branches B
NATURAL JOIN branch_locations BL
NATURAL JOIN restaurant_managers RM
WHERE RM.user_id = 1;

-- admin_view_reserves : Admin ดูการจองในจังหวัดที่ตัวเองรับผิดชอบ
SELECT A.user_id AS admin_id, P.province_name, RS.restaurant_name, B.branch_id, BT.table_number, R.user_id, R.preferred_name, R.amount FROM 
NATURAL JOIN admins A
NATURAL JOIN provinces P
NATURAL JOIN restaurants RS
NATURAL JOIN branches B
NATURAL JOIN branch_tables BT
NATURAL JOIN reserves R
WHERE A.user_id = 1;

-- admin_view_reservation_count : Admin ดูจำนวนการจองในจังหวัดที่ตัวเองรับผิดชอบ
SELECT A.user_id AS admin_id, RS.restaurant_name, B.branch_id, COUNT(*) FROM 
NATURAL JOIN admins A
NATURAL JOIN provinces P
NATURAL JOIN restaurants RS
NATURAL JOIN branches B
NATURAL JOIN branch_tables BT
NATURAL JOIN reserves R
WHERE A.user_id = 1
GROUP BY R.user_id AND R.table_id AND R.timeslots_id;

-- admin_view_restaurant_count : Admin ดูจำนวนร้านอาหารในจังหวัดที่ตัวเองรับผิดชอบ
SELECT A.user_id AS admin_id, P.province_name, RS.restaurant_name, COUNT(*) FROM 
NATURAL JOIN admins A
NATURAL JOIN provinces P
NATURAL JOIN restaurants RS
NATURAL JOIN branches B
NATURAL JOIN branch_tables BT
NATURAL JOIN reserves R
WHERE A.user_id = 1
GROUP BY B.restaurant_id;

-- calculate_max_capacity : function สำหรับ trigger หลัง insert + update + delete โต๊ะใน branch 
-- -> ทำการคำนวณจำนวนโต๊ะทั้งหมดที่ branch นั้นๆ มี แล้วเก็บใน attribute ใน table ของ branch นั้น
-- this trigger is for insert and update --------
CREATE OR REPLACE FUNCTION calculate_branch_max_capacity_for_insert_update()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  UPDATE branches
  SET max_capacity = (SELECT SUM(max_capacity) FROM branch_tables
    WHERE branch_id = NEW.branch_id)
  WHERE branch_id = NEW.branch_id;
  RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER inserting_and_updating_branch_tables
  AFTER INSERT OR UPDATE OF max_capacity
  ON branch_tables
  FOR EACH ROW
  EXECUTE PROCEDURE calculate_branch_max_capacity_for_insert_update()

-- this trigger is for delete --------

CREATE OR REPLACE FUNCTION calculate_branch_max_capacity_for_delete()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  UPDATE branches
  SET max_capacity = (SELECT SUM(max_capacity) FROM branch_tables
    WHERE branch_id = OLD.branch_id)
  WHERE branch_id = OLD.branch_id;
  RETURN OLD;
END;
$$
  
CREATE OR REPLACE TRIGGER deleting_branch_tables
  AFTER DELETE
  ON branch_tables
  FOR EACH ROW
  EXECUTE PROCEDURE calculate_branch_max_capacity_for_delete()

-- calculate_menu_price : function สำหรับ trigger หลัง insert + update + delete menu ใน branch
-- -> ทำการคำนวณราคา avg, min, max ของ menuทั้งหมดที่ branch นั้นๆ มี แล้วเก็บใน attribute ใน table ของ branch นั้น
CREATE OR REPLACE FUNCTION calculate_branch_menu_price_for_insert_update()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  UPDATE branches
  SET avg_price = (SELECT AVG(price) FROM menus
    WHERE branch_id = NEW.branch_id), 
  min_price = (SELECT MIN(price) FROM menus
    WHERE branch_id = NEW.branch_id),
  max_price = (SELECT MAX(price) FROM menus
    WHERE branch_id = NEW.branch_id)
  WHERE branch_id = NEW.branch_id;
  RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER inserting_and_updating_branch_menus
  AFTER INSERT OR UPDATE OF price
  ON menus
  FOR EACH ROW
  EXECUTE PROCEDURE calculate_branch_menu_price_for_insert_update()

CREATE OR REPLACE FUNCTION calculate_branch_menu_price_for_delete()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  UPDATE branches
  SET avg_price = (SELECT AVG(price) FROM menus
    WHERE branch_id = OLD.branch_id), 
  min_price = (SELECT MIN(price) FROM menus
    WHERE branch_id = OLD.branch_id),
  max_price = (SELECT MAX(price) FROM menus
    WHERE branch_id = OLD.branch_id)
  WHERE branch_id = OLD.branch_id;
  RETURN OLD;
END;
$$

CREATE OR REPLACE TRIGGER deleting_branch_tables
  AFTER DELETE
  ON menus
  FOR EACH ROW
  EXECUTE PROCEDURE calculate_branch_menu_price_for_delete()

-- Provinces Table
SELECT * FROM provinces;

-- Users Table
SELECT * FROM users;

-- Restaurants Table
SELECT * FROM restaurants;

-- Branches Table
SELECT * FROM branches;

-- Branch Locations Table
SELECT * FROM branch_locations;

-- Branch Tables Table
SELECT * FROM branch_tables;

-- Food Limitation Table
SELECT * FROM food_limitations;

-- Menus Table
SELECT * FROM menus;

-- Timeslots Table
SELECT * FROM timeslots;

-- Search Records Table
SELECT * FROM search_records;

-- Reserves Table
SELECT * FROM reserves;

-- Restaurant Managers Table
SELECT * FROM restaurant_managers;

-- Admins Table
SELECT * FROM admins;

-- Reports Table
SELECT * FROM reports;

-- Logs Table
SELECT * FROM logs;