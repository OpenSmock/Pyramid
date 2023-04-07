Class {
	#name : #PyramidTabElement,
	#superclass : #Object,
	#instVars : [
		'icon',
		'title',
		'presenter'
	],
	#category : #NeoPyramid
}

{ #category : #accessing }
PyramidTabElement class >> random [
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
PyramidTabElement >> icon [

	^ icon
]

{ #category : #accessing }
PyramidTabElement >> icon: anObject [

	icon := anObject
]

{ #category : #accessing }
PyramidTabElement >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidTabElement >> presenter: anObject [

	presenter := anObject
]

{ #category : #accessing }
PyramidTabElement >> title [

	^ title
]

{ #category : #accessing }
PyramidTabElement >> title: anObject [

	title := anObject
]
