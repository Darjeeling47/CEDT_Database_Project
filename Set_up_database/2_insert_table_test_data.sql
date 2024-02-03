-- Provinces Table
INSERT INTO provinces (country, province_name) VALUES
('Canada', 'Alberta'),
('USA', 'Texas'),
('Canada', 'British Columbia'),
('USA', 'Florida'),
('Canada', 'Manitoba'),
('USA', 'Illinois'),
('Canada', 'Saskatchewan'),
('USA', 'Ohio'),
('Canada', 'Nova Scotia'),
('USA', 'Michigan');

-- Users Table
INSERT INTO users (user_name, user_password, email, telephone_number) VALUES
('mike_wilson', 'mikemike', 'mike@example.com', '12345678'),
('sara_carter', 'sarasara', 'sara@example.com', '09876543'),
('david_green', 'davidpass', 'david@example.com', NULL),
('emily_white', 'emilypass', 'emily@example.com', '55555555'),
('james_brown', 'jamespass', 'james@example.com', '11111111'),
('linda_davis', 'lindapass', 'linda@example.com', '22222222'),
('chris_miller', 'chrispass', 'chris@example.com', '33333333'),
('amy_jackson', 'amypass', 'amy@example.com', '44444444'),
('steven_thomas', 'stevenpass', 'steven@example.com', '66666666'),
('jennifer_harris', 'jenniferpass', 'jennifer@example.com', '77777777');

-- Restaurants Table
INSERT INTO restaurants (detail, restaurant_owner, restaurant_name, website) VALUES
('Family-friendly Italian eatery.', 'Giuseppe Rossi', 'Pasta Palace', 'http://www.pastapalace.com'),
('Classic American diner.', 'Frank Johnson', 'Diner Delight', 'http://www.dinerdelight.com'),
('Exquisite French cuisine.', 'Claire Dubois', 'La Petite Bistro', 'http://www.lapetitebistro.com'),
('Authentic Indian flavors.', 'Raj Patel', 'Taj Mahal Restaurant', 'http://www.tajmahalrestaurant.com'),
('Taste of Thailand.', 'Somsak Niran', 'Thai Orchid', 'http://www.thaiorchid.com'),
('Gourmet burgers and fries.', 'Tom Smith', 'Burger Bistro', 'http://www.burgerbistro.com'),
('Mouthwatering BBQ.', 'Bill Johnson', 'Smokehouse Grill', 'http://www.smokehousegrill.com'),
('Fresh seafood by the coast.', 'Sarah Lee', 'Ocean Catch', 'http://www.oceancatch.com'),
('Homestyle Mexican favorites.', 'Maria Hernandez', 'Mama Kitchen', 'http://www.mamaskitchen.com'),
('Sushi made with care.', 'Kenji Tanaka', 'Sushi Station', 'http://www.sushistation.com');

-- Branches Table
INSERT INTO branches (province_id, branch_type, open_time, close_time, telephone_number, rating, max_capacity, parking_amount, restaurant_id) VALUES
(1, 'Main', '08:00', '22:00', '780-123-4567', 4.2, 90, 40, 1),
(2, 'Main', '07:00', '21:00', '512-555-1234', 4.7, 110, 35, 2),
(3, 'Main', '10:30', '20:30', '604-987-6543', 4.4, 95, 30, 3),
(4, 'Main', '11:00', '23:00', '305-555-1234', 4.6, 120, 50, 4),
(5, 'Main', '12:00', '22:00', '204-123-4567', 4.3, 100, 45, 5),
(6, 'Main', '10:30', '22:30', '312-555-1234', 4.5, 85, 25, 6),
(7, 'Main', '11:30', '21:00', '217-987-6543', 4.8, 130, 55, 7),
(8, 'Main', '09:00', '20:00', '216-555-1234', 4.9, 80, 20, 8),
(9, 'Main', '08:00', '22:00', '902-123-4567', 4.1, 105, 60, 9),
(10, 'Main', '12:00', '23:00', '313-555-1234', 4.2, 115, 30, 10);

