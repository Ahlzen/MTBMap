#buildings[zoom>=14]
{
  polygon-fill: @housecolor;
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


// Misc transportation

//#parkingPoint, 
#parkingArea [zoom >= 12] {
  polygon-fill: @roadcolor;
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