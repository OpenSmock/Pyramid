Class {
	#name : #PyramidDynamicResizer,
	#superclass : #Object,
	#instVars : [
		'pyramidSelectionWidgetExtension',
		'pyramidPositionExtension',
		'projectModel',
		'editor',
		'rightDynamicSize',
		'overlayElement',
		'moveEventRight',
		'bottomDynamicSize',
		'moveEventBottom',
		'resizeElementSize',
		'bottomAndRightDynamicSize',
		'moveEventBottomAndRight',
		'resizeElementColor',
		'minimumSizeForRightOrBottom',
		'currentTranslation',
		'positionOrigin',
		'minimumSizeForBottomAndRight',
		'resizeContainer'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #adding }
PyramidDynamicResizer >> createBottomAndRightResizerElement: aBlElement [

	| bottomAndRightResizer |
	bottomAndRightResizer := BlElement new.
	bottomAndRightResizer
		background: resizeElementColor;
		id: 'bottomAndRightResizer';
		extent: resizeElementSize;
		zIndex: 1005.
	bottomAndRightResizer constraintsDo: [ :c |
		c frame horizontal alignRight.
		c frame vertical alignBottom ].

	(aBlElement extent x < minimumSizeForBottomAndRight and: [
		 aBlElement extent y < minimumSizeForBottomAndRight ]) ifTrue: [
		bottomAndRightResizer extent: 0 @ 0 ].

	bottomAndRightResizer addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt |
				 aBlElement userData
					 at: #pyramidPreviousDynamicResize
					 put: aBlElement extent.
				 self positionOrigin: aBlElement position.
				 pyramidSelectionWidgetExtension elementAtEvents addEventHandler:
					 moveEventBottomAndRight.
				 evt consumed: true ]).

	^ bottomAndRightResizer
]

{ #category : #adding }
PyramidDynamicResizer >> createBottomResizerElement: aBlElement [

	| bottomResizer |
	bottomResizer := BlElement new.
	bottomResizer
		background: resizeElementColor;
		id: 'bottomResizer';
		extent: resizeElementSize;
		zIndex: 1005.
	bottomResizer constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignBottom ].

	aBlElement extent x < minimumSizeForRightOrBottom ifTrue: [
		bottomResizer extent: 0 @ 0 ].

	bottomResizer addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt |
				 aBlElement userData
					 at: #pyramidPreviousDynamicResize
					 put: aBlElement extent.
				 self positionOrigin: aBlElement position.
				 pyramidSelectionWidgetExtension elementAtEvents addEventHandler:
					 moveEventBottom.
				 evt consumed: true ]).

	^ bottomResizer
]

{ #category : #adding }
PyramidDynamicResizer >> createRightResizerElement: aBlElement [

	| rightResizer |
	rightResizer := BlElement new.
	rightResizer
		background: resizeElementColor;
		id: 'rightResizer';
		extent: resizeElementSize;
		zIndex: 1005.
	rightResizer constraintsDo: [ :c |
		c frame horizontal alignRight.
		c frame vertical alignCenter ].

	aBlElement extent y < minimumSizeForRightOrBottom ifTrue: [
		rightResizer extent: 0 @ 0 ].

	rightResizer addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt |
				 aBlElement userData
					 at: #pyramidPreviousDynamicResize
					 put: aBlElement extent.
				 self positionOrigin: aBlElement position.
				 pyramidSelectionWidgetExtension elementAtEvents addEventHandler:
					 moveEventRight.
				 evt consumed: true ]).

	^ rightResizer
]

