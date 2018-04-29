CREATE TABLE contact (
    contact_id SERIAL PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    address  VARCHAR(511),
    email VARCHAR(255),
    phone VARCHAR(31)
);