Class {
	#name : #PyramidPropertyInputModelBuilderTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-Tests-Cases'
}

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> builderFrom: aPopertyModel [

	| transformIn transformOut callback connectTriggerBlock initializeBlock |
	transformOut := [ :input |
	                input text
		                ifEmpty: [ nil ]
		                ifNotEmpty: [ input text ] ].
	transformIn := [ :input :value |
	               input text: (value ifNil: [ '' ] ifNotNil: [ value ]) ].
	callback := [ :input :col :model |
	            col do: [ :each | each id: (transformOut value: input) ] ].
	connectTriggerBlock := [ :input :col :model |
	                       input whenSubmitDo: [ :val |
		                       callback value: input value: col value: model ] ].
	initializeBlock := [ :input |  ].

	^ PyramidPropertyInputModelBuilder new
		  targetModel: aPopertyModel;
		  inputClass: PyramidMockSpecPresenter;
		  connectInputBlock: connectTriggerBlock;
		  setDefautValueBlock: transformIn;
		  buttonCallbackBlock: callback;
		  initializeInputBlock: initializeBlock;
		  noValue: 'no value';
		  multiValue: 'multi values';
		  yourself
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

	| targetModel inputModel builder |
	targetModel := PyramidPropertyTargetModel new.
	builder := builder := self builderFrom: targetModel.
	inputModel := builder build.

	self assert: inputModel elementInputsModel size equals: 0.
	self assert: inputModel stateInputsModel size equals: 0.
	self assert: inputModel applyToAllInput text equals: 'no value'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testMultiStatesMultiElementsModel [

	| targetModel inputModel builder e1 e2 e3 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	e2 := BlElement new
		      id: #'hello world';
		      yourself.
	e3 := BlElement new
		      id: #'Bonjour monde';
		      yourself.
	targetModel := PyramidPropertyTargetModel new
		               at: #'hello world' put: e1;
		               at: #'hello world' put: e2;
		               at: #'Bonjour monde' put: e3;
		               yourself.
	builder := builder := self builderFrom: targetModel.
	inputModel := builder build.

	self assert: inputModel elementInputsModel size equals: 3.
	self assert: inputModel stateInputsModel size equals: 2.
	self assert: inputModel applyToAllInput text equals: 'multi values'.

	inputModel stateInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	self assert: inputModel stateInputsModel size equals: 2.

	inputModel elementInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	self assert: inputModel stateInputsModel size equals: 3.

	inputModel stateInputsModel first input
		text: 'test3';
		submit.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test1.
	self assert: e3 id asSymbol equals: #'Bonjour monde'.
	self assert: inputModel stateInputsModel size equals: 3.

	inputModel elementInputsModel first input text: 'test4'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	self assert: e2 id asSymbol equals: #test4.
	self assert: e3 id asSymbol equals: #test4.
	self assert: inputModel stateInputsModel size equals: 1.

	inputModel stateInputsModel first input text: 'test5'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: inputModel stateInputsModel size equals: 1.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
	self assert: e3 id asSymbol equals: #goodbye
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateMultiElementsModel [

	| targetModel inputModel builder e1 e2 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	e2 := BlElement new
		      id: #'hello world';
		      yourself.
	targetModel := PyramidPropertyTargetModel new
		               at: #'hello world' put: e1;
		               at: #'hello world' put: e2;
		               yourself.
	builder := builder := self builderFrom: targetModel.
	inputModel := builder build.

	self assert: inputModel elementInputsModel size equals: 2.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'hello world'.

	inputModel stateInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #test1.
	self assert: inputModel stateInputsModel size equals: 1.

	inputModel elementInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test1.
	self assert: inputModel stateInputsModel size equals: 2.

	inputModel stateInputsModel first input
		text: 'test3';
		submit.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test1.
	self assert: inputModel stateInputsModel size equals: 2.

	inputModel elementInputsModel first input text: 'test4'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.
	self assert: e2 id asSymbol equals: #test4.
	self assert: inputModel stateInputsModel size equals: 1.
	
	inputModel stateInputsModel first input text: 'test5'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test5.
	self assert: e2 id asSymbol equals: #test5.
	self assert: inputModel stateInputsModel size equals: 1.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateSingleElementModel [

	| targetModel inputModel builder e1 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	targetModel := PyramidPropertyTargetModel new
		               at: #'hello world' put: e1;
		               yourself.
	builder := builder := self builderFrom: targetModel.
	inputModel := builder build.

	self assert: inputModel elementInputsModel size equals: 1.
	self assert: inputModel stateInputsModel size equals: 1.
	self assert: inputModel applyToAllInput text equals: 'hello world'.

	inputModel elementInputsModel first input
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.

	inputModel stateInputsModel first input
		text: 'test2';
		submit.
	self assert: e1 id asSymbol equals: #test2.

	inputModel elementInputsModel first input text: 'test3'.
	inputModel elementInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test3.

	inputModel stateInputsModel first input text: 'test4'.
	inputModel stateInputsModel first applyToAllButton click.
	self assert: e1 id asSymbol equals: #test4.

	inputModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye
]
