Class {
	#name : #PyramidPropertiesManagerTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-property'
}

{ #category : #tests }
PyramidPropertiesManagerTest >> testAddAllProperties [

	| manager prop1 prop2 prop3 |
	manager := PyramidPropertiesManager new commandExecutor: Object new; yourself.
	prop1 := PyramidProperty new
		         name: 'Porp1';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := PyramidProperty new
		         name: 'Porp2';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop3 := PyramidProperty new
		         name: 'Porp3';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.

	manager addAllProperties: { prop1. prop2 . prop3 }.
	self assert: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	self assert: manager commandExecutor equals: prop1 commandExecutor.
	self assert: manager commandExecutor equals: prop2 commandExecutor.
	self assert: manager commandExecutor equals: prop3 commandExecutor.
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testAddProperty [

	| manager prop1 prop2 prop3 |
	manager := PyramidPropertiesManager new commandExecutor: Object new;
		           yourself.
	prop1 := PyramidProperty new
		         name: 'Porp1';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := PyramidProperty new
		         name: 'Porp2';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop3 := PyramidProperty new
		         name: 'Porp3';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.

	manager addProperty: prop1.
	manager addProperty: prop2.
	manager addProperty: prop3.
	self assert: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	self assert: manager commandExecutor equals: prop1 commandExecutor.
	self assert: manager commandExecutor equals: prop2 commandExecutor.
	self assert: manager commandExecutor equals: prop3 commandExecutor
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testBuildPresenterFromCollection [

	| manager fakeStrategy prop1 prop2 prop3 targets |
	targets := { 
PyramidMockObjectForTest new count: 1; yourself.
PyramidMockObjectForTest new count: 2; yourself.
PyramidMockObjectForTest new count: 3; yourself.
PyramidMockObjectForTest new count: 4; yourself }.
	fakeStrategy := PyramidFakePropertyForTestStrategy new.
	manager := PyramidPropertiesManager new
		           presenterStrategy: fakeStrategy;
		           yourself.
	
	prop1 := PyramidProperty new name: 'Porp1'; command: PyramidSimpleMockCommand new ; pyramidInputPresenterClass: PyramidNumberInputPresenter ; yourself.
	prop2 := PyramidProperty new name: 'Porp2'; command: PyramidSimpleMockCommand new ; pyramidInputPresenterClass: PyramidNumberInputPresenter ; yourself.
	prop3 := PyramidProperty new name: 'Porp3'; command: PyramidSimpleMockCommand new ; pyramidInputPresenterClass: PyramidNumberInputPresenter ; yourself.
	
	manager addProperty: prop1.
	manager addProperty: prop2.
	manager addProperty: prop3.
	
	manager buildPresenterFromCollection: targets.
	
	self assert: fakeStrategy properties size equals: 3.
	self assert: (fakeStrategy properties includes: prop1).
	self assert: (fakeStrategy properties includes: prop2).
	self assert: (fakeStrategy properties includes: prop3).
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testCommandExecutor [

	| manager prop1 prop2 prop3 fake1 fake2 |
	fake1 := Object new.
	manager := PyramidPropertiesManager new.
	prop1 := PyramidProperty new
		         name: 'Porp1';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := PyramidProperty new
		         name: 'Porp2';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	manager addProperty: prop1.
	manager addProperty: prop2.
	manager commandExecutor: fake1.
	self assert: prop1 commandExecutor equals: fake1.
	self assert: prop2 commandExecutor equals: fake1.
	prop3 := PyramidProperty new
		         name: 'Porp3';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	manager addProperty: prop3.
	self assert: prop3 commandExecutor equals: fake1.

	fake2 := Object new.
	manager commandExecutor: fake2.
	self assert: prop1 commandExecutor equals: fake2.
	self assert: prop2 commandExecutor equals: fake2.
	self assert: prop3 commandExecutor equals: fake2
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testRemoveAllProperties [

	| manager prop1 prop2 prop3 |
	manager := PyramidPropertiesManager new
		           commandExecutor: Object new;
		           yourself.
	prop1 := PyramidProperty new
		         name: 'Porp1';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := PyramidProperty new
		         name: 'Porp2';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop3 := PyramidProperty new
		         name: 'Porp3';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.

	manager addAllProperties: {
			prop1.
			prop2.
			prop3 }.
	self assert: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	self assert: manager commandExecutor equals: prop1 commandExecutor.
	self assert: manager commandExecutor equals: prop2 commandExecutor.
	self assert: manager commandExecutor equals: prop3 commandExecutor.
	manager removeAllProperties.
	self deny: (manager properties includes: prop1).
	self deny: (manager properties includes: prop2).
	self deny: (manager properties includes: prop3).

]

{ #category : #tests }
PyramidPropertiesManagerTest >> testRemoveProperty [

	| manager prop1 prop2 prop3 hasFailed |
	manager := PyramidPropertiesManager new
		           commandExecutor: Object new;
		           yourself.
	prop1 := PyramidProperty new
		         name: 'Porp1';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := PyramidProperty new
		         name: 'Porp2';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop3 := PyramidProperty new
		         name: 'Porp3';
		         command: PyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.

	manager addAllProperties: {
			prop1.
			prop2.
			prop3 }.
	self assert: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	self assert: manager commandExecutor equals: prop1 commandExecutor.
	self assert: manager commandExecutor equals: prop2 commandExecutor.
	self assert: manager commandExecutor equals: prop3 commandExecutor.
	manager removeProperty: prop1.
	self deny: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	manager removeProperty: prop2.
	self deny: (manager properties includes: prop1).
	self deny: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	manager removeProperty: prop3.
	self deny: (manager properties includes: prop1).
	self deny: (manager properties includes: prop2).
	self deny: (manager properties includes: prop3).
	hasFailed := false.
	[ manager removeProperty: prop3 ]
		on: PyramidPropertyNotInstalledError
		do: [ :error |
			self assert: error manager equals: manager.
			self assert: error property equals: prop3.
			hasFailed := true ].
	self assert: hasFailed
]
