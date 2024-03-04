const url = 'https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-classroom/v1.1/14-Interactive-Web-Visualizations/02-Homework/samples.json'

// ------- DROPDOWN FUNCTION --------
function populateDropdown(options) {
    let dropdown = d3.select("#selDataset");

    options.forEach(option => {
        // console.log(option)
        dropdown
            .append("option")
            .text(option)
            .property("value", option);
    });
    createGraphs(options[0]);
    createPanel(options[0]);
}

// ------- ADD VALUES TO DROPDOWN --------
d3.json(url).then(function (data) {
    let options = data.names
    populateDropdown(options);
    // console.log(options)
});

function createPanel(sample) {
    d3.json(url).then(function (data) {
        // ------- DEMOGRAPHIC INFO --------
        let metadata = data.metadata
        let results = metadata.filter(x => x.id == sample)[0]
        // console.log(Object.keys(results), Object.values(results))
        // console.log(results.wfreq)
        
        let metadataDiv = d3.select("#sample-metadata")
        metadataDiv.html("");
        Object.entries(results).forEach(([key, value]) => {
            metadataDiv.append("p").text(`${key}: ${value}`)
            .style("font-size", "15px")
        // ------- GAUGE PLOT (an attempt...) --------
        // var data3 = [
        //     {
        //         domain: { x: [0, 1], y: [0, 1] },
        //         value: results.wfreq,
        //         // title: { text: "Speed" },
        //         type: "indicator",
        //         mode: "gauge",
        //         steps:[
        //             {range:[0,1], color: 'lightgray'},
        //             {range:[1,2], color: 'gray'}
        //         ]
        //     }
        // ];

        // var layout3 = { width: 600, height: 500, margin: { t: 0, b: 0 } };
        // Plotly.newPlot('gauge', data3, layout3);
        });
    });
}

function createGraphs(sample) {

    // ------- MAIN FUNCTION: CREATE PLOTS --------
    d3.json(url).then(function (data) {
        let samples = data.samples
        let results = samples.filter(x => x.id == sample)[0]
        let yedit = results.otu_ids.slice(0, 10).map(z => `OTU ${z}`).reverse()

        // ------- BAR PLOT --------
        let trace1 = {
            x: results.sample_values.slice(0, 10).reverse(),
            y: yedit,
            type: 'bar',
            orientation: 'h',
            text: results.otu_labels.slice(0,10).reverse()
        };
        var data1 = [trace1]

        let layout1 = {
            title: "Belly button data",
            // xaxis: {
            //     title:{
            //         text: 'asdf'
            //     }
            // },
            margin: {
                l: 150,
                r: 0,
                // b: 0,
                t: 50
            }
        }
        Plotly.newPlot("bar", data1, layout1);

        // ------- BUBBLE PLOT --------
        let trace2 = {
            x: results.otu_ids,
            y: results.sample_values,
            mode: 'markers',
            marker: {
                color: results.otu_ids,
                size: results.sample_values
            },
            text: results.otu_labels.slice(0,10).reverse()
        };

        var data2 = [trace2]
        let layout2 = {
            title: 'Bubble Plot',
            showlegend: false,
            height: 500,
            width: 1000,
            xaxis: {
                title:{
                    text: 'OTU ID'
                }
            }
        }
        Plotly.newPlot('bubble', data2, layout2);

        //     }
    });
}

function optionChanged(sector) {
    createGraphs(sector);
};
