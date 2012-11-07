INSERT INTO profile_source_connection
(profile_source_connection_name, w_create_dt)
VALUES
('unknown', NOW());

UPDATE profile_source_connection
SET profile_source_connection_id = 0
WHERE profile_source_connection_name = 'unknown'
LIMIT 1;

INSERT INTO profile_source
(profile_source_id, profile_source_name, w_create_dt, profile_source_connection)
VALUES
(0, 'unknown', NOW(), 0);

UPDATE profile_source
SET profile_source_id = 0
WHERE profile_source_name = 'unknown'
LIMIT 1;

INSERT INTO profile_source_table
(profile_source_table_name, profile_source_fk, w_create_dt)
VALUES
('unknown', 0, NOW());

UPDATE profile_source_table
SET profile_source_table_pk = 0
WHERE profile_source_table_name = 'unknown'
LIMIT 1;

INSERT INTO profile_source_table_number_analysis
(profile_source_table_pk, table_column_name, w_create_dt)
VALUES
(0, 'unknown', NOW());

UPDATE profile_source_table_number_analysis
SET profile_source_table_number_analysis_pk = 0
WHERE profile_source_table_pk = 0
  AND table_column_name = 'unknown'
LIMIT 1;

INSERT INTO profile_source_table_pattern_finder_analysis
(profile_source_table_pk, table_column_name, w_create_dt)
VALUES
(0, 'unknown', NOW());

UPDATE profile_source_table_pattern_finder_analysis
SET profile_source_table_pattern_finder_analysis_pk = 0
WHERE profile_source_table_pk = 0
  AND table_column_name = 'unknown'
LIMIT 1;

INSERT INTO profile_source_table_string_analysis
(profile_source_table_pk, table_column_name, w_create_dt)
VALUES
(0, 'unknown', NOW());

UPDATE profile_source_table_string_analysis
SET profile_source_table_string_analysis_pk = 0
WHERE profile_source_table_pk = 0
  AND table_column_name = 'unknown';

INSERT INTO profile_source_table_value_distribution_analysis
(profile_source_table_pk, table_column_name, w_create_dt)
VALUES
(0, 'unknown', NOW());

UPDATE profile_source_table_value_distribution_analysis
SET profile_source_table_value_distribution_analysis_pk = 0
WHERE profile_source_table_pk = 0
  AND table_column_name = 'unknown';

INSERT INTO profile_source_table_value_distribution_summary_analysis
(profile_source_table_pk, table_column_name, w_create_dt)
VALUES
(0, 'unknown', NOW());

UPDATE profile_source_table_value_distribution_summary_analysis
SET profile_source_table_value_distribution_summary_analysis_pk = 0
WHERE profile_source_table_pk = 0
  AND table_column_name = 'unknown'
LIMIT 1;
