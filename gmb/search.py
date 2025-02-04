import csv
import serpapi
import pandas as pd

def get_search_results(query, limit=10):
    params = {
        "engine": "google_maps",
        "q": query,
        "type": "search",
        "api_key": "44e438e9ce3c4344501382254d2b02047024d53f3b3cd5053cd550722dfb1871"
    }

    results = serpapi.search(params)
    local_results = results.get("local_results", [])[:limit]
    filtered_results = []

    for result in local_results:
        filtered_results.append({
            "Name": result.get("title"),
            "Address": result.get("address"),
            "Rating": result.get("rating"),
            "Phone": result.get("phone")
        })

    return filtered_results

def save_to_excel(data, filename):
    df = pd.DataFrame(data)
    df.to_excel(filename, index=False)
