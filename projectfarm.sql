Create Database Farmdb

CREATE TABLE Field (
    field_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(255),
    area DECIMAL(10,2),
    soil_type VARCHAR(50)
);

INSERT INTO Field (field_id, name, location, area, soil_type) VALUES
(1, 'North Field', 'Location 1', 20.5, 'Loamy'),
(2, 'East Field', 'Location 2', 15.3, 'Sandy'),
(3, 'South Field', 'Location 3', 18.2, 'Clay'),
(4, 'West Field', 'Location 4', 22.0, 'Loamy'),
(5, 'Central Field', 'Location 5', 30.1, 'Silty'),
(6, 'Top Hill', 'Location 6', 12.5, 'Sandy'),
(7, 'Riverside', 'Location 7', 25.0, 'Clay'),
(8, 'Green Valley', 'Location 8', 28.3, 'Peaty'),
(9, 'Lower Ridge', 'Location 9', 14.7, 'Silty'),
(10, 'Meadow Farm', 'Location 10', 17.9, 'Loamy');



drop table crop
CREATE TABLE Crop (
    crop_id INT PRIMARY KEY,
    field_id INT,
    crop_type VARCHAR(50),
    planting_date DATE,
    harvest_date DATE,
    status VARCHAR(20) CHECK (status IN ('Planted', 'Growing', 'Ready for Harvest')),
    FOREIGN KEY (field_id) REFERENCES Field(field_id)
);

INSERT INTO Crop (crop_id, field_id, crop_type, planting_date, harvest_date, status) VALUES
(1, 1, 'Wheat', '2024-01-15', '2024-07-15', 'Growing'),
(2, 2, 'Corn', '2024-02-10', '2024-08-10', 'Growing'),
(3, 3, 'Rice', '2024-03-05', '2024-09-05', 'Planted'),
(4, 4, 'Barley', '2024-04-01', '2024-10-01', 'Growing'),
(5, 5, 'Soybeans', '2024-05-15', '2024-11-15', 'Planted'),
(6, 6, 'Potato', '2024-02-20', '2024-08-20', 'Growing'),
(7, 7, 'Tomato', '2024-03-18', '2024-09-18', 'Growing'),
(8, 8, 'Carrot', '2024-04-25', '2024-10-25', 'Planted'),
(9, 9, 'Peas', '2024-05-30', '2024-11-30', 'Planted'),
(10, 10, 'Onion', '2024-06-10', '2024-12-10', 'Growing');



CREATE TABLE Weather (
    weather_id INT PRIMARY KEY,
    field_id INT,
    date DATE,
    temperature DECIMAL(5,2),
    humidity DECIMAL(5,2),
    FOREIGN KEY (field_id) REFERENCES Field(field_id)
);

INSERT INTO Weather (weather_id, field_id, date, temperature, humidity) VALUES
(1, 1, '2024-07-01', 30.5, 45.0),
(2, 1, '2024-07-02', 29.8, 47.2),

(3, 2, '2024-07-03', 32.0, 40.5),
(4, 2, '2024-07-04', 31.2, 42.3),

(5, 3, '2024-07-01', 28.9, 50.7),
(6, 3, '2024-07-02', 27.5, 52.1),
(11, 3, '2024-07-02', 27.5, 52.1),

(7, 4, '2024-07-01', 29.0, 48.3),
(8, 4, '2024-07-02', 28.0, 49.5),

(9, 5, '2024-07-01', 30.1, 44.6),
(10, 5, '2024-07-02', 31.0, 46.8);
drop table weather

CREATE TABLE Machinery (
    machine_id INT PRIMARY KEY,
    name VARCHAR(50),
    model VARCHAR(50),
    purchase_date DATE,
    last_service_date DATE,
    status VARCHAR(20) CHECK (status IN ('Available', 'In Use', 'Under Maintenance'))
);
ALTER TABLE Machinery
DROP COLUMN last_service_date;

ALTER TABLE Machinery
DROP CONSTRAINT Check;


ALTER TABLE Machinery
DROP COLUMN status;


