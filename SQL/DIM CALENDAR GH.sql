CREATE OR REPLACE VIEW v_export_dim_calendar AS
SELECT 
    datum AS shipment_date,
    EXTRACT(YEAR FROM datum) AS year,
    EXTRACT(MONTH FROM datum) AS month_number,
    TO_CHAR(datum, 'Month') AS month_name,
    TO_CHAR(datum, 'Mon') || '-' || EXTRACT(YEAR FROM datum) AS month_year,
    'FY' || RIGHT(EXTRACT(YEAR FROM datum)::text, 2) || '-M' || LTRIM(TO_CHAR(EXTRACT(MONTH FROM datum), '00')) AS fiscal_period
FROM (
    SELECT generate_series('2024-01-01'::date, '2027-12-31'::date, '1 day'::interval)::date AS datum
) calendar_basis;