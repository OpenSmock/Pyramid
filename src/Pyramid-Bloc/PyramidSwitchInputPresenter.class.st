"
i can show and edit boolean.
i have a uncertain state. In uncertain state i can not be edited
"
Class {
	#name : #PyramidSwitchInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'button',
		'state',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidSwitchInputPresenter class >> blocToggleOff [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #background;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.9022482893450635 g: 0.9022482893450635 b: 0.9022482893450635 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.7839687194525904 g: 0.7839687194525904 b: 0.7839687194525904 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   geometry: (BlRoundedRectangleGeometry cornerRadius: 8.5);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 32.0.
      constraints vertical exact: 16.0 ];
   yourself) . 
(BlElement new
   id: #toggle;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         yourself);
   geometry: BlEllipseGeometry new;
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0.
      constraints position: 2 @ 2 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSwitchInputPresenter class >> blocToggleOn [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #background;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.6862170087976539 g: 0.8357771260997068 b: 0.9804496578690127 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.7839687194525904 g: 0.7839687194525904 b: 0.7839687194525904 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   geometry: (BlRoundedRectangleGeometry cornerRadius: 8.5);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 32.0.
      constraints vertical exact: 16.0 ];
   yourself) . 
(BlElement new
   id: #toggle;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         yourself);
   geometry: BlEllipseGeometry new;
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0.
      constraints position: 18 @ 2.0 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSwitchInputPresenter class >> blocToggleUncertain [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #background;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.8592375366568915 b: 0.260019550342131 alpha: 1.0);
               yourself);
         yourself);
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 0.7839687194525904 g: 0.7839687194525904 b: 0.7839687194525904 alpha: 1.0);
               yourself);
         lineCap: BlStrokeLineCap butt;
         lineJoin: BlStrokeLineJoin miter;
         build);
   geometry: (BlRoundedRectangleGeometry cornerRadius: 8.5);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 32.0.
      constraints vertical exact: 16.0 ];
   yourself) . 
(BlElement new
   id: #toggle;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.592375366568915 g: 0.592375366568915 b: 0.592375366568915 alpha: 1.0);
               yourself);
         yourself);
   geometry: BlEllipseGeometry new;
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 12.0.
      constraints vertical exact: 12.0.
      constraints position: 10.0 @ 2.0 ];
   yourself)}
	] value
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter class >> formToggleOff [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocToggleOff materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter class >> formToggleOn [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocToggleOn materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter class >> formToggleUncertain [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocToggleUncertain materializeAsBlElement)
		  exportAsForm
]

{ #category : #accessing }
PyramidSwitchInputPresenter class >> inputModelClass [

	^ PyramidSwitchInputModel
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> applyInputModel [

	self button help: self inputModel help.
	self button label: self inputModel offLabel
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> button [

	^ button
]

{ #category : #layout }
PyramidSwitchInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self button;
		  yourself
]

{ #category : #initialization }
PyramidSwitchInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :bool | ].
	state := false.
	button := SpButtonPresenter new
		          icon: self class formToggleOff;
		          action: [ self switchState ];
		          yourself
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> label: aString [

	self button label: aString
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> state [

	^ state
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> state: anObject [

	state := anObject
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> switchState [

	self value: self state not.
	self whenValueChangedDo value: self value
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> value [

	^ self state
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> value: aBoolean [

	self state = aBoolean ifTrue: [ ^ self ].
	(aBoolean == true or: [ aBoolean == false ]) ifTrue: [
		self state: aBoolean.
		self button action: [ self switchState ].
		aBoolean
			ifTrue: [
				self button icon: self class formToggleOn.
				self button label: self inputModel onLabel ]
			ifFalse: [
				self button icon: self class formToggleOff.
				self button label: self inputModel offLabel ].
		^ self ].
	self state: PyramidUnknowState new.
	self button icon: self class formToggleUncertain.
	self button label: self inputModel uncertainLabel.
	self button action: [  ]
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