{ #category : #accessing }
PyramidDynamicResizer >> currentTranslation [

	^ currentTranslation
]

{ #category : #accessing }
PyramidDynamicResizer >> currentTranslation: aPosition [

	currentTranslation := ((aPosition + pyramidSelectionWidgetExtension movingForGrid) / pyramidSelectionWidgetExtension movingLap) rounded * pyramidSelectionWidgetExtension movingLap
]

{ #category : #accessing }
PyramidDynamicResizer >> defaultResizeElementSize [

	^ 8@8
]

{ #category : #adding }
PyramidDynamicResizer >> dynamicResizer: eventElement originElement: aBlElement [

	resizeContainer := BlElement new.
	resizeContainer
		id: 'dynamicResizer';
		clipChildren: false;
		zIndex: 1001.
	resizeContainer layout: BlFrameLayout new.
	resizeContainer constraints horizontal matchParent.
	resizeContainer constraints vertical matchParent.
	resizeContainer clipChildren: false.

	moveEventRight := self moveSpaceEventRight: aBlElement.
	rightDynamicSize := self createRightResizerElement: aBlElement.

	moveEventBottom := self moveSpaceEventBottom: aBlElement.
	bottomDynamicSize := self createBottomResizerElement: aBlElement.

	moveEventBottomAndRight := self moveSpaceEventBottomAndRight: aBlElement.
	bottomAndRightDynamicSize := self createBottomAndRightResizerElement: aBlElement.

	resizeContainer addChild: rightDynamicSize.
	resizeContainer addChild: bottomDynamicSize.
	resizeContainer addChild: bottomAndRightDynamicSize.

	eventElement addChild: resizeContainer
]

{ #category : #accessing }
PyramidDynamicResizer >> editor [

	^ editor
]

{ #category : #accessing }
PyramidDynamicResizer >> editor: aPyramidEditor [
	
	editor := aPyramidEditor.
	
]

{ #category : #initialization }
PyramidDynamicResizer >> initialize [ 
	
	"8@8"
	resizeElementSize := self defaultResizeElementSize.
	resizeElementColor := Color black.
	minimumSizeForRightOrBottom := 50.
	minimumSizeForBottomAndRight := 15
]

{ #category : #actions }
PyramidDynamicResizer >> installOnDynamicResizer: aEventElement [

	| originBlElement |
	self projectModel selection size = 1 ifFalse: [ ^ self ].

	originBlElement := self projectModel selection first.
	
	self dynamicResizer: aEventElement originElement: originBlElement
]

{ #category : #'event creation' }
PyramidDynamicResizer >> moveSpaceEventBottom: aBlElement [

	^ BlEventHandler
		  on: BlMouseMoveEvent
		  do: [ :evt |
			  evt primaryButtonPressed
				  ifFalse: [
					  evt consumed: true.
					  self resizeCommand: aBlElement with: aBlElement extent.
					  aBlElement userData removeKey: #pyramidPreviousDynamicResize.
					  pyramidSelectionWidgetExtension elementAtEvents
						  removeEventHandler: moveEventBottom ]
				  ifTrue: [
					  pyramidSelectionWidgetExtension movingForGrid:
						  aBlElement position.
					  self currentTranslation:
						  pyramidPositionExtension position - self positionOrigin.
					  aBlElement extent:
						  aBlElement extent x @ (self currentTranslation y
						   - pyramidSelectionWidgetExtension movingForGrid y).
					  aBlElement extent y < minimumSizeForRightOrBottom
						  ifTrue: [ rightDynamicSize extent: 0 @ 0 ]
						  ifFalse: [ rightDynamicSize extent: resizeElementSize ] ] ]
]

{ #category : #'event creation' }
PyramidDynamicResizer >> moveSpaceEventBottomAndRight: aBlElement [

	^ BlEventHandler
		  on: BlMouseMoveEvent
		  do: [ :evt |
			  evt primaryButtonPressed
				  ifFalse: [
					  evt consumed: true.
					  self resizeCommand: aBlElement with: aBlElement extent.
					  aBlElement userData removeKey: #pyramidPreviousDynamicResize.
					  pyramidSelectionWidgetExtension elementAtEvents
						  removeEventHandler: moveEventBottomAndRight ]
				  ifTrue: [
					  pyramidSelectionWidgetExtension movingForGrid:
						  aBlElement position.
					  self currentTranslation:
						  pyramidPositionExtension position - self positionOrigin.
					  aBlElement extent: self currentTranslation x
						  - pyramidSelectionWidgetExtension movingForGrid x
						  @ (self currentTranslation y
							   - pyramidSelectionWidgetExtension movingForGrid y).
					  aBlElement extent y < minimumSizeForRightOrBottom
						  ifTrue: [ rightDynamicSize extent: 0 @ 0 ]
						  ifFalse: [ rightDynamicSize extent: resizeElementSize ].
					  aBlElement extent x < minimumSizeForRightOrBottom
						  ifTrue: [ bottomDynamicSize extent: 0 @ 0 ]
						  ifFalse: [ bottomDynamicSize extent: resizeElementSize ].
					  (aBlElement extent x < minimumSizeForBottomAndRight and: [
						   aBlElement extent y < minimumSizeForBottomAndRight ])
						  ifTrue: [ bottomAndRightDynamicSize extent: 0 @ 0 ]
						  ifFalse: [
						  bottomAndRightDynamicSize extent: resizeElementSize ] ] ]
]

{ #category : #'event creation' }
PyramidDynamicResizer >> moveSpaceEventRight: aBlElement [

	^ BlEventHandler
		  on: BlMouseMoveEvent
		  do: [ :evt |
			  evt primaryButtonPressed
				  ifFalse: [
					  evt consumed: true.
					  self resizeCommand: aBlElement with: aBlElement extent.
					  aBlElement userData removeKey: #pyramidPreviousDynamicResize.
					  pyramidSelectionWidgetExtension elementAtEvents
						  removeEventHandler: moveEventRight ]
				  ifTrue: [
					  pyramidSelectionWidgetExtension movingForGrid:
						  aBlElement position.
					  self currentTranslation:
						  pyramidPositionExtension position - self positionOrigin.
					  aBlElement extent: self currentTranslation x
						  - pyramidSelectionWidgetExtension movingForGrid x
						  @ aBlElement extent y.
					  aBlElement extent x < minimumSizeForRightOrBottom
						  ifTrue: [ bottomDynamicSize extent: 0 @ 0 ]
						  ifFalse: [ bottomDynamicSize extent: resizeElementSize ] ] ]
]

{ #category : #'accessing - classes' }
PyramidDynamicResizer >> pluginFromPyramid: aPyramidEditor [

	| spacePlugin listOfSpaceExtension pyramidSelectionWidgetExtensionSet pyramidPositionExtensionSet |
	
	spacePlugin := aPyramidEditor findPlugin: PyramidSpacePlugin.
		
	listOfSpaceExtension := spacePlugin builder extensions.

	pyramidSelectionWidgetExtensionSet := listOfSpaceExtension select: [
		                                      :extensions |
		                                      extensions isKindOf:
			                                      PyramidSelectionWidgetExtension ].
	pyramidSelectionWidgetExtensionSet size = 1 ifFalse: [ ^ self ].

	pyramidSelectionWidgetExtension := pyramidSelectionWidgetExtensionSet
		                                   asArray first.

	pyramidPositionExtensionSet := listOfSpaceExtension select: [
		                               :extensions |
		                               extensions isKindOf:
			                               PyramidPositionExtension ].
	pyramidPositionExtensionSet size = 1 ifFalse: [ ^ self ].

	pyramidPositionExtension := pyramidPositionExtensionSet asArray first
]

{ #category : #accessing }
PyramidDynamicResizer >> positionOrigin [

	^ positionOrigin
]

{ #category : #accessing }
PyramidDynamicResizer >> positionOrigin: aPosition [

	positionOrigin := aPosition
]

{ #category : #accessing }
PyramidDynamicResizer >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidDynamicResizer >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel
]

{ #category : #commands }
PyramidDynamicResizer >> resizeCommand: aBlElement with: aSize [

	self editor commandExecutor
		use: PyramidDynamicResizeCommand new
		on: {aBlElement}
		with: aSize

]

{ #category : #accessing }
PyramidDynamicResizer >> resizeElementSize [

	^ resizeElementSize
]

{ #category : #accessing }
PyramidDynamicResizer >> resizeElementSize: aSize [

	resizeElementSize := aSize.
	rightDynamicSize extent: aSize.
	bottomDynamicSize extent: aSize.
	bottomAndRightDynamicSize extent: aSize
]

{ #category : #connecting }
PyramidDynamicResizer >> setupExtension: aPyramidEditor [

	self pluginFromPyramid: aPyramidEditor.
	
	self projectModel: aPyramidEditor projectModel.
	
	self editor: aPyramidEditor.
]
