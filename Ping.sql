-- 10.view_restaurants : ดูข้อมูลร้านอาหารทั้งหมดที่มี
SELECT * FROM restaurants;

-- 11.view_restaurant_detail : ดูข้อมูลร้านอาหารที่ต้องการ พร้อม branch_id ที่สังกัด restaurant นั้น
CREATE OR REPLACE FUNCTION view_restaurant_detail(restaurant_id INT)
  RETURN TABLE(
    restaurant_id INT,
    detail TEXT,
    restaurant_owner TEXT,
    restaurant_name VARCHAR(255),
    website TEXT
  )
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  SELECT * FROM restaurants R
  WHERE R.restaurant_id = restaurant_id;

  RETURN query;

END
$$

-- 35.view_branches : ดูข้อมูล branch ทั้งหมดที่มี พร้อม branch location ตาม เงื่อนไขที่มี (null คือไม่มีเงื่อนไข) 
CREATE OR REPLACE FUNCTION view_branches(filter_condition TEXT, sort_confition TEXT)
  RETURN TABLE(
    branch_id INT,
    province_id INT,
    branch_type VARCHAR(255),
    open_time TIMETZ,
    close_time TIMETZ,
    telephone_number VARCHAR(40),
    rating REAL,
    max_capacity INT,
    parking_amount INT,
    restaurant_id INT,
    house_number 
  )
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  SELECT * FROM branches B
  INNER JOIN branch_locations BL ON BL.branch_id = B.branch_id
  WHERE $filter_condition
  ORDER BY $sort_confition;

  RETURN query;

END
$$

-- 62.view_reserve_statistics : Restaurant manager ดูสถิติการจองที่ผ่านมาของ branch โดยที่ group by ตาม group_type
CREATE OR REPLACE FUNCTION view_reserve_statistics(branch_id INT, group_condition VARCHAR(255))
  RETURN TABLE(
    search_id INT,
    user_id INT,
    search_records_timestamp TEXT,
    location_link TEXT,
    food_type TEXT
  )
  LANGUAGE plpgsql
  AS 
$$
BEGIN
  SELECT * FROM search_records S
  WHERE S.branch_id = branch_id
  GROUP BY $;

  RETURN query;

END
$$