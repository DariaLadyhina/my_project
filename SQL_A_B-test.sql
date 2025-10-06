--Створення view для ab test в Pandas
CREATE OR REPLACE VIEW v_ab_test AS
SELECT u.user_id,
       g.group_label,
	   c.country_code,
	   dev.device_name,
	   d.date,
	   d.converted
FROM user_t u
LEFT JOIN daily d ON d.user_id = u.user_id
LEFT JOIN group_t g ON u.group_id = g.group_id
LEFT JOIN country c ON u.country_id = c.country_id
LEFT JOIN device dev ON u.device_id = dev.device_id;


--Створення view для Power BI
CREATE OR REPLACE VIEW v_daily_agg AS
SELECT d.date,
    u.user_id,
    g.group_label,
    c.country_code,
    dev.device_name,
    u.days_on_product,
    d.converted
FROM user_t u
LEFT JOIN daily d ON d.user_id = u.user_id
LEFT JOIN group_t g ON u.group_id = g.group_id
LEFT JOIN country c ON u.country_id = c.country_id
LEFT JOIN device dev ON u.device_id = dev.device_id;
