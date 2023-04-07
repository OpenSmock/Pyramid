Class {
	#name : #PyramidButton,
	#superclass : #Object,
	#instVars : [
		'icon',
		'title',
		'presenter',
		'align'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidButton class >> random [
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
PyramidButton >> align [

	align ifNil: [ self align: PyramidButtonElementAlignementStart new ].
	^ align
]

{ #category : #accessing }
PyramidButton >> align: anAlign [

	align := anAlign
]

{ #category : #'as yet unclassified' }
PyramidButton >> alignCenter [

	self align: PyramidButtonElementAlignement center
]

{ #category : #'as yet unclassified' }
PyramidButton >> alignEnd [

	self align: PyramidButtonElementAlignement end
]

{ #category : #'as yet unclassified' }
PyramidButton >> alignStart [

	self align: PyramidButtonElementAlignement start
]

{ #category : #accessing }
PyramidButton >> icon [

	^ icon
]

{ #category : #accessing }
PyramidButton >> icon: anObject [

	icon := anObject
]

{ #category : #accessing }
PyramidButton >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidButton >> presenter: anObject [

	presenter := anObject
]

{ #category : #accessing }
PyramidButton >> title [

	^ title
]

{ #category : #accessing }
PyramidButton >> title: anObject [

	title := anObject
]
