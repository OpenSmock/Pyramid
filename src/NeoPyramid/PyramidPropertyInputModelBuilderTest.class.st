Class {
	#name : #PyramidPropertyInputModelBuilderTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-plugin-properties'
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
	callback := [ :input :col |
	            col do: [ :each | each id: (transformOut value: input) ] ].
	connectTriggerBlock := [ :input :col |
	                       input whenSubmitDo: [ :val |
		                       callback value: input value: col ] ].
	initializeBlock := [ :input | ].

	^ PyramidPropertyInputModelBuilder new
		  propertyModel: aPopertyModel;
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

	| propertyModel inputModel builder  |
	propertyModel := PyramidPropertyModel new states:
		                 {  }.
	builder := builder := self builderFrom: propertyModel.
	inputModel := builder build.

	self assert: inputModel elementInputModel size equals: 0.
	self assert: inputModel globalInput text equals: 'no value'.
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testMultiStatesMultiElementsModel [

	| propertyModel inputModel builder e1 e2 e3 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	e2 := BlElement new
		      id: #'hello world';
		      yourself.
	e3 := BlElement new
		      id: #'dlrow olleh';
		      yourself.
	propertyModel := PyramidPropertyModel new states: {
			                 (PyramidCommandState new
				                  arguments: 'hello world';
				                  source: {
						                  e1.
						                  e2 }).
			                 (PyramidCommandState new
				                  arguments: 'dlrow olleh';
				                  source: { e3 }) }.
	builder := builder := self builderFrom: propertyModel.
	inputModel := builder build.

	self assert: inputModel elementInputModel size equals: 3.
	self assert: inputModel globalInput text equals: 'multi values'.

	inputModel elementInputModel first elementInput
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #'hello world'.
	self assert: e3 id asSymbol equals: #'dlrow olleh'.

	inputModel elementInputModel first elementInput text: 'test2'.
	inputModel elementInputModel first stateInput click.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test2.
	self assert: e3 id asSymbol equals: #'dlrow olleh'.

	inputModel elementInputModel first elementInput text: 'test3'.
	inputModel elementInputModel first modelInput click.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test3.
	self assert: e3 id asSymbol equals: #test3.

	inputModel globalInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
	self assert: e3 id asSymbol equals: #goodbye
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateMultiElementsModel [

	| propertyModel inputModel builder e1 e2 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	e2 := BlElement new
		      id: #'hello world';
		      yourself.
	propertyModel := PyramidPropertyModel new states: {
			                 (PyramidCommandState new
				                  arguments: 'hello world';
				                  source: {
						                  e1.
						                  e2 }) }.
	builder := builder := self builderFrom: propertyModel.
	inputModel := builder build.

	self assert: inputModel elementInputModel size equals: 2.
	self assert: inputModel globalInput text equals: 'hello world'.

	inputModel elementInputModel first elementInput
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.
	self assert: e2 id asSymbol equals: #'hello world'.

	inputModel elementInputModel first elementInput text: 'test2'.
	inputModel elementInputModel first stateInput click.
	self assert: e1 id asSymbol equals: #test2.
	self assert: e2 id asSymbol equals: #test2.

	inputModel elementInputModel first elementInput text: 'test3'.
	inputModel elementInputModel first modelInput click.
	self assert: e1 id asSymbol equals: #test3.
	self assert: e2 id asSymbol equals: #test3.

	inputModel globalInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
	self assert: e2 id asSymbol equals: #goodbye.
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateSingleElementModel [

	| propertyModel inputModel builder e1 |
	e1 := BlElement new
		      id: #'hello world';
		      yourself.
	propertyModel := PyramidPropertyModel new states:
		                 { (PyramidCommandState new
			                  arguments: 'hello world';
			                  source: {
					                  e1
					                   }) }.
	builder := builder := self builderFrom: propertyModel.
	inputModel := builder build.

	self assert: inputModel elementInputModel size equals: 1.
	self assert: inputModel globalInput text equals: 'hello world'.

	inputModel elementInputModel first elementInput
		text: 'test1';
		submit.
	self assert: e1 id asSymbol equals: #test1.

	inputModel elementInputModel first elementInput text: 'test2'.
	inputModel elementInputModel first stateInput click.
	self assert: e1 id asSymbol equals: #test2.

	inputModel elementInputModel first elementInput text: 'test3'.
	inputModel elementInputModel first modelInput click.
	self assert: e1 id asSymbol equals: #test3.

	inputModel globalInput
		text: 'goodbye';
		submit.
	self assert: e1 id asSymbol equals: #goodbye.
]
