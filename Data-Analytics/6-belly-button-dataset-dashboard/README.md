# Belly Button Biodiversity Dashboard

## Tools, Languages, and Libraries Used
- HTML
- CSS
- JavaScript
- D3.js

## Summary
The assignment involves building an interactive dashboard to explore the Belly Button Biodiversity dataset, which catalogs the microbes that colonize human navels. Here are the steps completed:

### Step 1: Data Visualization
1. Used the D3 library to read in samples.json from the2 URL.
2. Created a horizontal bar chart with a dropdown menu to display the top 10 OTUs found in each individual.
   - Used sample_values as the values for the bar chart.
   - Used otu_ids as the labels for the bar chart.
   - Used otu_labels as the hovertext for the chart.
3. Created a bubble chart that displays each sample.
   - Used otu_ids for the x values.
   - Used sample_values for the y values.
   - Used sample_values for the marker size.
   - Used otu_ids for the marker colors.
   - Used otu_labels for the text values.
4. Displayed the sample metadata, i.e., an individual's demographic information, by displaying each key-value pair from the metadata JSON object somewhere on the page.
5. Updated all the plots when a new sample is selected.

### Step 2: Deployment
1. Deployed the app to GitHub Pages.
2. Submitted the links to the deployment and the GitHub repo.

The dashboard provides an interactive interface for exploring the Belly Button Biodiversity dataset, allowing users to visualize and analyze the microbial data in an engaging manner.
