Class {
	#name : #PyramidInputWithModalPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'presenter',
		'button',
		'presenterModal',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #testing }
PyramidInputWithModalPresenter class >> isAbstract [

	^ self == PyramidInputWithModalPresenter
]

{ #category : #accessing }
PyramidInputWithModalPresenter class >> stringsClass [

	^ PyramidModalInputStrings
]

{ #category : #'as yet unclassified' }
PyramidInputWithModalPresenter >> applyStrings [

	self button help: self strings help
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

	whenValueChangedDo := [ :arg1 |  ].
	button := SpButtonPresenter new.
	button
		icon: (self iconNamed: #smallCogInitialState);
		action: [
			| dialog window |
			window := self presenterModal asModalWindow.
			window title: self strings windowTitle.
			dialog := window open.
			dialog isOk ifTrue: [
					self whenValueChangedDo value: self presenterModal value ] ]
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

{ #category : #accessing }
PyramidInputWithModalPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidInputWithModalPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
