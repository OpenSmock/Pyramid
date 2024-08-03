Class {
	#name : #PyramidPropertiesManagerForSelection,
	#superclass : #PyramidPropertiesManager,
	#instVars : [
		'mainPresenter',
		'shouldComputeProperties',
		'projectModel',
		'popupPresenter'
	],
	#category : #'Pyramid-property'
}

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> computeProperties: aCollection [

	self mainPresenter layout child:
		(self buildPresenterFromCollection: aCollection).
	self shouldComputeProperties: false
]

{ #category : #initialization }
PyramidPropertiesManagerForSelection >> initialize [

	super initialize.
	shouldComputeProperties := false.
	mainPresenter := SpPresenter new
		                 layout: SpScrollableLayout new;
		                 whenVisibleChangedDo: [ :isVisible |
			                 isVisible ifTrue: [
					                 self computeProperties:
							                 self projectModel selection ] ];
		                 yourself.
	popupPresenter := PyramidSinglePropertyPopupPresenter new
		                  originPresenter: mainPresenter;
		                  popoverDirection: SpPopoverPosition left;
		                  yourself.
]

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> mainPresenter [

	^ mainPresenter 
]

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> popupPresenter [

	^ popupPresenter
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> presenterBuilder [

	^ PyramidSinglePopingPresenterBuilder new
		  popupPanel: self popupPresenter;
		  yourself
]

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidPropertiesManagerForSelection >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel.
	aPyramidProjectModel announcer
		when: PyramidElementsChangedEvent
		do: [ :evt | self selectionOrElementsChanged: evt ]
		for: self.
	aPyramidProjectModel announcer
		when: PyramidSelectionChangedEvent
		do: [ :evt | self selectionOrElementsChanged: evt ]
		for: self.
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> selectionOrElementsChanged: anEvent [

	self shouldComputeProperties: true.
	self mainPresenter isVisible ifFalse: [ ^ self ].
	self computeProperties: anEvent selection
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties [

	^ shouldComputeProperties
]

{ #category : #'as yet unclassified' }
PyramidPropertiesManagerForSelection >> shouldComputeProperties: aBoolean [

	shouldComputeProperties:= aBoolean
]
