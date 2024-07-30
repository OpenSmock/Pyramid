Class {
	#name : #PyramidToploExamples,
	#superclass : #Object,
	#category : #'Pyramid-Toplo-Examples'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidToploExamples class >> buttons [
<pyStash>
	^ [ "BlStashSerializer"
| blinsets1 point2 blinsets3 blfontfamilydefaultattribute4 blframelayout5 blcolorpaint6 blborder7 blfontweightattribute8 blcolorpaint9 blcolorpaint10 bllinearlayout11 bllinearlayout12 blroundedrectanglegeometry13 blborder14 blcolorpaint15 blborder16 blpaintbackground17 albtextparagraphlinespacingattribute18 blpaintbackground19 blpaintbackground20 blfontsizedefaultattribute21 |
blinsets1 := BlInsets top: 4.0 right: 7.5 bottom: 4.0 left: 7.5.
point2 := Point new.
blinsets3 := BlInsets all: 5.0.
blfontfamilydefaultattribute4 := BlFontFamilyDefaultAttribute new.
blframelayout5 := BlFrameLayout new.
blcolorpaint6 := BlColorPaint new.
blborder7 := BlBorderBuilder new.
blfontweightattribute8 := BlFontWeightAttribute new.
blcolorpaint9 := BlColorPaint new.
blcolorpaint10 := BlColorPaint new.
bllinearlayout11 := BlLinearLayout horizontal.
bllinearlayout12 := BlLinearLayout horizontal.
blroundedrectanglegeometry13 := BlRoundedRectangleGeometry cornerRadius: 6.
blborder14 := BlBorderBuilder new.
blcolorpaint15 := BlColorPaint new.
blborder16 := BlBorderBuilder new.
blpaintbackground17 := BlPaintBackground new.
albtextparagraphlinespacingattribute18 := AlbTextParagraphLineSpacingAttribute new.
blpaintbackground19 := BlPaintBackground new.
blpaintbackground20 := BlPaintBackground new.
blfontsizedefaultattribute21 := BlFontSizeDefaultAttribute new.
{(ToElement new
   addChildren: {(BlElement new
         addChildren: {(ToButton new
               id: #buttonA;
               background: (BlPaintBackground new
                     opacity: 1.0;
                     paint: (blcolorpaint6
                           color: (Color r: 0.08602150537634409 g: 0.4662756598240469 b: 1.0 alpha: 1.0);
                           yourself);
                     yourself);
               border: (BlBorderBuilder new
                     paint: blcolorpaint6;
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: (bllinearlayout11
                     alignNone;
                     yourself);
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {(blfontweightattribute8
                                       weight: 600;
                                       yourself) . 
                                    (blfontfamilydefaultattribute4
                                       name: 'SFMono-Regular';
                                       yourself) . 
                                    (blfontsizedefaultattribute21
                                       size: 14;
                                       yourself) . 
                                    albtextparagraphlinespacingattribute18 . 
                                    (BlTextForegroundAttribute new
                                       paint: (Color r: 1.0 g: 1.0 b: 1.0 alpha: 1.0);
                                       yourself)} rope: (BlCollectionRope new
                                       collection: 'Primary Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonB;
               background: (blpaintbackground17
                     opacity: 1.0;
                     paint: (BlColorPaint new
                           color: (Color r: 1.0 g: 1.0 b: 1.0 alpha: 1.0);
                           yourself);
                     yourself);
               border: (BlBorderBuilder new
                     paint: (blcolorpaint10
                           color: (Color r: 0.8514173998044966 g: 0.8514173998044966 b: 0.8514173998044966 alpha: 1.0);
                           yourself);
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    (BlTextForegroundAttribute new
                                       paint: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0);
                                       yourself)} rope: (BlCollectionRope new
                                       collection: 'Default Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonC;
               background: blpaintbackground17;
               border: (BlBorderBuilder new
                     paint: blcolorpaint10;
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     dashArray: {3 . 
                        3};
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Dashed Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonD;
               background: blpaintbackground17;
               border: (blborder16
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Text Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonE;
               background: blpaintbackground17;
               border: blborder16 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    (BlTextForegroundAttribute new
                                       paint: (Color r: 0.08602150537634409 g: 0.4662756598240469 b: 1.0 alpha: 1.0);
                                       yourself)} rope: (BlCollectionRope new
                                       collection: 'Link Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself)};
         layout: (bllinearlayout12
               alignNone;
               cellSpacing: 5.0;
               yourself);
         constraintsDo: [:constraints |  constraints horizontal fitContent.
            constraints vertical fitContent.
            constraints padding: blinsets3 ];
         yourself) . 
      (BlElement new
         addChildren: {(ToButton new
               id: #buttonA;
               background: (blpaintbackground20
                     opacity: 1.0;
                     paint: (BlColorPaint new
                           color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.0392156862745098);
                           yourself);
                     yourself);
               border: (blborder14
                     paint: (blcolorpaint9
                           color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.2);
                           yourself);
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    (BlTextForegroundAttribute new
                                       paint: (Color r: 0.624633431085044 g: 0.624633431085044 b: 0.624633431085044 alpha: 1.0);
                                       yourself)} rope: (BlCollectionRope new
                                       collection: 'Primary Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonB;
               background: blpaintbackground20;
               border: blborder14 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Default Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonC;
               background: blpaintbackground20;
               border: (BlBorderBuilder new
                     paint: blcolorpaint9;
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     dashArray: {3 . 
                        3};
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Dashed Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonD;
               background: (blpaintbackground19
                     opacity: 1.0;
                     paint: (BlColorPaint new
                           color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 0.0);
                           yourself);
                     yourself);
               border: blborder16 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Text Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonE;
               background: blpaintbackground19;
               border: blborder16 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Link Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself)};
         layout: bllinearlayout12;
         constraintsDo: [:constraints |  constraints horizontal fitContent.
            constraints vertical fitContent.
            constraints padding: blinsets3 ];
         yourself) . 
      (BlElement new
         addChildren: {(ToButton new
               id: #buttonA;
               background: (BlPaintBackground new
                     opacity: 1.0;
                     paint: (blcolorpaint15
                           color: (Color r: 1.0 g: 0.3020527859237537 b: 0.3098729227761486 alpha: 1.0);
                           yourself);
                     yourself);
               border: (blborder7
                     paint: blcolorpaint15;
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Primary Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonB;
               background: blpaintbackground17;
               border: blborder7 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    (BlTextForegroundAttribute new
                                       paint: (Color r: 1.0 g: 0.3020527859237537 b: 0.3098729227761486 alpha: 1.0);
                                       yourself)} rope: (BlCollectionRope new
                                       collection: 'Default Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonC;
               background: blpaintbackground17;
               border: (BlBorderBuilder new
                     paint: blcolorpaint15;
                     lineCap: BlStrokeLineCap butt;
                     lineJoin: BlStrokeLineJoin miter;
                     dashArray: {3 . 
                        3};
                     build);
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Dashed Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonD;
               background: blpaintbackground17;
               border: blborder16 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Text Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself) . 
            (ToButton new
               id: #buttonE;
               background: blpaintbackground17;
               border: blborder16 build;
               geometry: blroundedrectanglegeometry13;
               layout: bllinearlayout11;
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical exact: 32.0.
                  constraints padding: blinsets1 ];
               beHorizontal;
               flexible: false;
               icon: nil;
               iconContainerHeight: 0.0;
               iconContainerWidth: 0.0;
               label: (ToLabel new
                     layout: blframelayout5;
                     constraintsDo: [:constraints |  constraints horizontal fitContent.
                        constraints vertical fitContent ];
                     text: (BlRopedText new
                           rope: (BlAttributeRope attributes: {blfontweightattribute8 . 
                                    blfontfamilydefaultattribute4 . 
                                    blfontsizedefaultattribute21 . 
                                    albtextparagraphlinespacingattribute18 . 
                                    BlTextForegroundAttribute new} rope: (BlCollectionRope new
                                       collection: 'Link Button';
                                       yourself));
                           yourself);
                     yourself);
               yourself)};
         layout: bllinearlayout12;
         constraintsDo: [:constraints |  constraints horizontal fitContent.
            constraints vertical fitContent.
            constraints padding: blinsets3 ];
         yourself)};
   id: #themeSandBox;
   layout: (BlFlowLayout vertical
         alignTopLeft;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal fitContent.
      constraints vertical fitContent.
      constraints padding: blinsets3 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidToploExamples class >> icons [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-07-30 18:24:19"

	<pyStash>
	^ [ | blsvgconverterclass1 toantdesigniconproviderclass2 |
blsvgconverterclass1 := BlSvgConverter.
toantdesigniconproviderclass2 := ToAntDesignIconProvider.
{(ToImage new
   innerImage: (PyramidExternalRessourceProxy new
         pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
               target: blsvgconverterclass1;
               selector: #convertFromString:;
               arguments: {(PyramidExternalRessourceProxy new
                     pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
                           target: toantdesigniconproviderclass2;
                           selector: #twotone_sound;
                           arguments: {};
                           yourself);
                     yourself)};
               yourself);
         yourself);
   constraintsDo: [:constraints |  constraints horizontal exact: 200.0.
      constraints vertical exact: 200.0 ];
   layout: BlFrameLayout new;
   id: #A;
   yourself) . 
(ToImage new
   innerImage: (PyramidExternalRessourceProxy new
         pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
               target: blsvgconverterclass1;
               selector: #convertFromString:;
               arguments: {(PyramidExternalRessourceProxy new
                     pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
                           target: toantdesigniconproviderclass2;
                           selector: #outlined_code;
                           arguments: {};
                           yourself);
                     yourself)};
               yourself);
         yourself);
   constraintsDo: [:constraints |  constraints horizontal exact: 48.0.
      constraints vertical exact: 48.0 ];
   layout: BlFrameLayout new;
   id: #B;
   yourself)} ] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidToploExamples class >> icons2 [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-07-30 18:25:18"

	<pyStash>
	^ [ {(ToImage new
   innerImage: (PyramidExternalRessourceProxy new
         pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
               target: BlSvgConverter;
               selector: #convertFromString:;
               arguments: {(PyramidExternalRessourceProxy new
                     pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
                           target: ToMaterialDesignIconProvider;
                           selector: #round_timelapse;
                           arguments: {};
                           yourself);
                     yourself)};
               yourself);
         yourself);
   constraintsDo: [:constraints |  constraints horizontal exact: 200.0.
      constraints vertical exact: 200.0 ];
   layout: BlFrameLayout new;
   id: #A;
   yourself)} ] value
]
