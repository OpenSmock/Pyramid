Class {
	#name : #PyramidInsetsInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'inputArray',
		'whenValueChangedDo'
	],
	#category : 'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> applyStrings [

	self inputArray strings: self strings.
]

{ #category : #layout }
PyramidInsetsInputPresenter >> defaultLayout [

^ SpBoxLayout newHorizontal add: self inputArray; yourself
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :insets | ].
	inputArray := PyramidNumberArrayInputPresenter new
		              whenValueChangedDo: [ :array |
		              self whenValueChangedDo value:
			              (self insetsFrom: array) ]
]

{ #category : #layout }
PyramidInsetsInputPresenter >> inputArray [

	^ inputArray
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> insetsFrom: anArray [

	anArray isCollection ifFalse: [ ^ anArray ].
	anArray size = 1 ifTrue: [ ^ BlInsets all: anArray first ].
	anArray size = 2 ifTrue: [ ^ BlInsets top: anArray first right: anArray last bottom: anArray first left: anArray last ].
	anArray size = 4 ifTrue: [ ^ BlInsets top: anArray first right: anArray second bottom: anArray third left: anArray last ].
	^ PyramidUnknowState new
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> value [

	^ self insetsFrom: self inputArray value
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenter >> value: aBlInsets [

	aBlInsets setInsetsOn: self
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> whenValueChangedDo [

	^	whenValueChangedDo
]

{ #category : #initialization }
PyramidInsetsInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
