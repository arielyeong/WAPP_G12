﻿INSERT INTO [dbo].[tblstudents]
    (SID, student_name, student_email, student_phonenum, studnet_gender, student_age, student_country, student_username, student_password)
VALUES
    (1, 'Ariel Yeong', 'ariel.yeong@example.com', '0123456789', 'Female', 20, 'Malaysia', 'arielyy', 'hashed_password_123'),
    (2, 'John Tan', 'john.tan@example.com', '0112233445', 'Male', 22, 'Singapore', 'johntan22', 'hashed_password_456'),
    (3, 'Mei Ling Wong', 'meiling.w@example.com', '0198765432', 'Female', 19, 'Malaysia', 'meiling19', 'hashed_password_789'),
    (4, 'Adam Lim', 'adam.lim@example.com', '0189988776', 'Male', 23, 'Brunei', 'adamlim', 'hashed_password_abc'),
    (5, 'Priya Kumar', 'priya.k@example.com', '0175566778', 'Female', 21, 'India', 'priyak21', 'hashed_password_xyz');

    SELECT student_name 
FROM tblstudents 
WHERE student_name = 'Ariel';
