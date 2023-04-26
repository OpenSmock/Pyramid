Class {
	#name : #PyramidPropertiesViewTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-plugin-properties'
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
PyramidPropertiesViewTest >> booleanCommand [

	^ PyramidCommand
		  name: '<A>'
		  set: [ :state :obj |  ]
		 get: [ :state :obj |
			  state source: obj.
			  state arguments: '<B>' ]
		  isExecutableBlock: [ :obj :state | obj == true ]
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
	Add a property <B> that should be displayed if selection contains boolean.
	Add a property <C> that should never be displayed.
	Update the selection (pyramidActiveProjectSelectionHasBeenUpdated) with no boolean.
	Verify only <A> is displayed.
	Update the selection (pyramidActiveProjectSelectionHasBeenUpdated) with a boolean.
	Verify only <A> and <B> are displayed."

	| propertyA propertyB propertyC view activeProject |
	activeProject := PyramidActiveProjectModel new.

	propertyA := PyramidProperty new
		             command: self alwaysTrueCommand;
		             yourself.
	propertyB := PyramidProperty new
		             command: self booleanCommand;
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

	activeProject selection replaceAll: { 'hello'. 'test' }.
	self assert: view propertyViews size equals: 1.
	self assert: (view propertyViews anySatisfy: [ :each |
			 each model globalInput text = '<A>' ]).
	self assert: (view propertyViews noneSatisfy: [ :each |
			 each model globalInput text = '<B>' ]).
	self assert: (view propertyViews noneSatisfy: [ :each |
			 each model globalInput text = '<C>' ]).

	activeProject selection replaceAll: { 'hello' . true. $a. 'test' }.
	self assert: view propertyViews size equals: 2.
	self assert: (view propertyViews anySatisfy: [ :each |
			 each model globalInput text = '<A>' ]).
	self assert: (view propertyViews anySatisfy: [ :each |
			 each model globalInput text = '<B>' ]).
	self assert: (view propertyViews noneSatisfy: [ :each |
			 each model globalInput text = '<C>' ])
]