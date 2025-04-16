-- Step 1: Create the Users Table
CREATE TABLE kafka_users (
    UserID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incremented primary key
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DateOfBirth DATE,
    CreatedAt DATETIME DEFAULT GETDATE() -- Automatically set the creation timestamp
);

-- Step 2: Enable CDC on this table
exec msdb.dbo.rds_cdc_enable_db 'database_name';


EXEC sys.sp_cdc_enable_table  
    @source_schema = 'dbo',  
    @source_name = 'kafka_users',  
    @role_name = NULL;

SELECT * FROM sys.sp_cdc_help_change_data_capture;

-- Step 3: Insert 10 Records into the Users Table
INSERT INTO kafka_users (FirstName, LastName, Email, DateOfBirth)
VALUES 
('Jake', 'Brown', 'jake.brown@example.com', '1990-01-01'),
('Jane', 'Smith', 'jane.smith@example.com', '1992-02-14'),
('Alice', 'Johnson', 'alice.johnson@example.com', '1988-03-10'),
('Bob', 'Williams', 'bob.williams@example.com', '1995-04-25')
