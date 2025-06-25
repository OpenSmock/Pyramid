Class {
	#name : #PyramidColorInputMultiLinesPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'hexaInput',
		'colorInput',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #accessing }
PyramidColorInputMultiLinesPresenter >> colorInput [

	^ colorInput
]

{ #category : #layout }
PyramidColorInputMultiLinesPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self hexaInput height: 24;
		  add: self colorInput expand: true;
		  yourself
]

{ #category : #accessing }
PyramidColorInputMultiLinesPresenter >> hexaInput [

	^ hexaInput
]

{ #category : #'initialization - deprecated' }
PyramidColorInputMultiLinesPresenter >> initializePresenters [

	whenValueChangedDo := [ :color |  ].
	colorInput := PyramidColorInputPresenter new.
	hexaInput := PyramidColorInputSingleLinePresenter new.

	colorInput whenValueChangedDo: [ :color |
		hexaInput value: color.
		self whenValueChangedDo value: color ].
	hexaInput whenValueChangedDo: [ :color |
		colorInput value: color.
		self whenValueChangedDo value: color ].

	self value: Color red
]

{ #category : #'as yet unclassified' }
PyramidColorInputMultiLinesPresenter >> value [

	^ self hexaInput value
]

{ #category : #'as yet unclassified' }
PyramidColorInputMultiLinesPresenter >> value: aColor [

	self colorInput value: aColor.
	self hexaInput value: aColor
]

{ #category : #accessing }
PyramidColorInputMultiLinesPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #'as yet unclassified' }
PyramidColorInputMultiLinesPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
