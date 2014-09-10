@mapbg: #fff;
@contourcolor: fadeout(#530, 80%);
@waterfill: #7af;
@naturecolor: #cce3b0;
@roadcolor: #aaa;
@housecolor: #bbb;
@townLabelColor: #999;
@bikeShopLabelColor: #a40;

@trailcolor: #000;

@peakColor: #642;
@peakFont: "Liberation Serif Regular";
@peakEleFont: "Liberation Serif Italic";
@peakHalo: white;


Map {
  background-color: @mapbg;
  buffer-size: 64;
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

#contours[zoom>=14] {
  line-width: 0.6; line-color: @contourcolor;
}


// Hydro fill

#ocean, #water {
  polygon-fill: @waterfill;
}

#wetlands [zoom >= 10] {
  polygon-pattern-file: url(symbols/marsh.png);
  
  // Cranberry bogs
  [landuse='orchard'][produce='cranberry'],
  [landuse='farm'][managed='yes'][seasonal='yes'] {
    polygon-fill: lighten(#80406e, 40%);
    polygon-pattern-file: url(symbols/marsh.png);
  }  
}


// Misc areas / landuse

#nature {
  polygon-fill: @naturecolor;
  [zoom<10] { polygon-fill: darken(@naturecolor, 15%); }
  [zoom=10] { polygon-fill: darken(@naturecolor, 10%); }
  [zoom=11] { polygon-fill: darken(@naturecolor, 5%); }
  [leisure='golf_course'] {
    polygon-fill: darken(@naturecolor, 15%);
  }
}

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

#areas [tourism='camp_site'][zoom>=14] {
  polygon-fill: black;
  polygon-opacity: 0.1; 
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
