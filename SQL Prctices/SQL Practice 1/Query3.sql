CREATE TABLE Countries (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE Players (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  country_id INT NOT NULL,
  expertise VARCHAR(50) NOT NULL,
  FOREIGN KEY (country_id) REFERENCES Countries(id)
);