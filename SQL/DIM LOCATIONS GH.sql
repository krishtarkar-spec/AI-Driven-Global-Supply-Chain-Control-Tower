CREATE OR REPLACE VIEW v_export_dim_locations_indepth AS
SELECT 
    DISTINCT 
    m.origin_id AS node_id, -- Pulling the ID from your existing fact_shipments table
    f.lat_o AS latitude,
    f.lon_o AS longitude,
    f.node_tier,

    -- 1. NODE CLASSIFICATION (From your AI-solved table)
    CASE 
        WHEN f.node_tier = 1 THEN 'Tier 1 Strategic Gateway'
        WHEN f.node_tier = 2 THEN 'Tier 2 Regional Hub'
        ELSE 'Tier 3 Local Distribution Center'
    END AS node_classification,

    -- 2. COUNTRY MAPPING
    CASE 
        WHEN m.origin_id LIKE 'IN-%' THEN 'India'
        WHEN m.origin_id LIKE 'DE-%' THEN 'Netherlands'
        WHEN m.origin_id LIKE 'TW-%' THEN 'Taiwan'
        WHEN m.origin_id LIKE 'CD-%' THEN 'Congo'
        WHEN m.origin_id = 'US-LAX' OR m.origin_id LIKE 'EXT-%' THEN 'USA'
        ELSE 'International'
    END AS country,
    
    -- 3. STATE/PROVINCE MAPPING
    CASE 
        WHEN m.origin_id = 'US-LAX' THEN 'California'
        WHEN m.origin_id = 'CD-KOL' THEN 'Lualaba'
        WHEN m.origin_id = 'DE-RTM' THEN 'South Holland'
        WHEN m.origin_id = 'TW-HSN' THEN 'Hsinchu County'
        WHEN m.origin_id LIKE 'IN-%' THEN (CASE WHEN m.origin_id = 'IN-MUN' THEN 'Gujarat' ELSE 'Maharashtra' END)
        -- Splitting EXT hubs by ID number logic
        WHEN m.origin_id LIKE 'EXT-%' AND (RIGHT(m.origin_id, 2)::INT % 4 = 0) THEN 'California'
        WHEN m.origin_id LIKE 'EXT-%' AND (RIGHT(m.origin_id, 2)::INT % 4 = 1) THEN 'New York'
        WHEN m.origin_id LIKE 'EXT-%' AND (RIGHT(m.origin_id, 2)::INT % 4 = 2) THEN 'Texas'
        ELSE 'Illinois'
    END AS state_province,

    -- 4. CITY MAPPING
    CASE 
        WHEN m.origin_id = 'US-LAX' THEN 'Los Angeles'
        WHEN m.origin_id = 'CD-KOL' THEN 'Kolwezi'
        WHEN m.origin_id = 'DE-RTM' THEN 'Rotterdam'
        WHEN m.origin_id = 'TW-HSN' THEN 'Hsinchu'
        WHEN m.origin_id = 'IN-JNPT' THEN 'Navi Mumbai'
        WHEN m.origin_id = 'IN-MUN' THEN 'Mundra'
        WHEN m.origin_id = 'IN-NSK' THEN 'Nashik'
        WHEN m.origin_id = 'IN-PNE' THEN 'Pune'
        WHEN m.origin_id = 'IN-DADRI' THEN 'Dadri'
        -- EXT City Distribution logic
        WHEN m.origin_id LIKE 'EXT-%' AND (RIGHT(m.origin_id, 2)::INT % 4 = 0) THEN 'San Francisco'
        WHEN m.origin_id LIKE 'EXT-%' AND (RIGHT(m.origin_id, 2)::INT % 4 = 1) THEN 'New York City'
        WHEN m.origin_id LIKE 'EXT-%' AND (RIGHT(m.origin_id, 2)::INT % 4 = 2) THEN 'Houston'
        ELSE 'Chicago'
    END AS city

FROM ai_optimized_1m_final f
-- Joining the AI table with your fact_shipments to bridge the origin_id
JOIN fact_shipments m ON f.shipment_id = m.shipment_id;