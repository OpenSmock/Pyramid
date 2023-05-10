Class {
	#name : #PyramidPropertyInputModelBuilderTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-Tests-Cases'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> dummyCommand [

	^ PyramidCommand name: #dummy
		  set: [ :state :target | target string: state arguments ]
		  get: [ :state :source |
			  state source: source.
			  state arguments: source string ]
		  isExecutableBlock: [ :obj :state |
			  true ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> inputModelFromCollection: aCollection [

	| property |
	property := PyramidProperty new
		            command: self dummyCommand;
		            pipeline: PyramidPipeline new;
		            yourself.
	PyramidPropertyInputModelBuilderFactory mockPresenter
		installBuilderOn: property.
	property makeNewInputsFor: aCollection.
	^ property inputsModel
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

	| inputModel |
	inputModel := self inputModelFromCollection: {  }.

	self assert: inputModel elementInputsModel size equals: 0.
	self assert: inputModel stateInputsModel size equals: 0.
	self assert: inputModel applyToAllInput text equals: '# no values'
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
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel elementInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 3.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel stateInputsModel first input
		text: 'test3';
		submit.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 3.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel elementInputsModel first input text: 'test4'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	self assert: e2 id asSymbol equals: #test4.
	self assert: e3 id asSymbol equals: #test4.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test4'.

	inputModel stateInputsModel first input text: 'test5'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test5'.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
	self assert: e3 id asSymbol equals: #goodbye.
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
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test1'.

	inputModel elementInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test1.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel stateInputsModel first input
		text: 'test3';
		submit.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test1.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel elementInputsModel first input text: 'test4'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	self assert: e2 id asSymbol equals: #test4.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test4'.

	inputModel stateInputsModel first input text: 'test5'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test5'.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'goodbye'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateSingleElementModel [

	| inputModel e1 |
	e1 := PyramidPropertiesTestDummy new
		      string: #'hello world';
		      yourself.
	inputModel := self inputModelFromCollection: { e1 }.

	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'hello world'.

	inputModel elementInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 string equals: 'test1'.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test1'.

	inputModel stateInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 string equals: 'test2'.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test2'.

	inputModel elementInputsModel first input text: 'test3'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert:e1 string equals: 'test3'.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test3'.

	inputModel stateInputsModel first input text: 'test4'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 string equals: 'test4'.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'test4'.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 string equals: 'goodbye'.
	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'goodbye'
]
