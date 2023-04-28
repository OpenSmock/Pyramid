Class {
	#name : #PyramidTab,
	#superclass : #PyramidVisualElement,
	#instVars : [
		'icon',
		'title',
		'presenter'
	],
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #accessing }
PyramidTab class >> random [
	| loremIpsumWords |
	loremIpsumWords := String loremIpsum substrings.
	^ self new
		  icon: Smalltalk ui icons icons atRandom;
		  title: loremIpsumWords atRandom;
		  presenter: (SpMorphPresenter new
				   morph: (Morph new color: Color random);
				   yourself)
]

{ #category : #accessing }
PyramidTab >> icon [

	^ icon
]

{ #category : #accessing }
PyramidTab >> icon: anObject [

	icon := anObject
]

{ #category : #accessing }
PyramidTab >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidTab >> presenter: anObject [

	presenter := anObject
]

{ #category : #accessing }
PyramidTab >> title [

	^ title
]

{ #category : #accessing }
PyramidTab >> title: anObject [

	title := anObject
]
