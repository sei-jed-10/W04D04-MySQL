-- Open up mysql and create a sql_lab database if you haven't already done so. 
-- If you already have a sql_lab database, no need to create it again.


-- Write SQL commands under the prompts below, and run the file to get results.

-- In case there is already a computers table, drop it

-- Create a computers table. For example:

CREATE TABLE computers (
  id int PRIMARY KEY, 
  make VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  cpu_speed INT NOT NULL
);


-- The table should have id, make, model, cpu_speed, memory_size,
--  price, release_date, photo_url, storage_amount, number_usb_ports,
--  number_firewire_ports, number_thunderbolt_ports


-- Insert 4 computers into the computers table. For example:
INSERT INTO computers (make, model, cpu_speed) VALUES ('Apple', 'MacBook', 10);


-- Select all entries from the computers table

