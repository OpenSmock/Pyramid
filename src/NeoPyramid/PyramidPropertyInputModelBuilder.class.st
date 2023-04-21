Class {
	#name : #PyramidPropertyInputModelBuilder,
	#superclass : #Object,
	#instVars : [
		'propertyModel',
		'inputClass',
		'connectInputBlock',
		'setDefautValueBlock',
		'noValue',
		'multiValue',
		'buttonCallbackBlock',
		'initializeInputBlock',
		'targetModel'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #building }
PyramidPropertyInputModelBuilder >> build [

	| inputModel |
	inputModel := PyramidPropertyInputModel new.
	inputModel globalInput: self makeInput.
	self
		connectInput: inputModel globalInput
		to: self targetModel targets.
	self setDefautValueOfGlobalInput: inputModel globalInput.
	self targetModel argumentsDict keysAndValuesDo: [ :arguments :targets |
		targets do: [ :single |
			inputModel addElementInput:
				(self buildInputModelFor: single withArguments: arguments) ] ].
	^ inputModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilder >> buildButtonFor: aCollection withInput: aSourceInput [

	| button |
	button := SpButtonPresenter new.
	button action: [ self buttonCallbackBlock value: aSourceInput value: aCollection].
	^ button
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilder >> buildElementInputFor: aCollection withArguments: anArgument [

	| elementInput |
	elementInput := self makeInput.
	self connectInput: elementInput to: aCollection.
	self setDefautValueOf: elementInput with: anArgument.
	^ elementInput
]

{ #category : #building }
PyramidPropertyInputModelBuilder >> buildInputModelFor: aTarget withArguments: anArgument [

	| model |
	model := PyramidPropertyInputForObjectModel new.
	model elementInput:
		(self buildElementInputFor: { aTarget } withArguments: anArgument).
	model stateInput: (self
			 buildButtonFor: (self targetModel targetsAt: anArgument)
			 withInput: model elementInput).
	model modelInput: (self
			 buildButtonFor: self targetModel targets
			 withInput: model elementInput).
	model referenceObject: aTarget.
	^ model
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> buttonCallbackBlock [

	^ buttonCallbackBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> buttonCallbackBlock: anObject [

	buttonCallbackBlock := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilder >> connectInput: input to: aCollection [
	self connectInputBlock value: input value: aCollection
	
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> connectInputBlock [

	^ connectInputBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> connectInputBlock: anObject [

	connectInputBlock := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> initializeInputBlock [

	^ initializeInputBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> initializeInputBlock: anObject [

	initializeInputBlock := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> inputClass: anObject [

	inputClass := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilder >> makeInput [
	| input |
	input := self inputClass new.
	self initializeInputBlock value: input.
	^ input
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> multiValue [

	^ multiValue
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> multiValue: anObject [

	multiValue := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> noValue [

	^ noValue
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> noValue: anObject [

	noValue := anObject
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> setDefautValueBlock [

	^ setDefautValueBlock
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> setDefautValueBlock: anObject [

	setDefautValueBlock := anObject
]

{ #category : #initialization }
PyramidPropertyInputModelBuilder >> setDefautValueOf: anInput with: aState [

	self setDefautValueBlock value: anInput value: aState
]

{ #category : #initialization }
PyramidPropertyInputModelBuilder >> setDefautValueOf: anInput withAllStates: aCollection [

	aCollection ifEmpty: [ self setDefautValueBlock value: anInput value: self noValue. ^ self ].
	aCollection size = 1 ifTrue: [ aCollection doOnlyOnce: [ :obj | self setDefautValueBlock value: anInput value: obj]. ^ self ].
	self setDefautValueBlock value: anInput value: self multiValue
]

{ #category : #initialization }
PyramidPropertyInputModelBuilder >> setDefautValueOfGlobalInput: anInput [

	| keys |
	keys := self targetModel argumentsDict keys.
	keys ifEmpty: [
		self setDefautValueBlock value: anInput value: self noValue.
		^ self ].
	keys size = 1 ifTrue: [
			self setDefautValueBlock value: anInput value: keys first.
		^ self ].
	self setDefautValueBlock value: anInput value: self multiValue
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> targetModel [

	^ targetModel
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> targetModel: anObject [

	targetModel := anObject
]
