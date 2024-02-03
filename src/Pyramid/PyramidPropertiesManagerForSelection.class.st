Class {
	#name : #PyramidPropertiesManagerForSelection,
	#superclass : #PyramidPropertiesManager,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'presenter',
		'projectModel',
		'shouldComputeProperties'
	],
	#category : #'Pyramid-property'
}

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> computeProperties [

	self presenter layout child:
		(self buildPresenterFromCollection: self projectModel selection).
		self shouldComputeProperties: false
]

{ #category : #initialization }
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

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> projectModel: aPyramidProjectModel [

	projectModel ifNotNil: [ projectModel removeObserver: self ].
	projectModel := aPyramidProjectModel.
	projectModel addObserver: self
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidElementsChanged [

	self shouldComputeProperties: true.
	self presenter isVisible ifFalse: [ ^ self ].
	self computeProperties
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidSelectionChanged [

	self shouldComputeProperties: true.
	self presenter isVisible ifFalse: [ ^ self ].
	self computeProperties
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties [

	^ shouldComputeProperties
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties: aBoolean [

	shouldComputeProperties:= aBoolean
]
