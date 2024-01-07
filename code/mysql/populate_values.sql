##Fake sample data is inserted into the doctors and patients tables. 

INSERT INTO doctors(
    first_name, 
    last_name, 
    department, 
    phone_num)
VALUES 
('Amelia', 'Johnson', 'Oncology', '9876543210'),
('Benjamin', 'Mitchell', 'Internal Medicine', '1234567890'), 
('Olivia', 'Anderson', 'Radiology', '5555555555'),
('Ethan', 'Parker', 'Gynecology', '8888888888'), 
('Sophia', 'Williams', 'General Medicine', '7777777777'); 

INSERT INTO patients(
    first_name,
    last_name,
    date_of_birth,
    primary_doctor_id)
VALUES
('Mia', 'Thompson', '2005-04-15', 2),
('Jackson', 'Davis', '02-10-28', 2),
('Isabella', 'Martinez', '2007-02-09', 4),
('Liam', 'Wilson', '2008-07-03', 1),
('Ava', 'Rodriguez', '2001-11-19', 4),
('Noah', 'Brown', '2004-05-22', 5),
('Sophia', 'Lopez', '2009-12-07', 1),
('Lucas', 'Harris', '2006-08-14', 3),
('Olivia', 'Lewis', '2000-01-30', 4),
('Ethan', 'Clark', '2003-06-12', 2),
('Emma', 'Turner', '2007-03-05', 1),
('Mason', 'King', '2008-09-26', 5),
('Harper', 'Wright', '2005-07-18', 4),
('Aiden', 'Green', '2002-11-01', 3),
('Charlotte', 'Parker', '2006-04-10', 5);
