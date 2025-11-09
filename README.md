# Level 1 - Data Handling & Visualization Platform

A comprehensive, offline, student-driven learning platform for data literacy through hands-on CSV analysis and visualization.

## 🚀 Quick Start

### Prerequisites
- Python 3.10 or higher
- pip package manager

### Installation

1. **Create virtual environment**
   ```bash
   python -m venv venv
   
   # On macOS/Linux
   source venv/bin/activate
   
   # On Windows
   venv\Scripts\activate
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the application**
   ```bash
   python app.py
   ```

4. **Access the platform**
   - Open your browser: http://localhost:5001
   - No login required - start immediately!

## 📋 12 Learning Tasks

The platform includes 12 sequential tasks:

1. **CSV Upload & Preview** - Learn data structure
2. **Summary Statistics** - Compute descriptive stats
3. **Missing Value Exploration** - Identify data quality issues
4. **Handle Missing Values** - Learn cleaning strategies
5. **Data Type Conversion** - Understand data types
6. **Create Derived Columns** - Basic feature engineering
7. **Outlier Detection** - Identify anomalies
8. **Correlation Analysis** - Explore relationships
9. **Create Visualizations** - Build professional charts
10. **Multi-Chart Reports** - Compose data stories
11. **Mini Assignments** - Reinforce skills
12. **Export & Share** - Package projects

## 📊 Sample Datasets

Ready-to-use CSV files in `seed_data/level1/`:

- **student_marks.csv** - Student performance data (30 rows)
- **weather_week.csv** - Weather time series (14 rows)
- **sales_small.csv** - Store sales data (50 rows)
- **survey_small.csv** - Survey responses (40 rows)

## 🎓 How to Use

### For Students
1. Visit http://localhost:5001
2. Click "Level 1 - Data Handling & Visualization"
3. Create a new project
4. Upload CSV or use sample data
5. Complete all 12 tasks
6. Export your project

### For Teachers
- **No setup required** - students can start immediately
- **Progressive learning** - tasks build sequentially
- **Real data** - students work with actual datasets
- **Offline safe** - no internet required

## 📚 Documentation

- **Student Guide**: `docs/level1_tasks.md` - Complete instructions for all tasks
- **Configuration**: `config.yaml` - Customize settings
- **Status Report**: `LEVEL1_STATUS.md` - Implementation details

## 🧪 Testing

Run acceptance tests:
```bash
./scripts/run_acceptance_tests.sh
```

## 🛠️ Technical Details

- **Framework**: Flask + Jinja2
- **Data Processing**: Pandas, NumPy
- **Visualizations**: Matplotlib, Seaborn
- **Storage**: Filesystem (`./artifacts/`)
- **UI**: Bootstrap 5 responsive design

## 📁 Project Structure

```
level1/
├── app.py                    # Main application
├── config.yaml               # Configuration
├── requirements.txt          # Dependencies
├── templates/                # HTML templates
├── seed_data/level1/        # Sample datasets
├── docs/                     # Documentation
├── scripts/                  # Test scripts
└── artifacts/                # Generated outputs
```

## ✨ Key Features

- ✅ **12 Comprehensive Tasks** - From basic to advanced
- ✅ **Offline-First** - No internet required
- ✅ **No Authentication** - Start immediately
- ✅ **Professional Output** - High-quality charts (300 DPI)
- ✅ **Export & Share** - Complete project packaging
- ✅ **Teacher-Friendly** - Easy to use and configure

## 🎯 Learning Outcomes

Students will learn:
- CSV data structure
- Data type recognition
- Missing value handling
- Descriptive statistics
- Outlier identification
- Correlation analysis
- Data visualization
- Report generation

## 🚀 Ready to Use

**Access Now:** http://localhost:5001

**Status:** ✅ Production Ready

Happy Learning! 🎉
