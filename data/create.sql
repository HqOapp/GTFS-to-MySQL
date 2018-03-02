#
# SQL Export
# Created by Querious (201024)
# Created: February 28, 2018 at 8:37:11 PM EST
# Encoding: Unicode (UTF-8)
#


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `transit_agency` (
  `agency_id` int(11) NOT NULL,
  `agency_name` varchar(255) DEFAULT NULL,
  `agency_url` varchar(255) DEFAULT NULL,
  `agency_timezone` varchar(50) DEFAULT NULL,
  `agency_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_calendar` (
  `service_id` varchar(255) DEFAULT NULL,
  `monday` tinyint(1) DEFAULT NULL,
  `tuesday` tinyint(1) DEFAULT NULL,
  `wednesday` tinyint(1) DEFAULT NULL,
  `thursday` tinyint(1) DEFAULT NULL,
  `friday` tinyint(1) DEFAULT NULL,
  `saturday` tinyint(1) DEFAULT NULL,
  `sunday` tinyint(1) DEFAULT NULL,
  `start_date` varchar(8) DEFAULT NULL,
  `end_date` varchar(8) DEFAULT NULL,
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_calendar_dates` (
  `service_id` varchar(255) DEFAULT NULL,
  `date` varchar(8) DEFAULT NULL,
  `exception_type` int(2) DEFAULT NULL,
  KEY `service_id` (`service_id`),
  KEY `exception_type` (`exception_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_fare_attributes` (
  `fare_id` int(11) DEFAULT NULL,
  `price` decimal(9,6) DEFAULT NULL,
  `currency_type` varchar(8) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `transfers` int(11) DEFAULT NULL,
  KEY `fare_id` (`fare_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_fare_rules` (
  `fare_id` int(11) DEFAULT NULL,
  `route_id` varchar(50) DEFAULT NULL,
  KEY `fare_id` (`fare_id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_routes` (
  `route_id` varchar(50) NOT NULL,
  `route_short_name` varchar(50) DEFAULT NULL,
  `route_long_name` varchar(255) DEFAULT NULL,
  `route_type` int(2) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `route_type` (`route_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_shapes` (
  `shape_id` varchar(50) DEFAULT NULL,
  `shape_pt_lat` decimal(9,6) DEFAULT NULL,
  `shape_pt_lon` decimal(9,6) DEFAULT NULL,
  `shape_pt_sequence` int(11) DEFAULT NULL,
  KEY `shape_id` (`shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_stop_times` (
  `trip_id` varchar(255) DEFAULT NULL,
  `arrival_time` varchar(8) DEFAULT NULL,
  `departure_time` varchar(8) DEFAULT NULL,
  `stop_id` int(11) DEFAULT NULL,
  `stop_sequence` int(11) DEFAULT NULL,
  KEY `trip_id` (`trip_id`),
  KEY `stop_id` (`stop_id`),
  KEY `stop_sequence` (`stop_sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_stops` (
  `stop_id` int(11) NOT NULL,
  `stop_name` varchar(255) DEFAULT NULL,
  `stop_lat` decimal(9,6) DEFAULT NULL,
  `stop_lon` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`stop_id`),
  KEY `stop_lat` (`stop_lat`),
  KEY `stop_lon` (`stop_lon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `transit_trips` (
  `route_id` varchar(50) DEFAULT NULL,
  `service_id` varchar(255) DEFAULT NULL,
  `trip_id` varchar(255) NOT NULL,
  `trip_headsign` varchar(255) DEFAULT NULL,
  `direction_id` tinyint(1) DEFAULT NULL,
  `shape_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `route_id` (`route_id`),
  KEY `service_id` (`service_id`),
  KEY `direction_id` (`direction_id`),
  KEY `shape_id` (`shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;