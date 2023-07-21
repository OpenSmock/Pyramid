Class {
	#name : #PyramidPropertiesManagerForSelection,
	#superclass : #PyramidPropertiesManager,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'presenter',
		'projectModel'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #initialization }
PyramidPropertiesManagerForSelection >> initialize [

	super initialize.
	presenter := SpPresenter new
		             layout: SpScrollableLayout new;
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

	self presenter layout child:
		(self buildPresenterFromCollection: self projectModel selection)
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> pyramidSelectionChanged [

	self presenter layout child:
		(self buildPresenterFromCollection: self projectModel selection)
]
