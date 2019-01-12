DROP TABLE IF EXISTS users_table;
DROP TABLE IF EXISTS groups_table;
DROP TABLE IF EXISTS rooms_table;
DROP TABLE IF EXISTS group_rooms_table;

CREATE TABLE groups_table
(
  group_id int NOT NULL PRIMARY KEY,
  group_name varchar(100) NOT NULL
);


INSERT INTO groups_table (group_id, group_name) VALUES (1, 'I.T');
INSERT INTO groups_table (group_id, group_name) VALUES (2, 'Sales');
INSERT INTO groups_table (group_id, group_name) VALUES (3, 'Administration');
INSERT INTO groups_table (group_id, group_name) VALUES (4, 'Operations');

CREATE TABLE users_table
(
  user_id int NOT NULL PRIMARY KEY,
  user_name varchar(100) NOT NULL,
  group_id int references groups_rooms_table.group_id
);


INSERT INTO users_table (user_id, user_name, group_id) VALUES (1, 'Modesto', 1);
INSERT INTO users_table (user_id, user_name, group_id) VALUES (2, 'Ayine', 1);

INSERT INTO users_table (user_id, user_name, group_id) VALUES (3, 'Christopher', 2);
INSERT INTO users_table (user_id, user_name, group_id) VALUES (4, 'Cheong woo', 2);

INSERT INTO users_table (user_id, user_name, group_id) VALUES (5, 'Saulat', 3);
INSERT INTO users_table (user_id, user_name, group_id) VALUES (6, 'Heidy', null);


CREATE TABLE rooms_table
(
  room_id int NOT NULL PRIMARY KEY,
  room_name varchar(100) NOT NULL
);


INSERT INTO rooms_table (room_id, room_name) VALUES (1, '101');
INSERT INTO rooms_table (room_id, room_name) VALUES (2, '102');
INSERT INTO rooms_table (room_id, room_name) VALUES (3, 'Auditorium A');
INSERT INTO rooms_table (room_id, room_name) VALUES (4, 'Auditorium B');



CREATE TABLE group_rooms_table
(
  group_id int references groups_rooms_table.group_id,
  room_id int references rooms_table.room_id
);


INSERT INTO group_rooms_table (group_id, room_id) VALUES (1, 1);
INSERT INTO group_rooms_table (group_id, room_id) VALUES (1, 2);

INSERT INTO group_rooms_table (group_id, room_id) VALUES (2, 2);
INSERT INTO group_rooms_table (group_id, room_id) VALUES (2, 3);

#All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

SELECT group_name, user_name FROM groups_table
LEFT JOIN users_table
ON groups_table.group_id = users_table.group_id;

#All rooms, and the groups assigned to each room.  The rooms should appear even if no groups have been assigned to them


SELECT room_name, group_name FROM rooms_table 
LEFT JOIN group_rooms_table 
ON rooms_table.room_id = group_rooms_table.room_id 

LEFT JOIN groups_table 
ON group_rooms_table.group_id = groups_table.group_id;

#A list of users, the groups that they belong to, and the rooms to which they are assigned.  This should be sorted alphabetically by user, then by group, then by room.

SELECT user_name, group_name, room_name FROM users_table
LEFT JOIN groups_table 
ON users_table.group_id = groups_table.group_id 
LEFT JOIN group_rooms_table 
ON users_table.group_id = group_rooms_table.group_id 
LEFT JOIN rooms_table ON group_rooms_table.room_id = rooms_table.room_id
ORDER BY users_table.user_name, groups_table.group_name, rooms_table.room_name;