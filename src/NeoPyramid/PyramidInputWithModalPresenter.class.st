Class {
	#name : #PyramidInputWithModalPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'presenter',
		'button',
		'presenterModal'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #testing }
PyramidInputWithModalPresenter class >> isAbstract [

	^ self == PyramidInputWithModalPresenter
]

{ #category : #accessing }
PyramidInputWithModalPresenter >> button [

	^ button
]

{ #category : #layout }
PyramidInputWithModalPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self presenter expand: true;
		  add: self button width: 24;
		  yourself
]

{ #category : #initialization }
PyramidInputWithModalPresenter >> initializePresenters [

	button := SpButtonPresenter new
		          icon: (self iconNamed: #smallCogInitialState);
		          action: [ self presenterModal openModal ];
		          yourself
]

{ #category : #accessing }
PyramidInputWithModalPresenter >> presenter [
	^ presenter
]

{ #category : #accessing }
PyramidInputWithModalPresenter >> presenter: anObject [

	presenter := anObject
]

{ #category : #accessing }
PyramidInputWithModalPresenter >> presenterModal [

	^ presenterModal
]

{ #category : #accessing }
PyramidInputWithModalPresenter >> presenterModal: anObject [

	presenterModal := anObject
]

{ #category : #'as yet unclassified' }
PyramidInputWithModalPresenter >> value [

	^ self presenterModal value
]

{ #category : #'as yet unclassified' }
PyramidInputWithModalPresenter >> value: anObject [

	self presenterModal value: anObject.
	self presenter value: anObject
]
