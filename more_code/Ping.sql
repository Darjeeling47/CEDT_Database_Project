-- 6.delete_user : ลบข้อมูล user ที่ต้องการ
DELETE FROM admins WHERE user_id = 1;
DELETE FROM restaurant_managers WHERE user_id = 1;
DELETE FROM users WHERE user_id = 1;

-- 10.view_restaurants : ดูข้อมูลร้านอาหารทั้งหมดที่มี
SELECT * FROM restaurants;

-- 11.view_restaurant_detail : ดูข้อมูลร้านอาหารที่ต้องการ พร้อม branch_id ที่สังกัด restaurant นั้น
SELECT * FROM restaurants
WHERE restaurant_id = 1;

SELECT branch_id, province_id, branch_type, open_time, close_time, telephone_number, rating, max_capacity, parking_amount
FROM branches
WHERE restaurant_id = 1;

-- 12.calculate_max_capacity : function สำหรับ trigger หลัง insert + update + delete โต๊ะใน branch 
-- -> ทำการคำนวณจำนวนโต๊ะทั้งหมดที่ branch นั้นๆ มี แล้วเก็บใน attribute ใน table ของ branch นั้น
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

-- 13.calculate_menu_price : function สำหรับ trigger หลัง insert + update + delete menu ใน branch
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

-- 21.add_food_limitation : เพิ่ม food limitation ตามข้อมูลที่ใส่มา
INSERT INTO food_limitations(have_cow_milk, have_egg, have_tree_nut, have_peanut, have_shellfish, have_fish, have_soy, have_wheat, have_sesame, is_halal, is_kosher, is_vegeterian, is_zhai)
VALUES (true, true, true, true, true, true, true, true, true, true, true, true, true);

-- 22.view_food_limitations : ดู food limitation ทั้งหมด (แสดงออกมาทั้งหมด)
SELECT * FROM food_limitations;

-- 23.edit_food_limitation : แก้ไขข้อมูล food limitation ที่ต้องการ
UPDATE food_limitations
SET have_cow_milk = false, is_halal = false
WHERE food_limitation_id = 4;

-- 24.delete_food_limiation : ลบ food limitation ที่ต้องการ
DELETE FROM food_limitations WHERE food_limitation_id = 4;

-- 25.search_food_limitation_id : รับข้อมูลเข้าไปว่าอันไหนจริงบ้าง แล้ว return food_limitation_id ที่มีข้อมูลตรงตามนั้นออกมา
SELECT food_limitation_id FROM food_limitations
WHERE have_cow_milk = false AND have_egg = false AND have_tree_nut = false AND have_peanut = false AND have_shellfish = false AND have_fish = false AND have_soy = false
AND have_wheat = false AND have_sesame = false AND is_halal = false AND is_kosher = false AND is_vegeterian = false AND is_zhai = false;

-- 35.view_branches : ดูข้อมูล branch ทั้งหมดที่มี พร้อม branch location ตาม เงื่อนไขที่มี (null คือไม่มีเงื่อนไข) 
SELECT * FROM restaurants R
INNER JOIN branches B ON B.restaurant_id = R.restaurant_id
INNER JOIN branch_locations BL ON BL.branch_id = B.branch_id
WHERE BL.district = 'Houston'
ORDER BY R.restaurant_name ASC;

-- 41.delete_branch : ลบ branch นั้น พร้อม branch location
DELETE FROM branch_locations WHERE branch_id = 1;
DELETE FROM reports WHERE branch_id = 1;
DELETE FROM menus WHERE branch_id = 1;
DELETE FROM reserves WHERE table_id IN (
  SELECT table_id FROM branch_tables
  WHERE branch_id = 1
);
DELETE FROM branch_tables WHERE branch_id = 1;
DELETE FROM branches WHERE branch_id = 1;

-- 62.view_reserve_statistics : Restaurant manager ดูสถิติการจองที่ผ่านมาของ branch 
-- group by user_id
SELECT R.user_id, U.user_name, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN users U ON U.user_id = R.user_id
WHERE BT.branch_id = 1
GROUP BY R.user_id, U.user_name
ORDER BY number_of_reservation DESC;

-- group by amount
SELECT R.amount, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
WHERE BT.branch_id = 1
GROUP BY R.amount
ORDER BY number_of_reservation DESC;

-- group by date
SELECT T.timeslot_date, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN timeslots T ON T.timeslot_id = R.timeslot_id
WHERE BT.branch_id = 1
GROUP BY T.timeslot_date
ORDER BY number_of_reservation DESC;

-- group by time
SELECT T.start_time, T.end_time, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN timeslots T ON T.timeslot_id = R.timeslot_id
WHERE BT.branch_id = 1
GROUP BY T.start_time, T.end_time
ORDER BY number_of_reservation DESC;

-- group by search - expected price
SELECT SR.expected_min_price, SR.expected_max_price, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN search_records SR ON SR.search_id = R.search_id
WHERE BT.branch_id = 1
GROUP BY SR.expected_min_price, SR.expected_max_price
ORDER BY SR.expected_min_price ASC, SR.expected_max_price ASC;

-- group by search - food type
SELECT SR.food_type, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN search_records SR ON SR.search_id = R.search_id
WHERE BT.branch_id = 1
GROUP BY SR.food_type
ORDER BY number_of_reservation DESC;

-- group by search - food limitation id
SELECT SR.food_limitation_id, COUNT(*) AS number_of_reservation FROM reserves R
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN search_records SR ON SR.search_id = R.search_id
WHERE BT.branch_id = 1
GROUP BY SR.food_limitation_id
ORDER BY number_of_reservation DESC;