INSERT INTO Machinery (machine_id, name, model, purchase_date, last_service_date, status) VALUES
(1, 'Tractor 1', 'Model T100', '2022-01-10', '2024-06-15', 'Available'),
(2, 'Harvester 1', 'Model H200', '2023-03-20', '2024-05-10', 'In Use'),
(3, 'Plow 1', 'Model P300', '2021-07-25', '2024-04-01', 'Under Maintenance'),
(4, 'Seeder 1', 'Model S400', '2022-10-15', '2024-05-25', 'Available'),
(5, 'Sprayer 1', 'Model SP500', '2023-06-30', '2024-07-01', 'Available'),
(6, 'Cultivator 1', 'Model CU600', '2021-09-20', '2024-05-15', 'In Use'),
(7, 'Fertilizer G', 'Model F700', '2023-11-01', '2024-06-01', 'Available'),
(8, 'Tractor 2', 'Model T110', '2022-08-05', '2024-06-20', 'In Use'),
(9, 'Harvester 2', 'Model H210', '2023-12-10', '2024-07-01', 'Available'),
(10, 'Seeder 2', 'Model S500', '2024-01-01', '2024-06-30', 'Available');

CREATE TABLE Worker (
    worker_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_number VARCHAR(15),
    position VARCHAR(50),
    hire_date DATE
);


INSERT INTO Worker (worker_id, name, contact_number, position, hire_date) VALUES
(1,'Doe Hardy', '1234567890', 'Farmhand', '2022-05-15'),
(2,'Smith', '2345678901', 'Technician', '2021-08-22'),
(3,'Robert potts', '3456789012', 'Farm Manager', '2019-03-10'),
(4,'Mark whites', '4567890123', 'Farmhand', '2023-01-17'),
(5,'James jackman', '5678901234', 'Irrigation Specialist', '2020-11-05'),
(6,'Johnson jack', '6789012345', 'Field Supervisor', '2018-06-14'),
(7,'Jacob john', '7890123456', 'Technician', '2023-04-25'),
(8,'Michael White', '8901234567', 'Farmhand', '2022-02-18'),
(9,'Elizabeth Harris', '9012345678', 'Farmhand', '2022-02-18');




CREATE TABLE WorkerMachinery (
    worker_id INT,
    machine_id INT,
    task_date DATE,
    hours_used DECIMAL(5,2),
    PRIMARY KEY (worker_id, machine_id, task_date),
    FOREIGN KEY (worker_id) REFERENCES Worker(worker_id),
    FOREIGN KEY (machine_id) REFERENCES Machinery(machine_id)
);


SELECT * FROM Worker;


INSERT INTO WorkerMachinery (worker_id, machine_id, task_date, hours_used) VALUES
(1, 1, '2024-10-15', 5.5),

(2, 2, '2024-10-15', 4.0),
(3, 3, '2024-10-16', 6.0),
(4, 4, '2024-10-16', 3.5),
(5, 5, '2024-10-17', 7.0),
(6, 1, '2024-10-17', 2.5),
(7, 2, '2024-10-18', 5.0),
(8, 3, '2024-10-18', 4.5),
(9, 4, '2024-10-19', 6.5);

CREATE TABLE MachineStatus (
    machine_id INT,
    status VARCHAR(20) CHECK (status IN ('Available', 'In Use', 'Under Maintenance')),
    last_service_date DATE,
    PRIMARY KEY (machine_id),
    FOREIGN KEY (machine_id) REFERENCES Machinery(machine_id)
);




-- Insert status and last service date data into MachineStatus table
INSERT INTO MachineStatus (machine_id, status, last_service_date) VALUES
(1, 'Available', '2024-06-15'),
(2, 'In Use', '2024-05-10'),
(3, 'Under Maintenance', '2024-04-01'),
(4, 'Available', '2024-05-25'),
(5, 'Available', '2024-07-01'),
(6, 'In Use', '2024-05-15'),
(7, 'Available', '2024-06-01'),
(8, 'In Use', '2024-06-20'),
(9, 'Available', '2024-07-01'),
(10, 'Available', '2024-06-30');

SELECT * FROM MachineStatus


-- Insert status and last service date data into MachineStatus table



/*List All Fields with Crop Type 'Wheat'*/

SELECT f.name AS field_name, c.crop_type
FROM Field f
JOIN Crop c ON f.field_id = c.field_id
WHERE c.crop_type = 'Wheat';

/*Find Crops Planted in a Specific Field with Status 'Planted'*/

SELECT crop_type, planting_date, harvest_date, status
FROM Crop
WHERE status = 'Planted';


