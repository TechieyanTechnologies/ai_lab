# Level 1 - Data Handling & Visualization Tasks

## Overview
This module teaches data literacy through hands-on CSV analysis, visualization, and reporting. Students will learn to work with real data, clean it, explore it, and create professional visualizations.

## Prerequisites
- Basic understanding of spreadsheets
- Familiarity with data files
- No programming experience required!

## Task List

### Task 1: CSV Upload & Preview
**Objective**: Learn CSV structure and basic data preview

**Steps**:
1. Click "Create New Project" on the Level 1 home page
2. Give your project a name (e.g., "Student Analysis")
3. Click "Upload CSV" button
4. Select `student_marks.csv` from seed_data or upload your own
5. Click "Preview Data" to see the first 20 rows

**Expected Output**:
- CSV file saved as `original.csv`
- Preview table showing columns and sample rows
- Column types automatically detected

**Sample Data**: `seed_data/level1/student_marks.csv`
- Columns: student_id, name, math, science, english, attendance, date
- 30 rows of student performance data
- Contains some missing values to practice cleaning

---

### Task 2: Summary Statistics
**Objective**: Compute descriptive statistics for columns

**Steps**:
1. After uploading data, click "Compute Summary Statistics"
2. Review the generated statistics table

**Expected Output**:
- Mean, median, std for numeric columns
- Count and unique values for categorical columns
- Statistics saved as `summary.json`

**Learning**: Understanding central tendency and data distribution

---

### Task 3: Missing Value Exploration
**Objective**: Identify and understand missing values

**Steps**:
1. Review the preview table - notice empty cells
2. Check the missing counts shown in the preview
3. Identify which columns have missing values

**Expected Output**:
- List of columns with missing values
- Percentage of missing data per column
- Count of missing rows

**Learning**: Understanding data quality issues

---

### Task 4: Handle Missing Values
**Objective**: Learn different strategies for missing data

**Steps**:
1. Select a column with missing values (e.g., "english")
2. Choose an action:
   - Fill with Mean (for numeric columns)
   - Fill with Median
   - Fill with Mode (for categorical)
   - Drop Rows
3. Click "Apply Cleaning"
4. Preview the cleaned data

**Expected Output**:
- Cleaned CSV saved as `cleaned_v1.csv`
- Preview showing before/after comparison
- Log of changes made

**Learning**: Data cleaning strategies

---

### Task 5: Data Type Conversion
**Objective**: Convert columns between types

**Steps**:
1. Select a column (e.g., "date")
2. Choose "Convert to DateTime"
3. Or choose "Convert to Numeric" for string numbers
4. Click "Apply"

**Expected Output**:
- Updated CSV with converted types
- Confirmation of successful conversion
- Or error message if conversion fails

**Learning**: Understanding data types and conversion

---

### Task 6: Create Derived Columns
**Objective**: Add calculated columns

**Steps**:
1. Click "Create Derived Column"
2. Choose formula (e.g., "Total Marks")
3. Preview the new column
4. Save the updated dataset

**Expected Output**:
- New column added (e.g., total_marks)
- Calculated values for all rows
- Updated CSV saved

**Learning**: Basic feature engineering

---

### Task 7: Outlier Detection
**Objective**: Identify unusual data points

**Steps**:
1. Select a numeric column (e.g., "math")
2. Click "Detect Outliers"
3. Review the boxplot visualization
4. Check the list of outlier rows

**Expected Output**:
- Number of outliers found
- Boxplot visualization saved
- List of outlier row indices
- Boxplot image file

**Learning**: Understanding data distribution and anomalies

---

### Task 8: Correlation Analysis
**Objective**: Explore relationships between variables

**Steps**:
1. Click "Create Correlation Heatmap"
2. Wait for processing
3. Review the heatmap visualization

**Expected Output**:
- Correlation matrix heatmap
- Color-coded relationship strengths
- Correlation values saved as CSV
- PNG visualization saved

**Learning**: Understanding variable relationships

---

### Task 9: Create Visualizations
**Objective**: Build different chart types

**Available Chart Types**:
- Bar Chart - Compare categories
- Line Chart - Show trends over time
- Scatter Plot - Explore relationships
- Histogram - Show distributions
- Box Plot - Display quartiles

**Steps** (Repeat for each chart type):
1. Select chart type
2. Choose X and Y columns
3. Add title and labels
4. Click "Generate Chart"
5. Download the chart

**Expected Output**:
- Professional PNG charts (300 DPI)
- High-quality visualizations
- Charts saved for report

**Learning**: Data visualization best practices

---

### Task 10: Build Multi-Chart Report
**Objective**: Compose a complete data story

**Steps**:
1. Select 2-3 of your best charts
2. Click "Add Chart to Report"
3. Add text insights after each chart
4. Review the assembled report
5. Click "Generate PDF Report"

**Expected Output**:
- HTML report saved
- PDF report generated
- Professional document ready for printing

**Learning**: Data storytelling and reporting

---

### Task 11: Mini Assignment Template
**Objective**: Practice specific skills

**Example Assignments**:
1. "Find the average math score"
2. "Create a bar chart of subjects"
3. "Identify the highest attendance"
4. "Remove all missing values"
5. "Create a trend chart over time"

**Steps**:
1. Complete each mini-assignment
2. Submit for auto-checking
3. Receive pass/fail feedback

**Expected Output**:
- Assignment results
- Pass/fail status
- Feedback on completion

**Learning**: Reinforced skills practice

---

### Task 12: Export & Share
**Objective**: Package project for offline sharing

**Steps**:
1. Click "Export Project"
2. Wait for ZIP creation
3. Download the project export
4. Share with teachers or classmates

**Expected Output**:
- Complete project ZIP file
- All datasets included
- All visualizations included
- All reports included
- Ready for USB transfer

**Learning**: Project management and sharing

---

## Sample Datasets

### student_marks.csv
- **Use for**: Basic analysis, missing values, grading
- **Contains**: Student performance across subjects
- **Size**: 30 rows, 7 columns

### weather_week.csv
- **Use for**: Time series analysis, trend visualization
- **Contains**: Daily weather data
- **Size**: 14 rows, 3 columns

### sales_small.csv
- **Use for**: Business analysis, categorical grouping
- **Contains**: Store sales data
- **Size**: 50 rows, 5 columns

### survey_small.csv
- **Use for**: Survey analysis, satisfaction scores
- **Contains**: Customer survey responses
- **Size**: 40 rows, 5 columns

---

## Tips for Success

1. **Start Simple**: Begin with Task 1 and work sequentially
2. **Use Sample Data**: Practice with provided datasets first
3. **Save Often**: Each cleaned version is saved automatically
4. **Explore Errors**: Learn from conversion failures
5. **Try Different Charts**: Experiment with all chart types
6. **Read Help Text**: Each task has inline help available

## Common Questions

**Q: Can I upload my own CSV?**
A: Yes! Click upload and select any CSV file.

**Q: What if my CSV doesn't load?**
A: Check the format - ensure first row is headers, data starts on row 2.

**Q: How do I know which chart to use?**
A: Check the help text in each chart type.

**Q: Can I undo changes?**
A: Yes! Each cleaned version is saved separately.

**Q: Where are my files saved?**
A: In `artifacts/projects/<your_project_id>/`

## Next Steps
After completing all 12 tasks:
- Review your generated reports
- Export your project
- Share with your teacher
- Consider trying Level 2 (Machine Learning)!

---

**Happy Learning!** 🎉
