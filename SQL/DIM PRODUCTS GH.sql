CREATE OR REPLACE VIEW v_export_dim_products AS
SELECT 
    DISTINCT product_category,
    CASE 
        WHEN product_category IN ('Semiconductors', 'Electronics') THEN 'High Priority'
        WHEN product_category IN ('Automotive', 'Industrial') THEN 'Medium Priority'
        ELSE 'Standard'
    END AS category_priority
FROM ai_optimized_1m_final;