/*Total Hours Worked by Each Worker on a Specific Machine*/
SELECT w.name AS worker_name, SUM(wm.hours_used) AS total_hours
FROM Worker w
JOIN WorkerMachinery wm ON w.worker_id = wm.worker_id
WHERE wm.machine_id = 4
GROUP BY w.name;

/*Weather Data for the Last Full Month */
SELECT date, temperature, humidity
FROM Weather
WHERE field_id = 3
AND date >= '2024-07-01'
AND date <= '2024-07-31'
ORDER BY date DESC;

/*Get Average Temperature for All Fields for a Specific Month*/
SELECT AVG(temperature) AS avg_temperature
FROM Weather
WHERE MONTH(date) = 7 
AND YEAR(date) = 2024; 

/*List All Machinery Assigned to a Worker*/
SELECT w.name AS worker_name, m.name AS machine_name, wm.hours_used, wm.task_date
FROM Worker w
JOIN WorkerMachinery wm ON w.worker_id = wm.worker_id
JOIN Machinery m ON wm.machine_id = m.machine_id
WHERE w.worker_id = 1;  

/*List All Crops Planted in a Specific Field*/
SELECT c.crop_type, c.planting_date, c.harvest_date, c.status
FROM Crop c
WHERE c.field_id = 1;


/* List All Crops Planted Before a Specific Date*/
SELECT crop_id, crop_type, planting_date, harvest_date, status
FROM Crop
WHERE planting_date < '2024-06-01';


/*List All Machinery That are under Maintenance*/
SELECT machine_id, status,last_service_date
FROM MachineStatus
WHERE status = 'Under Maintenance';

/*List All Workers and Their Assigned Machinery*/
SELECT w.worker_id, w.name AS worker_name, m.name AS machine_name, wm.task_date, wm.hours_used
FROM Worker w
JOIN WorkerMachinery wm ON w.worker_id = wm.worker_id
JOIN Machinery m ON wm.machine_id = m.machine_id
ORDER BY wm.task_date;



/*List of Crops which will be Ready to Harvest in the Next Month*/
SELECT crop_id, field_id, crop_type, planting_date, harvest_date, status
FROM Crop
WHERE harvest_date BETWEEN '2024-12-01' AND '2024-12-31'
AND status = 'Growing';

/*Get Fields with Area Greater Than a Specific Value*/
SELECT * FROM Field
WHERE area > 20.0;

/*. Update the Location of a Field*/
UPDATE Field
SET location = 'New Location'
WHERE field_id = 1;

/*Largest field */
SELECT TOP 1 * FROM Field
ORDER BY area DESC;


DELETE FROM Crop
WHERE crop_id = 10;

/*Add New Column to a Table*/
ALTER TABLE Field
ADD manager_id INT;

/*Rename a Column*/
ALTER TABLE Worker
RENAME COLUMN contact_number TO phone_number;


/*Modify Data Type of a Column*/
ALTER TABLE Field
MODIFY area DECIMAL(12, 2);

/*Drop a Column*/
ALTER TABLE Field
DROP COLUMN manager_id;

/*Drop a Constraint*/
ALTER TABLE Field
DROP FOREIGN KEY fk_manager_id;

/*Add a Constraint*/
ALTER TABLE Field
ADD CONSTRAINT fk_manager_id FOREIGN KEY (manager_id) REFERENCES Worker(worker_id);

CREATE TABLE MachineryAssignments (
    WorkerID INT,
    MachineID INT,
    AssignmentDate DATE,
    HoursUsed DECIMAL(5,2)
);


CREATE TRIGGER trg_update_crop_status
ON Crop
AFTER UPDATE
AS
BEGIN
    UPDATE Crop
    SET status = 'Ready for Harvest'
    WHERE crop_id IN (SELECT 6 FROM inserted WHERE harvest_date < '2024-08-20' AND status = 'Growing');
END;

DROP TRIGGER trg_check_field_area;

SELECT * FROM Crop WHERE status = 'Ready for Harvest';



CREATE TRIGGER trg_check_field_area
ON Field
AFTER INSERT, UPDATE
AS
BEGIN
    -- Check for any negative area value
    IF EXISTS (SELECT * FROM inserted WHERE area < 0)
    BEGIN
        -- Log the error to the TriggerLog table
        INSERT INTO TriggerLog (table_name, field_id, area, error_message)
        SELECT 'Field', field_id, area, 'Area cannot be negative'
        FROM inserted
        WHERE area < -1;

        -- Rollback the transaction
        ROLLBACK TRANSACTION;
    END
