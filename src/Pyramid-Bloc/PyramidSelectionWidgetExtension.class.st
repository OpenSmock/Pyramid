Class {
	#name : #PyramidSelectionWidgetExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension + TPyramidProjectModelObserver + TPyramidEditorTransformationObserver',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait + TPyramidProjectModelObserver classTrait + TPyramidEditorTransformationObserver classTrait',
	#instVars : [
		'projectModel',
		'widgetElement',
		'commandExecutor',
		'isDragging',
		'dragOrigin'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> alphaFactor [

	^ 0.5
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> centerDragEnd: anEvent [

	anEvent consumed: true.
	self isDragging: false.
	self usePositionOffsetCommand: anEvent position - self dragOrigin.
	self widgetElement transformDo: [ :t | t translateBy: 0 @ 0 ].
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> centerDragEvent: anEvent [

	self isDragging ifFalse: [ ^ self ].
	anEvent primaryButtonPressed ifFalse: [
		self centerDragEnd: anEvent.
		^ self ].
	self widgetElement transformDo: [ :t |
		t translateBy: anEvent position - self dragOrigin ].
	anEvent consumed: true
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> centerDragStart: anEvent [

	self isDragging: true.
	self dragOrigin: anEvent position.
	anEvent consumed: true
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> commandExecutor: anObject [

	commandExecutor := anObject
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> dragOrigin [

	^ dragOrigin
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> editor: aPyramidEditor [

	self commandExecutor: aPyramidEditor propertiesManager commandExecutor
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> informTransformationChanged [

	self widgetElement position: self currentTransformTranslation  
]

{ #category : #initialization }
PyramidSelectionWidgetExtension >> initialize [

	widgetElement := BlElement new
		                 clipChildren: false;
		                 zIndex: 1;
		                 yourself.
	dragOrigin := 0 @ 0.
	isDragging := false
]

{ #category : #displaying }
PyramidSelectionWidgetExtension >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addTransformationObserver: self.
	self elementAtWidgets addChild: self widgetElement
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> isDragging [

	^ isDragging
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> isDragging: anObject [

	isDragging := anObject
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> makeMonoSelectionFor: aBlElement [

	| monoSelection formElement |
	aBlElement requestParentLayout.
	aBlElement computeLayout.

	formElement := (aBlElement exportAsForm collectColors: [ :color |
		                | l |
		                l := color luminance.
		                Color
			                r: color red
			                g: color green
			                b: color blue
			                alpha: (color alpha min: self alphaFactor) ])
		               asElement.

	monoSelection := BlElement new
		                 border: (BlBorderBuilder new
				                  width: 1;
				                  paint: Color black;
				                  build);
		                 size: aBlElement size + (self offset * 2) asPoint;
		                 position: aBlElement position - self offset asPoint;
		                 yourself.
	monoSelection addChild: (formElement
			 position: self offset asPoint;
			 yourself).

	formElement
		when: BlPrimaryMouseDownEvent
		do: [ :evt | self centerDragStart: evt ].
	formElement
		when: BlMouseEvent
		do: [ :evt | self centerDragEvent: evt ].
	formElement
		when: BlPrimaryMouseUpEvent
		do: [ :evt | self centerDragEnd: evt ].

	^ monoSelection
]

{ #category : #removing }
PyramidSelectionWidgetExtension >> makeNewSelection [

	self projectModel selection do: [ :each |
		self widgetElement addChild: (self makeMonoSelectionFor: each) ]
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> offset [
	^ 10
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> projectModel: aProjectModel [

	projectModel := aProjectModel.
	projectModel addObserver: self.
	self makeNewSelection.
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> pyramidSelectionChanged [

	self removeSelection.
	self makeNewSelection.
]

{ #category : #removing }
PyramidSelectionWidgetExtension >> removeSelection [

	self widgetElement removeChildren.
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> usePositionOffsetCommand: aPosition [

	self commandExecutor
		use: PyramidPositionOffsetCommand new
		on: self projectModel selection asArray
		with: aPosition
]

{ #category : #removing }
PyramidSelectionWidgetExtension >> widgetElement [

	^ widgetElement
]
