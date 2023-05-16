Class {
	#name : #PyramidBlocWindowForLayoutLayer,
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
PyramidBlocWindowForLayoutLayer >> builder: aPyramidSpaceBuilder [

	aPyramidSpaceBuilder space
		when: BlSpaceResizedEvent
		do: [ :evt | self spaceResized: evt extent ].
	self space: aPyramidSpaceBuilder space
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> closeButton [
^ closeButton
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> extent [

	extent ifNil: [ extent := 500 @ 300 ].
	^ extent
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> extent: aPoint [

	extent := aPoint.
	self canvas size: aPoint.
	self root size: self windowOffset + aPoint.
	self closeButton position: aPoint x - 44 @ 0
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> iconElement [
^ iconElement
]

{ #category : #initialization }
PyramidBlocWindowForLayoutLayer >> initialize [

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
PyramidBlocWindowForLayoutLayer >> isFullScreenModeEnabled [
^ isFullScreenModeEnabled
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> isFullScreenModeEnabled: aBoolean [

	isFullScreenModeEnabled := aBoolean.
	aBoolean ifTrue: [ self spaceResized: self space extent ].
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> space [
^ space
]

{ #category : #accessing }
PyramidBlocWindowForLayoutLayer >> space: anObject [

	space := anObject 
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutLayer >> spaceResized: anExtent [

	self isFullScreenModeEnabled ifTrue: [ self extent: anExtent - self windowOffset]
]

{ #category : #'as yet unclassified' }
PyramidBlocWindowForLayoutLayer >> windowOffset [

	^ 0@22
]
