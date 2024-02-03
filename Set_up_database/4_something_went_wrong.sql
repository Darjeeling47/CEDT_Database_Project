-- incase of something went wrong
-- drop the tables

-- Drop the "reserves" table
DROP TABLE IF EXISTS reserves;

-- Drop other tables similarly, following the same pattern
DROP TABLE IF EXISTS search_records;
DROP TABLE IF EXISTS timeslots;
DROP TABLE IF EXISTS branch_tables;
DROP TABLE IF EXISTS branch_locations;
DROP TABLE IF EXISTS menus;
DROP TABLE IF EXISTS foodlimitation;
DROP TABLE IF EXISTS reports;
DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS restaurant_managers;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS provinces;