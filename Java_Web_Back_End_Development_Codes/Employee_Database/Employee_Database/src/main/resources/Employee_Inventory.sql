-- Create 'users' table
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(500) NOT NULL,
    enabled TINYINT NOT NULL,
    PRIMARY KEY (username)
);

-- Create 'authorities' table
CREATE TABLE authorities (
    username VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    UNIQUE KEY authorities_idx_1 (username, authority),
    CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users (username)
);

-- DML using plain text prefix ({noop}) for development/testing
INSERT INTO users (username, password, enabled)
VALUES ('john', '{noop}secret123', '1');

INSERT INTO authorities (username, authority)
VALUES ('john', 'ROLE_EMPLOYEE');

-- DML using BCrypt hashing prefix ({bcrypt}) for enterprise production security
INSERT INTO users (username, password, enabled)
VALUES ('mary', '{bcrypt}2a10 2a eDvE688750865.2p08.02.eDvE688750865.2p08.02'',1);' ||
                'INSERTINTO authorities(username,authority)' ||
                'VALUES(''mary'',''ROLEEMPLOYEE''),(''mary'',''ROLEMANAGER'');' ||
                'INSERTINTO users(username,password,enabled)VALUES(''susan'',''bcrypt2a10eDvE688750865.2p08.02.eDvE688750865.2p08.02', 1);

INSERT INTO authorities (username, authority)
VALUES ('susan', 'ROLE_EMPLOYEE'),
       ('susan', 'ROLE_MANAGER'),
       ('susan', 'ROLE_ADMIN');