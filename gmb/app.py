from flask import Flask, request, render_template, send_file, redirect, url_for
import pandas as pd
from search import get_search_results, save_to_excel

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        if 'query' in request.form:
            query = request.form['query']
            limit = int(request.form.get('limit', 10))
            results = get_search_results(query, limit)
            if results:
                save_to_excel(results, 'search_results.xlsx')
                return render_template('index.html', results=results)
        elif 'clear' in request.form:
            return redirect(url_for('index'))
    return render_template('index.html')

@app.route('/download')
def download_file():
    return send_file('search_results.xlsx', as_attachment=True)

if __name__ == '__main__':
    app.run(port=5001, debug=True)
