Class {
	#name : #PyramidPropertyInputModel,
	#superclass : #Object,
	#instVars : [
		'globalInput',
		'elementInputModel',
		'sectionName'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputModel >> addElementInput: anObject [

	elementInputModel add: anObject
]

{ #category : #accessing }
PyramidPropertyInputModel >> elementInputModel [

	^ elementInputModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> elementInputSize [
	^ self elementInputModel size
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModel >> getElementInputModelFor: anObject [

	| values |
	values := self elementInputModel select: [ :each |
		          each referenceObject == anObject ].
	^ values
]

{ #category : #accessing }
PyramidPropertyInputModel >> globalInput [

	^ globalInput
]

{ #category : #accessing }
PyramidPropertyInputModel >> globalInput: anObject [

	globalInput := anObject
]

{ #category : #initialization }
PyramidPropertyInputModel >> initialize [

	elementInputModel := OrderedCollection new.
]

{ #category : #accessing }
PyramidPropertyInputModel >> removeElementInput: anObject [

	elementInputModel remove: anObject
]

{ #category : #accessing }
PyramidPropertyInputModel >> sectionName [

	^ sectionName
]

{ #category : #accessing }
PyramidPropertyInputModel >> sectionName: aString [
	sectionName:=aString
]
