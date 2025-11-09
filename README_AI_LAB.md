# 4-Level Offline Student-Driven AI Lab

A comprehensive, offline AI learning platform designed for students to explore data science, machine learning, computer vision, and natural language processing through hands-on projects.

## 🎯 Overview

This platform provides four progressive levels of AI learning:

- **Level 1**: Data Handling & Visualization
- **Level 2**: Machine Learning (Regression & Classification)
- **Level 3**: Image Classification
- **Level 4**: NLP & Chatbot Development

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip package manager

### Installation

1. **Clone or download the repository**
   ```bash
   # If you have git
   git clone <repository-url>
   cd ai-lab
   
   # Or download and extract the ZIP file
   ```

2. **Create virtual environment**
   ```bash
   python -m venv venv
   
   # On Windows
   venv\Scripts\activate
   
   # On macOS/Linux
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the application**
   ```bash
   python app.py
   ```

5. **Access the platform**
   - Open your browser and go to: **http://localhost:5001**
   - No login required - start with any level!

## 📚 Level Descriptions

### Level 1: Data Handling & Visualization
**Goal**: Learn data literacy through hands-on CSV analysis

**Features**:
- Upload and preview CSV datasets
- Data cleaning tools (handle missing values, type conversion)
- Create various visualizations (bar charts, histograms, scatter plots, etc.)
- Generate reports with findings

**Sample Data**: Student marks, weather data, survey responses

**Learning Outcomes**:
- Understand data types and structures
- Learn data cleaning techniques
- Master visualization best practices
- Create professional reports

### Level 2: Machine Learning
**Goal**: Build and train machine learning models

**Features**:
- Regression and classification models
- Model evaluation and metrics
- Feature selection and preprocessing
- Download trained models and inference scripts

**Sample Data**: Student performance, housing prices

**Learning Outcomes**:
- Understand supervised learning
- Learn model evaluation techniques
- Practice feature engineering
- Deploy models for predictions

### Level 3: Image Classification
**Goal**: Train image classifiers using computer vision

**Features**:
- Upload image datasets organized by class
- Transfer learning with pre-trained models
- Classical computer vision features (fallback)
- Live image testing interface

**Sample Data**: Fruits dataset (apples, bananas, oranges)

**Learning Outcomes**:
- Understand image preprocessing
- Learn transfer learning concepts
- Practice computer vision techniques
- Build image classification systems

### Level 4: NLP & Chatbot
**Goal**: Process text data and build chatbots

**Features**:
- Text preprocessing and vectorization
- Chatbot development with FAQ matching
- Text classification models
- Similarity search and ranking

**Sample Data**: Movie reviews, FAQ pairs

**Learning Outcomes**:
- Understand text preprocessing
- Learn TF-IDF and embeddings
- Build retrieval-based chatbots
- Practice text classification

## 🛠️ Technical Features

### Offline-First Design
- No internet connection required
- All processing happens locally
- No data sent to external servers

### Background Processing
- Long-running tasks use background threads
- Real-time progress tracking
- Automatic result generation

### Artifact Management
- All outputs saved to `./artifacts/` directory
- Organized by project and run
- Downloadable models, charts, and reports

### Fallback Support
- Works with minimal dependencies
- Graceful degradation when heavy libraries unavailable
- Clear UI indicators for available features

## 📁 Project Structure

```
ai-lab/
├── app.py                 # Main Flask application
├── requirements.txt       # Python dependencies
├── seed_data/            # Sample datasets
│   ├── level1/           # Data visualization samples
│   ├── level2/           # ML samples
│   ├── level3/           # Image samples
│   └── level4/           # NLP samples
├── templates/            # HTML templates
│   ├── landing.html      # Level selection page
│   ├── level_home.html   # Level instructions
│   ├── project_dashboard.html
│   └── report.html
├── static/               # CSS, JS, images
├── artifacts/            # Generated outputs
│   └── projects/         # Project-specific files
└── scripts/              # Test and utility scripts
```

## 🎓 Educational Use

### For Students
1. **Choose Your Level**: Start with Level 1 or jump to your interest area
2. **Create Projects**: Organize your work in named projects
3. **Upload Data**: Use sample data or upload your own datasets
4. **Run Analysis**: Execute hands-on AI tasks
5. **Explore Results**: View charts, download models, generate reports

### For Teachers
1. **No Setup Required**: Students can start immediately
2. **Progressive Learning**: Four levels build upon each other
3. **Real Results**: Students create actual AI models and visualizations
4. **Offline Safe**: No concerns about internet access or data privacy

## 🔧 Configuration

### Environment Variables
- `FLASK_ENV`: Set to `development` for debug mode
- `MAX_WORKERS`: Number of background threads (default: 2)

### File Limits
- Maximum file size: 50MB
- Supported formats: CSV, ZIP, PNG, JPG, JPEG, GIF, BMP

## 🧪 Testing

Run the smoke test to verify everything works:

```bash
./scripts/smoke_test.sh
```

This will test:
- Application startup
- All level pages
- Project creation
- Dataset upload
- Background processing

## 🐛 Troubleshooting

### Common Issues

1. **Port 5000 in use**
   - Change port in `app.py`: `app.run(port=5001)`
   - Or kill existing process: `lsof -ti:5000 | xargs kill`

2. **Missing dependencies**
   - Ensure virtual environment is activated
   - Run `pip install -r requirements.txt`

3. **Permission errors**
   - Check write permissions for `./artifacts/` directory
   - Run with appropriate user permissions

4. **Memory issues with large datasets**
   - Reduce dataset size
   - Increase system memory
   - Use smaller model parameters

### Getting Help

1. Check the help sections in each level
2. Review the sample data formats
3. Ensure your data matches expected formats
4. Try with sample data first

## 🚀 Advanced Features

### Custom Models
- Download trained models as `.pkl` files
- Use generated inference scripts
- Integrate with other Python projects

### Report Generation
- Automatic PDF report creation
- Include all generated artifacts
- Professional formatting for presentations

### Extensibility
- Add new levels by extending the framework
- Custom analysis modules
- Integration with external tools

## 📄 License

This project is designed for educational use. Feel free to modify and distribute for learning purposes.

## 🤝 Contributing

Contributions welcome! Areas for improvement:
- Additional sample datasets
- New visualization types
- Enhanced model options
- Better error handling
- UI/UX improvements

## 📞 Support

For issues or questions:
1. Check the troubleshooting section
2. Review the help content in each level
3. Test with sample data first
4. Check system requirements

---

**Happy Learning! 🎉**

Start your AI journey by visiting **http://localhost:5001** and choosing your first level!
