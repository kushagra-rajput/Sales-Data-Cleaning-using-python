# Sales-Data-Cleaning-using-python
## 🔍 Overview

This project focuses on cleaning, preprocessing, and structuring a messy sales dataset using Python (Pandas) and then performing business-oriented analysis using Microsoft SQL Server.
The major goal of this project is to demonstrate how raw, inconsistent data can be transformed into a high-quality analytical dataset and then used to generate meaningful KPIs and business insights.
## 📝 Key Objective

The primary objective of the project are:

- Perform end-to-end data cleaning using Pandas.
- Handle missing, inconsistent, and incorrect values.
- Fix data types and standardize columns.
- Detect outliers in each column and fix them.
- Engineer analytical features such as total revenue.
- Load cleaned data into SQL Server.
- Build KPI-driven SQL analysis.
 
## 🧾 Dataset Description

The project uses one datasets related to the product_sales:

Columns:

- sale_id (Primary Key)
- product_name
- category
- quantity
- unit_price
- sale_date
- customer_rating
- remarks

Derived Column:

- total_revenue = quantity × unit_price

## 🧹 Data Cleaning (Core Part of Project)

The dataset was highly inconsistent and required structured preprocessing using Pandas.

### ✔ Cleaning steps performed:

- Removed duplicate records.
- Handled missing values logically (mode, median, business rules).
- Converted incorrect data types (object → numeric, object → datetime).
- Standardized date formats.
- Cleaned text columns (remarks, product names, categories).
- Removed special characters from numeric fields.
- Detected and handled invalid values.
- Treated outliers where required.
- Replaced logically incorrect entries with NaN.
- Validated final dataset integrity.

## 🛠 Tools & Technologies

To run this project, you'll need the following:

- **Python 3.7 or later**-
- **Jupyter Notebook or any other Python IDE**
- **The following Python libraries:**
  - pandas
  - NumPy
  - matplotlib
- **Database: Microsoft SQL Server (SSMS)**
- **Data Format: CSV**
- **Version Control: GitHub**

You can install the required libraries using pip:
`pip install pandas numpy matplotlib `

## 📋 Methodology

The project follows these steps:

1. Data Cleaning: Handling missing values, converting data types, and transforming data for analysis.
2. Exploratory Data Analysis (EDA): Investigating datasets to summarize main characteristics and find patterns.
3. Advanced Analysis: Performing deeper analysis on specific topics such as top product, category, and revenue calcultion.
4. Visualization: Creating plots and charts to visualize findings from the data.

## 📁 Files in the Repository

- `cleaning_messy_dataset.ipynb`: The Jupyter notebook containing the code for data cleaning, analysis, and visualization.
- `sql_sales_analysis.sql`: SQL notebook containing all the querys and analysis.
Dataset:
- `messy_sales_dataset.csv`: Dataset with messy data and many inconsistency.
- `cleaned_data.csv`: Data with proper structure and ready for analysis.
- `SQL_Sales_Analysis_Project_File.docx`: The sql project file that explain sql data analysis.
- `README.md`: This README file provides an overview and instructions for the project.

## 📈 Key Insights

- Proper data cleaning significantly improved analytical accuracy.
- A small number of products generate a major share of revenue.
- Some categories show strong sales but weaker customer satisfaction.
- Customer remarks strongly align with rating patterns.

## ✅ Conclusion

This project highlights the importance of data cleaning as the foundation of analytics. By using Pandas for preprocessing and SQL Server for structured analysis, the project demonstrates a complete real-world data analytics workflow.
