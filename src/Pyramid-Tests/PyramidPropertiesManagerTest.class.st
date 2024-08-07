Class {
	#name : #PyramidPropertiesManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'commandExecutor',
		'presenterBuilder',
		'manager',
		'presenterStrategy',
		'prop1',
		'prop2',
		'prop3'
	],
	#category : #'Pyramid-Tests-cases-property'
}

{ #category : #accessing }
PyramidPropertiesManagerTest >> commandExecutor [

	^ commandExecutor
]

{ #category : #accessing }
PyramidPropertiesManagerTest >> manager [

	^ manager
]

{ #category : #accessing }
PyramidPropertiesManagerTest >> presenterBuilder [

	^ presenterBuilder
]

{ #category : #accessing }
PyramidPropertiesManagerTest >> presenterStrategy [

	^ presenterStrategy
]

{ #category : #accessing }
PyramidPropertiesManagerTest >> prop1 [

	^ prop1
]

{ #category : #accessing }
PyramidPropertiesManagerTest >> prop2 [

	^ prop2
]

{ #category : #accessing }
PyramidPropertiesManagerTest >> prop3 [

	^ prop3
]

{ #category : #running }
PyramidPropertiesManagerTest >> setUp [

	super setUp.
	
	prop1 := PyramidProperty new
		         name: 'Porp1';
		         command: PyramidSimpleMockCommand new;
		         inputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop2 := PyramidProperty new
		         name: 'Porp2';
		         command: PyramidSimpleMockCommand new;
		         inputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	prop3 := PyramidProperty new
		         name: 'Porp3';
		         command: PyramidSimpleMockCommand new;
		         inputPresenterClass: PyramidNumberInputPresenter;
		         yourself.
	
	presenterStrategy := PyramidFakePropertyForTestStrategy new.
	commandExecutor := PyramidMainCommandExecutor new.
	presenterBuilder := PyramidFakePresenterBuilder new.
	manager := PyramidPropertiesManagerForTest new
		           commandExecutor: commandExecutor;
		           presenterBuilder: presenterBuilder;
		           presenterStrategy: presenterStrategy;
		           yourself
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testAddAllProperties [

	self manager addAllProperties: {
			prop1.
			prop2.
			prop3 }.
	self assert: (self manager properties includes: prop1).
	self assert: (self manager properties includes: prop2).
	self assert: (self manager properties includes: prop3).
	self
		assert: self manager commandExecutor
		equals: prop1 commandExecutor.
	self
		assert: self manager commandExecutor
		equals: prop2 commandExecutor.
	self
		assert: self manager commandExecutor
		equals: prop3 commandExecutor.
	self assert: self presenterBuilder equals: prop1 presenterBuilder.
	self assert: self presenterBuilder equals: prop2 presenterBuilder.
	self assert: self presenterBuilder equals: prop3 presenterBuilder
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testAddProperty [

	manager addProperty: prop1.
	manager addProperty: prop2.
	manager addProperty: prop3.
	self assert: (manager properties includes: prop1).
	self assert: (manager properties includes: prop2).
	self assert: (manager properties includes: prop3).
	self assert: manager commandExecutor equals: prop1 commandExecutor.
	self assert: manager commandExecutor equals: prop2 commandExecutor.
	self assert: manager commandExecutor equals: prop3 commandExecutor.
	self assert: self presenterBuilder equals: prop1 presenterBuilder.
	self assert: self presenterBuilder equals: prop2 presenterBuilder.
	self assert: self presenterBuilder equals: prop3 presenterBuilder
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testBuildPresenterFromCollection [

	| targets |
	targets := {
		           (PyramidMockObjectForTest new
			            count: 1;
			            yourself).
		           (PyramidMockObjectForTest new
			            count: 2;
			            yourself).
		           (PyramidMockObjectForTest new
			            count: 3;
			            yourself).
		           (PyramidMockObjectForTest new
			            count: 4;
			            yourself) }.

	manager addProperty: prop1.
	manager addProperty: prop2.
	manager addProperty: prop3.

	manager buildPresenterFromCollection: targets.

	self assert: self presenterStrategy properties size equals: 3.
	self assert: (self presenterStrategy properties includes: prop1).
	self assert: (self presenterStrategy properties includes: prop2).
	self assert: (self presenterStrategy properties includes: prop3)
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testCommandExecutor [

	| fake1 fake2 |
	fake1 := PyramidMainCommandExecutor new.
	
	manager addProperty: prop1.
	manager addProperty: prop2.
	manager commandExecutor: fake1.
	self assert: prop1 commandExecutor equals: fake1.
	self assert: prop2 commandExecutor equals: fake1.
	manager addProperty: prop3.
	self assert: prop3 commandExecutor equals: fake1.

	fake2 := PyramidMainCommandExecutor new.
	manager commandExecutor: fake2.
	self assert: prop1 commandExecutor equals: fake2.
	self assert: prop2 commandExecutor equals: fake2.
	self assert: prop3 commandExecutor equals: fake2
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testRemoveAllProperties [


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
	self deny: (manager properties includes: prop3)
]

{ #category : #tests }
PyramidPropertiesManagerTest >> testRemoveProperty [

	| hasFailed |

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
