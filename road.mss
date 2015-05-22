// Basic color palette, from which variations will be derived.
@motorway:          #0e1d32;
@main:              lighten(@motorway,10%);
@street:            #43505c;
@street_limited:    #778b95;
@railway:           #ff0404;

@road_case_color: lighten(@land,10%);
// ---------------------------------------------------------------------

// Roads are split across 3 layers: #road, #bridge, and #tunnel. Each
// road segment will only exist in one of the three layers. The
// #bridge layer makes use of Mapnik's group-by rendering mode;
// attachments in this layer will be grouped by layer for appropriate
// rendering of multi-level overpasses.

// The main road style is for all 3 road layers and divided into 2 main
// attachments. The 'case' attachment is 

#road, #bridge, #tunnel {
  
  // casing/outlines & single lines
  ::case[zoom>=6]['mapnik::geometry_type'=2] {
    [class='motorway'] {
      line-join:round;
      line-color: mix(@motorway, #800, 75);
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=6]  { line-width:0.4; }
      [zoom>=7]  { line-width:0.6; }
      [zoom>=8] { line-width:1.5; }
      [zoom>=10]  { line-width:3; }
      [zoom>=13] { line-width:3.5;  }
      [zoom>=14] { line-width:5; }
      [zoom>=15] { line-width:7; }
      [zoom>=16] { line-width:9; }
    }
    [class='motorway_link'][zoom>=13] {
      line-join:round;
      line-color: @road_case_color;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=13] { line-width:1; }
      [zoom>=14] { line-width:3; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:6.5; }
    }
    [type='trunk']{
      line-color: @road_case_color;
      [zoom>=8] { line-width:4; }
      [zoom>=10] { line-width:7; }
      [zoom>=14] { line-width:14; }
      [zoom>=16] { line-width:20; }
      }
    [type='primary']{
      line-color: @road_case_color;
      [zoom>=8] { line-width:2; }
      [zoom>=10] { line-width:7; }
      [zoom>=14] { line-width:12; }
      [zoom>=16] { line-width:18; }
      }
    [type='secondary']{
      line-color: @road_case_color;
      [zoom>=8] { line-width:2; }
      [zoom>=10] { line-width:6; }
      [zoom>=14] { line-width:11; }
      [zoom>=16] { line-width:16; }
      }
    [type='tertiary']{
      line-color: @road_case_color;
      [zoom>=14] { line-width:8; }
      [zoom>=16] { line-width:13; }
      }
   /* [class='main'] {
      line-join:round;
      line-color: @road_case_color;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=6] { line-width:0.2; }
      [zoom>=7] { line-width:0.4; }
      [zoom>=8] { line-width:1.5; }
      [zoom>=10] { line-width:2.4; }
      [zoom>=13] { line-width:2.5; }
      [zoom>=14] { line-width:4; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:12; }
    }*/
    [class='street'][zoom>=12],[class='street_limited'][zoom>=12] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: @road_case_color;
      [zoom>=12] { line-width:0.5; }
      [zoom>=14] { line-width:1; }
      [zoom>=15] { line-width:4; }
      [zoom>=16] { line-width:6.5; }
    }
    [class='service'][zoom>=15] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: @road_case_color;
      [zoom>=15] { line-width:1; }
      [zoom>=16] { line-width:4; }
    }
    [class='path'][zoom>=15] {
      line-color: #cba;
      line-dasharray: 2,1;
      [zoom>=16] { line-width: 1.2; }
      [zoom>=17] { line-width: 1.5; }
    }
  }
  
  // fill/inlines
  ::fill[zoom>=6]['mapnik::geometry_type'=2] {
    [class='motorway'][zoom>=8] {
      line-join:round;
      #road, #bridge { line-cap:round; }
      line-color:@motorway;
      #tunnel { line-color:lighten(@motorway,4); }
      [zoom>=8] { line-width:0.5; }
      [zoom>=10] { line-width:10; }
      [zoom>=14] { line-width:16; }
      [zoom>=16] { line-width:18; }
    }
    [class='motorway_link'][zoom>=14] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color:@motorway;
      #tunnel {  line-color:lighten(@motorway,4); }
      [zoom>=14] { line-width:1.5; }
      [zoom>=15] { line-width:3; }
      [zoom>=16] { line-width:4.5; }
    }
    [type='trunk']{
      line-color:@motorway;
      [zoom>=8] { line-width:2; }
      [zoom>=10] { line-width:5; }
      [zoom>=14] { line-width:10; }
      [zoom>=16] { line-width:16; }
      }
     [type='primary']{
      line-color:@main;
      [zoom>=8] { line-width:1; }
      [zoom>=10] { line-width:3; }
      [zoom>=14] { line-width:8; }
      [zoom>=16] { line-width:14; }
      }
    [type='secondary']{
      line-color:@main;
      [zoom>=8] { line-width:0.5; }
      [zoom>=10] { line-width:2; }
      [zoom>=14] { line-width:7; }
      [zoom>=16] { line-width:12; }
      }
    [type='tertiary']{
      line-color:@main;
      [zoom>=10] { line-width:0.5; }
      [zoom>=14] { line-width:4; }
      [zoom>=16] { line-width:9; }
      }
    
    /*
    [class='main'][zoom>=8] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color:@main;
      #tunnel { line-color:lighten(@main,4); }
      [zoom>=8] { line-width:0.5; }
      [zoom>=10] { line-width:1; }
      [zoom>=13] { line-width:1.5; }
      [zoom>=14] { line-width:2.5; }
      [zoom>=15] { line-width:3.5; }
      [zoom>=16] { line-width:6; }
    }
   */
    
    [class='street'][zoom>=15], {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width:2.5; line-color:@street; }
      [zoom>=16] { line-width:4; }
    }
    [class='street_limited'][zoom>=15], {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width:2.5; line-color:@street_limited; }
      [zoom>=16] { line-width:4; }
    }
    [class='service'][zoom>=16], {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=16] { line-width:2; line-color:#fff; }
    }
    [class='major_rail'] {
      line-width: 0.4;
      line-color: @railway;
      [zoom>=16] {
        line-width: 0.75;
      	// Hatching
      	h/line-width: 3;
      	h/line-color: @railway;
      	h/line-dasharray: 1,31;
      }
    }
  }
}
