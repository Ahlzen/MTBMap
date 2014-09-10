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