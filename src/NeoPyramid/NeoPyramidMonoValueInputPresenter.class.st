Class {
	#name : #NeoPyramidMonoValueInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'value',
		'presenter'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #layout }
NeoPyramidMonoValueInputPresenter >> defaultLayout [

	^ SpBoxLayout new add: self presenter; yourself
]

{ #category : #initialization }
NeoPyramidMonoValueInputPresenter >> initializePresenters [

	presenter := SpNullPresenter new.
]

{ #category : #accessing }
NeoPyramidMonoValueInputPresenter >> presenter [

	^ presenter
]

{ #category : #accessing }
NeoPyramidMonoValueInputPresenter >> presenter: aPresenter [

	presenter := aPresenter.
	self layout: self defaultLayout
]

{ #category : #evaluating }
NeoPyramidMonoValueInputPresenter >> value [

	^ value
]

{ #category : #evaluating }
NeoPyramidMonoValueInputPresenter >> value: anObject [

	value := anObject
]
