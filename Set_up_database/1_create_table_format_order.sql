-- Provinces Table
CREATE TABLE provinces(
	province_id SERIAL, -- Unique identifier for the province
	country VARCHAR(255) NOT NULL, -- Country of the province
	province_name VARCHAR(255) NOT NULL, -- Name of the province
	PRIMARY KEY(province_id) -- Primary key constraint
);

-- Users Table
CREATE TABLE users(
	user_id SERIAL, -- Unique identifier for the user
	user_name VARCHAR(255) NOT NULL, -- User's name
	user_password VARCHAR(255) NOT NULL, -- User's password
	email VARCHAR(255) DEFAULT NULL, -- User's email address
	telephone_number VARCHAR(40) DEFAULT NULL, -- User's telephone number
	PRIMARY KEY (user_id) -- Primary key constraint
);

-- Restaurants Table
CREATE TABLE restaurants(
	restaurant_id SERIAL, -- Unique identifier for the restaurant
	detail TEXT DEFAULT NULL, -- Details about the restaurant
	restaurant_owner TEXT NOT NULL, -- Owner of the restaurant
	restaurant_name VARCHAR(255) NOT NULL, -- Name of the restaurant
	website TEXT DEFAULT NULL, -- Website of the restaurant
	PRIMARY KEY(restaurant_id) -- Primary key constraint
);

-- Branches Table
CREATE TABLE branches(
	branch_id SERIAL, -- Unique identifier for the branch
	province_id INT NOT NULL, -- Foreign key referencing province_id in provinces table
	branch_type VARCHAR(255) DEFAULT NULL, -- Type of branch
	open_time TIME NOT NULL, -- Opening time
	close_time TIME NOT NULL, -- Closing time
	telephone_number VARCHAR(40) DEFAULT NULL, -- Branch telephone number
	rating NUMERIC DEFAULT 0, -- Rating of the branch
	max_capacity INT DEFAULT 0, -- Maximum capacity of the branch
	parking_amount INT DEFAULT 0, -- Amount of parking available
	avg_price REAL DEFAULT 0, -- Average price of menus in this branch
	min_price REAL DEFAULT 0, -- Minimum price of menus in this branch
	max_price REAL DEFAULT 0, -- Maximum price of menus in this branch
	restaurant_id INT NOT NULL, -- Foreign key referencing restaurant_id in restaurants table
	PRIMARY KEY(branch_id), -- Primary key constraint
	FOREIGN KEY(province_id) REFERENCES provinces(province_id), -- Foreign key constraint
	FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id) -- Foreign key constraint
);

-- Branch Locations Table
CREATE TABLE branch_locations(
	branch_id INT NOT NULL, -- Foreign key referencing branch_id in branches table
	house_number VARCHAR(255) NOT NULL, -- House number
	lane VARCHAR(255) DEFAULT NULL, -- Lane (if applicable)
	road VARCHAR(255) NOT NULL, -- Road name
	sub_district VARCHAR(255) NOT NULL, -- Sub-district
	district VARCHAR(255) NOT NULL, -- District
	postal_code VARCHAR(10) NOT NULL, -- Postal code
	PRIMARY KEY(branch_id), -- Primary key constraint
	FOREIGN KEY(branch_id) REFERENCES branches(branch_id) -- Foreign key constraint
);

-- Branch Tables Table
CREATE TABLE branch_tables(
	table_id SERIAL, -- Unique identifier for the table
	table_number INT NOT NULL, -- Table number
	max_capacity INT DEFAULT 1, -- Maximum capacity of the table
	branch_id INT NOT NULL, -- Foreign key referencing branch_id in branches table
	PRIMARY KEY (table_id), -- Primary key constraint
	FOREIGN KEY (branch_id) REFERENCES branches(branch_id) -- Foreign key constraint
);

-- Food Limitation Table
CREATE TABLE food_limitations(
	food_limitation_id SERIAL, -- Unique identifier for the food limitation
	have_cow_milk BOOLEAN DEFAULT FALSE, -- Flag for cow milk restriction
	have_egg BOOLEAN DEFAULT FALSE, -- Flag for egg restriction
	have_tree_nut BOOLEAN DEFAULT FALSE, -- Flag for tree nut restriction
	have_peanut BOOLEAN DEFAULT FALSE, -- Flag for peanut restriction
	have_shellfish BOOLEAN DEFAULT FALSE, -- Flag for shellfish restriction
	have_fish BOOLEAN DEFAULT FALSE, -- Flag for fish restriction
	have_soy BOOLEAN DEFAULT FALSE, -- Flag for soy restriction
	have_wheat BOOLEAN DEFAULT FALSE, -- Flag for wheat restriction
	have_sesame BOOLEAN DEFAULT FALSE, -- Flag for sesame restriction
	is_halal BOOLEAN DEFAULT FALSE, -- Flag for halal food
	is_kosher BOOLEAN DEFAULT FALSE, -- Flag for kosher food
	is_vegeterian BOOLEAN DEFAULT FALSE, -- Flag for vegetarian food
	is_zhai BOOLEAN DEFAULT FALSE, -- Flag for zhai food
	PRIMARY KEY(food_limitation_id), -- Primary key constraint
	UNIQUE(have_cow_milk, have_egg, have_tree_nut, have_peanut, have_shellfish, have_fish, have_soy, have_wheat, have_sesame, is_halal, is_kosher, is_vegeterian, is_zhai)
);

