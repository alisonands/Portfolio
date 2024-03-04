# USGS Earthquake Visualization

## Summary
The United States Geological Survey (USGS) is interested in building a new set of tools to visualize their earthquake data. The goal is to provide meaningful visualizations that can educate the public and government organizations about issues facing our planet. This challenge involves creating an earthquake visualization using Leaflet.

## Tools and Languages Used
- HTML
- JavaScript
- Leaflet.js
- JSON

## Part 1: Create the Earthquake Visualization
### Step 1: Get Dataset
1. Visit the USGS GeoJSON Feed page and choose a dataset to visualize.
2. Select a dataset, such as "All Earthquakes from the Past 7 Days."
3. Obtain the JSON representation of the data from the provided URL.

### Step 2: Import and Visualize Data
1. Use Leaflet to create a map that plots all the earthquakes from the dataset based on their longitude and latitude.
2. Reflect the magnitude of the earthquake by the size of the data markers.
3. Reflect the depth of the earthquake by the color of the data markers. Earthquakes with higher magnitudes should appear larger, and earthquakes with greater depth should appear darker in color.
4. Include popups that provide additional information about the earthquake when its associated marker is clicked.

### Step 3: Create Legend
1. Create a legend to provide context for the map data.

The resulting visualization will allow users to explore earthquake data interactively, providing insights into the location, magnitude, and depth of recent earthquakes.
