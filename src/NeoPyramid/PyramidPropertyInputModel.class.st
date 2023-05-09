Class {
	#name : #PyramidPropertyInputModel,
	#superclass : #Object,
	#instVars : [
		'applyToAllInput',
		'elementInputsModel',
		'stateInputsModel',
		'sectionName'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputModel >> addElementInput: anObject [

	elementInputsModel add: anObject
]

{ #category : #accessing }
PyramidPropertyInputModel >> addStateInput: anObject [

	stateInputsModel add: anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> allElementInputs [

	^ self elementInputModel collect: [ :each | each elementInput ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> allInputs [

	^ self elementInputsModel collect: [ :each | each input ].

]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> allInputsOf: aCollection [

	| inputs |
	inputs := self elementInputsModel 
		          select: [ :each |
			          aCollection anySatisfy: [ :obj |
				          obj = each referenceObject ] ]
		          thenCollect: [ :each | each input ].
	^ inputs
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> allStateInputs [

	^ self allStateInputs collect: [ :each | each stateInput ]
]

{ #category : #accessing }
PyramidPropertyInputModel >> applyToAllInput [

	^ applyToAllInput
]

{ #category : #accessing }
PyramidPropertyInputModel >> applyToAllInput: anObject [

	applyToAllInput := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> elementInputSize [
	^ self elementInputsModel size
]

{ #category : #accessing }
PyramidPropertyInputModel >> elementInputsModel [

	^ elementInputsModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> getElementInputModelFor: anObject [

	| values |
	values := self elementInputModel select: [ :each |
		          each referenceObject == anObject ].
	^ values
]

{ #category : #initialization }
PyramidPropertyInputModel >> initialize [

	elementInputsModel := OrderedCollection new.
	stateInputsModel := OrderedCollection new
]

{ #category : #accessing }
PyramidPropertyInputModel >> removeElementInput: anObject [

	elementInputsModel remove: anObject
]

{ #category : #accessing }
PyramidPropertyInputModel >> removeStateInput: anObject [

	stateInputsModel remove: anObject
]

{ #category : #accessing }
PyramidPropertyInputModel >> sectionName [

	^ sectionName
]

{ #category : #accessing }
PyramidPropertyInputModel >> sectionName: aString [
	sectionName:=aString
]

{ #category : #accessing }
PyramidPropertyInputModel >> stateInputsModel [

	^ stateInputsModel
]
