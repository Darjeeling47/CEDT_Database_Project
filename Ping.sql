-- 10.view_restaurants : ดูข้อมูลร้านอาหารทั้งหมดที่มี
SELECT * FROM restaurants;

-- 11.view_restaurant_detail : ดูข้อมูลร้านอาหารที่ต้องการ พร้อม branch_id ที่สังกัด restaurant นั้น
SELECT * FROM restaurants
WHERE restaurant_id = 1;

SELECT branch_id, province_id, branch_type, open_time, close_time, telephone_number, rating, max_capacity, parking_amount
FROM branches
WHERE restaurant_id = 1;

-- 21.add_food_limitation : เพิ่ม food limitation ตามข้อมูลที่ใส่มา
INSERT INTO 

-- 35.view_branches : ดูข้อมูล branch ทั้งหมดที่มี พร้อม branch location ตาม เงื่อนไขที่มี (null คือไม่มีเงื่อนไข) 
SELECT * FROM restaurants R
INNER JOIN branches B ON B.restaurant_id = R.restaurant_id
INNER JOIN branch_locations BL ON BL.branch_id = B.branch_id
WHERE BL.district = 'Houston'
ORDER BY R.restaurant_name ASC;

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