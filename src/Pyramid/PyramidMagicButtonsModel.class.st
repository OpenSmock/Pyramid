Class {
	#name : 'PyramidMagicButtonsModel',
	#superclass : 'Object',
	#instVars : [
		'buttonsModel'
	],
	#category : 'Pyramid-specs-custom',
	#package : 'Pyramid',
	#tag : 'specs-custom'
}

{ #category : 'adding' }
PyramidMagicButtonsModel >> addButtonModel: aPyramidMagicButonModel [

	self buttonsModel add: aPyramidMagicButonModel
]

{ #category : 'as yet unclassified' }
PyramidMagicButtonsModel >> buttonsModel [
	^ buttonsModel
]

{ #category : 'initialization' }
PyramidMagicButtonsModel >> initialize [

	buttonsModel := OrderedCollection new.
]
