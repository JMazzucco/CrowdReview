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
    "member": "Public(Pub)",
    "number": 4773
  }, {
    "member": "Research scientists(Sci)",
    "number": 2023
  }, {
    "member": "Science communicators(Com)",
    "number": 256
  }, {
    "member": "Practitioners(Doc)",
    "number": 423

  }],
  "valueField": "number",
  "titleField": "member",
  "pullOutRadius": 10,
  "titles": [{
    "text": "Article mentions by members"
  }, {
    "text": "Number of people mentioning this article who are members of given categories",
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
    "marginRight": 10,
    "autoMargins": false
  },
  "dataProvider": [ {
    "member": "Public(Pub)",
    "number": 4773
  }, {
    "member": "Research scientists(Sci)",
    "number": 2023
  }, {
    "member": "Practitioners(Doc)",
    "number": 423

  }, {
    "member": "Science communicators(Com)",
    "number": 256
  } ],
  "valueField": "number",
  "titleField": "member",
  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
  "export": {
    "enabled": true
  },
  "titles": [{
    "text": "Article mentions by members"
  }, {
    "text": "Number of people mentioning this article who are members of given categories",
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
    "Socialmedia": "cited_by_twitter_count",
    "visits": 200,
    "color": "#04D215"
  }, {
    "Socialmedia": "cited_by_facebook_count",
    "visits": 150,
    "color": "#0D8ECF"
  }, {
    "Socialmedia": "cited_by_google+_count",
    "visits": 110,
    "color": "#0D52D1"
  }, {
    "Socialmedia": "cited_by_blogposts_count",
    "visits": 75,
    "color": "#2A0CD0"
  }, {
    "Socialmedia": "cited_by_linkedin_count",
    "visits": 50,
    "color": "#8A0CCF"
  }, {
    "Socialmedia": "cited_by_wikipedia_count",
    "visits": 35,
    "color": "#CD0D74"
  }],
  "valueAxes": [{
    "axisAlpha": 0,
    "position": "left",
    "title": "Citations in Social Media"
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
  "categoryField": "Socialmedia",
  "categoryAxis": {
    "gridPosition": "start",
    "labelRotation": 45
  },
  "export": {
    "enabled": true
  },
  "titles": [{
    "text": "Cited_by_x_count"
  }, {
    "text": "Count of unique authors, where x is one of below platform",
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
    "text": "Altmetric score for this article"
  }, {
    "text": "Measure of the quality and quantity of attention received",
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
    "text": "No of Readers on different platforms"
  }, {
    "text": "Readers using services which help discover scholarly references",
    "bold": false
  }]

});

})