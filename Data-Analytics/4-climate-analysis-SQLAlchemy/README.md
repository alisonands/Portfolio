v# Climate Data Analysis and API Design

# Climate Data Analysis and APIs

## Tools, Languages, and Libraries Used
- Python
- SQLAlchemy
- Pandas
- Matplotlib
- Flask
## Analyzing and Exploration

### Setup
- Connect to the SQLite database using SQLAlchemy.
- Reflect tables into classes using SQLAlchemy automap_base().
- Create a SQLAlchemy session to link Python to the database.

### Precipitation Analysis
- Find the most recent date in the dataset.
- Query the previous 12 months of precipitation data based on the most recent date.
  - Select only the "date" and "prcp" values.
  - Load query results into a Pandas DataFrame.
  - Sort DataFrame values by "date".
- Plot the results using DataFrame plot method.
- Print summary statistics for the precipitation data.

### Station Analysis
- Design a query to calculate the total number of stations in the dataset.
- Find the most-active station (station with the most rows).
  - List stations and observation counts in descending order.
  - Query lowest, highest, and average temperatures for the most-active station.
- Query the previous 12 months of temperature observation (TOBS) data for the most-active station.
- Plot the results as a histogram with bins=12.

### Close Session
- Close SQLAlchemy session at the end of the notebook.

## Desigining the Flask App

### Routes
- **/**: Homepage, listing all available routes.
- **/api/v1.0/precipitation**: Convert precipitation analysis results to a dictionary and return JSON representation.
- **/api/v1.0/stations**: Return a JSON list of stations from the dataset.
- **/api/v1.0/tobs**: Query temperature observations of the most-active station for the previous year and return JSON list.
- **/api/v1.0/<start>** and **/api/v1.0/<start>/<end>**: Calculate TMIN, TAVG, and TMAX for specified start or start-end range and return JSON list.
