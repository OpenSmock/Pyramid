Class {
	#name : #PyramidExternalRessourceProxy,
	#superclass : #Object,
	#instVars : [
		'object',
		'source',
		'hasComputedObject'
	],
	#category : #'Pyramid-external-ressources'
}

{ #category : #'as yet unclassified' }
PyramidExternalRessourceProxy class >> fromSource: aSource [

	^ self new
		  pyramidExternalRessourceSource: aSource;
		  yourself
]

{ #category : #'instance creation' }
PyramidExternalRessourceProxy class >> fromTarget: aTarget selector: aSelector arguments: aCollection [

	^ self fromTarget: aTarget selector: aSelector arguments: aCollection withPostConstructionBlock: nil
]

{ #category : #'instance creation' }
PyramidExternalRessourceProxy class >> fromTarget: aTarget selector: aSelector arguments: aCollection withPostConstructionBlock: aBlock [

	^ self fromSource: (PyramidExternalRessourceSource
			   target: aTarget
			   selector: aSelector
			   arguments: aCollection
			postConstructionBlock: aBlock)
]

{ #category : #converting }
PyramidExternalRessourceProxy >> asStashConstructor [

	^ self class printString , ' new'
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceProxy >> doesNotUnderstand: aMessage [

	| returnValue target |
	target := self pyramidExternalRessourceObject.
	self pyramidExternalRessourceObject isPyramidProxy ifTrue: [ ^ target doesNotUnderstand: aMessage ].
	
	(target respondsTo: aMessage selector)
		ifFalse: [ ^ super doesNotUnderstand: aMessage ].

	returnValue := target
		               perform: aMessage selector
		               withEnoughArguments: aMessage arguments.
	returnValue == object ifTrue: [ ^ self ].
	^ returnValue
]

{ #category : #'instance creation' }
PyramidExternalRessourceProxy >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value |
		key = #source ifTrue: [
			self pyramidExternalRessourceSource: value
			 ] ]
]

{ #category : #initialization }
PyramidExternalRessourceProxy >> initialize [

	super initialize.
	hasComputedObject := false.
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isArray [

	^ self pyramidExternalRessourceObject isArray
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isAssociation [

	^ self pyramidExternalRessourceObject isAssociation
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isBehavior [

	^ self pyramidExternalRessourceObject isBehavior
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isBlock [

	^ self pyramidExternalRessourceObject isBlock
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isCharacter [

	^ self pyramidExternalRessourceObject isCharacter
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isClass [

	^ self pyramidExternalRessourceObject isClass
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isClassOrTrait [

	^ self pyramidExternalRessourceObject isClassOrTrait
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isClosure [

	^ self pyramidExternalRessourceObject isClosure
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isCollection [

	^ self pyramidExternalRessourceObject isCollection
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isColor [

	^ self pyramidExternalRessourceObject isColor
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isColorForm [

	^ self pyramidExternalRessourceObject isColorForm
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isCompiledBlock [

	^ self pyramidExternalRessourceObject isCompiledBlock
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isCompiledMethod [

	^ self pyramidExternalRessourceObject isCompiledMethod
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isContext [

	^ self pyramidExternalRessourceObject isContext
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isDictionary [

	^ self pyramidExternalRessourceObject isDictionary
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isEmbeddedBlock [

	^ self pyramidExternalRessourceObject isEmbeddedBlock
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isFloat [

	^ self pyramidExternalRessourceObject isFloat
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isForm [

	^ self pyramidExternalRessourceObject isForm
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isFraction [

	^ self pyramidExternalRessourceObject isFraction
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isHeap [

	^ self pyramidExternalRessourceObject isHeap
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isInteger [

	^ self pyramidExternalRessourceObject isInteger
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isInterval [

	^ self pyramidExternalRessourceObject isInterval
]

{ #category : #'class membership' }
PyramidExternalRessourceProxy >> isKindOf: aClass [

	^ self pyramidExternalRessourceObject isKindOf: aClass
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isLiteral [

	^ self pyramidExternalRessourceObject isLiteral
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isMessageSend [

	^ self pyramidExternalRessourceObject isMessageSend
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isMethodProperties [

	^ self pyramidExternalRessourceObject isMethodProperties
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isMorph [

	^ self pyramidExternalRessourceObject isMorph
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isMorphicEvent [

	^ self pyramidExternalRessourceObject isMorphicEvent
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isNotNil [

	^ self pyramidExternalRessourceObject isNotNil
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isNumber [

	^ self pyramidExternalRessourceObject isNumber
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isPoint [

	^ self pyramidExternalRessourceObject isPoint
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isPyramidProxy [

	^ true
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isRectangle [

	^ self pyramidExternalRessourceObject isRectangle
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isStream [

	^ self pyramidExternalRessourceObject isStream
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isString [

	^ self pyramidExternalRessourceObject isString
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isSymbol [

	^ self pyramidExternalRessourceObject isSymbol
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isSystemWindow [

	^ self pyramidExternalRessourceObject isSystemWindow
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isText [

	^ self pyramidExternalRessourceObject isText
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isTrait [

	^ self pyramidExternalRessourceObject isTrait
]

{ #category : #testing }
PyramidExternalRessourceProxy >> isVariableBinding [

	^ self pyramidExternalRessourceObject isVariableBinding
]

{ #category : #testing }
PyramidExternalRessourceProxy >> notNil [

	^ self pyramidExternalRessourceObject notNil
]

{ #category : #accessing }
PyramidExternalRessourceProxy >> pyramidExternalRessourceObject [

	hasComputedObject ifFalse: [
		hasComputedObject := true.
		object := self pyramidExternalRessourceSource getRessource ].
	^ object
]

{ #category : #accessing }
PyramidExternalRessourceProxy >> pyramidExternalRessourceObject: anObject [

	object := anObject
]

{ #category : #accessing }
PyramidExternalRessourceProxy >> pyramidExternalRessourceSource [

	^ source
]

{ #category : #accessing }
PyramidExternalRessourceProxy >> pyramidExternalRessourceSource: anObject [

	source := anObject
]

{ #category : #asserting }
PyramidExternalRessourceProxy >> shouldSerializedChildren [ 

	^ false
]

{ #category : #accessing }
PyramidExternalRessourceProxy >> size [

	^ self pyramidExternalRessourceObject size
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceProxy >> stashAccessors [

	<stashAccessors>
	^ { #pyramidExternalRessourceSource . #pyramidExternalRessourceObject onlyGetOnStash }
]

{ #category : #'as yet unclassified' }
PyramidExternalRessourceProxy >> stonOn: stonWriter [

	stonWriter
		writeObject: self
		streamMap: [ :map | map at: #source put: self pyramidExternalRessourceSource ]
]