-- Branch Locations Table
INSERT INTO branch_locations (branch_id, house_number, lane, road, sub_district, district, postal_code) VALUES
(1, '456', NULL, 'Broadway Avenue', 'Downtown', 'Edmonton', 'T5J 0H1'),
(2, '789', NULL, 'Elm Street', 'Midtown', 'Houston', '77002'),
(3, '321', NULL, 'Burrard Street', 'Downtown', 'Vancouver', 'V6C 3P5'),
(4, '123', NULL, 'Palm Boulevard', 'Beachside', 'Miami', '33101'),
(5, '987', NULL, 'Bayview Drive', 'Waterfront', 'Winnipeg', 'R3C 0C8'),
(6, '456', NULL, 'Clark Street', 'Downtown', 'Chicago', '60601'),
(7, '654', NULL, 'Main Street', 'Riverside', 'Springfield', '62701'),
(8, '321', NULL, 'Ocean Avenue', 'Seaside', 'Cleveland', '44101'),
(9, '789', NULL, 'Maple Street', 'Downtown', 'Halifax', 'B3K 4M1'),
(10, '123', NULL, 'Market Street', 'Downtown', 'Detroit', '48201');

-- Branch Tables Table
INSERT INTO branch_tables (table_number, max_capacity, branch_id) VALUES
(1, 4, 1),
(2, 6, 1),
(1, 4, 2),
(2, 6, 2),
(1, 4, 3),
(2, 6, 3),
(1, 4, 4),
(2, 6, 4),
(1, 4, 5),
(2, 6, 5),
(1, 4, 6),
(2, 6, 6),
(1, 4, 7),
(2, 6, 7),
(1, 4, 8),
(2, 6, 8),
(1, 4, 9),
(2, 6, 9),
(1, 4, 10),
(2, 6, 10);

-- Food Limitation Table
INSERT INTO food_limitations (have_cow_milk, have_egg, have_tree_nut, have_peanut, have_shellfish, have_fish, have_soy, have_wheat, have_sesame, is_halal, is_kosher, is_vegeterian, is_zhai) VALUES
(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE);

-- Menus Table
INSERT INTO menus (branch_id, menu_name, price, menu_type, picture, food_limitation_id) VALUES
(1, 'Vegetarian Lasagna', 18, 'Main Course', 'lasagna.jpg', 1),
(2, 'Bacon Cheeseburger', 12, 'Main Course', 'burger.jpg', 2),
(3, 'Escargot', 20, 'Appetizer', 'escargot.jpg', 3),
(4, 'Chicken Tikka Masala', 16, 'Main Course', 'tikka_masala.jpg', 1),
(5, 'Tom Yum Soup', 8, 'Appetizer', 'tom_yum.jpg', 2),
(6, 'Double Cheese Pizza', 14, 'Main Course', 'cheese_pizza.jpg', 3),
(7, 'Smoked Brisket', 25, 'Main Course', 'brisket.jpg', 1),
(8, 'Lobster Roll', 30, 'Main Course', 'lobster_roll.jpg', 2),
(9, 'Taco Salad', 12, 'Main Course', 'taco_salad.jpg', 3),
(10, 'Dragon Roll', 22, 'Main Course', 'dragon_roll.jpg', 1);

INSERT INTO timeslots (timeslot_date, start_time, end_time) VALUES
('2024-02-03', '06:00:00', '06:30:00'),
('2024-02-03', '06:30:00', '07:00:00'),
('2024-02-03', '07:00:00', '07:30:00'),
('2024-02-03', '07:30:00', '08:00:00'),
('2024-02-03', '08:00:00', '08:30:00'),
('2024-02-03', '08:30:00', '09:00:00'),
('2024-02-03', '09:00:00', '09:30:00'),
('2024-02-03', '09:30:00', '10:00:00'),
('2024-02-03', '10:00:00', '10:30:00'),
('2024-02-03', '10:30:00', '11:00:00'),
('2024-02-03', '11:00:00', '11:30:00'),
('2024-02-03', '11:30:00', '12:00:00'),
('2024-02-03', '12:00:00', '12:30:00'),
('2024-02-03', '12:30:00', '13:00:00'),
('2024-02-03', '13:00:00', '13:30:00'),
('2024-02-03', '13:30:00', '14:00:00'),
('2024-02-03', '14:00:00', '14:30:00'),
('2024-02-03', '14:30:00', '15:00:00'),
('2024-02-03', '15:00:00', '15:30:00'),
('2024-02-03', '15:30:00', '16:00:00'),
('2024-02-03', '16:00:00', '16:30:00'),
('2024-02-03', '16:30:00', '17:00:00'),
('2024-02-03', '17:00:00', '17:30:00'),
('2024-02-03', '17:30:00', '18:00:00'),
('2024-02-03', '18:00:00', '18:30:00'),
('2024-02-03', '18:30:00', '19:00:00'),
('2024-02-03', '19:00:00', '19:30:00'),
('2024-02-03', '19:30:00', '20:00:00'),
('2024-02-03', '20:00:00', '20:30:00'),
('2024-02-03', '20:30:00', '21:00:00'),
('2024-02-03', '21:00:00', '21:30:00'),
('2024-02-03', '21:30:00', '22:00:00'),
('2024-02-03', '22:00:00', '22:30:00'),
('2024-02-03', '22:30:00', '23:00:00'),
('2024-02-03', '23:00:00', '23:30:00'),
('2024-02-03', '23:30:00', '00:00:00');

