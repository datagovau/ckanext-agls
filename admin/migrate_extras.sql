update package_extra set key = 'creation_date' where key ='Creation Date';
update package_extra_revision set key = 'creation_date' where key ='Creation Date';

update package_extra set key = 'data_granularity' where key like '%Data Granularity';
update package_extra set key = 'data_granularity' where key ='Data';
update package_extra set key = 'data_granularity' where key ='Data Granularity';
update package_extra set key = 'data_granularity' where key ='Granularity';
update package_extra_revision set key = 'data_granularity' where key  like'%Data Granularity';
update package_extra_revision set key = 'data_granularity' where key ='Data';
update package_extra_revision set key = 'data_granularity' where key ='Data Granularity';
update package_extra_revision set key = 'data_granularity' where key ='Granularity';

update package_extra set key = 'spatial_coverage' where key ='Data Location' and value = 'City of Salisbury';
update package_extra set key = 'spatial_coverage' where key ='Data Location' and value = 'South Australia';
update package_extra_revision set key = 'spatial_coverage' where key ='Data Location' and value = 'City of Salisbury';
update package_extra_revision set key = 'spatial_coverage' where key ='Data Location' and value = 'South Australia';

update package_extra set key = 'data_state' where key ='Data Status';
update package_extra set key = 'data_state' where key ='Status';
update package_extra_revision set key = 'data_state' where key ='Data Status';
update package_extra_revision set key = 'data_state' where key ='Status';

update package_extra set key = 'spatial_coverage' where key ='Geospatial Coverage';
update package_extra set key = 'spatial_coverage' where key ='Geographical Coverage';
update package_extra set key = 'spatial_coverage' where key ='Gepspatial Coverage';
update package_extra set key = 'spatial_coverage' where key ='Coverage';
update package_extra_revision set key = 'spatial_coverage' where key ='Geospatial Coverage';
update package_extra_revision set key = 'spatial_coverage' where key ='Geographical Coverage';
update package_extra_revision set key = 'spatial_coverage' where key ='Gepspatial Coverage';
update package_extra_revision set key = 'spatial_coverage' where key ='Coverage';

update package_extra set key = 'update_date' where key ='Last Update';
update package_extra set key = 'update_date' where key ='Last Update';
update package_extra set key = 'update_date' where key ='Last Updated';
update package_extra set key = 'update_date' where key ='Last Updated';
update package_extra set key = 'update_date' where key ='Data update';
update package_extra set key = 'update_date' where key ='Data updated';
update package_extra set key = 'update_date' where key ='Data Updated';
update package_extra_revision set key = 'update_date' where key ='Last Update';
update package_extra_revision set key = 'update_date' where key ='Last Update';
update package_extra_revision set key = 'update_date' where key ='Last Updated';
update package_extra_revision set key = 'update_date' where key ='Last Updated';
update package_extra_revision set key = 'update_date' where key ='Data update';
update package_extra_revision set key = 'update_date' where key ='Data updated';
update package_extra_revision set key = 'update_date' where key ='Data Updated';
 
update package_extra set key = 'temporal_coverage_from' where key ='Temporal Coverage';
update package_extra set key = 'temporal_coverage_from' where key ='Currency';
update package_extra_revision set key = 'temporal_coverage_from' where key ='Temporal Coverage';
update package_extra_revision set key = 'temporal_coverage_from' where key ='Currency';

update package_extra set key = 'update_freq' where key ='Update Frequency';
update package_extra set key = 'update_freq' where key ='Refresh Frequency';
update package_extra set key = 'update_freq' where key ='Updated Frequency';
update package_extra set key = 'update_freq' where key ='Update frequency';
update package_extra set key = 'update_freq' where key ='Frequency';
update package_extra_revision set key = 'update_freq' where key ='Update Frequency';
update package_extra_revision set key = 'update_freq' where key ='Refresh Frequency';
update package_extra_revision set key = 'update_freq' where key ='Updated Frequency';
update package_extra_revision set key = 'update_freq' where key ='Update frequency';
update package_extra_revision set key = 'update_freq' where key ='Frequency';
