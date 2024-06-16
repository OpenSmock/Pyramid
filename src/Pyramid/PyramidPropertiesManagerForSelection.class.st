Class {
	#name : 'PyramidPropertiesManagerForSelection',
	#superclass : 'PyramidPropertiesManager',
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'presenter',
		'projectModel',
		'shouldComputeProperties'
	],
	#category : 'Pyramid-property',
	#package : 'Pyramid',
	#tag : 'property'
}

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> computeProperties [

	self presenter layout child:
		(self buildPresenterFromCollection: self projectModel selection).
		self shouldComputeProperties: false
]

{ #category : 'initialization' }
PyramidPropertiesManagerForSelection >> initialize [

	super initialize.
	shouldComputeProperties := false.
	presenter := SpPresenter new
		             layout: SpScrollableLayout new;
		whenVisibleChangedDo: [ :isVisible | isVisible ifTrue: [ self computeProperties ] ];
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
	projectModel announcer when: PyramidElementsChangedEvent send: #pyramidElementsChanged: to: self.
	projectModel announcer when: PyramidSelectionChangedEvent send: #pyramidSelectionChanged: to: self.

]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidElementsChanged [

	self selectionOrElementsChanged
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidElementsChanged: anEvent [

	self selectionOrElementsChanged
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidSelectionChanged [

	self selectionOrElementsChanged
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidSelectionChanged: anEvent [

	self selectionOrElementsChanged
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> selectionOrElementsChanged [

	self shouldComputeProperties: true.
	self presenter isVisible ifFalse: [ ^ self ].
	self computeProperties
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties [

	^ shouldComputeProperties
]

{ #category : 'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties: aBoolean [

	shouldComputeProperties:= aBoolean
]
