Class {
	#name : #PyramidExternalProperty,
	#superclass : #Object,
	#instVars : [
		'selector',
		'target'
	],
	#category : #'NeoPyramid-plugin-properties-external'
}

{ #category : #'instance creation' }
PyramidExternalProperty class >> fromSton: stonReader [

	| externalProperty |
	externalProperty := self new
		                    fromSton: stonReader;
		                    yourself.

	^ self
		  makeAnonymousSubClassOf: externalProperty
]

{ #category : #'as yet unclassified' }
PyramidExternalProperty class >> makeAnonymousSubClassOf: aPyramidExternalProperty [

	| object anonClass |
	object := aPyramidExternalProperty target perform:
		          aPyramidExternalProperty selector.
	anonClass := object class newAnonymousSubclass.
	anonClass addSlot: #pyramidExternalRessource => InstanceVariableSlot.
	anonClass instanceSide compile:
		'pyramidExternalRessource<r><r><t>^ pyramidExternalRessource'
			expandMacros.
	anonClass instanceSide compile:
		'pyramidExternalRessource: anObject<r><r><t>pyramidExternalRessource := anObject'
			expandMacros.
	anonClass instanceSide compile:
		'= anObject<r><r><t>^ self == anObject pyramidExternalRessource'
			expandMacros.
	anonClass instanceSide compile:
		'stonOn: stonWriter<r><r><t>stonWriter writeObject: self pyramidExternalRessource'
			expandMacros.
	object := object as: anonClass.
	object perform: #pyramidExternalRessource: with: aPyramidExternalProperty.
	^ object
]

{ #category : #comparing }
PyramidExternalProperty >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	self selector = anObject selector ifFalse: [ ^ false ].
	^ self target = anObject target
]

{ #category : #converting }
PyramidExternalProperty >> asExternalRessource [

	^ self class makeAnonymousSubClassOf: self
]

{ #category : #accessing }
PyramidExternalProperty >> selector [

	^ selector
]

{ #category : #accessing }
PyramidExternalProperty >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
PyramidExternalProperty >> target [

	^ target
]

{ #category : #accessing }
PyramidExternalProperty >> target: anObject [

	target := anObject
]
