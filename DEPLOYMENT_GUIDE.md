# School AI Lab - Deployment Guide

## 🚀 Quick Start

The School AI Lab Class-8 Data Handling & Visualization Module is now **ready for deployment**!

### Prerequisites
- Python 3.8 or higher
- pip (Python package installer)
- 4GB RAM minimum
- 1GB free disk space

### Installation Steps

1. **Navigate to the project directory**
   ```bash
   cd /Users/hari/search
   ```

2. **Create and activate virtual environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Start the application**
   ```bash
   python app.py
   ```

5. **Access the platform**
   - Open your browser and go to: **http://localhost:8082**
   - Default admin credentials: `admin` / `admin123`
   - **Important**: Change the default password after first login!

## 🎯 What's Included

### Core Platform Features
- ✅ **Multi-User System**: Admin, Teacher, Student roles
- ✅ **Project Management**: Create and manage data analysis projects
- ✅ **Data Upload**: CSV file upload with validation
- ✅ **Data Explorer**: Interactive data preview and cleaning tools
- ✅ **Visualization Builder**: Create charts and graphs
- ✅ **Guided Labs**: 6 step-by-step learning exercises
- ✅ **Report Generation**: PDF reports and certificates
- ✅ **Admin Panel**: School branding and system configuration

### Sample Data
- `school_marks.csv` - Student performance data
- `weather_data.csv` - Weather time-series data
- `student_survey.csv` - Survey response data

### Documentation
- Complete README with setup instructions
- 8-week detailed lesson plan for teachers
- User guides and help sections

## 🎨 Customization

### School Branding
1. Login as admin (admin/admin123)
2. Go to Admin Panel
3. Update:
   - School name
   - Primary and accent colors
   - Upload school logo
4. Changes apply immediately

### System Settings
- Upload file size limits
- Maximum rows per dataset
- Enable/disable modules

## 📚 Teacher Workflow

1. **Setup** (Admin)
   - Configure school branding
   - Create teacher accounts
   - Import student lists

2. **Teaching** (Teacher)
   - Create classes
   - Assign projects to students
   - Monitor student progress
   - Grade completed work

3. **Learning** (Student)
   - Create projects
   - Upload and explore data
   - Complete guided labs
   - Generate reports

## 🔧 Troubleshooting

### Port Issues
If you get "Address already in use" errors:
- Change the port in `app.py` (line 686): `port=8080` → `port=8081`
- Or kill existing processes: `pkill -f "python app.py"`

### Permission Errors
- Ensure you have write permissions in the project directory
- On Windows, run as administrator if needed

### Database Issues
- Delete `schoolai.db` to reset the database
- The application will recreate it on next run

## 📊 System Requirements

### Minimum
- Python 3.8+
- 4GB RAM
- 1GB disk space
- Modern web browser

### Recommended
- Python 3.10+
- 8GB RAM
- 5GB disk space
- Chrome/Firefox/Safari/Edge

## 🔒 Security Features

- Local authentication (no external accounts)
- Password hashing with bcrypt
- Role-based access control
- Secure file uploads
- Offline operation (no internet required)

## 📈 Performance

- Handles datasets up to 50,000 rows
- File uploads up to 10MB
- Fast local SQLite database
- Responsive web interface

## 🎓 Educational Value

### Learning Objectives
Students will learn to:
- Understand data types and structures
- Clean and prepare data for analysis
- Create appropriate visualizations
- Interpret charts and draw conclusions
- Generate professional reports

### 8-Week Curriculum
- Week 1: Introduction to data
- Week 2: Data types and preview
- Week 3: Data cleaning
- Week 4: Basic visualizations
- Week 5: Relationships and correlation
- Week 6: Time series analysis
- Week 7: Mini-project
- Week 8: Presentation and assessment

## 🚀 Next Steps

1. **Test the platform** with sample data
2. **Customize branding** for your school
3. **Create teacher accounts** and import students
4. **Follow the lesson plan** to teach data literacy
5. **Monitor student progress** and provide feedback

## 📞 Support

For technical issues:
- Check the README.md for detailed instructions
- Review the lesson plan in docs/teacher_lesson_plan_class8.md
- Run the acceptance tests: `./scripts/run_acceptance_tests.sh`

---

**Status**: ✅ Ready for Production  
**Version**: 1.0.0  
**Last Updated**: 2024  
**Platform**: Offline, Cross-platform
