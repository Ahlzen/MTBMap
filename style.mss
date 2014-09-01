@mapbg: #fff;
@contourcolor: fadeout(#530, 80%);
@waterfill: #7af;
@naturecolor: #cce3b0;
@roadcolor: #aaa;
@housecolor: #bbb;
@townLabelColor: #999;
@bikeShopLabelColor: #a40;

@trailcolor: #000;

/* Mountain peaks */
@peakColor: #643;
@peakFont: "Liberation Serif Regular";
@peakEleFont: "Liberation Serif Italic";
@peakHalo: desaturate(lighten(@peakColor, 60%), 50%);


Map {
  background-color: @mapbg;
  buffer-size: 64;
}


/* Contours and buildings */
#contours[zoom>=14] { line-width: 0.6; line-color: @contourcolor; }
#buildings[zoom>=14] { polygon-fill: @housecolor; }


#townMarkers [zoom>=8][zoom<=14]
{
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
    //[place='village'] {text-size: 11}
    //[place='hamlet'],[place='locality'] {text-size: 10}
  }
  [zoom=12] {
   	[place='city'] {text-size: 14; text-opacity: 1;}
    [place='town'] {text-size: 11; text-opacity: 1;}
    [place='village'] {text-size: 9; text-opacity: 1;}
    //[place='hamlet'],[place='locality'] {text-size: 10; text-opacity: 1;}
  }
  [zoom>=13] {
   	[place='city'] {text-size: 15; text-opacity: 1;}
    [place='town'] {text-size: 12; text-opacity: 1;}
    [place='village'] {text-size: 10; text-opacity: 1;}
    [place='hamlet'],[place='locality'] {text-size: 8; text-opacity: 1; text-halo-radius: 1.5;}
  }
}

#parkLabelsLowzoom
{
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

/* Landuse etc */
#nature {
  polygon-fill: @naturecolor;
  [zoom<10] { polygon-fill: darken(@naturecolor, 15%); }
  [zoom=10] { polygon-fill: darken(@naturecolor, 10%); }
  [zoom=11] { polygon-fill: darken(@naturecolor, 5%); }
  [leisure='golf_course'] {
    polygon-fill: darken(@naturecolor, 15%);
  }
}


// Hydro features

#ocean, #water { polygon-fill: @waterfill; }
#wetlands {
  /*polygon-fill: fadeout(@waterfill, 60%);*/
  polygon-pattern-file: url(symbols/marsh.png);
  //polygon-pattern-file: url(symbols/wetland.svg);
}
#waterways [zoom>=12] {
  line-width:0;
  line-color:@waterfill;
  [intermittent='yes'] { line-dasharray: 6,3; }
  [waterway='river'] { line-width: 3; }
  [waterway='canal'] { line-width: 3; }
  [waterway='stream'] { line-width: 1.5; }
  [waterway='ditch'] { line-width: 1; }
}


// Transportation and trails

#roadsLowzoom [zoom<=11] {
  line-width:0;
  line-color:@roadcolor;
  line-opacity: 0.5;
  [highway='motorway'] { line-width: 1.5; }
  [highway='trunk'] { line-width: 1.2; }
  [highway='primary'],
  [highway='secondary'] { line-width: 0.7; }
  //[highway='tertiary'] { line-width: 0.5; }
  
  //[highway='motorway'],
  //[highway='trunk'] {
  [highway='motorway'][osm_id < 0] { 
    shield-name: "[ref]";
    shield-file: url(symbols/shield-standard.svg); // 10px
    shield-face-name: "DejaVu Sans Bold";
    shield-fill: @roadcolor;
    shield-size: 8;
    shield-transform: scale(3, 3);
    shield-spacing: 500;
    shield-min-distance: 100;
  }
  
}

