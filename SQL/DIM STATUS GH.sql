CREATE OR REPLACE VIEW v_export_dim_status_lookup AS
SELECT DISTINCT
    -- Demand Signal (Pre-calculated in Python)
    CASE 
        WHEN risk_score > 0.85 THEN 'SIGNAL: KILL BID'
        WHEN current_node_stock < 1000 AND ai_recommendation = 'PIVOT' THEN 'SIGNAL: REDUCE BID'
        ELSE 'SIGNAL: AGGRESSIVE BIDDING'
    END AS marketing_ai_strategy,
    
    -- Risk Signal (Pre-calculated in Python)
    CASE 
        WHEN risk_score > 0.90 THEN 'BLACK SWAN: Port Disruption'
        WHEN risk_score > 0.70 THEN 'PREDICTIVE ALERT: High Risk'
        ELSE 'NORMAL OPERATION'
    END AS anomaly_status,
    
    -- Decisions (Pulled directly from your table)
    ai_recommendation AS executive_action_plan,
    strategic_justification

FROM ai_optimized_1m_final;