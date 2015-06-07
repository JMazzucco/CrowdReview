$(function() {
AmCharts.lazyLoadMakeChart = AmCharts.makeChart;

// override makeChart function
AmCharts.makeChart = function(a, b, c) {

  // set scroll events
  jQuery(document).on('scroll load touchmove', handleScroll);
  jQuery(window).on('load', handleScroll);

  function handleScroll() {
    var $ = jQuery;
    if (true === b.lazyLoaded)
      return;
    var hT = $('#' + a).offset().top,
      hH = $('#' + a).outerHeight() / 2,
      wH = $(window).height(),
      wS = $(window).scrollTop();
    if (wS > (hT + hH - wH)) {
      b.lazyLoaded = true;
      AmCharts.lazyLoadMakeChart(a, b, c);
      return;
    }
  }

  // Return fake listener to avoid errors
  return {
    addListener: function() {}
  };
};

/**
 * First chart
 */
var chart = AmCharts.makeChart("chartdiv1", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [{
    "country": "USA",
    "visits": 3025,
    "color": "#FF0F00"
  }, {
    "country": "China",
    "visits": 1882,
    "color": "#FF6600"
  }, {
    "country": "Japan",
    "visits": 1809,
    "color": "#FF9E01"
  }, {
    "country": "Germany",
    "visits": 1322,
    "color": "#FCD202"
  }, {
    "country": "UK",
    "visits": 1122,
    "color": "#F8FF01"
  }, {
    "country": "France",
    "visits": 1114,
    "color": "#B0DE09"
  }, {
    "country": "India",
    "visits": 984,
    "color": "#04D215"
  }, {
    "country": "Spain",
    "visits": 711,
    "color": "#0D8ECF"
  }, {
    "country": "Netherlands",
    "visits": 665,
    "color": "#0D52D1"
  }, {
    "country": "Russia",
    "visits": 580,
    "color": "#2A0CD0"
  }, {
    "country": "South Korea",
    "visits": 443,
    "color": "#8A0CCF"
  }, {
    "country": "Canada",
    "visits": 441,
    "color": "#CD0D74"
  }],
  "startDuration": 1,
  "graphs": [{
    "fillColorsField": "color",
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  }],
  "categoryField": "country",
  "categoryAxis": {
    "labelsEnabled": false
  },
  "titles": [{
    "text": "First chart"
  }, {
    "text": "Scroll down for the next chart",
    "bold": false
  }]
});

/**
 * Second chart
 */
var chart = AmCharts.makeChart("chartdiv2", {
  "theme": "light",
  "type": "serial",
  "dataProvider": [{
    "country": "USA",
    "year2004": 3.5,
    "year2005": 4.2
  }, {
    "country": "UK",
    "year2004": 1.7,
    "year2005": 3.1
  }, {
    "country": "Canada",
    "year2004": 2.8,
    "year2005": 2.9
  }, {
    "country": "Japan",
    "year2004": 2.6,
    "year2005": 2.3
  }, {
    "country": "France",
    "year2004": 1.4,
    "year2005": 2.1
  }, {
    "country": "Brazil",
    "year2004": 2.6,
    "year2005": 4.9
  }],
  "startDuration": 1,
  "graphs": [{
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "title": "2004",
    "type": "column",
    "valueField": "year2004"
  }, {
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "title": "2005",
    "type": "column",
    "clustered": false,
    "columnWidth": 0.5,
    "valueField": "year2005"
  }],
  "plotAreaFillAlphas": 0.1,
  "categoryField": "country",
  "titles": [{
    "text": "Second chart"
  }, {
    "text": "Scroll down for the next chart",
    "bold": false
  }]

});

/**
 * Third chart
 */
var chart = AmCharts.makeChart("chartdiv3", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [{
    "year": 2009,
    "income": 23.5,
    "expenses": 21.1
  }, {
    "year": 2010,
    "income": 26.2,
    "expenses": 30.5
  }, {
    "year": 2011,
    "income": 30.1,
    "expenses": 34.9
  }, {
    "year": 2012,
    "income": 29.5,
    "expenses": 31.1
  }, {
    "year": 2013,
    "income": 30.6,
    "expenses": 28.2,
  }, {
    "year": 2014,
    "income": 34.1,
    "expenses": 32.9,
    "dashLengthColumn": 5,
    "alpha": 0.2,
    "additional": "(projection)"
  }],
  "valueAxes": [{
    "axisAlpha": 0,
    "position": "left"
  }],
  "startDuration": 1,
  "graphs": [{
    "alphaField": "alpha",
    "fillAlphas": 1,
    "title": "Income",
    "type": "column",
    "valueField": "income",
    "dashLengthField": "dashLengthColumn"
  }, {
    "id": "graph2",
    "bullet": "round",
    "lineThickness": 3,
    "bulletSize": 7,
    "bulletBorderAlpha": 1,
    "bulletColor": "#FFFFFF",
    "useLineColorForBulletBorder": true,
    "bulletBorderThickness": 3,
    "fillAlphas": 0,
    "lineAlpha": 1,
    "title": "Expenses",
    "valueField": "expenses"
  }],
  "categoryField": "year",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "titles": [{
    "text": "Third chart"
  }, {
    "text": "Scroll down for the next chart",
    "bold": false
  }]
});

/**
 * Fourth chart
 */
AmCharts.makeChart("chartdiv4", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [{
    "country": "Lithuania",
    "litres": 501.9
  }, {
    "country": "Czech Republic",
    "litres": 301.9
  }, {
    "country": "Ireland",
    "litres": 201.1
  }, {
    "country": "Germany",
    "litres": 165.8
  }, {
    "country": "Australia",
    "litres": 139.9
  }, {
    "country": "Austria",
    "litres": 128.3
  }, {
    "country": "UK",
    "litres": 99
  }, {
    "country": "Belgium",
    "litres": 60
  }, {
    "country": "The Netherlands",
    "litres": 50
  }],
  "valueField": "litres",
  "titleField": "country",
  "pullOutRadius": 10,
  "titles": [{
    "text": "Fourth chart"
  }, {
    "text": "The last one",
    "bold": false
  }]
});
})