#roads [zoom>=12][zoom<=13] {
  line-color:@roadcolor;
  [highway='motorway'],
  [highway='trunk'] { line-width: 2.5; }
  [highway='primary'],
  [highway='secondary'] { line-width: 1.3; }
  [highway='tertiary'] { line-width: 1.1; }
  [highway='residential'],
  [highway='unclassified'] { line-width: 0.9; }
  [highway='motorway_link'],
  [highway='trunk_link'],
  [highway='primary_link'],
  [highway='secondary_link'],
  [highway='tertiary_link'],
  [highway='service'] { line-width:0.7; }  
}

#roads [zoom>=14] {
  
  line-color: @roadcolor;
  
  // Dash by surface
  [surface='dirt'],[surface='unpaved'],[surface='sand']{
    line-dasharray: 12, 2;
  }
  
  // Width by type
  [highway='motorway'],
  [highway='trunk'] { line-width: 8; }
  [highway='primary'] { line-width: 6; }
  [highway='secondary'] { line-width: 5; }
  [highway='tertiary'] { line-width: 4; }
  [highway='residential'],
  [highway='unclassified'] { line-width: 3; }
  [highway='motorway_link'],
  [highway='trunk_link'],
  [highway='primary_link'],
  [highway='secondary_link'],
  [highway='tertiary_link'],
  [highway='service'] {
    line-width: 2;
    [service='driveway'],[service='parking_aisle'] { line-width: 1.5; }
  }
  
  // Exception: Roads with motor_vehicle=no are considered
  // hiking/biking paths:
  [motor_vehicle='no'] {
    line-width: 1.8;
    line-color: @trailcolor;
  	[surface='dirt'],[surface='ground'],[surface='unpaved'],[surface='sand'],[surface='gravel']{
      //line-color: @trailcolorDirt;
      line-dasharray: 12, 2;
    }
  }
  
  ::labels [zoom >= 14] {
   	text-name: "[name]";
    text-size: 9;
    text-face-name: "DejaVu Sans Book";
    text-character-spacing: 1;
    text-max-char-angle-delta: 20;
    text-transform: uppercase;
    text-placement: line;
    text-halo-fill: white;
    text-halo-radius: 1;
    text-dy: 7;
  }
}

#trails [zoom>12][zoom<=13] { 
  [highway='footway'],
  [highway='path'],
  [highway='pedestrian'] {
    line-width: 0.5;
    line-dasharray: 2, 2;
    line-color: fadeout(@trailcolor, 30%);
  } 
    
  [highway='bridleway'],
  [highway='track'],
  [highway='cycleway'] {
    line-width: 0.7;
    line-dasharray: 5, 2;
    line-color: fadeout(@trailcolor, 30%);
  } 
  
  // motor_vehicle=no
  [highway='residential'], 
  [highway='service'],
  [highway='unclassified'] {
    line-width: 0.7;
    line-color: fadeout(@trailcolor, 30%);
  } 
}

