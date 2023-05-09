Class {
	#name : #PyramidPropertyInputModelBuilderTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-Tests-Cases'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> builderFrom: aPopertyTargetModel [

	| transformIn transformOut callback connectTriggerBlock initializeBlock builder |
	transformOut := [ :input |
	                input text
		                ifEmpty: [ nil ]
		                ifNotEmpty: [ input text ] ].
	transformIn := [ :input :value |
	               input text: (value ifNil: [ '' ] ifNotNil: [ value asSymbol ]) ].
	callback := [ :input :col :model |
	            col do: [ :each | each id: (transformOut value: input) ] ].
	connectTriggerBlock := [ :input :col :model |
	                       input whenSubmitDo: [ :val |
		                       callback value: input value: col value: model ] ].
	initializeBlock := [ :input |  ].

	builder := PyramidPropertyInputModelBuilder new
		           targetModel: aPopertyTargetModel;
		           inputClass: PyramidMockSpecPresenter;
		           connectInputBlock: connectTriggerBlock;
		           setDefautValueBlock: transformIn;
		           buttonCallbackBlock: callback;
		           initializeInputBlock: initializeBlock;
		           noValue: 'no value';
		           multiValue: 'multi values';
		           yourself.
	^ builder
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> inputModelFrom: aCollection [


	| targetModel builder |
	targetModel := self targetModelFrom: aCollection.
	builder := self builderFrom: targetModel.
	^ builder build.
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> targetModelFrom: aCollection [

	| targetModel |
	targetModel := PyramidPropertyTargetModel new.
	aCollection do: [ :each | targetModel at: each id put: each ].
	^ targetModel
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testBuild [

	self testEmptyModel.
	self testSingleStateSingleElementModel.
	self testSingleStateMultiElementsModel.
	self testMultiStatesMultiElementsModel.
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testEmptyModel [

	| inputModel  |
	inputModel := self inputModelFrom: { }.

	self assert: inputModel elementInputsModel size equals: 0.
	self assert: inputModel stateInputsModel size equals: 0.
	self assert: inputModel applyToAllInput text equals: 'no value'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testMultiStatesMultiElementsModel [

	| inputModel e1 e2 e3 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	e2 := BlElement new
		      id: #'hello world';
		      yourself.
	e3 := BlElement new
		      id: #'Bonjour monde';
		      yourself.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel stateInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel elementInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 3.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel stateInputsModel first input
		text: 'test3';
		submit.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 3.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel elementInputsModel first input text: 'test4'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	self assert: e2 id asSymbol equals: #test4.
	self assert: e3 id asSymbol equals: #test4.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test4'.

	inputModel stateInputsModel first input text: 'test5'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test5'.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
	self assert: e3 id asSymbol equals: #goodbye.
	inputModel := self inputModelFrom: {
			              e1.
			              e2.
			              e3 }.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'goodbye'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateMultiElementsModel [

	| inputModel e1 e2 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	e2 := BlElement new
		      id: #'hello world';
		      yourself.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'hello world'.

	inputModel stateInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #test1.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test1'.

	inputModel elementInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test1.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel stateInputsModel first input
		text: 'test3';
		submit.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test1.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel elementInputsModel first input text: 'test4'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	self assert: e2 id asSymbol equals: #test4.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test4'.

	inputModel stateInputsModel first input text: 'test5'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test5'.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
	inputModel := self inputModelFrom: {
			              e1.
			              e2 }.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'goodbye'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateSingleElementModel [

	| inputModel e1 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	inputModel := self inputModelFrom: { e1 }.

	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'hello world'.

	inputModel elementInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	inputModel := self inputModelFrom: { e1 }.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test1'.

	inputModel stateInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	inputModel := self inputModelFrom: { e1 }.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test2'.

	inputModel elementInputsModel first input text: 'test3'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test3.
	inputModel := self inputModelFrom: { e1 }.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test3'.

	inputModel stateInputsModel first input text: 'test4'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	inputModel := self inputModelFrom: { e1 }.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test4'.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	inputModel := self inputModelFrom: { e1 }.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'goodbye'.
]
