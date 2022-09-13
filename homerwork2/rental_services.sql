-- Ulises Abrahan - Rental services DATABASE;
-- Rental company (renting of different transport vehicles for short- and long-term rent)

-- DATABASE CREATION 

DROP DATABASE IF EXISTS rental_services;
CREATE DATABASE rental_services;
USE rental_services;



-- TABLE CREATION 

DROP TABLE IF EXISTS TypeOfVehicles;
CREATE TABLE TypeOfVehicles(
id_typeVehicle INTEGER NOT NULL AUTO_INCREMENT,
vehicle_description VARCHAR(30),

PRIMARY KEY (id_typeVehicle)
);

DROP TABLE IF EXISTS VehiclesModels;
CREATE TABLE VehiclesModels(
id_model INTEGER NOT NULL AUTO_INCREMENT,
model_description VARCHAR(20),
color VARCHAR (20),

PRIMARY KEY(id_model)
);

DROP TABLE IF EXISTS Vehicles;
CREATE TABLE Vehicles (
id_vehicle INTEGER NOT NULL AUTO_INCREMENT,
id_typeVehicle INTEGER NOT NULL,
id_model INTEGER NOT NULL,
license_plate VARCHAR(20),
stateVehicle boolean,

PRIMARY KEY (id_vehicle),
FOREIGN KEY (id_typeVehicle) REFERENCES TypeOfVehicles(id_typeVehicle),
FOREIGN KEY (id_model) REFERENCES VehiclesModels(id_model)
);

DROP TABLE IF EXISTS BranchsLocations;
CREATE TABLE BranchsLocations(
id_locationBranch INTEGER NOT NULL AUTO_INCREMENT ,
country VARCHAR(20),
state VARCHAR(20),
city VARCHAR(20),
postalCode VARCHAR(20),

PRIMARY KEY(id_locationBranch)
);

DROP TABLE IF EXISTS Branchs;
CREATE TABLE Branchs (
id_branch INTEGER NOT NULL AUTO_INCREMENT,
id_locationBranch INTEGER NOT NULL,
adress VARCHAR(20),
phone_number VARCHAR(20),

PRIMARY KEY(id_branch),
FOREIGN KEY(id_locationBranch) REFERENCES BranchsLocations(id_locationBranch)
);




DROP TABLE IF EXISTS Area;
CREATE TABLE Area(
id_area INTEGER NOT NULL AUTO_INCREMENT ,
area_description VARCHAR(20),

PRIMARY KEY(id_area)
);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees(
id_employee INTEGER NOT NULL AUTO_INCREMENT,
id_branch INTEGER NOT NULL,
id_area INTEGER NOT NULL,
name_employee VARCHAR(20),
adress VARCHAR(20),
phone_number VARCHAR (20),

PRIMARY KEY(id_employee),
FOREIGN KEY(id_area) REFERENCES Area(id_area),
FOREIGN KEY(id_branch) REFERENCES Branchs(id_branch)
);


DROP TABLE IF EXISTS PaymentTypes;
CREATE TABLE PaymentTypes(
id_paymentType INTEGER NOT NULL AUTO_INCREMENT ,
payment_description VARCHAR(20),

PRIMARY KEY(id_paymentType)
);


DROP TABLE IF EXISTS Payments;
CREATE TABLE Payments(
id_payment INTEGER NOT NULL AUTO_INCREMENT,
id_paymentType INTEGER NOT NULL,
payment_date DATETIME,
payment_amount DOUBLE,

PRIMARY KEY(id_payment),
FOREIGN KEY(id_paymentType) REFERENCES PaymentTypes(id_paymentType)
);



DROP TABLE IF EXISTS ClientLicense;
CREATE TABLE ClientLicense(
id_typeLicense INTEGER NOT NULL AUTO_INCREMENT,
license_description VARCHAR(20),

PRIMARY KEY(id_typeLicense)
);

DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients(
id_client INTEGER NOT NULL AUTO_INCREMENT ,
id_typeLicense INTEGER NOT NULL,
first_name VARCHAR(20),
last_name VARCHAR(20),
adress VARCHAR(20),
insurance_number VARCHAR(20),
phone1 VARCHAR(20),
phone2 VARCHAR(20),

PRIMARY KEY(id_client),
FOREIGN KEY(id_typeLicense) REFERENCES ClientLicense(id_typeLicense)
);

DROP TABLE IF EXISTS Rental;
CREATE TABLE Rental(
id_rental INTEGER NOT NULL AUTO_INCREMENT,
id_vehicle INTEGER NOT NULL,
id_client INTEGER NOT NULL,
id_payment INTEGER NOT NULL,
id_employee INTEGER NOT NULL,
id_period INTEGER NOT NULL,
rental_date DATETIME,
end_date DATETIME,


PRIMARY KEY(id_rental),
FOREIGN KEY(id_vehicle) REFERENCES Vehicles(id_vehicle),
FOREIGN KEY(id_client) REFERENCES Clients(id_client),
FOREIGN KEY(id_payment) REFERENCES Payments(id_payment),
FOREIGN KEY(id_employee) REFERENCES Employees(id_employee)

);




