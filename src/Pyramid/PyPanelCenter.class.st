Class {
	#name : #PyPanelCenter,
	#superclass : #SpPresenter,
	#traits : 'TPyramidBusinessUser',
	#classTraits : 'TPyramidBusinessUser classTrait',
	#category : #'Pyramid-Editor'
}

{ #category : #layout }
PyPanelCenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: SpNullPresenter new;
		  yourself
]
