#
# SQL Export
# Created by Querious (201024)
# Created: February 28, 2018 at 8:37:11 PM EST
# Encoding: Unicode (UTF-8)
#


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `transit_trips`;
DROP TABLE IF EXISTS `transit_stops`;
DROP TABLE IF EXISTS `transit_stop_times`;
DROP TABLE IF EXISTS `transit_shapes`;
DROP TABLE IF EXISTS `transit_routes`;
DROP TABLE IF EXISTS `transit_fare_rules`;
DROP TABLE IF EXISTS `transit_fare_attributes`;
DROP TABLE IF EXISTS `transit_calendar_dates`;
DROP TABLE IF EXISTS `transit_calendar`;
DROP TABLE IF EXISTS `transit_agency`;

SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;