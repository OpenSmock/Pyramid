Class {
	#name : #PyramidPropertyInputBuilder,
	#superclass : #SpPresenter,
	#instVars : [
		'propertyModel',
		'inputClass',
		'connectInputBlock',
		'setDefautValueBlock',
		'noValue',
		'multiValue',
		'buttonCallbackBlock'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #building }
PyramidPropertyInputBuilder >> build [

	| inputModel |
	inputModel := PyramidPropertyInputModel new.
	inputModel globalInput: self inputClass new.
	self
		connectInput: inputModel globalInput
		to: self propertyModel allElements.
	self
		setDefautValueOf: inputModel globalInput
		withAllStates: self propertyModel states.
	self propertyModel states do: [ :state |
		state source do: [ :element |
			inputModel addElementInput: (self buildElementInputModelForState: state element: element)
			 ] ].
	^ inputModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputBuilder >> buildButtonFor: aCollection withInput: aSourceInput [

	| button |
	button := SpButtonPresenter new.
	button action: [ self buttonCallbackBlock value: aSourceInput value: aCollection].
	^ button
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputBuilder >> buildElementInputFor: aCollection withState: state [

	| elementInput |
	elementInput := self inputClass new.
	self connectInput: elementInput to: aCollection.
	self setDefautValueOf: elementInput with: state arguments.
	^ elementInput
]

{ #category : #building }
PyramidPropertyInputBuilder >> buildElementInputModelForState: state element: element [
	| model |
	model := PyramidPropertyInputForElementsModel new.
	model elementInput: (self buildElementInputFor: { element } withState: state).
	model stateInput: (self buildButtonFor: state source withInput: model elementInput).
	model modelInput: (self buildButtonFor: self propertyModel allElements withInput: model elementInput).
	^ model
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> buttonCallbackBlock [

	^ buttonCallbackBlock
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> buttonCallbackBlock: anObject [

	buttonCallbackBlock := anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputBuilder >> connectInput: input to: aCollection [
	self connectInputBlock value: input value: aCollection
	
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> connectInputBlock [

	^ connectInputBlock
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> connectInputBlock: anObject [

	connectInputBlock := anObject
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> inputClass [

	^ inputClass
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> inputClass: anObject [

	inputClass := anObject
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> multiValue [

	^ multiValue
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> multiValue: anObject [

	multiValue := anObject
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> noValue [

	^ noValue
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> noValue: anObject [

	noValue := anObject
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> propertyModel [

	^ propertyModel
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> propertyModel: anObject [

	propertyModel := anObject
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> setDefautValueBlock [

	^ setDefautValueBlock
]

{ #category : #accessing }
PyramidPropertyInputBuilder >> setDefautValueBlock: anObject [

	setDefautValueBlock := anObject
]

{ #category : #initialization }
PyramidPropertyInputBuilder >> setDefautValueOf: anInput with: aState [

	self setDefautValueBlock value: anInput value: aState
]

{ #category : #initialization }
PyramidPropertyInputBuilder >> setDefautValueOf: anInput withAllStates: aCollection [

	aCollection ifEmpty: [ self setDefautValueBlock value: anInput value: self noValue. ^ self ].
	aCollection size = 1 ifTrue: [ self setDefautValueBlock value: anInput value: aCollection first arguments. ^ self ].
	self setDefautValueBlock value: anInput value: self multiValue
]
