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

CREATE TABLE IF NOT EXISTS memberOf(
    user_id INT NOT NULL,
    group_id INT NOT NULL,
    CONSTRAINT member_fk
        FOREIGN KEY(user_id) REFERENCES users(user_id),
        FOREIGN KEY(group_id) REFERENCES groups(group_id)
);

-- Creation of documents table
CREATE TABLE IF NOT EXISTS documents(
    document_id SERIAL NOT NULL,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY(document_id)
);

-- Creation of read rights table
CREATE TABLE IF NOT EXISTS readRights(
    owner_user_id INT NULL,
    owner_group_id INT NULL,
    document_id INT NOT NULL,
    ExportDependentDocument BOOLEAN NOT NULL,
    ExportOriginal BOOLEAN NOT NULL,
    ReadActivities BOOLEAN NOT NULL,
    ReadArchive BOOLEAN NOT NULL,
    ReadAttributes BOOLEAN NOT NULL,
    ReadProcessing BOOLEAN NOT NULL,
    ReadRelease BOOLEAN NOT NULL,
    ReadBlocked BOOLEAN NOT NULL,
    ReadVerification BOOLEAN NOT NULL,
    ReadHiddenAttributes BOOLEAN NOT NULL,
    DisplayingWithWatermark BOOLEAN NOT NULL,
    CONSTRAINT owns_fk 
        FOREIGN KEY(owner_user_id) REFERENCES users(user_id),
        FOREIGN KEY(owner_group_id) REFERENCES groups(group_id),
        FOREIGN KEY(document_id) REFERENCES documents(document_id),
    CONSTRAINT user_or_group CHECK (
      CASE WHEN owner_group_id IS NULL THEN 0 ELSE 1 END +
      CASE WHEN owner_user_id IS NULL THEN 0 ELSE 1 END = 1
    )
);

-- Creation of write rights table
CREATE TABLE IF NOT EXISTS writeRights(
    owner_user_id INT NULL,
    owner_group_id INT NULL,
    document_id INT NOT NULL,
    ChangeAttributesRelease BOOLEAN NOT NULL,
    ChangeProtectedAttributes BOOLEAN NOT NULL,
    ChangeHiddenAttributes BOOLEAN NOT NULL,
    UpdateDocument BOOLEAN NOT NULL,
    ImportDocument BOOLEAN NOT NULL,
    ChangeDocumentType BOOLEAN NOT NULL,
    CreatingDependantDocuments BOOLEAN NOT NULL,
    CreateChangeNotes BOOLEAN NOT NULL,
    CreateChangeRedlining BOOLEAN NOT NULL,
    ChangeColorMarking BOOLEAN NOT NULL,
    DeleteArchive BOOLEAN NOT NULL,
    DeleteProcessing BOOLEAN NOT NULL,
    DeleteRelease BOOLEAN NOT NULL,
    DeleteVerification BOOLEAN NOT NULL,
    CONSTRAINT owns_fk 
        FOREIGN KEY(owner_user_id) REFERENCES users(user_id),
        FOREIGN KEY(owner_group_id) REFERENCES groups(group_id),
        FOREIGN KEY(document_id) REFERENCES documents(document_id),
    CONSTRAINT user_or_group CHECK (
      CASE WHEN owner_group_id IS NULL THEN 0 ELSE 1 END +
      CASE WHEN owner_user_id IS NULL THEN 0 ELSE 1 END = 1
    )
);