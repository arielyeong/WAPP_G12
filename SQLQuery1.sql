﻿INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Kaja Rooney', 'Rooney', 'krooney0', 'iX4%ULx3', 15, 'Female', 'Colombia', 'https://robohash.org/suntquiet.png?size=50x50&set=set1', '2025-02-19 11:42:17', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Ettore MacAnulty', 'MacAnulty', 'emacanulty1', 'hY7&H36{XI!C', 8, 'Male', 'New Zealand', 'https://robohash.org/inventoreliberosit.png?size=50x50&set=set1', '2024-11-05 06:14:41', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Jorge Gerlts', 'Gerlts', 'jgerlts2', 'kT6%g0B9', 17, 'Male', 'Thailand', 'https://robohash.org/sapientenihilfugit.png?size=50x50&set=set1', '2025-06-12 07:32:32', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Nancee Pegler', 'Pegler', 'npegler3', 'cF4@)c}(&Hq1|Y((', 15, 'Female', 'Iceland', 'https://robohash.org/earumabvoluptatem.png?size=50x50&set=set1', '2025-09-15 07:16:42', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Aida Santarelli', 'Santarelli', 'asantarelli4', 'dM9{0_eL(_s3"', 16, 'Female', 'Indonesia', 'https://robohash.org/facerequivelit.png?size=50x50&set=set1', '2025-02-20 01:28:28', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Mirilla Tefft', 'Tefft', 'mtefft5', 'sA1/!P)0.!I6l', 8, 'Female', 'China', 'https://robohash.org/magnamquiaeaque.png?size=50x50&set=set1', '2025-01-12 23:54:23', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Catlee Cobbled', 'Cobbled', 'ccobbled6', 'fO3|hCl`@', 11, 'Female', 'Czech Republic', 'https://robohash.org/voluptatemexet.png?size=50x50&set=set1', '2025-02-04 23:05:16', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Brinna Cleaver', 'Cleaver', 'bcleaver7', 'xW3|=y?v16C{?', 8, 'Female', 'Canada', 'https://robohash.org/laborumquiain.png?size=50x50&set=set1', '2025-01-23 15:38:34', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('Milzie Joseff', 'Joseff', 'mjoseff8', 'zW4@x{M.c~<!ET', 18, 'Female', 'China', 'https://robohash.org/aspernaturvelrepudiandae.png?size=50x50&set=set1', '2025-07-26 20:58:16', 'User');
INSERT INTO tblRegisteredUsers (Fullname, EmailAddress, Username, Password, Age, Gender, Country, Picture, dateRegister, Role) VALUES ('System Admin', 'admin@example.com', 'admin', 'admin123', 30, 'Male', 'Malaysia', 'https://robohash.org/admin.png?size=50x50&set=set1', GETDATE(), 'Admin');


update tblRegisteredUsers Set Password='wapp'

select * from tblRegisteredUsers

DELETE FROM tblRegisteredUsers;

DBCC CHECKIDENT ('tblRegisteredUsers', RESEED, 0);
TRUNCATE TABLE tblRegisteredUsers;

DELETE FROM tblRegisteredUsers
WHERE RID IN (13);

ALTER TABLE tblRegisteredUsers
ADD Role NVARCHAR(20) NOT NULL DEFAULT 'User';

SELECT * FROM [tblContactUs]