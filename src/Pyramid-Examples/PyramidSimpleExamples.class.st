Class {
	#name : #PyramidSimpleExamples,
	#superclass : #Object,
	#category : #'Pyramid-Examples'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> imageProxy [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-07-30 11:33:02"

	<pyStash>
	^ [ | objectclass1 |
objectclass1 := Object.
{(BlElement new
   background: (BlImageBackground new
         image: (PyramidExternalRessourceProxy new
               pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
                     target: objectclass1;
                     selector: #iconNamed:;
                     arguments: {#pharoBig};
                     yourself);
               yourself);
         opacity: 1.0;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal exact: 256.0.
      constraints vertical exact: 256.0 ];
   id: #A;
   yourself) . 
(BlElement new
   background: (BlImageBackground new
         image: (PyramidExternalRessourceProxy new
               pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
                     target: objectclass1;
                     selector: #iconNamed:;
                     arguments: {#abstract};
                     yourself);
               yourself);
         opacity: 1.0;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal exact: 16.0.
      constraints vertical exact: 16.0 ];
   id: #A;
   yourself)} ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> little_cat_in_black [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-07-29 11:47:06"

	<pyStash>
	^ [ | blpaintbackground1 blpaintbackground2 |
blpaintbackground1 := BlPaintBackground new.
blpaintbackground2 := BlPaintBackground new.
{(BlElement new
   background: (blpaintbackground2
         paint: (BlColorPaint new
               color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         opacity: 1.0;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal matchParent.
      constraints vertical matchParent ];
   layout: BlFrameLayout new;
   addChildren: {(BlElement new
         clipChildren: false;
         constraintsDo: [:constraints |  constraints frame horizontal alignCenter.
            constraints frame vertical alignTopAt: 0.3.
            constraints position: 373.0 @ 166.0 ];
         addChildren: {(BlElement new
               background: (blpaintbackground1
                     paint: (BlColorPaint new
                           color: (Color r: 1.0 g: 1.0 b: 1.0 alpha: 1.0);
                           yourself);
                     opacity: 1.0;
                     yourself);
               geometry: (BlRoundedRectangleGeometry cornerRadius: 12);
               constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
                  constraints vertical exact: 100.0.
                  constraints position: -200 @ 0 ];
               addChildren: {(BlElement new
                     background: blpaintbackground2;
                     geometry: BlEllipseGeometry new;
                     constraintsDo: [:constraints |  constraints horizontal exact: 10.0.
                        constraints vertical exact: 100.0.
                        constraints position: 43.0 @ 46.0 ];
                     id: #E;
                     yourself)};
               id: #C;
               yourself) . 
            (BlElement new
               background: blpaintbackground1;
               geometry: (BlRoundedRectangleGeometry cornerRadius: 12);
               constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
                  constraints vertical exact: 100.0.
                  constraints position: 150 @ 0 ];
               addChildren: {(BlElement new
                     background: blpaintbackground2;
                     geometry: BlEllipseGeometry new;
                     constraintsDo: [:constraints |  constraints horizontal exact: 10.0.
                        constraints vertical exact: 100.0.
                        constraints position: 43.0 @ 46.0 ];
                     id: #E;
                     yourself)};
               id: #D;
               yourself)};
         id: #eyes;
         yourself) . 
      (BlElement new
         geometry: BlRectangleGeometry new;
         constraintsDo: [:constraints |  constraints frame horizontal alignCenter.
            constraints frame vertical alignCenter.
            constraints position: 373.0 @ 263.0 ];
         addChildren: {(BlElement new
               background: blpaintbackground1;
               geometry: BlEllipseGeometry new;
               id: #G;
               yourself) . 
            (BlElement new
               background: blpaintbackground1;
               geometry: (BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
                           topLeft: 12;
                           topRight: 12;
                           bottomLeft: 0;
                           bottomRight: 0;
                           yourself));
               constraintsDo: [:constraints |  constraints vertical exact: 25.0 ];
               id: #H;
               yourself)};
         id: #nose;
         yourself) . 
      (BlElement new
         clipChildren: false;
         constraintsDo: [:constraints |  constraints frame horizontal alignCenter.
            constraints frame vertical alignTopAt: 0.6.
            constraints position: 373.0 @ 364.0 ];
         addChildren: {(BlElement new
               background: blpaintbackground1;
               geometry: BlEllipseGeometry new;
               constraintsDo: [:constraints |  constraints horizontal exact: 150.0.
                  constraints vertical exact: 10.0.
                  constraints position: 100.0 @ 0 ];
               id: #J;
               yourself) . 
            (BlElement new
               background: blpaintbackground1;
               geometry: BlEllipseGeometry new;
               constraintsDo: [:constraints |  constraints horizontal exact: 150.0.
                  constraints vertical exact: 10.0.
                  constraints position: 80 @ 30 ];
               id: #K;
               yourself) . 
            (BlElement new
               background: blpaintbackground1;
               geometry: BlEllipseGeometry new;
               constraintsDo: [:constraints |  constraints horizontal exact: 150.0.
                  constraints vertical exact: 10.0.
                  constraints position: -200 @ 0 ];
               id: #L;
               yourself) . 
            (BlElement new
               background: blpaintbackground1;
               geometry: BlEllipseGeometry new;
               constraintsDo: [:constraints |  constraints horizontal exact: 150.0.
                  constraints vertical exact: 10.0.
                  constraints position: -180 @ 30 ];
               id: #M;
               yourself)};
         id: #mustach;
         yourself)};
   id: #background;
   yourself)} ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble [

	<pyStash>
	^ [ "BlStashSerializer"
	  {
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #'background-top';
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 1.0
												       g: 0.6197458455522972
												       b: 0.5689149560117303
												       alpha: 1.0);
										      yourself);
								     yourself);
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints proportional vertical bottom: 0.5 ];
						    yourself).
					   (BlElement new
						    id: #'background-bottom';
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 0.7487781036168133
												       g: 0.46236559139784944
												       b: 0.4232649071358749
												       alpha: 1.0);
										      yourself);
								     yourself);
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints proportional vertical top: 0.5 ];
						    yourself) };
			   id: #background;
			   background: (BlTransparentBackground new
					    opacity: 1.0;
					    yourself);
			   layout: BlProportionalLayout new;
			   constraintsDo: [ :constraints |
				   constraints horizontal matchParent.
				   constraints vertical matchParent ];
			   yourself).
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #darkShade;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlRadialGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.0)).
												      (0.8 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.4)).
												      (1.0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.6)) };
										      innerCenter: 125 @ 125;
										      innerRadius: 0;
										      outerCenter: 125 @ 125;
										      outerRadius: 125;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints vertical matchParent ];
						    yourself).
					   (BlElement new
						    id: #lightShade;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlRadialGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.6980392156862745)).
												      (0.1 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.4980392156862745)).
												      (1.0 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.0)) };
										      innerCenter: 70 @ 70;
										      innerRadius: 0;
										      outerCenter: 70 @ 70;
										      outerRadius: 125;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints vertical matchParent ];
						    yourself) };
			   id: #ball;
			   background: (BlPaintBackground new
					    opacity: 1.0;
					    paint: (BlColorPaint new
							     color: (Color
									      r: 0.11339198435972629
									      g: 0.6432062561094819
									      b: 1.0
									      alpha: 1.0);
							     yourself);
					    yourself);
			   geometry: BlEllipseGeometry new;
			   layout: BlBasicLayout uniqueInstance;
			   constraintsDo: [ :constraints |
				   constraints horizontal exact: 250.0.
				   constraints vertical exact: 250.0.
				   constraints position: 274.0 @ 126.0 ];
			   yourself) } ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble2 [

	<pyStash>
	^ [ "BlStashSerializer"
	  {
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #'background-top';
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 1.0
												       g: 0.6197458455522972
												       b: 0.5689149560117303
												       alpha: 1.0);
										      yourself);
								     yourself);
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints proportional vertical bottom: 0.5 ];
						    yourself).
					   (BlElement new
						    id: #'background-bottom';
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 0.7487781036168133
												       g: 0.46236559139784944
												       b: 0.4232649071358749
												       alpha: 1.0);
										      yourself);
								     yourself);
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints proportional vertical top: 0.5 ];
						    yourself) };
			   id: #background;
			   background: (BlTransparentBackground new
					    opacity: 1.0;
					    yourself);
			   layout: BlProportionalLayout new;
			   constraintsDo: [ :constraints |
				   constraints horizontal matchParent.
				   constraints vertical matchParent ];
			   yourself).
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #darkShade;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlRadialGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.0)).
												      (0.8 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.4)).
												      (1.0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.6)) };
										      innerCenter: 125 @ 125;
										      innerRadius: 0;
										      outerCenter: 125 @ 125;
										      outerRadius: 125;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints vertical matchParent ];
						    yourself).
					   (BlElement new
						    id: #lightShade;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlRadialGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.6980392156862745)).
												      (0.1 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.4980392156862745)).
												      (1.0 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.0)) };
										      innerCenter: 70 @ 70;
										      innerRadius: 0;
										      outerCenter: 70 @ 70;
										      outerRadius: 125;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints vertical matchParent ];
						    yourself) };
			   id: #ball;
			   background: (BlPaintBackground new
					    opacity: 1.0;
					    paint: (BlColorPaint new
							     color: (Color
									      r: 0.11339198435972629
									      g: 0.6432062561094819
									      b: 1.0
									      alpha: 1.0);
							     yourself);
					    yourself);
			   geometry: BlEllipseGeometry new;
			   layout: BlBasicLayout uniqueInstance;
			   constraintsDo: [ :constraints |
				   constraints horizontal exact: 250.0.
				   constraints vertical exact: 250.0.
				   constraints position: 274.0 @ 126.0 ];
			   yourself).
		  (BlElement new
			   id: #ballShadow;
			   background: (BlPaintBackground new
					    opacity: 1.0;
					    paint: (BlColorPaint new
							     color: (Color
									      r: 0.0
									      g: 0.0
									      b: 0.0
									      alpha: 0.12941176470588237);
							     yourself);
					    yourself);
			   geometry: BlEllipseGeometry new;
			   layout: BlBasicLayout uniqueInstance;
			   constraintsDo: [ :constraints |
				   constraints horizontal exact: 250.0.
				   constraints vertical exact: 100.0.
				   constraints position: 300 @ 416 ];
			   yourself) } ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble3 [

	<pyStash>
	^ [ "BlStashSerializer"
	  | association2 blpaintbackground3 bltransparentbackground8 |
	  association2 := Association new.
	  blpaintbackground3 := BlPaintBackground new.
	  bltransparentbackground8 := BlTransparentBackground new.
	  {
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #'background-top';
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 1.0
												       g: 0.6197458455522972
												       b: 0.5689149560117303
												       alpha: 1.0);
										      yourself);
								     yourself);
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints proportional vertical bottom: 0.5 ];
						    yourself).
					   (BlElement new
						    id: #'background-bottom';
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 0.7487781036168133
												       g: 0.46236559139784944
												       b: 0.4232649071358749
												       alpha: 1.0);
										      yourself);
								     yourself);
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints proportional vertical top: 0.5 ];
						    yourself) };
			   id: #background;
			   background: (bltransparentbackground8
					    opacity: 1.0;
					    yourself);
			   layout: BlProportionalLayout new;
			   constraintsDo: [ :constraints |
				   constraints horizontal matchParent.
				   constraints vertical matchParent ];
			   yourself).
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #darkShade;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlRadialGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.0)).
												      (0.8 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.4)).
												      (1.0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.6)) };
										      innerCenter: 125 @ 125;
										      innerRadius: 0;
										      outerCenter: 125 @ 125;
										      outerRadius: 125;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints vertical matchParent ];
						    yourself).
					   (BlElement new
						    id: #lightShade;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlRadialGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.6980392156862745)).
												      (0.1 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.4980392156862745)).
												      (1.0 -> (Color
														        r: 1.0
														        g: 1.0
														        b: 1.0
														        alpha: 0.0)) };
										      innerCenter: 70 @ 70;
										      innerRadius: 0;
										      outerCenter: 70 @ 70;
										      outerRadius: 125;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints vertical matchParent ];
						    yourself) };
			   id: #ball;
			   background: (BlPaintBackground new
					    opacity: 1.0;
					    paint: (BlColorPaint new
							     color: (Color
									      r: 0.11339198435972629
									      g: 0.6432062561094819
									      b: 1.0
									      alpha: 1.0);
							     yourself);
					    yourself);
			   geometry: BlEllipseGeometry new;
			   layout: BlBasicLayout uniqueInstance;
			   constraintsDo: [ :constraints |
				   constraints horizontal exact: 250.0.
				   constraints vertical exact: 250.0.
				   constraints position: 274.0 @ 126.0 ];
			   yourself).
		  (BlElement new
			   id: #ballShadow;
			   background: (BlPaintBackground new
					    opacity: 1.0;
					    paint: (BlColorPaint new
							     color: (Color
									      r: 0.0
									      g: 0.0
									      b: 0.0
									      alpha: 0.12941176470588237);
							     yourself);
					    yourself);
			   geometry: BlEllipseGeometry new;
			   layout: BlBasicLayout uniqueInstance;
			   constraintsDo: [ :constraints |
				   constraints horizontal exact: 250.0.
				   constraints vertical exact: 100.0.
				   constraints position: 361.0 @ 416.0 ];
			   yourself).
		  (BlElement new
			   addChildren: {
					   (BlElement new
						    id: #tableShadow;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlLinearGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.6980392156862745)).
												      (0.8 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.6980392156862745)).
												      (1.0 -> (Color
														        r: 0.0
														        g: 0.0
														        b: 0.0
														        alpha: 0.0)) };
										      start: 0 @ 0;
										      end: 280.0 @ 0;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal exact: 280.0.
							    constraints position: 0 @ 52 ];
						    yourself).
					   (BlElement new
						    id: #bottom;
						    background: (blpaintbackground3
								     opacity: 1.0;
								     paint: (BlLinearGradientPaint new
										      stops: {
												      (0 -> (Color
														        r: 0.11339198435972629
														        g: 0.6432062561094819
														        b: 1.0
														        alpha: 1.0)).
												      (0.25 -> (Color
														        r: 0.5571847507331378
														        g: 0.823069403714565
														        b: 1.0
														        alpha: 1.0)).
												      (0.75 -> (Color
														        r: 0.23558162267839688
														        g: 0.5219941348973607
														        b: 0.7096774193548387
														        alpha: 1.0)).
												      (1.0 -> (Color
														        r: 0.08211143695014662
														        g: 0.45454545454545453
														        b: 0.7018572825024438
														        alpha: 1.0)) };
										      start: 0 @ 0;
										      end: 250.0 @ 0;
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints position: 0 @ 50.0 ];
						    yourself).
					   (BlElement new
						    id: #medium;
						    background: blpaintbackground3;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
							    constraints horizontal matchParent.
							    constraints position: 0 @ 25 ];
						    yourself).
					   (BlElement new
						    addChildren: { (BlElement new
								     id: #ballShadow;
								     background: (BlPaintBackground new
										      opacity: 1.0;
										      paint: (BlRadialGradientPaint new
												       stops: {
														       (0 -> (Color
																         r: 0.0
																         g: 0.0
																         b: 0.0
																         alpha: 0.4980392156862745)).
														       (0.5 -> (Color
																         r: 0.0
																         g: 0.0
																         b: 0.0
																         alpha: 0.4)).
														       (1.0 -> (Color
																         r: 0.0
																         g: 0.0
																         b: 0.0
																         alpha: 0.0)) };
												       innerCenter: 125 @ 50.0;
												       innerRadius: 0;
												       outerCenter: 125 @ 50.0;
												       outerRadius: 125;
												       yourself);
										      yourself);
								     layout: BlBasicLayout uniqueInstance;
								     constraintsDo: [ :constraints |
									     constraints horizontal exact: 250.0.
									     constraints vertical exact: 125.
									     constraints position: 69.0 @ -65.0 ];
								     yourself) };
						    id: #top;
						    background: (BlPaintBackground new
								     opacity: 1.0;
								     paint: (BlColorPaint new
										      color: (Color
												       r: 0.4115347018572825
												       g: 0.7644183773216031
												       b: 1.0
												       alpha: 1.0);
										      yourself);
								     yourself);
						    geometry: BlEllipseGeometry new;
						    layout: BlBasicLayout uniqueInstance;
						    constraintsDo: [ :constraints |
						    constraints horizontal matchParent ];
						    yourself) };
			   id: #table;
			   background: bltransparentbackground8;
			   geometry: BlRectangleGeometry new;
			   clipChildren: false;
			   layout: BlBasicLayout uniqueInstance;
			   constraintsDo: [ :constraints |
				   constraints horizontal exact: 250.0.
				   constraints vertical exact: 100.0.
				   constraints position: 274.0 @ 429 ];
			   yourself) } ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> signal [
<pyStash>
	^ [ "BlStashSerializer"
| blinsets1 blellipsegeometry2 |
blinsets1 := BlInsets all: 5.0.
blellipsegeometry2 := BlEllipseGeometry new.
{(BlElement new
   addChildren: {(BlElement new
         id: #B;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.4115347018572825 g: 0.2903225806451613 b: 0.2785923753665689 alpha: 1.0);
                     yourself);
               yourself);
         geometry: blellipsegeometry2;
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #C;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.4115347018572825 g: 0.38025415444770283 b: 0.2785923753665689 alpha: 1.0);
                     yourself);
               yourself);
         geometry: blellipsegeometry2;
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #D;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.2785923753665689 g: 0.4115347018572825 b: 0.3176930596285435 alpha: 1.0);
                     yourself);
               yourself);
         geometry: blellipsegeometry2;
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints margin: blinsets1 ];
         yourself)};
   id: #A;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6080156402737048 g: 0.6080156402737048 b: 0.6080156402737048 alpha: 1.0);
               yourself);
         yourself);
   geometry: (BlRoundedRectangleGeometry cornerRadius: 100);
   layout: (BlLinearLayout vertical
         alignNone;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal fitContent.
      constraints vertical fitContent.
      constraints position: 50 @ 50.
      constraints padding: blinsets1 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> signal_green [
<pyStash>
	^ [ "BlStashSerializer"
| blinsets1 blellipsegeometry2 |
blinsets1 := BlInsets all: 5.0.
blellipsegeometry2 := BlEllipseGeometry new.
{(BlElement new
   addChildren: {(BlElement new
         id: #B;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.4115347018572825 g: 0.2903225806451613 b: 0.2785923753665689 alpha: 1.0);
                     yourself);
               yourself);
         geometry: blellipsegeometry2;
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #C;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.4115347018572825 g: 0.38025415444770283 b: 0.2785923753665689 alpha: 1.0);
                     yourself);
               yourself);
         geometry: blellipsegeometry2;
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #D;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.02737047898338221 g: 0.9217986314760508 b: 0.20821114369501467 alpha: 1.0);
                     yourself);
               yourself);
         geometry: blellipsegeometry2;
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints margin: blinsets1 ];
         yourself)};
   id: #A;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6080156402737048 g: 0.6080156402737048 b: 0.6080156402737048 alpha: 1.0);
               yourself);
         yourself);
   geometry: (BlRoundedRectangleGeometry cornerRadius: 100);
   layout: (BlLinearLayout vertical
         alignNone;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal fitContent.
      constraints vertical fitContent.
      constraints position: 50 @ 50.
      constraints padding: blinsets1 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> simpleFlowLayout [
<pyStash>
	^ [ "BlStashSerializer"
| blinsets1 |
blinsets1 := BlInsets all: 5.0.
{(BlElement new
   addChildren: {(BlElement new
         id: #B;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.6764418377321603 g: 0.7908113391984359 b: 0.9726295210166178 alpha: 1.0);
                     yourself);
               yourself);
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
            constraints vertical exact: 100.0.
            constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #C;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.2482893450635386 g: 0.6451612903225806 b: 0.6148582600195504 alpha: 1.0);
                     yourself);
               yourself);
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
            constraints vertical exact: 100.0.
            constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #D;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.8983382209188661 g: 0.3128054740957967 b: 0.5053763440860215 alpha: 1.0);
                     yourself);
               yourself);
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
            constraints vertical exact: 100.0.
            constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #E;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.15640273704789834 g: 0.20625610948191594 b: 0.7223851417399805 alpha: 1.0);
                     yourself);
               yourself);
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
            constraints vertical exact: 100.0.
            constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #F;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.8778103616813294 g: 0.83088954056696 b: 0.4868035190615836 alpha: 1.0);
                     yourself);
               yourself);
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
            constraints vertical exact: 100.0.
            constraints margin: blinsets1 ];
         yourself) . 
      (BlElement new
         id: #G;
         background: (BlPaintBackground new
               opacity: 1.0;
               paint: (BlColorPaint new
                     color: (Color r: 0.16911045943304007 g: 0.5141739980449658 b: 0.7429130009775171 alpha: 1.0);
                     yourself);
               yourself);
         layout: BlBasicLayout uniqueInstance;
         constraintsDo: [:constraints |  constraints horizontal exact: 100.0.
            constraints vertical exact: 100.0.
            constraints margin: blinsets1 ];
         yourself)};
   id: #A;
   background: (BlTransparentBackground new
         opacity: 1.0;
         yourself);
   clipChildren: false;
   layout: (BlFlowLayout horizontal
         alignTopLeft;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal fitContent.
      constraints vertical fitContent ];
   yourself)}
	] value
]

{ #category : #'see class side' }
PyramidSimpleExamples >> seeClassSide [ 
]
