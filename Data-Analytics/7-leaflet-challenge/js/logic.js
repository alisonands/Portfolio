url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson'

// Creating a map
let myMap = L.map("map", {
    center: [37.09, -95.71],
    zoom: 5
})


// coordinates
coords = []
d3.json(url).then(function(data){
    console.log(data)
    // console.log(data.features[0].geometry.coordinates)
    // data.features.forEach((element) => console.log([element.geometry.coordinates[0], element.geometry.coordinates[1]]))

    // color scale function (value = data.features[0].coordinates[2])
    function getColor(value) {
        // for (let i = 0; i < value; i++){
        //     let color = "";
            if (value > 90){
                color = "#FF0000";
                return color;
            }
            else if(value > 70){
                color = "#FF4500";
                return color;
            }
            else if (value > 50){
                color = "#FFA500";
                return color;
            }
            else if(value > 30){
                color = "#FFFF00";
                return color;
            }
            else if(value > 10){
                color = "#ADFF2F";
                return color;
            }
            else {
                color = "#008000";
                return color;
            }
        // }
    }

    for (let i = 0; i < data.features.length; i++){
    //Plot on map
        let circle_color = getColor(data.features[i].geometry.coordinates[2])
        L.circle([data.features[i].geometry.coordinates[1], data.features[i].geometry.coordinates[0]], {
            fillColor: circle_color,
            color: "black",
            fillOpacity: 0.50,
            weight: 1, 
            radius: data.features[i].properties.mag * 15000
        }).addTo(myMap)
    }

})

// legend
let legend = L.control({ position: "bottomright" });

legend.onAdd = function() {
    let div = L.DomUtil.create("div", "info legend");
    let colors = ["#FF0000", "#FF4500", "#FFA500", "#FFFF00", "#ADFF2F", "#008000"];
    let depth = [">90", "70-90", "50-70", "30-50", "10-30", "<10"];
    let legendInfo = "<h2>Earthquake depth</h2>";
    div.innerHTML = legendInfo;

    for (var i = 0; i < colors.length; i++) {
        // div.innerHTML += '<div><span class="color-box" style="background-color: ' + colors[i] + ';"></span> depth ' + depth[i] + '</div>';
        div.innerHTML += '<i style="background-color:' + colors[i] + '"></i> ' + depth[i] +'<br>';

    }
    console.log("Legend added to map:", map);

    return div;
};

legend.addTo(myMap);


// tile layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(myMap);

// Create circle point(s)

// L.circle([32.7767, -96.7979], {
//     // color: circle_color,
//     fill: circle_color,
//     fillOpacity: 0.25,
//     radius: circle_radius
// }).addTo(myMap);