END;

INSERT INTO Field (field_id, name, location, area, soil_type) VALUES
(11, 'Meadow Farm', 'Location 10', -1, 'Loamy');





SELECT  trg_check_field_area;

CREATE TRIGGER trg_update_machine_status
ON MachineStatus
AFTER INSERT, DELETE
AS
BEGIN
    UPDATE MachineStatus
    SET status = CASE 
                    WHEN EXISTS (SELECT * FROM inserted WHERE MachineStatus.machine_id = inserted.machine_id) THEN 'In Use'
                    ELSE 'Available'
                 END
    WHERE machine_id IN (SELECT machine_id FROM inserted);
END;

SELECT * FROM MachineStatus WHERE status = 'In Use';


/*5. Trigger to Enforce Consistent Weather Records for Each Field*/
CREATE TRIGGER trg_check_weather_duplicates
ON Weather
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE EXISTS (SELECT * FROM Weather WHERE Weather.field_id = inserted.field_id AND Weather.date = inserted.date))
    BEGIN
        RAISERROR('Duplicate weather record for this field and date.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

INSERT INTO Weather (weather_id, field_id, date, temperature, humidity) VALUES
(13,4,'2024-07-02', 45, 101);


drop TRIGGER trg_update_crop_status
CREATE TRIGGER trg_update_crop_status
ON Crop
AFTER UPDATE
AS
BEGIN
    UPDATE Crop
    SET status = 'Ready for Harvest'
    WHERE crop_id IN (SELECT crop_id FROM inserted WHERE harvest_date < '2024-11-25' AND status = 'Growing');
END;

SELECT * FROM Crop WHERE status = 'Ready for Harvest';


UPDATE Crop
SET harvest_date = '2024-12-01'
WHERE crop_id = 5;  -- Example crop_id
select *from crop where crop_id = 5;



drop TRIGGER trg_check_weather_temperature
CREATE TRIGGER trg_check_weather_temperature
ON Weather
AFTER UPDATE
AS
BEGIN
    DECLARE @weather_id INT, @temperature DECIMAL(5,2), @date DATE;
    DECLARE @warning_message VARCHAR(255);

    SELECT @weather_id = weather_id, @temperature = temperature, @date = date FROM inserted;

    
    IF @temperature > 35
    BEGIN
        SET @warning_message = 'Warning: High temperature recorded on ' + CAST(@date AS VARCHAR) + '. Temperature: ' + CAST(@temperature AS VARCHAR) + '°C';
        
        
        UPDATE Weather
        SET humidity = 60
        WHERE weather_id = @weather_id;

        -- Log the warning message
        PRINT @warning_message;
    END
END;
UPDATE Weather
SET temperature = 36
WHERE weather_id = 1;  -- Example weather_id


INSERT INTO Weather (weather_id, field_id, date, temperature, humidity) VALUES

(3, 1,'2024-07-03',45.5, 70.2);


INSERT INTO Weather (weather_id, field_id, date, temperature, humidity) VALUES
(1, 1, '2024-07-01', 30.5, 45.0),
(2, 1, '2024-07-0', 29.8, 47.2),
(3, 1,'2024-07-03',45, 70),
(3, 2, '2024-07-03', 32.0, 40.5),
(4, 2, '2024-07-04', 31.2, 42.3),

(5, 3, '2024-07-01', 28.9, 50.7),
(6, 3, '2024-07-02', 27.5, 52.1),
(11, 3, '2024-07-02', 27.5, 52.1),

(7, 4, '2024-07-01', 29.0, 48.3),
(8, 4, '2024-07-02', 28.0, 49.5),

(9, 5, '2024-07-01', 30.1, 44.6),
(10, 5, '2024-07-02', 31.0, 46.8);


DECLARE @field_name VARCHAR(50);
DECLARE field_cursor CURSOR FOR
SELECT name FROM Field;

OPEN field_cursor;

FETCH NEXT FROM field_cursor INTO @field_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @field_name;
    FETCH NEXT FROM field_cursor INTO @field_name;
END;

CLOSE field_cursor;
DEALLOCATE field_cursor;



DECLARE @temperature DECIMAL(5,2), @field_id INT, @weather_date DATE;
DECLARE weather_cursor CURSOR FOR
SELECT temperature, field_id, date FROM Weather;

OPEN weather_cursor;

FETCH NEXT FROM weather_cursor INTO @temperature, @field_id, @weather_date;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Temperature: ' + CAST(@temperature AS VARCHAR(5)) + ' for Field ID: ' + CAST(@field_id AS VARCHAR(5)) + ' on ' + 
	CAST(@weather_date AS VARCHAR(10));
    FETCH NEXT FROM weather_cursor INTO @temperature, @field_id, @weather_date;
END;

CLOSE weather_cursor;
DEALLOCATE weather_cursor;

CREATE TRIGGER trg_check_field_area
ON Field
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE area < 0)
    BEGIN
        RAISERROR('Area cannot be negative', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

4. Cursor to Calculate Total Hours Used by Each Worker
DECLARE @worker_id INT, @total_hours DECIMAL(5,2);
DECLARE worker_cursor CURSOR FOR
SELECT worker_id FROM Worker;

OPEN worker_cursor;

FETCH NEXT FROM worker_cursor INTO @worker_id;

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @total_hours = SUM(hours_used)
    FROM WorkerMachinery
    WHERE worker_id = @worker_id;
    
    PRINT 'Worker ID ' + CAST(@worker_id AS VARCHAR(5)) + ' has worked for ' + CAST(@total_hours AS VARCHAR(5)) + ' hours.';
    
    FETCH NEXT FROM worker_cursor INTO @worker_id;
END;

CLOSE worker_cursor;
DEALLOCATE worker_cursor;




5. Cursor to Loop Through Machinery and Print Status

DECLARE @machine_id INT, @machine_status VARCHAR(20);
DECLARE machine_cursor CURSOR FOR
SELECT machine_id, status FROM MachineStatus;

OPEN machine_cursor;

FETCH NEXT FROM machine_cursor INTO @machine_id, @machine_status;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Machine ID: ' + CAST(@machine_id AS VARCHAR(5)) + ' status: ' + @machine_status;
    FETCH NEXT FROM machine_cursor INTO @machine_id, @machine_status;
END;

CLOSE machine_cursor;
DEALLOCATE machine_cursor;





















drop sys.check




select *from crop



-- Declare variables for the cursor

DECLARE @crop_id INT, @harvest_date DATE, @status VARCHAR(20);

-- Define the cursor
DECLARE crop_cursor CURSOR FOR
SELECT crop_id, harvest_date, status 
FROM Crop 
WHERE status = 'Planted';

OPEN crop_cursor;

-- Fetch the first row into the variables
FETCH NEXT FROM crop_cursor INTO @crop_id, @harvest_date, @status;

-- Loop through the rowsx1
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Check if the harvest_date matches the specific value
    IF @harvest_date > '2024-09-05'
    BEGIN
        -- Update the status for the specific crop_id
        UPDATE Crop
        SET status = 'Ready to Harvest'
        WHERE crop_id = @crop_id;
    END

    -- Fetch the next row into the variables
    FETCH NEXT FROM crop_cursor INTO @crop_id, @harvest_date, @status;
END;

-- Close and deallocate the cursor
CLOSE crop_cursor;
DEALLOCATE crop_cursor;

-- Display the updated rows for verification
SELECT * FROM Crop WHERE harvest_date = '2024-09-05';


EXEC sp_helpconstraint 'Crop';


select *from crop




-- Declare variables
DECLARE @worker_id INT, @name VARCHAR(100), @hire_date DATE, @position VARCHAR(50);

DECLARE worker_cursor CURSOR FOR
SELECT worker_id, name, hire_date, position
FROM Worker
WHERE position = 'Farmhand';


OPEN worker_cursor;

FETCH NEXT FROM worker_cursor INTO @worker_id, @name, @hire_date, @position;

WHILE @@FETCH_STATUS = 0
BEGIN

    IF @hire_date < '2023-01-01'
    BEGIN
        -- Update the position to 'Senior Farmhand'
        UPDATE Worker
        SET position = 'Senior Farmhand'
        WHERE worker_id = @worker_id;

        PRINT 'Updated ' + @name + ' to Senior Farmhand';
    END;


    FETCH NEXT FROM worker_cursor INTO @worker_id, @name, @hire_date, @position;
END;

-- Close and deallocate the cursor
CLOSE worker_cursor;
DEALLOCATE worker_cursor;
-- Verify the updates
SELECT * FROM Worker;


