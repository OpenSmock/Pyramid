Class {
	#name : #PyramidPropertyMultiInputsModel,
	#superclass : #Object,
	#instVars : [
		'applyToAllInput',
		'elementInputsModel',
		'stateInputsModel',
		'sectionName',
		'shouldDisplay'
	],
	#category : #'Pyramid-properties'
}

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> addElementInput: anObject [

	elementInputsModel add: anObject
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> addStateInput: anObject [

	stateInputsModel add: anObject
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
PyramidPropertyMultiInputsModel >> elementInputsFor: anObject [

	^ (self elementInputsModel select: [ :each | each reference = anObject ]) first
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> elementInputsModel [

	^ elementInputsModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyMultiInputsModel >> elementInputsSize [

	^ self elementInputsModel size
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
PyramidPropertyMultiInputsModel >> shouldDisplay [

	^ shouldDisplay
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> shouldDisplay: anObject [

	shouldDisplay := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyMultiInputsModel >> stateInputsFor: anObject [

	"Use for testing"
	^ (self stateInputsModel select: [ :each |
		   each reference anySatisfy: [ :ref | ref = anObject ] ]) first
]

{ #category : #accessing }
PyramidPropertyMultiInputsModel >> stateInputsModel [

	^ stateInputsModel
]
