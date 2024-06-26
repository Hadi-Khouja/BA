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

-- Create Enumeration
CREATE TYPE DOCTYPE AS ENUM ('TechnicalSpecification', 'MaintenanceReport','MarketingPlan', 'Invoice', 'ServiceContract');

-- Creation of documents table
CREATE TABLE IF NOT EXISTS documents(
    document_id SERIAL NOT NULL,
    documemt_file_name VARCHAR(250) NOT NULL,
    documentType DOCTYPE NOT NULL,
    PRIMARY KEY(document_id)
);

-- Creation of ownsDocument Table
CREATE TABLE IF NOT EXISTS ownsDocument(
	owner_user_id INT NULL,
	owner_group_id INT NULL,
	document_id INT NOT NULL,
	
	-- definition der Foreign keys
	CONSTRAINT owns_fk 
		FOREIGN KEY(owner_user_id) REFERENCES users(user_id),
		FOREIGN KEY(owner_group_id) REFERENCES groups(group_id),
		FOREIGN KEY(document_id) REFERENCES documents(document_id),
		
	-- Einschraekung, dass nur entweder user_id oder group_id gleichzeit besetzt sein darf
	CONSTRAINT user_or_group CHECK (
		CASE WHEN owner_group_id IS NULL THEN 0 ELSE 1 END +
		CASE WHEN owner_user_id IS NULL THEN 0 ELSE 1 END = 1
	)
);

-- Creation MaintenanceReport
CREATE TABLE IF NOT EXISTS maintenanceReport (
    document_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    reportDate VARCHAR(50) NULL,
    reportedBy VARCHAR(50) NULL,
    action VARCHAR(250) NULL,

    CONSTRAINT maintenance_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id)
);

-- Creation Invoices
CREATE TABLE IF NOT EXISTS invoices(
    document_id INT NOT NULL,
    recipient VARCHAR(50),
    amount INT,
    isPayed BOOLEAN,

    CONSTRAINT invoice_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id)
);

-- Creation MarketingPlan
CREATE TABLE IF NOT EXISTS marketingPlans(
    document_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    target_audience VARCHAR(300),
    budget INT,

    CONSTRAINT marketing_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id)
);

-- Creation Invoices
CREATE TABLE IF NOT EXISTS technicalSpecifications(
    document_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    doc_version VARCHAR(50),
    doc_date VARCHAR(50),

    CONSTRAINT spec_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id)
);

-- Creation Invoices
CREATE TABLE IF NOT EXISTS serviceContracts(
    document_id INT NOT NULL,
    client_name VARCHAR(50),
    duration VARCHAR(50),
    service_fee INT,
    terms VARCHAR(200),

    CONSTRAINT service_fk
        FOREIGN KEY(document_id) REFERENCES documents(document_id)
);