#!/usr/bin/env python3
"""Generate remaining task templates"""

tasks = {
    4: {
        'title': 'Type Conversion',
        'icon': 'exchange-alt',
        'name': 'Type Conversion',
        'objective': 'Learn to convert between data types (string to numeric, dates, etc.)'
    },
    5: {
        'title': 'Derived Columns',
        'icon': 'plus-circle',
        'name': 'Create Derived Columns',
        'objective': 'Add calculated columns to your dataset'
    },
    6: {
        'title': 'Binning',
        'icon': 'layer-group',
        'name': 'Binning & Bucketing',
        'objective': 'Convert numeric to categorical using bins'
    },
    7: {
        'title': 'Outlier Detection',
        'icon': 'exclamation-triangle',
        'name': 'Detect Outliers',
        'objective': 'Identify unusual data points in your dataset'
    },
    8: {
        'title': 'Correlation',
        'icon': 'project-diagram',
        'name': 'Correlation Analysis',
        'objective': 'Explore relationships between variables'
    },
    9: {
        'title': 'Visualizations',
        'icon': 'chart-bar',
        'name': 'Create Visualizations',
        'objective': 'Build professional charts and graphs'
    },
    10: {
        'title': 'Report Building',
        'icon': 'file-pdf',
        'name': 'Build Reports',
        'objective': 'Compile multi-chart reports'
    },
    11: {
        'title': 'Mini Assignments',
        'icon': 'tasks',
        'name': 'Practice Assignments',
        'objective': 'Test your skills with exercises'
    },
    12: {
        'title': 'Export',
        'icon': 'download',
        'name': 'Export & Share',
        'objective': 'Package and share your project'
    }
}

template = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task {num}: {title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .task-header {{ background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 2rem 0; }}
        .learning-objective {{ background: #f8f9fa; padding: 1rem; border-left: 4px solid #667eea; }}
    </style>
</head>
<body>
    <div class="task-header">
        <div class="container">
            <h1><i class="fas fa-{icon} me-3"></i>Task {num}: {name}</h1>
            <p class="lead mb-0">{objective}</p>
        </div>
    </div>

    <div class="container py-4">
        <div class="learning-objective mb-4">
            <h4><i class="fas fa-bullseye me-2"></i>Learning Objective</h4>
            <p class="mb-0">{objective}</p>
        </div>

        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h4>Your Task</h4>
            </div>
            <div class="card-body">
                <p>This task is under development. Complete earlier tasks first.</p>
                <div id="taskContent">
                    <!-- Task-specific content will be added here -->
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body text-center">
                <a href="/level/1" class="btn btn-outline-secondary me-2">
                    <i class="fas fa-arrow-left me-2"></i>Back to Tasks
                </a>
                <a href="/level/1/task/{next}" class="btn btn-primary">
                    Next Task <i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Task-specific JavaScript will be added here
    </script>
</body>
</html>
"""

for num, info in tasks.items():
    next_num = num + 1 if num < 12 else 12
    content = template.format(
        num=num,
        title=info['title'],
        name=info['name'],
        icon=info['icon'],
        objective=info['objective'],
        next=next_num
    )
    
    filename = f"templates/task{num}_{info['title'].lower().replace(' ', '_')}.html"
    with open(filename, 'w') as f:
        f.write(content)
    print(f"Created {filename}")

print("\nAll task templates created!")
