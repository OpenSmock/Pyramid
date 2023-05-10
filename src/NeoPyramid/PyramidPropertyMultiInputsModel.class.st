Class {
	#name : #PyramidPropertyMultiInputsModel,
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
PyramidPropertyMultiInputsModel >> addElementInput: anObject [

	elementInputsModel add: anObject
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> addStateInput: anObject [

	stateInputsModel add: anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyMultiInputsModel >> allElementInputs [

	^ self elementInputsModel collect: [ :each | each input ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyMultiInputsModel >> allElementInputsOf: aCollection [

	| inputs |
	inputs := self elementInputsModel
		          select: [ :each |
		          aCollection anySatisfy: [ :obj | obj = each reference ] ]
		          thenCollect: [ :each | each input ].
	^ inputs
]

{ #category : #'as yet unclassified' }
PyramidPropertyMultiInputsModel >> allInputsOf: aCollection [

	| inputs |
	inputs := self elementInputsModel
		          select: [ :each |
			          aCollection anySatisfy: [ :obj |
				          obj = each reference ] ]
		          thenCollect: [ :each | each input ].
	^ inputs
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> applyToAllInput [

	^ applyToAllInput
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> applyToAllInput: anObject [

	applyToAllInput := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyMultiInputsModel >> elementInputSize [
	^ self elementInputsModel size
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> elementInputsModel [

	^ elementInputsModel
]

{ #category : #initialization }
PyramidPropertyMultiInputsModel >> initialize [

	elementInputsModel := OrderedCollection new.
	stateInputsModel := OrderedCollection new
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> removeElementInput: anObject [

	elementInputsModel remove: anObject
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> removeStateInput: anObject [

	stateInputsModel remove: anObject
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> sectionName [

	^ sectionName
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> sectionName: aString [
	sectionName:=aString
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> stateInputsModel [

	^ stateInputsModel
]
