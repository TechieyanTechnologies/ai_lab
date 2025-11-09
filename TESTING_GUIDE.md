# School AI Lab - Testing Guide

## 🧪 Testing the New Student Management & Graph Plotting Features

This guide will help you test the newly implemented functionality for admin student management and student graph plotting tasks.

## 🚀 Quick Start

1. **Start the application:**
   ```bash
   cd /Users/hari/search
   source venv/bin/activate
   python app.py
   ```

2. **Access the platform:**
   - URL: http://localhost:8082
   - Admin: admin / admin123
   - Teacher: teacher1 / teacher123

## 📋 Test Scenarios

### 1. Admin Functionality Testing

#### Test 1.1: Create Individual Student
1. Login as admin (admin/admin123)
2. Go to Admin Panel
3. Click "Add Student"
4. Fill in the form:
   - Username: `teststudent1`
   - Full Name: `Test Student One`
   - Password: `testpass123`
   - Class: Select "Class 8A" or "Class 8B"
5. Click "Create Student"
6. **Expected Result:** Success message and student account created

#### Test 1.2: Bulk Import Students
1. Stay in Admin Panel
2. Click "Import Students"
3. Download the sample CSV: `sample_students.csv`
4. Upload the CSV file
5. Click "Import Students"
6. **Expected Result:** Success message showing number of students imported

#### Test 1.3: Create Teacher Account
1. In Admin Panel, click "Add Teacher"
2. Fill in the form:
   - Username: `teacher2`
   - Full Name: `Mr. John Smith`
   - Password: `teacherpass123`
3. Click "Create Teacher"
4. **Expected Result:** Success message and teacher account created

#### Test 1.4: Create Class (as Teacher)
1. Login as teacher1 (teacher1/teacher123)
2. Go to Classes
3. Click "Create Class"
4. Enter class name: `Class 8C`
5. Click "Create Class"
6. **Expected Result:** Success message and class created

### 2. Student Login & Task Testing

#### Test 2.1: Student Login
1. Use one of the created student accounts:
   - Username: `student001`
   - Password: `password123`
2. Login to the platform
3. **Expected Result:** Student dashboard with "My Tasks" option

#### Test 2.2: Access Student Tasks
1. As a student, click "My Tasks" in the navigation
2. **Expected Result:** Task page showing "Plot Graphs" as available

#### Test 2.3: Plot Graphs Task
1. Click "Start Task" on the Plot Graphs card
2. **Expected Result:** Graph plotting interface opens

#### Test 2.4: Create Bar Chart
1. Select dataset: "School Marks"
2. Choose chart type: "Bar Chart"
3. Select X-axis: "Subject"
4. Select Y-axis: "Mark"
5. Enter title: "Student Marks by Subject"
6. Click "Create Chart"
7. **Expected Result:** Bar chart generated and displayed

#### Test 2.5: Create Scatter Plot
1. Select dataset: "Student Survey"
2. Choose chart type: "Scatter Plot"
3. Select X-axis: "Study_Hours"
4. Select Y-axis: "Age"
5. Enter title: "Study Hours vs Age"
6. Click "Create Chart"
7. **Expected Result:** Scatter plot generated and displayed

#### Test 2.6: Create Line Graph
1. Select dataset: "Weather Data"
2. Choose chart type: "Line Graph"
3. Select X-axis: "Date"
4. Select Y-axis: "Temperature"
5. Enter title: "Temperature Over Time"
6. Click "Create Chart"
7. **Expected Result:** Line graph generated and displayed

## 📊 Available Test Datasets

### 1. School Marks Dataset
- **File:** `seed_data/school_marks.csv`
- **Columns:** Student_Name, Class, Subject, Mark, Grade, Date
- **Best for:** Bar charts, categorical analysis

### 2. Weather Data Dataset
- **File:** `seed_data/weather_data.csv`
- **Columns:** Date, Temperature, Humidity, Wind_Speed, Weather_Condition
- **Best for:** Line graphs, time series analysis

### 3. Student Survey Dataset
- **File:** `seed_data/student_survey.csv`
- **Columns:** Student_ID, Age, Gender, Favorite_Subject, Study_Hours, Extracurricular, Grade_Expectation
- **Best for:** Scatter plots, correlation analysis

## 🔧 Troubleshooting

### Common Issues

1. **Chart not displaying:**
   - Check browser console for errors
   - Ensure dataset is selected
   - Verify column selections are valid

2. **Student login fails:**
   - Verify student account was created successfully
   - Check username/password spelling
   - Ensure student role is assigned

3. **Bulk import fails:**
   - Check CSV format matches requirements
   - Ensure all required columns are present
   - Verify class IDs exist

4. **Permission denied:**
   - Ensure you're logged in with correct role
   - Check if user has necessary permissions

### Debug Steps

1. **Check application logs** in terminal
2. **Verify database** - check if users/classes were created
3. **Test API endpoints** directly:
   - `/api/load_dataset?dataset=school_marks`
   - `/api/create_chart` (POST)

## ✅ Expected Results Summary

After completing all tests, you should have:

1. **Admin Panel:**
   - ✅ Individual student creation working
   - ✅ Bulk student import working
   - ✅ Teacher creation working
   - ✅ Class management working

2. **Student Interface:**
   - ✅ Student login working
   - ✅ Task access working
   - ✅ Graph plotting interface working
   - ✅ Multiple chart types generating successfully

3. **Data Visualization:**
   - ✅ Bar charts from categorical data
   - ✅ Scatter plots from numeric data
   - ✅ Line graphs from time series data
   - ✅ Chart download functionality

## 🎯 Success Criteria

- All admin functions work without errors
- Students can login and access tasks
- Graph plotting generates visualizations correctly
- Charts are saved and downloadable
- No JavaScript errors in browser console
- All API endpoints respond correctly

## 📝 Test Data

### Sample Student CSV Format:
```csv
username,fullname,password,class_id
student001,Alice Johnson,password123,1
student002,Bob Smith,password456,1
student003,Charlie Brown,password789,2
```

### Sample Teacher Account:
- Username: `teacher1`
- Password: `teacher123`
- Classes: Class 8A, Class 8B

---

**Note:** This testing guide covers the core functionality. Additional edge cases and error handling can be tested by modifying the test data or trying invalid inputs.
