Class {
	#name : #PyramidDrawOrderIcons,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocMoveBackward [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #B;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6862170087976539 g: 0.8357771260997068 b: 0.9804496578690127 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 1);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0.
      constraints position: 4 @ 4 ];
   yourself) . 
(BlElement new
   id: #A;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.9022482893450635 g: 0.9022482893450635 b: 0.9022482893450635 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 2);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocMoveForward [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #A;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.9022482893450635 g: 0.9022482893450635 b: 0.9022482893450635 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 0);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0 ];
   yourself) . 
(BlElement new
   id: #B;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6862170087976539 g: 0.8357771260997068 b: 0.9804496578690127 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 1);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0.
      constraints position: 4 @ 4 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocOnBackground [
<pyStash>
	^ [ "BlStashSerializer"
| blborder1 blpaintbackground2 |
blborder1 := BlBorderBuilder new.
blpaintbackground2 := BlPaintBackground new.
{(BlElement new
   id: #B;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6862170087976539 g: 0.8357771260997068 b: 0.9804496578690127 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 1);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 4 @ 4 ];
   yourself) . 
(BlElement new
   id: #A;
   background: (blpaintbackground2
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.9022482893450635 g: 0.9022482893450635 b: 0.9022482893450635 alpha: 1.0);
               yourself);
         yourself);
   border: (blborder1
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 2);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0 ];
   yourself) . 
(BlElement new
   id: #C;
   background: blpaintbackground2;
   border: blborder1 build;
   elevation: (BlRelativeElevation elevation: 2);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 8.0 @ 8.0 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocOnForeground [
<pyStash>
	^ [ "BlStashSerializer"
| blborder1 blpaintbackground2 |
blborder1 := BlBorderBuilder new.
blpaintbackground2 := BlPaintBackground new.
{(BlElement new
   id: #A;
   background: (blpaintbackground2
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.9022482893450635 g: 0.9022482893450635 b: 0.9022482893450635 alpha: 1.0);
               yourself);
         yourself);
   border: (blborder1
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0 ];
   yourself) . 
(BlElement new
   id: #C;
   background: blpaintbackground2;
   border: blborder1 build;
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 8.0 @ 8.0 ];
   yourself) . 
(BlElement new
   id: #B;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6862170087976539 g: 0.8357771260997068 b: 0.9804496578690127 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   elevation: (BlRelativeElevation elevation: 1);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 4 @ 4 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> formMoveBackward [

	^ (BlElement new
		   size: 16 @ 16;
		   addChildren: self blocMoveBackward materializeAsBlElement)
		  exportAsForm
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> formMoveForward [

	^ (BlElement new
		   size: 16 @ 16;
		   addChildren: self blocMoveForward materializeAsBlElement)
		  exportAsForm
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> formOnBackground [

	^ (BlElement new
		   size: 16 @ 16;
		   addChildren: self blocOnBackground materializeAsBlElement)
		  exportAsForm
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> formOnForeground [

	^ (BlElement new
		   size: 16 @ 16;
		   addChildren: self blocOnForeground materializeAsBlElement)
		  exportAsForm
]
