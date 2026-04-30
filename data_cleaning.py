import pandas as pd

# Creating a sample logistics dataset with errors
raw_data = {
    'TrackingID': ['TRK101', 'TRK101', 'TRK102'], # Duplicate entry
    'City': ['Noida', 'Noida', 'Gurgaon'],
    'Weight': [2.0, 2.0, None] # Missing value
}

df = pd.DataFrame(raw_data)

# Step 1: Removing duplicate shipments
df_cleaned = df.drop_duplicates()

# Step 2: Filling missing weight with average
df_cleaned['Weight'] = df_cleaned['Weight'].fillna(df_cleaned['Weight'].mean())

print("Cleaned Shipment Data for Analysis:")
print(df_cleaned)
