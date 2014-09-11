/* Labels, symbols, shields and other stuff that goes on top */

#townLabels [zoom>=8][zoom<=14] {
  text-name: "[name]";
  text-opacity: 0;
  text-transform: uppercase;
  text-face-name: "DejaVu Sans Condensed Bold";
  text-wrap-width: 70;
  text-max-char-angle-delta: 20;
  text-fill: @townLabelColor;
  text-halo-fill: white;
  text-halo-radius: 2;
  [zoom<=9] {
   	[place='city'] {text-size: 10; text-opacity: 1;}
    text-halo-radius: 1.5;
  }
  [zoom=10] {
   	[place='city'] {text-size: 12; text-opacity: 1;}
    [place='town'] {text-size: 8; text-opacity: 1;}
    text-halo-radius: 1.5;
  }
  [zoom=11] {
   	[place='city'] {text-size: 13; text-opacity: 1;}
    [place='town'] {text-size: 10; text-opacity: 1;}
    text-halo-radius: 1.5;
  }
  [zoom=12] {
   	[place='city'] {text-size: 14; text-opacity: 1;}
    [place='town'] {text-size: 11; text-opacity: 1;}
    [place='village'] {text-size: 9; text-opacity: 1;}
  }
  [zoom>=13] {
   	[place='city'] {text-size: 15; text-opacity: 1;}
    [place='town'] {text-size: 12; text-opacity: 1;}
    [place='village'] {text-size: 10; text-opacity: 1;}
    [place='hamlet'],[place='locality'] {
      text-size: 8; text-opacity: 1; text-halo-radius: 1.5;
    }
  }
}

#parkLabels {
  [zoom>=11][zoom<=12][way_area > 5000000],
  [zoom>=13][zoom<=14][way_area > 1000000],
  [zoom>=15][zoom<=15][way_area > 100000] {
    text-name: "[name]";
    text-size: 10;
    text-size: 13;
    text-face-name: "DejaVu Sans Condensed Oblique";
    text-wrap-width: 80;
    text-max-char-angle-delta: 20;
    text-fill: #060;
    text-halo-fill: white;
    text-halo-radius: 2;
    text-min-distance: 50;
  }
}


// Bike shop labels

.bikeShops [zoom>=12] {
  marker-file: url(symbols/bike-shop.svg);
  marker-allow-overlap: false;
  marker-transform: scale(2.5, 2.5);
  text-dy: 12px;
  text-size: 9;
  text-face-name: "DejaVu Sans Condensed Bold";
  [zoom > 14] {
    marker-transform: scale(4, 4);
    text-dy: 14px;
    text-size: 11;
  }
  text-name: "[name]";  
  text-wrap-width: 50;
  text-fill: @bikeShopLabelColor;
  text-halo-fill: white;
  text-halo-radius: 1.5;
}


// Misc POIs

#points [amenity='toilets'][zoom>=14] {
  marker-file: url(symbols/restrooms.svg);
  marker-transform: scale(0.5,0.5);
  marker-allow-overlap: false;
}

#points [amenity='drinking_water'][zoom>=14] {
  marker-file: url(symbols/water.svg);
  marker-transform: scale(0.5,0.5);
  marker-allow-overlap: false;
}

#points [tourism='viewpoint'][zoom>=14] {
  marker-file: url(symbols/view.svg);
  marker-transform: scale(0.5,0.5);
  marker-allow-overlap: false;
}

#points [barrier='gate'][zoom>=15] {
  marker-file: url(symbols/gate.svg);
  marker-allow-overlap: false;
  marker-transform: scale(1,1);
  [zoom=16] { marker-transform: scale(1.3,1.3); }
  [zoom>=17] { marker-transform: scale(1.6,1.6); }
}

#areaLabels[zoom >= 14],
#points[zoom >= 14]
{
  [amenity='parking'] {
    marker-file: url(symbols/parking.svg);
    marker-transform: scale(0.5,0.5);
    marker-allow-overlap: false;
  }  
  
  // water areas (except rivers; they are
  // labeled along the corresponding waterway)
  [natural='water'][water!='river'] {
    text-name: "[name]";
    text-size: 11;
    text-face-name: "DejaVu Sans Oblique";
    text-fill: #03d;
    text-halo-radius: 1.3;
    text-halo-fill: lighten(@waterfill, 20%);
    text-max-char-angle-delta: 20;
    text-wrap-width: 30;
  }
  
  [aeroway='aerodrome'],
  [amenity='school'][zoom >= 15],
  [leisure='beach'][zoom >= 15],
  [landuse='cemetery'][zoom >= 15],
  [landuse='quarry'][zoom >= 15]
  {
    text-name: "[name]";
    text-size: 8;
    [zoom >= 16] { text-size: 9; }
    text-face-name: "DejaVu Sans Book";
    text-transform: uppercase;
    text-halo-fill: white;
    text-halo-radius: 1;
    text-wrap-width: 60;
  }
  
  [tourism='camp_site'] {
    marker-file: url(symbols/campground.svg);
    marker-transform: scale(0.6,0.6);
    marker-allow-overlap: false;  
  }
  
  [man_made='water_tank'],
  [man_made='water_tower'],
  [man_made='tower'],
  {
    marker-line-width: 0;
    marker-width: 4;
    marker-fill: black;
    text-name: "[name]";
    text-size: 9;
    text-face-name: "DejaVu Sans Book";
    text-halo-fill: white;
    text-halo-radius: 1;
    text-dy: 5;
    [man_made='water_tank'] { text-name: '"Water Tank"'; }
    [man_made='water_tower'] { text-name: '"Water Tower"'; }
  	[man_made='tower'] { text-name: '"Tower"'; }
  }
  
  [natural='peak'] {
    point-file: url(symbols/peak.svg);
    point-transform: scale(5.0, 5.0);
    [zoom >= 14] { point-transform: scale(6.0, 6.0); }
    [zoom >= 16] { point-transform: scale(8.0, 8.0); }
    text-name: "[name]";
    text-dy: 8;
    text-face-name: @peakFont;
    text-size: 11;
    [zoom >= 16] { text-size: 13; }
    text-fill: @peakColor;
    text-halo-fill: @peakHalo;
    text-halo-radius: 1.6;
    ::elevation [ele!=""] {
      text-name: [ele] + ' ft';
      text-face-name: @peakEleFont;
      text-size: 11;
      text-dy: 22;
      text-fill: @peakColor;
      text-halo-fill: @peakHalo;
      text-halo-radius: 1.5;
    }
  }
}


// Waterway labels

#waterwayLabels[zoom >= 14] {
  text-name: "[name]";
  text-size: 11;
  text-placement: line;
  text-face-name: "DejaVu Sans Oblique";
  text-fill: #03d;
  text-halo-radius: 1.3;
  text-halo-fill: lighten(@waterfill, 20%);
  text-max-char-angle-delta: 20;
  text-wrap-width: 30;
}


// Trail/intersection markers

#junctionMarkers [zoom >= 15] {
  marker-line-color: @trailcolor;
  marker-fill: white;
  marker-width: 5;
  text-dy: 6;
  text-name: "[number]";
  text-face-name: "DejaVu Sans Condensed";
  
  text-size: 8;
  text-halo-radius: 1.5;
  text-fill: #047;
  text-halo-fill: white;
  [zoom >=16] {
    text-halo-radius: 2;
    marker-width: 6;
    text-size: 10;
  }
}