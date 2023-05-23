Class {
	#name : #PyramidPropertyInputModelBuilderTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-Cases'
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

{ #category : #'as yet unclassified' }
PyramidPropertyInputModelBuilderTest >> propertyFromCollection: aCollection [

	| property |
	property := PyramidProperty new
		            command: self dummyCommand;
		            pipeline: PyramidPipeline new;
		            yourself.
	PyramidPropertyInputModelBuilderFactory mockPresenter
		installBuilderOn: property.
	property makeNewInputsFor: aCollection.
	^ property
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

	| property |
	property := self propertyFromCollection: {  }.

	self assert: property inputsModel elementInputsModel size equals: 0.
	self assert: property inputsModel stateInputsModel size equals: 0.
	self assert: property inputsModel applyToAllInput text equals: '# no values'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testMultiStatesMultiElementsModel [

	| property e1 e2 e3 |
	e1 := PyramidPropertiesTestDummy new
		      string: #'hello world';
		      yourself.
	e2 := PyramidPropertiesTestDummy new
		      string: #'hello world';
		      yourself.
	e3 := PyramidPropertiesTestDummy new
		      string: #'Bonjour monde';
		      yourself.
	property := self propertyFromCollection: {
			            e1.
			            e2.
			            e3 }.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 2.
	self
		assert: property inputsModel applyToAllInput text
		equals: '# mixed values'.

	(property inputsModel stateInputsFor: e1) input
		text: 'test1';
		submit.
	self assert: e1 string equals: #test1.
	self assert: e2 string equals: #test1.
	self assert: e3 string equals: #'Bonjour monde'.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 2.
	self
		assert: property inputsModel applyToAllInput text
		equals: '# mixed values'.

	(property inputsModel elementInputsFor: e1) input
		text: 'test2';
		submit.
	self assert: e1 string equals: #test2.
	self assert: e2 string equals: #test1.
	self assert: e3 string equals: #'Bonjour monde'.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 3.
	self
		assert: property inputsModel applyToAllInput text
		equals: '# mixed values'.

	(property inputsModel stateInputsFor: e1) input
		text: 'test3';
		submit.
	self assert: e1 string equals: #test3.
	self assert: e2 string equals: #test1.
	self assert: e3 string equals: #'Bonjour monde'.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 3.
	self
		assert: property inputsModel applyToAllInput text
		equals: '# mixed values'.

	(property inputsModel elementInputsFor: e1) input text: 'test4'.
	(property inputsModel elementInputsFor: e1) applyToAllButton click.
	self assert: e1 string equals: #test4.
	self assert: e2 string equals: #test4.
	self assert: e3 string equals: #test4.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test4'.

	(property inputsModel stateInputsFor: e1) input text: 'test5'.
	(property inputsModel stateInputsFor: e1) applyToAllButton click.
	self assert: e1 string equals: #test5.
	self assert: e2 string equals: #test5.
	self assert: e2 string equals: #test5.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test5'.

	property inputsModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 string equals: #goodbye.
	self assert: e2 string equals: #goodbye.
	self assert: e3 string equals: #goodbye.
	self assert: property inputsModel elementInputsModel size equals: 3.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'goodbye'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateMultiElementsModel [

	| property e1 e2 |
	e1 := PyramidPropertiesTestDummy new
		      string: #'hello world';
		      yourself.
	e2 := PyramidPropertiesTestDummy new
		      string: #'hello world';
		      yourself.
	property := self propertyFromCollection: {
			            e1.
			            e2 }.

	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'hello world'.

	(property inputsModel stateInputsFor: e1) input
		text: 'test1';
		submit.
	self assert: e1 string equals: #test1.
	self assert: e2 string equals: #test1.
	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test1'.

	(property inputsModel elementInputsFor: e1) input
		text: 'test2';
		submit.
	self assert: e1 string equals: #test2.
	self assert: e2 string equals: #test1.
	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 2.
	self
		assert: property inputsModel applyToAllInput text
		equals: '# mixed values'.

	(property inputsModel stateInputsFor: e1) input
		text: 'test3';
		submit.
	self assert: e1 string equals: #test3.
	self assert: e2 string equals: #test1.
	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 2.
	self
		assert: property inputsModel applyToAllInput text
		equals: '# mixed values'.

	(property inputsModel elementInputsFor: e1) input text: 'test4'.
	(property inputsModel elementInputsFor: e1) applyToAllButton click.
	self assert: e1 string equals: #test4.
	self assert: e2 string equals: #test4.
	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test4'.

	(property inputsModel stateInputsFor: e1) input text: 'test5'.
	(property inputsModel stateInputsFor: e1) applyToAllButton click.
	self assert: e1 string equals: #test5.
	self assert: e2 string equals: #test5.
	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test5'.

	property inputsModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 string equals: #goodbye.
	self assert: e2 string equals: #goodbye.
	self assert: property inputsModel elementInputsModel size equals: 2.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'goodbye'
]

{ #category : #tests }
PyramidPropertyInputModelBuilderTest >> testSingleStateSingleElementModel [

	| property e1 |
	e1 := PyramidPropertiesTestDummy new
		      string: #'hello world';
		      yourself.
	property := self propertyFromCollection: { e1 }.

	self assert: property inputsModel elementInputsModel size equals: 1.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'hello world'.

	(property inputsModel elementInputsFor: e1) input
		text: 'test1';
		submit.
	self assert: e1 string equals: 'test1'.
	self assert: property inputsModel elementInputsModel size equals: 1.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test1'.

	(property inputsModel stateInputsFor: e1) input
		text: 'test2';
		submit.
	self assert: e1 string equals: 'test2'.
	self assert: property inputsModel elementInputsModel size equals: 1.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test2'.

	(property inputsModel elementInputsFor: e1) input text: 'test3'.
	(property inputsModel elementInputsFor: e1) applyToAllButton click.
	self assert: e1 string equals: 'test3'.
	self assert: property inputsModel elementInputsModel size equals: 1.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test3'.

	(property inputsModel stateInputsFor: e1) input text: 'test4'.
	(property inputsModel stateInputsFor: e1) applyToAllButton click.
	self assert: e1 string equals: 'test4'.
	self assert: property inputsModel elementInputsModel size equals: 1.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'test4'.

	property inputsModel applyToAllInput
		text: 'goodbye';
		submit.
	self assert: e1 string equals: 'goodbye'.
	self assert: property inputsModel elementInputsModel size equals: 1.
	self assert: property inputsModel stateInputsModel size equals: 1.
	self
		assert: property inputsModel applyToAllInput text
		equals: 'goodbye'
]
