Class {
	#name : #PyramidPositionExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait',
	#instVars : [
		'display',
		'builder'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #accessing }
PyramidPositionExtension >> builder [

	^ builder
]

{ #category : #accessing }
PyramidPositionExtension >> builder: anObject [

	builder:= anObject
]

{ #category : #displaying }
PyramidPositionExtension >> currentTransformTranslation [

	| matrix |
	matrix := self elementAtTransforms transformation matrix.
	^ matrix x @ matrix y
]

{ #category : #accessing }
PyramidPositionExtension >> display [
^display
]

{ #category : #'as yet unclassified' }
PyramidPositionExtension >> elementAtDisplay [

	^ (self builder elementAt: #displays)
]

{ #category : #'as yet unclassified' }
PyramidPositionExtension >> elementAtEvents [

	^ self builder elementAt: #events
]

{ #category : #'as yet unclassified' }
PyramidPositionExtension >> elementAtTransforms [

	^ (self builder elementAt: #transforms)
]

{ #category : #initialization }
PyramidPositionExtension >> initialize [

	display := (0 @ 0) asRopedText asElement.
	display
		background: Color white;
		zIndex: 1;
		padding: (BlInsets all: 3).
]

{ #category : #displaying }
PyramidPositionExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtEvents when: BlMouseMoveEvent do: [ :evt |
		self display text:
			(evt position - self currentTransformTranslation) asRopedText ].
	self elementAtDisplay addChild: self display
]
