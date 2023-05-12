Class {
	#name : #PyramidNumberPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputNumber'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #layout }
PyramidNumberPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputNumber;
		  yourself
]

{ #category : #'initialization - deprecated' }
PyramidNumberPresenter >> initializePresenter [

	inputNumber := SpTextInputFieldPresenter new.
]

{ #category : #accessing }
PyramidNumberPresenter >> inputNumber [
^ inputNumber
]
