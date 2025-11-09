#!/bin/bash

# Smoke test for 4-Level AI Lab
echo "Starting smoke test for 4-Level AI Lab..."

# Test 1: Check if app starts
echo "Test 1: Starting application..."
python app.py &
APP_PID=$!
sleep 3

# Test 2: Check if landing page loads
echo "Test 2: Testing landing page..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "✓ Landing page loads successfully"
else
    echo "✗ Landing page failed to load (HTTP $HTTP_CODE)"
    kill $APP_PID
    exit 1
fi

# Test 3: Check level pages
echo "Test 3: Testing level pages..."
for level in 1 2 3 4; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/level/$level)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "✓ Level $level page loads successfully"
    else
        echo "✗ Level $level page failed to load (HTTP $HTTP_CODE)"
    fi
done

# Test 4: Test project creation
echo "Test 4: Testing project creation..."
PROJECT_RESPONSE=$(curl -s -X POST -H "Content-Type: application/json" \
    -d '{"level":1,"title":"Test Project"}' \
    http://localhost:5000/projects/create)
if echo "$PROJECT_RESPONSE" | grep -q "project_id"; then
    echo "✓ Project creation works"
    PROJECT_ID=$(echo "$PROJECT_RESPONSE" | grep -o '"project_id":"[^"]*"' | cut -d'"' -f4)
    echo "  Created project: $PROJECT_ID"
else
    echo "✗ Project creation failed"
    echo "  Response: $PROJECT_RESPONSE"
fi

# Test 5: Test dataset upload (if project was created)
if [ ! -z "$PROJECT_ID" ]; then
    echo "Test 5: Testing dataset upload..."
    UPLOAD_RESPONSE=$(curl -s -X POST -F "file=@seed_data/level1/student_marks.csv" \
        http://localhost:5000/projects/$PROJECT_ID/upload)
    if echo "$UPLOAD_RESPONSE" | grep -q "success"; then
        echo "✓ Dataset upload works"
    else
        echo "✗ Dataset upload failed"
        echo "  Response: $UPLOAD_RESPONSE"
    fi
fi

# Test 6: Test run status endpoint
echo "Test 6: Testing run status endpoint..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/runs/test123/status)
if [ "$HTTP_CODE" -eq 404 ]; then
    echo "✓ Run status endpoint responds correctly (404 for non-existent run)"
else
    echo "✗ Run status endpoint failed (HTTP $HTTP_CODE)"
fi

# Cleanup
echo "Cleaning up..."
kill $APP_PID
wait $APP_PID 2>/dev/null

echo "Smoke test completed!"
