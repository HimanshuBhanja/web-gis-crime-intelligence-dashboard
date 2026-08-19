import pandas as pd
from sqlalchemy import create_engine

# Read CSV
df = pd.read_csv(
    r"D:\Msc Agri. Analytics\3. VAC_Summer\1. Rotten grapes\VAC_Project\10_Property_stolen_and_recovered.csv"
)

# PostgreSQL connection
engine = create_engine(
    "postgresql+psycopg2://postgres:864886@localhost:5432/crime_india"
)

# Upload CSV to PostgreSQL
df.to_sql(
    "property_crime",
    engine,
    if_exists="replace",
    index=False
)

print("CSV uploaded successfully!")