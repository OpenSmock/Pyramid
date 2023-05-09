Class {
	#name : #PyramidPropertyInputModelBuilder,
	#superclass : #Object,
	#instVars : [
		'propertyModel',
		'inputClass',
		'connectInputBlock',
		'noValue',
		'multiValue',
		'buttonCallbackBlock',
		'initializeInputBlock',
		'targetModel',
		'sectionName',
		'inputModel',
		'setDefautValueBlock'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #building }
PyramidPropertyInputModelBuilder >> build [

	self inputModel: (PyramidPropertyInputModel new
			 sectionName: self sectionName;
			 applyToAllInput: self makeInput;
			 yourself).
	self
		connectInput: self inputModel applyToAllInput
		toCollection: self targetModel targets
		fromModel: self inputModel.
	self setDefautValueOfGlobalInput: self inputModel applyToAllInput.
	self targetModel argumentsDict keysAndValuesDo: [ :arguments :targets |
		self buildStateInputModelFor: targets withArguments: arguments.
		targets do: [ :single |
			self buildElementInputModelFor: single withArguments: arguments ] ].
	^ self inputModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilder >> buildButtonFor: aBlockCollection withInput: aSourceInput [

	| button |
	button := SpButtonPresenter new.
	button action: [
		self buttonCallbackBlock
			value: aSourceInput
			value: aBlockCollection value
			value: self inputModel ].
	^ button
]

{ #category : #building }
PyramidPropertyInputModelBuilder >> buildElementInputModelFor: aTarget withArguments: anArgument [

	| elementModel |
	elementModel := PyramidPropertyInputForElementModel new.
	elementModel input:
		(self buildInputFor: { aTarget } withArguments: anArgument).
	elementModel applyToAllButton: (self
			 buildButtonFor: [ self targetModel targets ]
			 withInput: elementModel input).
	elementModel referenceObject: aTarget.
	self inputModel addElementInput: elementModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilder >> buildInputFor: aCollection withArguments: anArgument [

	| elementInput |
	elementInput := self makeInput.
	self
		connectInput: elementInput
		toCollection: aCollection
		fromModel: self inputModel.
	self setDefautValueOf: elementInput with: anArgument.
	^ elementInput
]

{ #category : #building }
PyramidPropertyInputModelBuilder >> buildStateInputModelFor: aCollection withArguments: anArgument [

	| stateModel |
	stateModel := PyramidPropertyInputForStateModel new.
	stateModel input:
		(self buildInputFor: aCollection withArguments: anArgument).
	stateModel applyToAllButton: (self
			 buildButtonFor: [ self targetModel targets ]
			 withInput: stateModel input).
	stateModel referenceState: anArgument.
	self inputModel addStateInput: stateModel
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
PyramidPropertyInputModelBuilder >> connectInput: input toCollection: aCollection fromModel: aModel [

	self connectInputBlock value: input value: aCollection value: aModel
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

{ #category : #building }
PyramidPropertyInputModelBuilder >> inputModel [
	^ inputModel 
]

{ #category : #building }
PyramidPropertyInputModelBuilder >> inputModel: anObject [

	inputModel:=anObject
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
PyramidPropertyInputModelBuilder >> sectionName [

	^ sectionName
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> sectionName: aString [

	sectionName := aString
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
