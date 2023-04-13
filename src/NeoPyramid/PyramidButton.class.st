Class {
	#name : #PyramidButton,
	#superclass : #PyramidVisualElement,
	#instVars : [
		'icon',
		'align',
		'callback'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidButton class >> random [
	| loremIpsumWords |
	loremIpsumWords := String loremIpsum substrings.
	^ self new
		  icon: Smalltalk ui icons icons atRandom
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

{ #category : #converting }
PyramidButton >> asSpecButtonFor: anObject [

	^ SpButtonPresenter new
		  icon: self icon;
		  action: self callback;
		  yourself
]

{ #category : #accessing }
PyramidButton >> callback [

	^ callback
]

{ #category : #accessing }
PyramidButton >> callback: anObject [

	callback := anObject
]

{ #category : #accessing }
PyramidButton >> icon [

	^ icon
]

{ #category : #accessing }
PyramidButton >> icon: anObject [

	icon := anObject
]