-- Search Records Table
INSERT INTO search_records (user_id, search_records_timestamp, location_link, food_type, food_limitation_id, expected_min_price, expected_max_price, amount) VALUES
(3, '2024-02-03 11:00:00', 'http://maps.google.com/...', 'French', 1, 15, 25, 1),
(4, '2024-02-03 18:00:00', 'http://maps.google.com/...', 'Indian', 1, 12, 18, 2),
(5, '2024-02-03 19:00:00', 'http://maps.google.com/...', 'Thailand', 2, 12, 18, 2),
(6, '2024-02-03 20:00:00', 'http://maps.google.com/...', 'Japan', 3, 12, 18, 2);;

-- Reserves Table
INSERT INTO reserves (user_id, timeslot_id, table_id, preferred_name, amount, search_id) VALUES
(1, 3, 7, 'John Doe', 1, 1),
(2, 1, 7, 'Jane Smith', 2, 2),
(3, 2, 7, 'Bob Jones', 1, 1),
(4, 3, 9, 'Alice Wang', 1, 2),
(5, 1, 9, 'Mike Wilson', 2, 1),
(6, 2, 9, 'Sara Carter', 1, 1),
(7, 3, 1, 'David Green', 1, 2),
(8, 1, 5, 'Emily White', 2, 1),
(9, 2, 6, 'James Brown', 1, 2),
(10, 3, 12, 'Linda Davis', 1, 1),
(1, 1, 12, 'Chris Miller', 2, 2),
(2, 2, 10, 'Amy Jackson', 1, 1),
(3, 3, 10, 'Steven Thomas', 1, 2),
(4, 1, 10, 'Jennifer Harris', 2, 1),
(5, 2, 15, 'Mike Wilson', 1, 1),
(6, 3, 15, 'Sara Carter', 1, 2),
(7, 1, 15, 'David Green', 2, 1),
(8, 2, 20, 'Emily White', 1, 2),
(9, 3, 20, 'James Brown', 1, 1),
(10, 1, 20, 'Linda Davis', 2, 2);


-- Restaurant Managers Table
INSERT INTO restaurant_managers (user_id, restaurant_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Admins Table
INSERT INTO admins (user_id, province_id) VALUES
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Reports Table
INSERT INTO reports (user_id, branch_id, report_description, is_service_issue, is_hygiene_issue, is_other_issue) VALUES
(5, 1, 'Delayed service during rush hour.', TRUE, FALSE, FALSE),
(6, 2, 'Unclean restrooms.', FALSE, TRUE, FALSE),
(7, 3, 'Food not served as per order.', FALSE, FALSE, TRUE),
(8, 4, 'Rude behavior from staff.', TRUE, FALSE, FALSE),
(9, 5, 'Overcharged on the bill.', FALSE, FALSE, TRUE),
(10, 6, 'Long waiting time for seating.', TRUE, FALSE, FALSE);

INSERT INTO logs (user_id, log_time, is_login, is_logout) VALUES
(1, '2024-02-03 11:00:00', TRUE, FALSE),
(1, '2024-02-03 15:00:00', FALSE, TRUE);
