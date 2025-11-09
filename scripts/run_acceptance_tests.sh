#!/bin/bash

# Acceptance Tests for Level 1 - Data Handling & Visualization

echo "========================================"
echo "Level 1 Acceptance Tests"
echo "========================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

PASSED=0
FAILED=0

# Test function
test_check() {
    local test_name=$1
    local command=$2
    
    echo -n "Testing: $test_name ... "
    
    if eval "$command" > /dev/null 2>&1; then
        echo -e "${GREEN}PASS${NC}"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        ((FAILED++))
        return 1
    fi
}

echo "========================================"
echo "Test 1: Application Structure"
echo "========================================"

# Check required files
test_check "app.py exists" "test -f app.py"
test_check "config.yaml exists" "test -f config.yaml"
test_check "requirements.txt exists" "test -f requirements.txt"
test_check "templates directory exists" "test -d templates"
test_check "seed_data directory exists" "test -d seed_data"
test_check "seed_data/level1 directory exists" "test -d seed_data/level1"

echo ""
echo "========================================"
echo "Test 2: Seed Data"
echo "========================================"

# Check seed files
test_check "student_marks.csv exists" "test -f seed_data/level1/student_marks.csv"
test_check "weather_week.csv exists" "test -f seed_data/level1/weather_week.csv"
test_check "sales_small.csv exists" "test -f seed_data/level1/sales_small.csv"
test_check "survey_small.csv exists" "test -f seed_data/level1/survey_small.csv"

# Check CSV format
test_check "student_marks.csv is valid CSV" "head -1 seed_data/level1/student_marks.csv | grep -q ','"

echo ""
echo "========================================"
echo "Test 3: Python Dependencies"
echo "========================================"

# Check Python version
test_check "Python 3.10+ installed" "python3 --version | grep -E 'Python (3\.(1[0-9]|[2-9])|[4-9])'"

# Check imports
test_check "Flask import works" "python3 -c 'import flask'"
test_check "Pandas import works" "python3 -c 'import pandas'"
test_check "NumPy import works" "python3 -c 'import numpy'"
test_check "Matplotlib import works" "python3 -c 'import matplotlib'"

echo ""
echo "========================================"
echo "Test 4: Application Startup"
echo "========================================"

# Try to start app in background
echo "Starting application..."
python3 app.py > /tmp/app_test.log 2>&1 &
APP_PID=$!
sleep 3

# Check if app is running
test_check "Application started" "kill -0 $APP_PID"

# Check if port is listening
test_check "Port 5001 is listening" "lsof -ti:5001"

# Test HTTP endpoints
test_check "Landing page accessible" "curl -s -o /dev/null -w '%{http_code}' http://localhost:5001 | grep -q '200'"
test_check "Level 1 page accessible" "curl -s -o /dev/null -w '%{http_code}' http://localhost:5001/level/1 | grep -q '200'"

echo ""
echo "========================================"
echo "Test 5: API Endpoints"
echo "========================================"

# Test project creation
PROJECT_RESPONSE=$(curl -s -X POST -H "Content-Type: application/json" \
    -d '{"title":"Test Project"}' \
    http://localhost:5001/projects/create)

test_check "Project creation works" "echo $PROJECT_RESPONSE | grep -q 'project_id'"

# Extract project ID
PROJECT_ID=$(echo $PROJECT_RESPONSE | grep -o '"project_id":"[^"]*"' | cut -d'"' -f4)

if [ ! -z "$PROJECT_ID" ]; then
    echo "Created test project: $PROJECT_ID"
    
    # Test file upload
    echo "Testing file upload..."
    UPLOAD_RESPONSE=$(curl -s -X POST \
        -F "file=@seed_data/level1/student_marks.csv" \
        http://localhost:5001/projects/$PROJECT_ID/upload)
    
    test_check "File upload works" "echo $UPLOAD_RESPONSE | grep -q 'success'"
    
    # Test preview
    PREVIEW_RESPONSE=$(curl -s http://localhost:5001/projects/$PROJECT_ID/dataset/preview)
    test_check "Preview endpoint works" "echo $PREVIEW_RESPONSE | grep -q 'columns'"
fi

# Cleanup
echo "Stopping application..."
kill $APP_PID
wait $APP_PID 2>/dev/null

echo ""
echo "========================================"
echo "Test Results Summary"
echo "========================================"
echo ""
echo -e "Passed: ${GREEN}$PASSED${NC}"
echo -e "Failed: ${RED}$FAILED${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}All tests PASSED! ✓${NC}"
    exit 0
else
    echo -e "${RED}Some tests FAILED! ✗${NC}"
    exit 1
fi