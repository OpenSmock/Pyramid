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
		'initializeInputBlock'
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
		to: self propertyModel allElements.
	self
		setDefautValueOf: inputModel globalInput
		withAllStates: self propertyModel states.
	self propertyModel states do: [ :state |
		state source do: [ :element |
			inputModel addElementInput:
				(self buildElementInputModelForState: state element: element) ] ].
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
PyramidPropertyInputModelBuilder >> buildElementInputFor: aCollection withState: state [

	| elementInput |
	elementInput := self makeInput.
	self connectInput: elementInput to: aCollection.
	self setDefautValueOf: elementInput with: state arguments.
	^ elementInput
]

{ #category : #building }
PyramidPropertyInputModelBuilder >> buildElementInputModelForState: state element: element [
	| model |
	model := PyramidPropertyInputForElementModel new.
	model elementInput: (self buildElementInputFor: { element } withState: state).
	model stateInput: (self buildButtonFor: state source withInput: model elementInput).
	model modelInput: (self buildButtonFor: self propertyModel allElements withInput: model elementInput).
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
PyramidPropertyInputModelBuilder >> propertyModel [

	^ propertyModel
]

{ #category : #accessing }
PyramidPropertyInputModelBuilder >> propertyModel: anObject [

	propertyModel := anObject
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
	aCollection size = 1 ifTrue: [ self setDefautValueBlock value: anInput value: aCollection first arguments. ^ self ].
	self setDefautValueBlock value: anInput value: self multiValue
]
