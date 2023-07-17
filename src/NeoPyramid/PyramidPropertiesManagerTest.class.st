Class {
	#name : #PyramidPropertiesManagerTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-cases-property'
}

{ #category : #tests }
PyramidPropertiesManagerTest >> testAddProperty [


	| manager prop1 prop2 prop3|
	manager := PyramidPropertiesManager new.
	prop1 := NeoPyramidProperty new
		         name: 'Porp1';
		         command: NeoPyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := NeoPyramidProperty new
		         name: 'Porp2';
		         command: NeoPyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop3 := NeoPyramidProperty new
		         name: 'Porp3';
		         command: NeoPyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.

	manager addProperty: prop1.
	manager addProperty: prop2.
	manager addProperty: prop3.
	self assert: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testBuildPresenterFromCollection [

	| manager fakeStrategy prop1 prop2 prop3 targets |
	targets := { 
NeoPyramidMockObjectForTest new count: 1; yourself.
NeoPyramidMockObjectForTest new count: 2; yourself.
NeoPyramidMockObjectForTest new count: 3; yourself.
NeoPyramidMockObjectForTest new count: 4; yourself }.
	fakeStrategy := PyramidFakePropertyForTestStrategy new.
	manager := PyramidPropertiesManager new
		           presenterStrategy: fakeStrategy;
		           yourself.
	
	prop1 := NeoPyramidProperty new name: 'Porp1'; command: NeoPyramidSimpleMockCommand new ; pyramidInputPresenterClass: PyramidNumberInputPresenter ; yourself.
	prop2 := NeoPyramidProperty new name: 'Porp2'; command: NeoPyramidSimpleMockCommand new ; pyramidInputPresenterClass: PyramidNumberInputPresenter ; yourself.
	prop3 := NeoPyramidProperty new name: 'Porp3'; command: NeoPyramidSimpleMockCommand new ; pyramidInputPresenterClass: PyramidNumberInputPresenter ; yourself.
	
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
	prop1 := NeoPyramidProperty new
		         name: 'Porp1';
		         command: NeoPyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := NeoPyramidProperty new
		         name: 'Porp2';
		         command: NeoPyramidSimpleMockCommand new;
		         pyramidInputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	manager addProperty: prop1.
	manager addProperty: prop2.
	manager commandExecutor: fake1.
	self assert: prop1 commandExecutor equals: fake1.
	self assert: prop2 commandExecutor equals: fake1.
	prop3 := NeoPyramidProperty new
		         name: 'Porp3';
		         command: NeoPyramidSimpleMockCommand new;
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
