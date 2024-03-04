# Mars News Articles Scraping and Analysis

## Tools, Languages, and Libraries Used
- Python
- Jupyter Notebook
- Beautiful Soup
- Splinter
- Pandas
- Matplotlib
- JSON

## Summary
The project involves scraping Mars news articles and analyzing Mars weather data using web scraping techniques and data analysis in Python. It consists of two parts:

## Part 1: Scrape Titles and Preview Text from Mars News
1. Used automated browsing with Splinter to visit the Mars news site and inspected the page to identify elements to scrape.
2. Created a Beautiful Soup object and extracted text elements from the website.
3. Extracted titles and preview text of the news articles.
4. Stored the scraping results in Python data structures, including dictionaries and lists.
5. Printed the list of scraped data in the notebook.
6. Exported the scraped data to a JSON file.

## Part 2: Scrape and Analyze Mars Weather Data
1. Used automated browsing with Splinter to visit the Mars Temperature Data Site and inspected the page to identify elements to scrape.
2. Created a Beautiful Soup object and scraped data from the HTML table.
3. Assembled scraped data into a Pandas DataFrame.
4. Analyzed the dataset by answering questions such as the number of months on Mars, Martian days worth of data in the dataset, coldest and warmest months on Mars, etc.
5. Plotted the results using Matplotlib to visualize the data.
6. Exported the DataFrame to a CSV file for further analysis.

The project demonstrates the use of web scraping techniques, data manipulation, and visualization to gather and analyze information about Mars news articles and weather data.
