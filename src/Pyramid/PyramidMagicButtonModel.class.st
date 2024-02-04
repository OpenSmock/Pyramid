Class {
	#name : #PyramidMagicButtonModel,
	#superclass : #Object,
	#instVars : [
		'icon',
		'helpSelected',
		'helpNotSelected',
		'inputValue',
		'label',
		'inputValidation'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #accessing }
PyramidMagicButtonModel >> helpNotSelected [

	^ helpNotSelected
]

{ #category : #accessing }
PyramidMagicButtonModel >> helpNotSelected: anObject [

	helpNotSelected := anObject
]

{ #category : #accessing }
PyramidMagicButtonModel >> helpSelected [

	^ helpSelected
]

{ #category : #accessing }
PyramidMagicButtonModel >> helpSelected: anObject [

	helpSelected := anObject
]

{ #category : #accessing }
PyramidMagicButtonModel >> icon [

	^ icon
]

{ #category : #accessing }
PyramidMagicButtonModel >> icon: anObject [

	icon := anObject
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonModel >> inputValidation [

	^ inputValidation
]

{ #category : #'as yet unclassified' }
PyramidMagicButtonModel >> inputValidation: aFullBlockClosure [ 
	
	inputValidation := aFullBlockClosure
]

{ #category : #accessing }
PyramidMagicButtonModel >> inputValue [

	^ inputValue
]

{ #category : #accessing }
PyramidMagicButtonModel >> inputValue: anObject [

	inputValue := anObject
]

{ #category : #accessing }
PyramidMagicButtonModel >> label [

	^ label
]

{ #category : #accessing }
PyramidMagicButtonModel >> label: anObject [

	label := anObject
]
