Class {
	#name : #PyramidMonoValueInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'value',
		'presenter'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #layout }
PyramidMonoValueInputPresenter >> defaultLayout [

	^ SpBoxLayout new add: self presenter; yourself
]

{ #category : #initialization }
PyramidMonoValueInputPresenter >> initializePresenters [

	presenter := SpNullPresenter new.
]

{ #category : #accessing }
PyramidMonoValueInputPresenter >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidMonoValueInputPresenter >> presenter: aPresenter [

	presenter := aPresenter.
	self layout: self defaultLayout
]

{ #category : #evaluating }
PyramidMonoValueInputPresenter >> value [

	^ value
]

{ #category : #evaluating }
PyramidMonoValueInputPresenter >> value: anObject [

	value := anObject
]
