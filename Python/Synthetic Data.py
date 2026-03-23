import pandas as pd
import numpy as np

# 1. SETUP - 1.04 Million Rows (2^20 for Excel/PowerBI limits)
num_rows = 1048576
shipment_ids = [f'SHP-{i:07d}' for i in range(num_rows)]

# 2. SYNTHETIC LOGISTICS GENERATION
data = {
    'shipment_id': shipment_ids,
    'product_category': np.random.choice(['Semiconductors', 'Electronics', 'Automotive', 'Industrial', 'Energy & Power', 'Raw Materials'], num_rows),
    'weight_kg': np.random.uniform(10, 5000, num_rows),
    'dist_km': np.random.uniform(100, 15000, num_rows),
    'unit_cost': np.random.uniform(50, 2000, num_rows),
    'current_node_stock': np.random.randint(50, 5000, num_rows),
    'labor_strike_score': np.random.beta(2, 8, num_rows) # Skewed towards low risk (normal)
}

df = pd.DataFrame(data)

# 3. LINEAR PROGRAMMING & PREDICTIVE LOGIC (Simulated)
# Calculation of "Predicted Time-to-Recovery" (TTR) based on Risk Score
df['plan_hrs'] = np.random.randint(24, 168, num_rows)
df['predicted_ttr'] = (df['labor_strike_score'] * 200) + np.random.normal(12, 4, num_rows)

# AI Decision Engine: Pivot if TTR is too high or Stock is too low
# Constraint: If predicted_ttr > 72 hours AND stock < 1000, RECOMMEND PIVOT
df['ai_recommendation'] = np.where(
    (df['predicted_ttr'] > 72) & (df['current_node_stock'] < 1000), 
    'PIVOT', 
    'MAINTAIN'
)

# 4. EXPORT FOR POSTGRES
# This file is then used as the 'ai_optimized_final' table in the SQL scripts
df.to_csv('D:/Project 3 Supply chain/ai_optimized_1M_final.csv', index=False)
print("1.04 Million Rows Generated with AI Optimization Logic.")