#trails [zoom>=14] {
  
  
  line-color: @trailcolor;
  /*
  // Color by surface type
  [surface='asphalt'],[surface='paved'] { line-color: @trailcolorAsphalt; }
  [surface='dirt'],[surface='ground'],[surface='unpaved']{ line-color: @trailcolorDirt; }
  [surface='sand'] { line-color: @trailcolorSand; }
  [surface='gravel'] { line-color: @trailcolorGravel; }
  [bicycle='no'] { line-color: @trailcolorNoBike; }
  */
  
  [highway='track'],
  [highway='bridleway'] {
    [bridge='yes'] { line-width: 6.5; line-color: fadeout(black, 30%); }
    ::background { line-width: 4.5; line-color: white; }
    ::fill {
      line-width: 2.0;
      line-dasharray: 12, 2;
      [tracktype='grade5'] { line-dasharray: 7, 2; }
      [tracktype='grade4'] { line-dasharray: 9, 2; }
      [tracktype='grade3'] { line-dasharray: 11, 2; }
      [tracktype='grade2'] { line-dasharray: 13.5, 2; }
      [tracktype='grade1'] { line-dasharray: 15, 2; }
    }
  }
  
  [highway='footway'],
  [highway='path'],
  [highway='pedestrian']  
  {
    // Narrow singletrack and/or bad visibility (overgrown)
    [width='1 ft'],[trail_visibility='intermediate'],
    [trail_visibility='bad'],[trail_visibility='horrible'] {
      [bridge='yes'] { line-width: 5.5; line-color: fadeout(black, 30%); }
      ::background { line-width: 3.5; line-color: white; }
      ::fill {
        line-width: 1.0;
        line-dasharray: 3, 2;
      }
    }
    
    // Normal singletrack (default), good visibility
    [width=''],[width='2 ft'],[width='3 ft']
    {
      [trail_visibility=''],
      [trail_visibility='good'],
      [trail_visibility='excellent']
      {
        [bridge='yes'] { line-width: 6; line-color: fadeout(black, 30%); }
        ::background { line-width: 4; line-color: white; }
        ::fill {
          line-width: 1.5;
          line-dasharray: 4, 2;
        }
      }
    }
    
    // Wide singletrack, good visibility
    [width='4 ft'],[width='5 ft'],[width='6 ft'],[width='7 ft'],
    [width='8 ft'],[width='9 ft'],[width='10 ft']
    {
      [trail_visibility=''],[trail_visibility='good'],[trail_visibility='excellent']
      {
        [bridge='yes'] { line-width: 6.5; line-color: fadeout(black, 30%); }
        ::background { line-width: 4.5; line-color: white; }
        ::fill {
          line-width: 2.0;
          line-dasharray: 4, 2;
        }
      }
    }
    
  }
  
  // Minor roads with motor_vehicle=no are considered bike paths.
  [highway='residential'],[highway='unclassified'],[highway='service'] {
    [bridge='yes'] {
      line-width: 6; line-color: fadeout(@trailcolor, 30%);
      ::midfill { line-width: 4.5; line-color: fadeout(@mapbg, 30%); }
    }
    ::background { line-width: 4.5; line-color: white; }
    ::fill { line-width: 2.0; }
  }
  
  [highway='cycleway'] {
    [bridge='yes'] {
      line-width: 6; line-color: fadeout(@trailcolor, 30%);
      ::midfill { line-width: 4; line-color: fadeout(@mapbg, 30%); }
    }
    ::background { line-width: 4; line-color: white; }
    ::fill { line-width: 1.5; }
  }
  
  ::labels [zoom >= 14] {
   	text-name: "[name]";
    text-size: 9;
    text-face-name: "DejaVu Sans Book";
    text-character-spacing: 1;
    text-max-char-angle-delta: 20;
    text-transform: uppercase;
    text-placement: line;
    text-halo-fill: white;
    text-halo-radius: 1;
    text-dy: 7;
  }
}

#parkingPoint, #parkingArea [zoom >= 12] {
  polygon-fill: @roadcolor;
  ::points[zoom>=14] {
    marker-file: url(symbols/parking.svg);
    marker-transform: scale(0.5,0.5);
    marker-allow-overlap: false;
    [access='destination'],[access='no'],[access='private'] {
      marker-opacity: 0; // hack for hiding icons
    }
  }
}

#rail [railway='rail'][zoom>=12] {
  line-width: 1.5;
  line-color: @roadcolor;
  ::ties { line-width: 6; line-dasharray: 1.5,20; line-color: @roadcolor; }
}


// Fences

#miscLines [zoom >= 14][barrier='fence'] {
  line-width:0.5;
  line-color:#000;
  line-dasharray: 5,1;
}


// Power lines

#miscLines [zoom >= 14][power='line'] {
  line-width:0.7;
  line-color:#555;
}
#miscLines [zoom >= 14][power='minor_line'] {
  line-width:0.5;
  line-color:#555;
}
#points [power='pole'][zoom>=14] {
  marker-line-width: 0;
  marker-width: 3;
  marker-fill: #555;
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

