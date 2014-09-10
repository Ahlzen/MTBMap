#roadsLowzoom [zoom<=11] {
  line-width:0;
  line-color:@roadcolor;
  line-opacity: 0.5;
  [highway='motorway'] { line-width: 1.5; }
  [highway='trunk'] { line-width: 1.2; }
  [highway='primary'],
  [highway='secondary'] { line-width: 0.7; }
  
  // shields for route relations
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