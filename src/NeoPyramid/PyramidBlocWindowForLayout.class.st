Class {
	#name : #PyramidBlocWindowForLayout,
	#superclass : #PyramidSpaceLayer,
	#instVars : [
		'extent',
		'iconElement',
		'closeButton',
		'isFullScreenModeEnabled',
		'space'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #accessing }
PyramidBlocWindowForLayout >> builder: aPyramidSpaceBuilder [

	aPyramidSpaceBuilder space
		when: BlSpaceResizedEvent
		do: [ :evt | self spaceResized: evt extent ].
	self space: aPyramidSpaceBuilder space
]

{ #category : #initialization }
PyramidBlocWindowForLayout >> closeButton [
^ closeButton
]

{ #category : #initialization }
PyramidBlocWindowForLayout >> extent [

	extent ifNil: [ extent := 500 @ 300 ].
	^ extent
]

{ #category : #initialization }
PyramidBlocWindowForLayout >> extent: aPoint [

	extent := aPoint.
	self canvas size: aPoint.
	self root size: self windowOffset + aPoint.
	self closeButton position: aPoint x - 44 @ 0
]

{ #category : #accessing }
PyramidBlocWindowForLayout >> iconElement [
^ iconElement
]

{ #category : #initialization }
PyramidBlocWindowForLayout >> initialize [

	isFullScreenModeEnabled := false.
	iconElement := BlElement new
		               size: 22 asPoint;
		               position: 3 asPoint;
		               background:
			               (BlBackground image:
					                (self iconNamed: #komitterNewSlice));
		               yourself.
	closeButton := BlElement new
		               size: 44 @ 22;
		               background: Color red;
		               position: self extent x - 44 @ 0;
		               yourself.
	self canvas
		size: self extent;
		position: self windowOffset;
		background: Color white;
		yourself.

	self root
		background: Color white darker;
		size: self windowOffset + self extent;
		addChild: iconElement;
		addChild: closeButton;
		yourself
]

{ #category : #accessing }
PyramidBlocWindowForLayout >> isFullScreenModeEnabled [
^ isFullScreenModeEnabled
]

{ #category : #accessing }
PyramidBlocWindowForLayout >> isFullScreenModeEnabled: aBoolean [

	isFullScreenModeEnabled := aBoolean.
	aBoolean ifTrue: [ self spaceResized: self space extent ].
]

{ #category : #accessing }
PyramidBlocWindowForLayout >> space [
^ space
]

{ #category : #accessing }
PyramidBlocWindowForLayout >> space: anObject [

	space := anObject 
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayout >> spaceResized: anExtent [

	self isFullScreenModeEnabled ifTrue: [ self extent: anExtent - self windowOffset]
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayout >> windowOffset [

	^ 0@22
]
