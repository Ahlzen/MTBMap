@mapbg: #fff;
@trailcolor: #740;
@contourcolor: fadeout(#930, 80%);
@waterfill: #7af;
@naturecolor: #ceb;
Map { background-color: @mapbg; }


/* Contours and buildings */
#contours[zoom>=14] { line-width: 0.6; line-color: @contourcolor; }
#buildings[zoom>=14] { polygon-fill: #000; }

/* Landuse etc */
#nature {
  polygon-fill: @naturecolor;
  [leisure='golf_course'] {
    polygon-fill: darken(@naturecolor, 10%);
  }
}


// Hydrography

#ocean { polygon-fill: @waterfill; }
#water { 
  polygon-fill: @waterfill;
  ::labels [zoom >= 14] {
   	text-name: "[name]";
    text-size: 9;
    text-face-name: "DejaVu Sans Oblique";
    text-fill: #03d;
    text-max-char-angle-delta: 20;
    text-wrap-width: 30;
  }
}
#wetlands {
  polygon-fill: fadeout(@waterfill, 60%);
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

#roads [zoom<=10] {
  line-width:0;
  line-color:black;  
  [highway='motorway'],
  [highway='trunk'] { line-width: 1; }
  [highway='primary'],
  [highway='secondary'] { line-width: 0.7; }
  [highway='tertiary'] { line-width: 0.5; }
}

#roads [zoom>=11][zoom<=13] {
  line-width:0;
  line-color:black;
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
  [highway='track'],
  [highway='footway'],
  [highway='path'],
  [highway='bridleway'],
  [highway='cycleway'] {
    line-width: 0.5;
    line-color: @trailcolor;
  }
}

#roads [zoom>=14] {
  line-width:0;
  line-color:black;
  
  [highway='motorway'],
  [highway='trunk'] { line-width: 7; }
  [highway='primary'] { line-width: 5; }
  [highway='secondary'] { line-width: 4; }
  [highway='tertiary'] { line-width: 3; }
  [highway='residential'],
  [highway='unclassified'] { line-width: 2; }
  [highway='motorway_link'],
  [highway='trunk_link'],
  [highway='primary_link'],
  [highway='secondary_link'],
  [highway='tertiary_link'],
  [highway='service'] {
    line-width: 1.5;
    [service='driveway'],[service='parking_aisle'] { line-width: 1; }
  }  
  [highway='track'],
  [highway='bridleway'] {
    line-width: 1.5;
    line-dasharray: 6, 2;
    line-color: @trailcolor;
  }
  [highway='footway'],
  [highway='path'] {
    [bridge='yes'] {
      line-width: 6; line-color: fadeout(@trailcolor, 30%);
      ::midfill { line-width: 4; line-color: fadeout(@mapbg, 30%); }
    }
    ::fill {
      line-width: 1.5;
      line-dasharray: 2, 2;
      line-color: @trailcolor;
    }
  }
  [highway='cycleway'] {
    [bridge='yes'] {
      line-width: 6; line-color: fadeout(@trailcolor, 30%);
      ::midfill { line-width: 4; line-color: fadeout(@mapbg, 30%); }
    }
    ::fill {
      line-width: 1.5;
      line-color: @trailcolor;
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
    text-halo-radius: 2;
  }
}

#parkingPoint, #parkingArea {
  polygon-fill: black;
  polygon-opacity: 0.3;
  ::points[zoom>=14] {
    marker-file: url(symbols/parking.svg);
    marker-transform: scale(0.5,0.5);
    marker-allow-overlap: false;
    [access='destination'],[access='no'],[access='private'] {
      marker-opacity: 0; // hack for hiding icons
    }
  }
}

#rail [railway='rail'][zoom>=11] {
  line-width: 1.5;
  line-color: #555;
  ::ties { line-width: 6; line-dasharray: 1.5,20; line-color: #555; }
}


// Power lines etc

#powerlines {
  line-width:0.5;
  line-color:#555;
}
#points [power='pole'][zoom>=14] {
  marker-line-width: 0;
  marker-width: 3;
  marker-fill: #555;
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

#areas [tourism='camp_site'][zoom>=12],
#points [tourism='camp_site'][zoom>=12] {
  polygon-fill: black;
  polygon-opacity: 0.1;
  marker-file: url(symbols/campground.svg);
  marker-transform: scale(0.6,0.6);
  marker-allow-overlap: false;
}


// Misc areas / landuse

#areas [access='no'] {
  polygon-fill: fadeout(red, 80%);
  polygon-pattern-file: url(symbols/hatch-red-10.png);
}

#areas [landuse='meadow'],
#areas [landuse='grass'] {
  polygon-fill: fadeout(#f0ffa0, 40%);
}

#areas [landuse='landfill'] {
  polygon-fill: fadeout(#640, 70%);
}

#areas [landuse='cemetery'],
#areas [amenity='grave_yard'] {
  polygon-fill: #050;
  polygon-opacity: 0.1;
}

#areas [natural='sand'],
#areas [leisure='beach'] {
  polygon-fill: #c0c070;
}

#areas [natural='wood'] {
  polygon-fill: #070;
  polygon-opacity: 0.3;
}

#areas [leisure='pitch'] {
  polygon-fill: #070;
  polygon-opacity: 0.3;
}

#hillshade {
  raster-opacity: 0.2;
  raster-scaling: bilinear;
  raster-comp-op: multiply;
  ::hilight {
    raster-scaling: bilinear;
    raster-comp-op: hard-light;
    raster-opacity: 0.5;
  }
}