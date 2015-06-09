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
 * Fourth chart
 */
AmCharts.makeChart("chartdiv1", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [{
    "country": "Public(Pub)",
    "litres": 4773
  }, {
    "country": "Research scientists(Sci)",
    "litres": 2023
  }, {
    "country": "Science communicators(Com)",
    "litres": 256
  }, {
    "country": "Practitioners(Doc)",
    "litres": 423

  }],
  "valueField": "litres",
  "titleField": "country",
  "pullOutRadius": 10,
  "titles": [{
    "text": "First chart"
  }, {
    "text": "Article mention by member",
    "bold": false
  }]
});


var chart = AmCharts.makeChart( "chartdiv", {
  "type": "pie",
  "theme": "light",
  "path": "http://www.amcharts.com/lib/3/",
  "legend": {
    "markerType": "circle",
    "position": "right",
    "marginRight": 80,
    "autoMargins": false
  },
  "dataProvider": [ {
    "country": "Public(Pub)",
    "litres": 4773
  }, {
    "country": "Research scientists(Sci)",
    "litres": 2023
  }, {
    "country": "Practitioners(Doc)",
    "litres": 423

  }, {
    "country": "Science communicators(Com)",
    "litres": 256
  } ],
  "valueField": "litres",
  "titleField": "country",
  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
  "export": {
    "enabled": true
  },
  "titles": [{
    "text": "First chart"
  }, {
    "text": "Article mention by member",
    "bold": false
  }]
});


/**
 * First chart
 */
var chart = AmCharts.makeChart("chartdiv4", {
"type": "serial",
  "theme": "light",
  "marginRight": 70,
  "path": "http://www.amcharts.com/lib/3/",
  "dataProvider": [{
    "country": "cited_by_twitter_count",
    "visits": 200,
    "color": "#04D215"
  }, {
    "country": "cited_by_facebook_count",
    "visits": 150,
    "color": "#0D8ECF"
  }, {
    "country": "cited_by_google+_count",
    "visits": 110,
    "color": "#0D52D1"
  }, {
    "country": "cited_by_blogposts_count",
    "visits": 75,
    "color": "#2A0CD0"
  }, {
    "country": "cited_by_linkedin_count",
    "visits": 50,
    "color": "#8A0CCF"
  }, {
    "country": "cited_by_wikipedia_count",
    "visits": 35,
    "color": "#CD0D74"
  }],
  "valueAxes": [{
    "axisAlpha": 0,
    "position": "left",
    "title": "Visitors from country"
  }],
  "startDuration": 1,
  "graphs": [{
    "balloonText": "<b>[[category]]: [[value]]</b>",
    "fillColorsField": "color",
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  }],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "country",
  "categoryAxis": {
    "gridPosition": "start",
    "labelRotation": 45
  },
  "export": {
    "enabled": true
  },
  "titles": [{
    "text": "Second chart"
  }, {
    "text": "Scroll down for the next chart",
    "bold": false
  }]
});

/**
 * NEW Third chart
 */

var chart = AmCharts.makeChart("chartdiv5", {
  "type": "serial",
  "addClassNames": true,
  "theme": "light",
  "path": "http://www.amcharts.com/lib/3/",
  "autoMargins": false,
  "marginLeft": 60,
  "marginRight": 40,
  "marginTop": 70,
  "marginBottom": 60,
  "balloon": {
    "adjustBorderColor": false,
    "horizontalPadding": 10,
    "verticalPadding": 8,
    "color": "#ffffff"
  },

  "dataProvider": [{
    "year": "One Week",
    "score": 172
  }, {
    "year": "One Month",
    "score": 203
  }, {
    "year": "Three Months",
    "score": 279
  }, {
    "year": "Six Months",
    "score": 1057
  }, {
    "year": "One Year",
    "score": 1212
  }, {
    "year": "Current",
    "score": 5160,
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
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "fillAlphas": 1,
    "title": "Income",
    "type": "column",
    "valueField": "income",
    "dashLengthField": "dashLengthColumn"
  }, {
    "id": "graph2",
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "bullet": "round",
    "lineThickness": 3,
    "bulletSize": 7,
    "bulletBorderAlpha": 1,
    "bulletColor": "#FFFFFF",
    "useLineColorForBulletBorder": true,
    "bulletBorderThickness": 3,
    "fillAlphas": 0,
    "lineAlpha": 1,
    "title": "Score",
    "valueField": "score"
  }],
  "categoryField": "year",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "export": {
    "enabled": true
  },
  "titles": [{
    "text": "Third chart"
  }, {
    "text": "Scroll down for the next chart",
    "bold": false
  }]
});


/**
 * Horizontal Bar chart
 */
var chart = AmCharts.makeChart("chartdiv6", {
  "type": "serial",
  "path": "http://www.amcharts.com/lib/3/",
  "categoryField": "year",
  "rotate": true,
  "startDuration": 1,
  "marginLeft": 60,
  "marginRight": 40,
  "marginTop": 70,
  "marginBottom": 30,
  "categoryAxis": {
    "gridPosition": "start",
    "position": "left"
  },
  "trendLines": [],
  "graphs": [
    {
      "balloonText": "Readers:[[value]]",
      "fillAlphas": 0.8,
      "id": "AmGraph-1",
      "lineAlpha": 0.2,
      "title": "Income",
      "type": "column",
      "valueField": "income"
    }
  ],
  "guides": [],
  "valueAxes": [
    {
      "id": "ValueAxis-1",
      "position": "top",
      "axisAlpha": 0
    }
  ],
  "allLabels": [],
  "balloon": {},
  "titles": [],
  "dataProvider": [
    {
      "year": "Mendeley",
      "income": 200,
    },
    {
      "year": "Citeulike",
      "income": 100,

    },
    {
      "year": "Connotea",
      "income": 50,

    },
  ],
    "export": {
      "enabled": true
     },
    "titles": [{
    "text": "Fourth chart"
  }, {
    "text": "Scroll down for the next chart",
    "bold": false
  }]

});

})