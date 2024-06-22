'use strict';

$(document).ready(function(){
    // Make some sample data
    var pieData = [
        {data: 6, color: 'rgba(255,255,255,0.20)', label: 'Informatique'},
        {data: 5, color: 'rgba(255,255,255,0.36)', label: 'Mathematique'},
        {data: 6, color: 'rgba(255,255,255,0.52)', label: 'Physique'},
        {data: 4, color: 'rgba(255,255,255,0.68)', label: 'Chimie'},
        {data: 6, color: 'rgba(255,255,255,0.84)', label: 'Biologie'},
        {data: 5, color: '#fff', label: 'Litterature francaise'}
    ];
    
    // Pie Chart
    if($('.flot-pie')[0]){
        $.plot('.flot-pie', pieData, {
            series: {
                pie: {
                    show: true,
                    stroke: {
                        width: 0
                    }
                }
            },
            legend: {
                container: '.flot-chart-legend--pie',
                noColumns: 0,
                lineWidth: 0,
                labelBoxBorderColor: 'rgba(255,255,255,0)'
            }
        });
    }
    
    // Donut Chart
    if($('.flot-donut')[0]){
        $.plot('.flot-donut', pieData, {
            series: {
                pie: {
                    innerRadius: 0.5,
                    show: true,
                    stroke: { 
                        width: 0
                    }
                }
            },
            legend: {
                container: '.flot-chart-legend--donut',
                noColumns: 0,
                lineWidth: 0,
                labelBoxBorderColor: 'rgba(255,255,255,0)'
            }
        });
    }
});