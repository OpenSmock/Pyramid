Class {
	#name : #PyramidPropertyPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'whenSubmitDo'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #testing }
PyramidPropertyPresenter >> model [

	model ifNil: [ model := PyramidPropertyModel new.
		model addObserver: self ].
	^ model
]

{ #category : #testing }
PyramidPropertyPresenter >> model: anObject [

	self model removeObserver: self.
	model := anObject.
	model addObserver: self
]

{ #category : #private }
PyramidPropertyPresenter >> updateLayout [
	self layout: self defaultLayout
]

{ #category : #accessing }
PyramidPropertyPresenter >> whenSubmitDo [

	^ whenSubmitDo
]

{ #category : #accessing }
PyramidPropertyPresenter >> whenSubmitDo: aBlock [
	"two arguments block. Must be called when inputs trigger a submission.
	
	- pipelineTarget: a PyramidPiepelineTarget.
	- state: create state from the different inputs
	"

	whenSubmitDo := aBlock
]