-- Menus Table
CREATE TABLE menus(
	menu_id SERIAL, -- Unique identifier for the menu
	branch_id INT NOT NULL, -- Foreign key referencing branch_id in branches table
	menu_name VARCHAR(255) NOT NULL, -- Name of the menu
	price INT DEFAULT 0, -- Price of the menu
	menu_type VARCHAR(255) NOT NULL, -- Type of the menu
	picture TEXT DEFAULT NULL, -- Picture of the menu
	food_limitation_id INT NOT NULL, -- Foreign key referencing food_limitation_id in foodlimitation table
	PRIMARY KEY(menu_id), -- Primary key constraint
	FOREIGN KEY(branch_id) REFERENCES branches(branch_id), -- Foreign key constraint
	FOREIGN KEY(food_limitation_id) REFERENCES food_limitations(food_limitation_id) -- Foreign key constraint
);

-- Timeslots Table
CREATE TABLE timeslots(
	timeslot_id SERIAL, -- Unique identifier for the timeslot
	timeslot_date DATE NOT NULL, -- Date of the timeslot
	start_time TIME NOT NULL, -- Start time of the timeslot
	end_time TIME NOT NULL, -- End time of the timeslot
	PRIMARY KEY (timeslot_id) -- Primary key constraint
);

-- Search Records Table
CREATE TABLE search_records(
	search_id SERIAL NOT NULL, -- Unique identifier for the search record
	user_id INT NOT NULL, -- Foreign key referencing user_id in reserves table
	search_records_timestamp TIMESTAMPTZ NOT NULL, -- Timestamp of the search record
	location_link TEXT DEFAULT NULL, -- Link to location
	food_type VARCHAR(255) DEFAULT NULL, -- Type of food
	food_limitation_id INT DEFAULT NULL, -- Food limitations in Food Limitaion Id
	expected_min_price INT DEFAULT NULL, -- Expected minimum price
	expected_max_price INT DEFAULT NULL, -- Expected maximum price
	amount INT DEFAULT 0, -- Amount of search
	PRIMARY KEY (search_id), -- Primary key constraint
	FOREIGN KEY (user_id) REFERENCES users(user_id), -- Foreign key constraint
	FOREIGN KEY (food_limitation_id) REFERENCES food_limitations(food_limitation_id) -- Foreign key constraint
);

-- Reserves Table
CREATE TABLE reserves(
	user_id INT NOT NULL, -- Foreign key referencing user_id in users table
	timeslot_id INT NOT NULL, -- Foreign key referencing time_slot_id in timeslots table
	table_id INT NOT NULL, -- Foreign key referencing table_id in branch_tables table
	preferred_name VARCHAR(255) NOT NULL, -- Preferred name for reservation
	amount INT DEFAULT 1, -- Amount of reservation
	search_id INT NOT NULL, -- Foreign key referencing search_id in search_records table
	PRIMARY KEY (timeslot_id, table_id), -- Primary key constraint
	FOREIGN KEY (user_id) REFERENCES users(user_id), -- Foreign key constraint
	FOREIGN KEY (timeslot_id) REFERENCES timeslots(timeslot_id), -- Foreign key constraint
	FOREIGN KEY (table_id) REFERENCES branch_tables(table_id), -- Foreign key constraint
	FOREIGN KEY (search_id) REFERENCES search_records(search_id) -- Foreign key constraint
);

-- Restaurant Managers Table
CREATE TABLE restaurant_managers(
	user_id INT NOT NULL, -- Foreign key referencing user_id in users table
	restaurant_id INT NOT NULL, -- Foreign key referencing restaurant_id in restaurants table
	PRIMARY KEY (user_id), -- Primary key constraint
	FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) -- Foreign key constraint
);

-- Admins Table
CREATE TABLE admins(
	user_id INT NOT NULL, -- Foreign key referencing user_id in users table
	province_id INT NOT NULL, -- Foreign key referencing province_id in provinces table
	PRIMARY KEY (user_id, province_id), -- Composite primary key
	FOREIGN KEY (user_id) REFERENCES users(user_id), -- Foreign key constraint
	FOREIGN KEY (province_id) REFERENCES provinces(province_id) -- Foreign key constraint
);

-- Reports Table
CREATE TABLE reports(
	report_id SERIAL NOT NULL, -- Unique identifier for the report
	user_id INT NOT NULL, -- Foreign key referencing user_id in users table
	branch_id INT NOT NULL, -- Foreign key referencing restaurant_branch_id in reserves table
	report_description VARCHAR(255) DEFAULT NULL, -- Description of the report
	is_service_issue BOOLEAN DEFAULT FALSE, -- Flag for service issue
	is_hygiene_issue BOOLEAN DEFAULT FALSE, -- Flag for hygiene issue
	is_other_issue BOOLEAN DEFAULT FALSE, -- Flag for other issue
	PRIMARY KEY (report_id), -- Primary key constraint
	FOREIGN KEY (user_id) REFERENCES users(user_id), -- Foreign key constraint
	FOREIGN KEY (branch_id) REFERENCES branches(branch_id) -- Foreign key constraint
);

-- Logs Table
CREATE TABLE logs(
	log_id SERIAL NOT NULL, -- Unique identifier for the logs
	user_id INT NOT NULL, -- Foreign key referencing user_id in users table
	log_time TIMESTAMPTZ NOT NULL, -- Date/time of the log
	is_login BOOLEAN DEFAULT FALSE, -- Flag for login
	is_logout BOOLEAN DEFAULT FALSE, -- Flag for logout
	PRIMARY KEY (log_id), -- Primary key constraint
	FOREIGN KEY (user_id) REFERENCES users(user_id) -- Foreign key constraint
);
