Class {
	#name : 'PyramidPropertiesManagerForSelection',
	#superclass : 'PyramidPropertiesManager',
	#instVars : [
		'presenter',
		'shouldComputeProperties',
		'projectModel'
	],
	#category : 'Pyramid-property',
	#package : 'Pyramid',
	#tag : 'property'
}

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> computeProperties: aCollection [

	self presenter layout child:
		(self buildPresenterFromCollection: aCollection).
	self shouldComputeProperties: false
]

{ #category : 'initialization' }
PyramidPropertiesManagerForSelection >> initialize [

	super initialize.
	shouldComputeProperties := false.
	presenter := SpPresenter new
		             layout: SpScrollableLayout new;
		             whenVisibleChangedDo: [ :isVisible |
			             isVisible ifTrue: [ self computeProperties: self projectModel selection ] ];
		             yourself.
	commandExecutor := PyramidCallbackCommandExecutor new
		                   wrappee: commandExecutor;
		                   yourself.
	commandExecutor afterDo: [ self projectModel informElementsChanged ]
]

{ #category : 'accessing' }
PyramidPropertiesManagerForSelection >> presenter [

	^ presenter
]

{ #category : 'accessing' }
PyramidPropertiesManagerForSelection >> projectModel [

	^ projectModel
]

{ #category : 'accessing' }
PyramidPropertiesManagerForSelection >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel.
	aPyramidProjectModel announcer
		when: PyramidElementsChangedEvent
		send: #selectionOrElementsChanged:
		to: self.
	aPyramidProjectModel announcer
		when: PyramidSelectionChangedEvent
		send: #selectionOrElementsChanged:
		to: self
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> selectionOrElementsChanged: anEvent [

	self shouldComputeProperties: true.
	self presenter isVisible ifFalse: [ ^ self ].
	self computeProperties: anEvent selection
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties [

	^ shouldComputeProperties
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties: aBoolean [

	shouldComputeProperties:= aBoolean
]
