Class {
	#name : #PyramidMagicButtonsModel,
	#superclass : #Object,
	#instVars : [
		'buttonsModel',
		'buttonExtent'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #adding }
PyramidMagicButtonsModel >> addButtonModel: aPyramidMagicButonModel [

	self buttonsModel add: aPyramidMagicButonModel
]

{ #category : #accessing }
PyramidMagicButtonsModel >> buttonExtent [

	^ buttonExtent
]

{ #category : #accessing }
PyramidMagicButtonsModel >> buttonExtent: anObject [

	buttonExtent := anObject
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonsModel >> buttonsModel [
	^ buttonsModel
]

{ #category : #initialization }
PyramidMagicButtonsModel >> initialize [

	buttonExtent := 24 asPoint.
	buttonsModel := OrderedCollection new.
]
