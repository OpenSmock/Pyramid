Class {
	#name : #PyramidPropertiesViewTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertiesViewTest >> alwaysFalseCommand [

	^ PyramidCommand
		  name: '<C>'
		  set: [ :state :obj |  ]
		  get: [ :state :obj |
			  state source: obj.
			  state arguments: '<C>' ]
		  isExecutableBlock: [ :obj :state | false ]
]

{ #category : #'as yet unclassified' }
PyramidPropertiesViewTest >> alwaysTrueCommand [

	^ PyramidCommand
		  name: '<A>'
		  set: [ :state :obj |  ]
		  get: [ :state :obj |
			  state source: obj.
			  state arguments: '<A>' ]
		  isExecutableBlock: [ :obj :state | true ]
]

{ #category : #'as yet unclassified' }
PyramidPropertiesViewTest >> isTotoCommand [

	^ PyramidCommand
		  name: '<A>'
		  set: [ :state :obj |  ]
		  get: [ :state :obj |
			  state source: obj.
			  state arguments: '<B>' ]
		  isExecutableBlock: [ :obj :state | obj isToto ]
]

{ #category : #tests }
PyramidPropertiesViewTest >> testAddProperty [
	"Test:
	
	Add a property.
	Verify a property should be added.
	Try adding the same property.
	Verify no property shoud be added."

	| view property |
	property := PyramidProperty new.
	view := PyramidPropertiesView new.
	self assert: view properties size equals: 0.

	view addProperty: property.
	self assert: view properties size equals: 1.
	self assert:
		(view properties anySatisfy: [ :each | each = property ]).

	view addProperty: property.
	self assert: view properties size equals: 1.
	self assert:
		(view properties anySatisfy: [ :each | each = property ])
]

{ #category : #tests }
PyramidPropertiesViewTest >> testUpdatePropertyViews [
	"Test:
	
	Add a property <A> that should always be displayed.
	Add a property <B> that should be displayed if object in selection is toto.
	Add a property <C> that should never be displayed.
	Verify <A> <B> <C> targetModel is empty.
	Update the selection (pyramidActiveProjectSelectionHasBeenUpdated) with no toto.
	Verify only <A> is displayed.
	Verify <A> targetModel is not empty, <B> <C> targetModel is empty.
	Update the selection (pyramidActiveProjectSelectionHasBeenUpdated) with one toto.
	Verify only <A> and <B> are displayed.
	Verify <A> <B> targetModel is not empty, <C> targetModel is empty."

	| propertyA propertyB propertyC view activeProject |
	activeProject := PyramidProjectModel new.

	propertyA := PyramidProperty new
		             command: self alwaysTrueCommand;
		             yourself.
	propertyB := PyramidProperty new
		             command: self isTotoCommand;
		             yourself.
	propertyC := PyramidProperty new
		             command: self alwaysFalseCommand;
		             yourself.
	PyramidPropertyInputModelBuilderFactory mockPresenter
		installBuilderOn: propertyA.
	PyramidPropertyInputModelBuilderFactory mockPresenter
		installBuilderOn: propertyB.
	PyramidPropertyInputModelBuilderFactory mockPresenter
		installBuilderOn: propertyC.

	view := PyramidPropertiesView new.
	view activeProject: activeProject.

	view addProperty: propertyA.
	view addProperty: propertyB.
	view addProperty: propertyC.

	self assert: propertyA targetModel isEmpty.
	self assert: propertyB targetModel isEmpty.
	self assert: propertyC targetModel isEmpty.

	activeProject selection replaceAll: {
			PyramidPropertiesTestDummy new.
			PyramidPropertiesTestDummy new }.
	self assert: view propertyViews size equals: 1.
	self assert: (view propertyViews anySatisfy: [ :each |
			 each property inputsModel applyToAllInput text = '<A>' ]).
	self assert: (view propertyViews noneSatisfy: [ :each |
			 each property inputsModel applyToAllInput text = '<B>' ]).
	self assert: (view propertyViews noneSatisfy: [ :each |
			 each property inputsModel applyToAllInput text = '<C>' ]).
	self assert: propertyA targetModel size equals: 2.
	self assert: propertyB targetModel isEmpty.
	self assert: propertyC targetModel isEmpty.

	activeProject selection replaceAll: {
			PyramidPropertiesTestDummy new.
			PyramidPropertiesTestDummy new beToto.
			PyramidPropertiesTestDummy new.
			PyramidPropertiesTestDummy new }.
	self assert: view propertyViews size equals: 2.
	self assert: (view propertyViews anySatisfy: [ :each |
			 each property inputsModel applyToAllInput text = '<A>' ]).
	self assert: (view propertyViews anySatisfy: [ :each |
			 each property inputsModel applyToAllInput text = '<B>' ]).
	self assert: (view propertyViews noneSatisfy: [ :each |
			 each property inputsModel applyToAllInput text = '<C>' ]).
	self assert: propertyA targetModel size equals: 4.
	self assert: propertyB targetModel size equals: 1.
	self assert: propertyC targetModel isEmpty
]
