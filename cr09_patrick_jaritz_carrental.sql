-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 16. Jun 2018 um 02:14
-- Server-Version: 10.1.32-MariaDB
-- PHP-Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_patrick_jaritz_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `fk_inv_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_start_loc_id` int(11) DEFAULT NULL,
  `fk_return_loc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_date`, `fk_inv_id`, `fk_customer_id`, `fk_car_id`, `fk_start_loc_id`, `fk_return_loc_id`) VALUES
(1, '2017-11-11', 1, 1, 1, 2, 5),
(2, '2017-12-12', 2, 2, 8, 5, 1),
(3, '2018-01-04', 3, 3, 6, 2, 2),
(4, '2018-01-17', 4, 4, 2, 4, 4),
(5, '2018-02-03', 5, 5, 4, 1, 2),
(6, '2018-02-10', 6, 6, 3, 3, 5),
(7, '2018-02-17', 7, 7, 13, 6, 6),
(8, '2018-03-02', 8, 8, 10, 5, 2),
(9, '2018-03-16', NULL, 9, 8, 1, 1),
(10, '2018-03-30', NULL, 10, 11, 2, 4),
(11, '2018-04-04', NULL, NULL, 7, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_type` varchar(55) DEFAULT NULL,
  `fk_car_status_id` int(11) DEFAULT NULL,
  `fk_booking_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `reservation_from` date DEFAULT NULL,
  `reservation_to` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_id`, `car_type`, `fk_car_status_id`, `fk_booking_id`, `fk_customer_id`, `reservation_from`, `reservation_to`, `return_date`) VALUES
(1, 'Van', 5, 5, NULL, '2017-12-01', '2017-12-31', '2017-12-31'),
(2, 'Sports', 3, 6, NULL, '2018-01-01', '2018-01-14', '2018-01-14'),
(3, 'Coupe', 1, 3, NULL, '2018-01-15', '2018-01-31', '2018-01-31'),
(4, 'Limousine', 2, 4, NULL, '2018-02-01', '2018-02-15', '2018-02-16'),
(5, 'Sports', 4, 1, NULL, '2018-02-01', '2018-02-14', '2018-02-14'),
(6, 'Coupe', 6, 7, NULL, '2018-02-15', '2018-02-28', '2018-02-28'),
(7, 'Limousine', 5, 2, NULL, '2018-03-01', '2018-03-14', '2018-03-14'),
(8, 'Sports', 6, 8, NULL, '2018-04-01', '2018-04-14', '2018-04-16'),
(9, 'Coupe', 2, 10, NULL, '2018-04-02', '2018-04-05', '2018-04-05'),
(10, 'Limousine', 1, 9, NULL, '2018-05-01', '2018-05-14', '2018-05-14'),
(11, 'Sports', 4, 11, NULL, '2018-05-03', '2018-05-04', '2018-05-04'),
(12, 'Coupe', 6, 13, NULL, '2018-05-03', '2018-05-07', '2018-05-07'),
(13, 'Limousine', 7, 12, NULL, '2018-06-01', '2018-06-14', '2018-06-14');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_status`
--

CREATE TABLE `car_status` (
  `car_status_id` int(11) NOT NULL,
  `km_total` int(11) DEFAULT NULL,
  `km_driven` int(11) DEFAULT NULL,
  `integrity` varchar(55) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fuel_full` int(11) DEFAULT NULL,
  `fuel_is` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_status`
--

INSERT INTO `car_status` (`car_status_id`, `km_total`, `km_driven`, `integrity`, `fk_car_id`, `fuel_full`, `fuel_is`) VALUES
(1, 21231, 250, 'ok', 2, 50, 50),
(2, 36288, 100, 'ok', 3, 30, 20),
(3, 43876, 500, 'ok', 2, 60, 50),
(4, 53333, 400, 'ok', 4, 40, 40),
(5, 23424, 300, 'ok', 5, 55, 50),
(6, 13442, 450, 'ok', 6, 45, 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `credit_card` bigint(16) DEFAULT NULL,
  `telephone` bigint(12) DEFAULT NULL,
  `fk_booking_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_inv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `credit_card`, `telephone`, `fk_booking_id`, `fk_car_id`, `fk_inv_id`) VALUES
(1, 'Susi', 'Flusi', 2827383946462048, 436648923375, 1, 5, 1),
(2, 'Hans', 'Krans', 3839482750693625, 4366038394387, 2, 4, 2),
(3, 'Bernd', 'Sternd', 4857362939573638, 4306993388465, 3, 7, 3),
(4, 'Peter', 'Kneter', 3757900285933338, 436649865274, 4, 13, 4),
(5, 'Andi', 'Kawandi', 3384055378928374, 436763896564, 5, 2, 5),
(6, 'Babsi', 'Schwabsi', 3788394465773742, 436769988345, 6, 10, 6),
(7, 'Viki', 'Tiki', 7464938227589874, 436608753467, 7, 6, 7),
(8, 'Patze', 'Bratze', 8846264830244498, 436992837447, 8, 1, 8),
(9, 'Anna', 'Bananna', 4733389928465589, 436507658793, 9, 12, NULL),
(10, 'Melli', 'Delli', 9933447592758843, 436769335765, 10, 9, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `inv_id` int(11) NOT NULL,
  `inv_paid` varchar(11) DEFAULT NULL,
  `fk_booking_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_start_loc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`inv_id`, `inv_paid`, `fk_booking_id`, `fk_customer_id`, `fk_car_id`, `fk_start_loc_id`) VALUES
(1, 'yes', 1, 1, 5, 1),
(2, 'yes', 2, 2, 9, 3),
(3, 'yes', 3, 3, 8, 2),
(4, 'yes', 4, 4, 6, 5),
(5, 'no', 5, 5, 10, 4),
(6, 'yes', 6, 6, 5, 6),
(7, 'yes', 7, 7, 1, 3),
(8, 'yes', 8, 8, 11, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_location`
--

CREATE TABLE `return_location` (
  `return_loc_id` int(11) NOT NULL,
  `return_loc_name` varchar(55) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_car_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `return_location`
--

INSERT INTO `return_location` (`return_loc_id`, `return_loc_name`, `fk_car_id`, `fk_car_status_id`) VALUES
(1, 'Klagenfurt', 10, 3),
(2, 'Innsbruck', 3, 5),
(3, 'Graz', 5, 1),
(4, 'Bregenz', 11, 4),
(5, 'Eisenstadt', 12, 6),
(6, 'Wien', 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_location`
--

CREATE TABLE `start_location` (
  `start_loc_id` int(11) NOT NULL,
  `start_loc_name` varchar(55) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_inv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `start_location`
--

INSERT INTO `start_location` (`start_loc_id`, `start_loc_name`, `fk_car_id`, `fk_inv_id`) VALUES
(1, 'Klagenfurt', 3, 1),
(2, 'Innsbruck', 6, 2),
(3, 'Graz', 7, 3),
(4, 'Bregenz', 5, 4),
(5, 'Eisenstadt', 2, 5),
(6, 'Wien', 12, 6);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`),
  ADD KEY `fk_return_loc_id` (`fk_return_loc_id`),
  ADD KEY `fk_inv_id` (`fk_inv_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indizes für die Tabelle `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`car_status_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_inv_id` (`fk_inv_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`inv_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`);

--
-- Indizes für die Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_loc_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_car_status_id` (`fk_car_status_id`);

--
-- Indizes für die Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_loc_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_inv_id`) REFERENCES `invoice` (`inv_id`),
  ADD CONSTRAINT `booking_ibfk_10` FOREIGN KEY (`fk_return_loc_id`) REFERENCES `return_location` (`return_loc_id`),
  ADD CONSTRAINT `booking_ibfk_11` FOREIGN KEY (`fk_inv_id`) REFERENCES `invoice` (`inv_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`fk_start_loc_id`) REFERENCES `start_location` (`start_loc_id`),
  ADD CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`fk_return_loc_id`) REFERENCES `return_location` (`return_loc_id`),
  ADD CONSTRAINT `booking_ibfk_6` FOREIGN KEY (`fk_inv_id`) REFERENCES `invoice` (`inv_id`),
  ADD CONSTRAINT `booking_ibfk_7` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `booking_ibfk_8` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `booking_ibfk_9` FOREIGN KEY (`fk_start_loc_id`) REFERENCES `start_location` (`start_loc_id`);

--
-- Constraints der Tabelle `car_status`
--
ALTER TABLE `car_status`
  ADD CONSTRAINT `car_status_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_inv_id`) REFERENCES `invoice` (`inv_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_start_loc_id`) REFERENCES `start_location` (`start_loc_id`);

--
-- Constraints der Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `return_location_ibfk_2` FOREIGN KEY (`fk_car_status_id`) REFERENCES `car_status` (`car_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