#areas [tourism='camp_site'][zoom>=14],
#points [tourism='camp_site'][zoom>=14] {
  polygon-fill: black;
  polygon-opacity: 0.1;
  marker-file: url(symbols/campground.svg);
  marker-transform: scale(0.6,0.6);
  marker-allow-overlap: false;
}
/*
#areaLabels {
  [man_made='water_tank'],
  [man_m
}
*/
/*
#areaLabels [zoom >= 14] {
	marker-line-width: 0;
    marker-width: 4;
    marker-fill: blue;
    text-name: "[name]";
    text-size: 12;
    text-face-name: "DejaVu Sans Book";
    text-halo-fill: white;
    text-halo-radius: 1;
    text-dy: 5;
}
*/
#areaLabels [zoom >= 14],
#points [zoom >= 14] {
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
    text-name: "[name]";
    text-dy: 8;
    text-face-name: @peakFont;
    text-size: 11;
    text-fill: @peakColor;
    text-halo-fill: @peakHalo;
    text-halo-radius: 1.5;
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


// Trail / junction markers

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


// Misc areas / landuse

#areas [access='no'][zoom >= 12] {
  polygon-fill: fadeout(red, 80%);
  polygon-pattern-file: url(symbols/hatch-red-10.png);
}

#areas [power='substation'],
#areas [power='station'] {
  polygon-fill: fadeout(#000000, 70%);
}

#areas [aeroway='aerodrome'][zoom >= 11] {
  polygon-fill: fadeout(@roadcolor, 50%);
}

#areas [landuse='meadow'],
#areas [landuse='grass'] {
  polygon-fill: fadeout(#f8ffc0, 30%);
}

#areas [landuse='landfill'][zoom >= 12] {
  polygon-fill: fadeout(#640, 70%);
}

#areas [landuse='cemetery'],
#areas [amenity='grave_yard'] {
  polygon-fill: #050;
  polygon-opacity: 0.1;
}

#areas [amenity='school'] {
  polygon-fill: #852;
  polygon-opacity: 0.2;
}

#areas [highway='pedestrian'],
#areas [highway='footway']{
  polygon-fill: @roadcolor;
  line-color: @trailcolor;
  line-width: 0.5;
}

#areas [natural='sand'],
#areas [leisure='beach'] {
  polygon-fill: #c0c070;
}

#areas [natural='wood'] {
  polygon-fill: #070;
  polygon-opacity: 0.3;
}

#areas [landuse='quarry'],
#areas [landuse='construction'] {
  polygon-fill: #555;
  polygon-opacity: 0.3;
}

#areas [leisure='pitch'][zoom >= 12] {
  polygon-fill: #070;
  polygon-opacity: 0.3;
}

// Area labels

#areaLabels
{
  [zoom >= 14] {
    [natural='water'] {
      text-name: "[name]";
      text-size: 11;
      text-face-name: "DejaVu Sans Oblique";
      text-fill: #03d;
      text-max-char-angle-delta: 20;
      text-wrap-width: 30;
    }
  }
  [zoom >= 15] {
    [amenity='school'],
    [leisure='beach'],
    [landuse='cemetery'],
    [landuse='quarry'],
    [aeroway='aerodrome'] {
      text-name: "[name]";
      text-size: 8;
      [zoom >= 16] { text-size: 9; }
      text-face-name: "DejaVu Sans Book";
      text-transform: uppercase;
      text-halo-fill: white;
      text-halo-radius: 1;
      text-wrap-width: 60;
    }
  }
}



#hillshade {
  raster-opacity: 0.2;
  raster-scaling: bilinear;
  raster-comp-op: multiply;
  ::hilight {
    raster-scaling: bilinear;
    raster-comp-op: hard-light;
    raster-opacity: 0.6;
  }
}
