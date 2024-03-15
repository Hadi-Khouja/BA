-- Creation of users table
CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL NOT NULL,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY(user_id)
);

-- Creation of groups table
CREATE TABLE IF NOT EXISTS groups(
    group_id SERIAL NOT NULL,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY(group_id)
);

-- Creation of documents table
CREATE TABLE IF NOT EXISTS documents(
    document_id SERIAL NOT NULL,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY(document_id)
);

-- Creation of read rights table
CREATE TABLE IF NOT EXISTS readRights(
    owner_id INT NOT NULL,
    document_id INT NOT NULL,
    CONSTRAINT read_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id),
        FOREIGN KEY(owner_id) REFERENCES users(user_id)
);

-- Creation of write rights table
CREATE TABLE IF NOT EXISTS writeRights(
    owner_id INT NOT NULL,
    document_id INT NOT NULL,
    CONSTRAINT read_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id),
        FOREIGN KEY(owner_id) REFERENCES users(user_id)
);