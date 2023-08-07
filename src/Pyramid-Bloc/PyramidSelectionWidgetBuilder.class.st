Class {
	#name : #PyramidSelectionWidgetBuilder,
	#superclass : #Object,
	#instVars : [
		'target',
		'element'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBuilder class >> target: aTarget [

	^ self new
		  target: aTarget;
		  build
]

{ #category : #building }
PyramidSelectionWidgetBuilder >> build [

	self element size: self target requestedSize.
	self element position: self target positionInSpace.
	^ self element
]

{ #category : #accessing }
PyramidSelectionWidgetBuilder >> element [

	^ element
]

{ #category : #initialization }
PyramidSelectionWidgetBuilder >> initialize [

	element := BlElement new
		           border: (BlBorder paint: Color red width: 3);
		clipChildren: false;
		           yourself
]

{ #category : #accessing }
PyramidSelectionWidgetBuilder >> target [

	^ target
]

{ #category : #accessing }
PyramidSelectionWidgetBuilder >> target: anObject [

	target := anObject
]
