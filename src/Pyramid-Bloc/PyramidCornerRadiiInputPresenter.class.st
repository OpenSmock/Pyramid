Class {
	#name : #PyramidCornerRadiiInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'inputArray',
		'whenValueChangedDo'
	],
	#category : 'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidCornerRadiiInputPresenter >> applyStrings [

	self inputArray strings: self strings
]

{ #category : #'as yet unclassified' }
PyramidCornerRadiiInputPresenter >> cornerRadiiFrom: anArray [

	anArray isCollection ifFalse: [ ^ anArray ].
	anArray size = 1 ifTrue: [ ^ BlCornerRadii radius: anArray first ].
	anArray size = 2 ifTrue: [
		^ BlCornerRadii new
			  topLeft: anArray first;
			  topRight: anArray last;
			  bottomRight: anArray first;
			  bottomLeft: anArray last;
			  yourself ].
	anArray size = 4 ifTrue: [
		^ BlCornerRadii new
			  topLeft: anArray first;
			  topRight: anArray second;
			  bottomRight: anArray third;
			  bottomLeft: anArray last;
			yourself ].
	^ PyramidUnknowState new
]

{ #category : #layout }
PyramidCornerRadiiInputPresenter >> defaultLayout [

^ SpBoxLayout newHorizontal add: self inputArray; yourself
]

{ #category : #initialization }
PyramidCornerRadiiInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :insets |  ].
	inputArray := PyramidNumberArrayInputPresenter new
		              whenValueChangedDo: [ :array |
		              self whenValueChangedDo value:
			              (self cornerRadiiFrom: array) ]
]

{ #category : #layout }
PyramidCornerRadiiInputPresenter >> inputArray [

	^ inputArray
]

{ #category : #'as yet unclassified' }
PyramidCornerRadiiInputPresenter >> value [

	^ self cornerRadiiFrom: self inputArray value
]

{ #category : #'as yet unclassified' }
PyramidCornerRadiiInputPresenter >> value: aBlCornerRadii [

	aBlCornerRadii setCornerRadiiOn: self
]

{ #category : #initialization }
PyramidCornerRadiiInputPresenter >> whenValueChangedDo [

	^	whenValueChangedDo
]

{ #category : #initialization }
PyramidCornerRadiiInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
