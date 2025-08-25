Class {
	#name : #PyramidStampManagerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'projectModel',
		'styleSheetEditor',
		'treeTableStamp',
		'pyramidPropertiesStrategy',
		'stampPresenterLabel',
		'selectedStamp',
		'removeStampButton',
		'currentSelectedElement',
		'treeTableAddStampPresenter',
		'selectedStampEquipped',
		'selectedStampToAdd',
		'addStampButton'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #adding }
PyramidStampManagerPresenter >> addRootsStampAddTreeTable: aElement [

	| collectionOfStamps |
	
	collectionOfStamps := pyramidPropertiesStrategy propertiesFor: aElement.
	
	^ collectionOfStamps.
]

{ #category : #'as yet unclassified' }
PyramidStampManagerPresenter >> allStampFromElement: aElement [

	| stampsCollection |
	stampsCollection := OrderedCollection new.

	aElement allStamps do: [ :aStamp |
		stampsCollection add: (PyramidProperty new
				 name: aStamp;
				 command: (PyramidStampCommand new
						  stamp: aStamp;
						  yourself)) ].

	stampsCollection isEmpty ifTrue: [
		treeTableStamp roots: {  }.
		^ self ].

	treeTableStamp roots: stampsCollection asArray
]

{ #category : #accessing }
PyramidStampManagerPresenter >> currentSelectedElement [

	^ currentSelectedElement
]

{ #category : #layout }
PyramidStampManagerPresenter >> defaultLayout [

	| defaultLayout stampPresenterTree stampPresenterLabelLine stampToolBarButton addStampButtonToolBar removeStampButtonToolBar |
	
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 6;
		                 yourself.

	stampPresenterLabelLine := SpBoxLayout newHorizontal
		                           hAlignStart;
		                           yourself.
	stampPresenterLabelLine add: stampPresenterLabel.

	stampToolBarButton := SpBoxLayout newHorizontal
		                      hAlign;
		                      yourself.
		
	addStampButtonToolBar := SpBoxLayout newHorizontal
		                      hAlignStart;
		                      yourself.
		
	removeStampButtonToolBar := SpBoxLayout newHorizontal
		                      hAlignEnd;
		                      yourself.
	
	addStampButtonToolBar add: addStampButton width: 125.
	removeStampButtonToolBar add: removeStampButton width: 125.
	
	stampToolBarButton add: addStampButtonToolBar.
	stampToolBarButton add: removeStampButtonToolBar.

	stampPresenterTree := SpBoxLayout newVertical.
	stampPresenterTree add: treeTableStamp.

	defaultLayout add: stampPresenterLabelLine expand: false.
	defaultLayout add: stampToolBarButton expand: false.
	defaultLayout add: stampPresenterTree expand: true.

	^ defaultLayout
]

{ #category : #'as yet unclassified' }
PyramidStampManagerPresenter >> elementsOrSelectionChanged: anEvent [
	
	(anEvent selection isEmpty or:[ anEvent selection size > 1 ])
	ifTrue: [ treeTableStamp roots: {  }. addStampButton disable. ^ self ].
	
	currentSelectedElement := anEvent selection first.
	self allStampFromElement: currentSelectedElement.
	addStampButton enable.
]

{ #category : #'initialization - deprecated' }
PyramidStampManagerPresenter >> initializePresenter [ 
	
	stampPresenterLabel := SpLabelPresenter new 
							displayBold: [ true ];
							label: 'Selected element stamp :';
							yourself.
							
	addStampButton := SpButtonPresenter new
								label: 'Add Stamp';
								icon: (Smalltalk ui icons iconNamed: #add);
								whenActivatedDo: [ self openModalAddStampTreeTable ];
								disable.
							
	removeStampButton := SpButtonPresenter new
								label: 'Remove Stamp';
								icon: (Smalltalk ui icons iconNamed: #cancel);
								whenActivatedDo: [ self removeSelectedStamp: selectedStampEquipped ];
								disable.
	
	treeTableStamp := SpTreeTablePresenter new.
	treeTableStamp whenSelectedItemChangedDo: [ :aStampSelected | selectedStampEquipped := aStampSelected.
										selectedStampEquipped 
										ifNil: [ removeStampButton disable ] 
										ifNotNil: [ removeStampButton enable ] ].
									
	treeTableStamp addColumn: (SpCompositeTableColumn new
			title: 'Stamp';
			addColumn: (SpStringTableColumn evaluated: #name);
			yourself).
			
	treeTableAddStampPresenter := PyramidAddStampPresenter new
											stampManagerPresenter: self.

]

{ #category : #'as yet unclassified' }
PyramidStampManagerPresenter >> openModalAddStampTreeTable [

	| dialog window |
	
	projectModel selection isEmpty
	ifTrue: [ ^ self ].
	projectModel selection size > 1
	ifTrue: [ ^ self ].
	
	window := treeTableAddStampPresenter asModalWindow.
	
	treeTableAddStampPresenter treeTableAddStamp roots: (self addRootsStampAddTreeTable: currentSelectedElement).
	
	window title: 'Add stamp to the selected element'.
	dialog := window open.
]

{ #category : #accessing }
PyramidStampManagerPresenter >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidStampManagerPresenter >> projectModel: aPyramidProjectModel [

	projectModel := aPyramidProjectModel.
	projectModel announcer
		when: PyramidElementsChangedEvent
		do: [ :evt | self elementsOrSelectionChanged: evt ]
		for: self.
	projectModel announcer
		when: PyramidSelectionChangedEvent
		do: [ :evt | self elementsOrSelectionChanged: evt ]
		for: self.
]

{ #category : #accessing }
PyramidStampManagerPresenter >> pyramidPropertiesStrategy [

	^ pyramidPropertiesStrategy
]

{ #category : #accessing }
PyramidStampManagerPresenter >> pyramidPropertiesStrategy: aPyramidPropertiesStrategy [

	pyramidPropertiesStrategy := aPyramidPropertiesStrategy
]

{ #category : #adding }
PyramidStampManagerPresenter >> refreshStampTreeTable [

	self allStampFromElement: currentSelectedElement.
]

{ #category : #removing }
PyramidStampManagerPresenter >> removeSelectedStamp: aSelectedStamp [

	selectedStampEquipped ifNil: [ ^ self ].

	selectedStampEquipped command 
		setValueFor: currentSelectedElement 
		with: false.
	
	self refreshStampTreeTable.
]

{ #category : #accessing }
PyramidStampManagerPresenter >> styleSheetEditor [

	^ styleSheetEditor
]

{ #category : #accessing }
PyramidStampManagerPresenter >> styleSheetEditor: aStyleSheetEditor [

	styleSheetEditor := aStyleSheetEditor 
]

{ #category : #accessing }
PyramidStampManagerPresenter >> treeTableStamp [

	^ treeTableStamp
]
