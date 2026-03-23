CREATE OR REPLACE VIEW v_export_fact_shipments AS
SELECT 
    f.shipment_id,
    f.product_category,
    f.node_tier,
    f.mode,
    
    -- 1. Time Impact (Predicted vs Optimized)
    f.plan_hrs AS original_planned_hours,
    f.predicted_ttr AS raw_predicted_delay_hrs,
    -- If AI says PIVOT, we assume a recovery to 24hrs; else use predicted delay
    CASE WHEN f.ai_recommendation = 'PIVOT' THEN 24 ELSE f.predicted_ttr END AS optimized_ttr_hrs,
    
    -- 2. Financial & ESG Impact
    f.unit_cost AS original_freight_cost,
    f.pivot_impact AS optimized_total_cost,
    -- Formula: (Weight * Distance * factor) / 1000 * Carbon Price ($50)
    ROUND(((f.weight_kg * f.dist_km * 0.0001) / 1000.0) * 50.0, 2) AS carbon_tax_liability,
    
    -- 3. AI Predictive Signals
    f.risk_score,
    f.ai_recommendation,
    f.strategic_justification,
    f.is_delayed,
    f.current_node_stock

FROM ai_optimized_1m_final f;