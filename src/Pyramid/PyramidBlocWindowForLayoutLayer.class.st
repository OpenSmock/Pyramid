Class {
	#name : #PyramidBlocWindowForLayoutLayer,
	#superclass : #PyramidSpaceLayer,
	#instVars : [
		'space',
		'presenter',
		'isFullScreen',
		'buttonWindowProperty'
	],
	#category : #'Pyramid-plugin-central'
}

{ #category : #adding }
PyramidBlocWindowForLayoutLayer >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #spaceToolbarBottom addItem: [ :builder |
		builder makeButtonWithIcon: self buttonWindowProperty order: 9998 ].
	aPyramidSimpleWindow
		at: #spaceToolbarBottom
		addItem: [ :builder | builder makeEmptyWith: [ :c | c height: 100 ] order: 9999 ]
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> buttonWindowProperty [

	^ buttonWindowProperty 
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> configureSpaceBuilder: aPyramidSpaceBuilder [

	aPyramidSpaceBuilder space
		when: BlSpaceResizedEvent
		do: [ :evt | self spaceResized: evt extent ].
	self space: aPyramidSpaceBuilder space
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> defaultExtent [

	^ 600 @ 400
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> extentCanvas: anExtent [
	"
	isFullScreen
	true: canvas size = anExtent ; position : 0 @ 0
	false: canvas size = anExtent ; position : windowoffset
	"
	| requestedExtent|
	requestedExtent := self isFullScreen ifTrue: [ self space extent ]
		ifFalse: [ anExtent ].

	self canvas size: requestedExtent.
	self root size: requestedExtent + self windowOffset.
	self isFullScreen
		ifTrue: [ self root position: self windowOffset * -1 ]
		ifFalse: [ self root position: 0 @ 0 ]
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> initialize [

	isFullScreen := false.
	presenter := PyramidBlocWindowForLayoutPresenter new
		             isFullScreen: self isFullScreen;
		             requestedExtent: self defaultExtent;
		             whenFullScreenChangedDo: [ :bool |
			             self isFullScreen: bool ];
		             whenExtentChangedDo: [ :point |
			             self extentCanvas: point ];
		             yourself.
	buttonWindowProperty := SpButtonPresenter new
		                        icon: (self iconNamed: #window);
		                        action: [
			                        (PyramidPopoverFactory
				                         makeWithPresenter: self presenter
				                         relativeTo: self buttonWindowProperty
				                         position: SpPopoverPosition right) popup ];
		                        yourself.

	self initializeBlocWindowLike.
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> initializeBlocWindowLike [

	| iconElement |
	iconElement := BlElement new
		               size: 22 asPoint;
		               position: 3 asPoint;
		               background:
			               (BlBackground image:
					                (self iconNamed: #komitterNewSlice));
		               yourself.
	self canvas
		size: self defaultExtent;
		position: self windowOffset;
		background: Color white;
		yourself.

	self root
		background: Color white darker;
		size: self windowOffset + self defaultExtent;
		addChild: iconElement;
		yourself
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> isFullScreen [

	^ isFullScreen
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> isFullScreen: aBoolean [

	isFullScreen := aBoolean.
	self extentCanvas: self presenter requestedExtent
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> presenter [
^ presenter
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> space [

	^ space
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> space: anObject [

	space := anObject.
	self presenter isFullScreenCheckbox state: true
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutLayer >> spaceResized: anExtent [

	self isFullScreen ifTrue: [ self extentCanvas: anExtent ]
	
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutLayer >> windowOffset [

	^ 0@22
]
