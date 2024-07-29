Class {
	#name : #PyramidNavigationTreePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'navigationModel',
		'treeTable',
		'editor',
		'shouldUpdateSelection'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #'as yet unclassified' }
PyramidNavigationTreePresenter >> actionEditorMenu [

	| builder |
	self editor ifNil: [ ^ SpMenuPresenter new ].
	builder := (self editor window services at: #selectionMenu) builder.
	^ builder menuFor: self editor projectModel selection
]

{ #category : #'as yet unclassified' }
PyramidNavigationTreePresenter >> actionSelectionChanged: aSelection [

	self editor ifNil: [ ^ self ].
	self shouldUpdateSelection ifFalse: [ ^ self ].
	self shouldUpdateSelection: false.
	[ self editor projectModel setSelection: aSelection selectedItems ]
		ensure: [ self shouldUpdateSelection: true ]
]

{ #category : #initialization }
PyramidNavigationTreePresenter >> allTreeColumns [

	| pragmas sorted |
	pragmas := Pragma allNamed: #pyramidNavigationColumn:.
	sorted := pragmas sorted: [ :a :b |
		          a arguments first < b arguments first ].
	^ sorted collect: [ :each |
		  each method
			  receiver: self
			  withArguments: #(  )
			  executeMethod: each method ]
]

{ #category : #private }
PyramidNavigationTreePresenter >> childrenFor: aBlElement [

	self displayAllChildren ifTrue: [ ^ aBlElement children ].
	aBlElement shouldSerializedChildren ifTrue: [ ^ aBlElement children ].
	^ {  }
]

{ #category : #layout }
PyramidNavigationTreePresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self treeTable;
		  yourself
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> displayAllChildren [

	^ self navigationModel displayAllChildren
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> editor [

	^ editor
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> editor: anObject [

	editor := anObject.
	editor projectModel announcer
		when: PyramidElementsChangedEvent
		do: [ :evt | self updateRoots. self updateSelection ]
		for: self.
	editor projectModel announcer
		when: PyramidFirstLevelElementsChangedEvent
		do: [ :evt | self updateRoots. ]
		for: self.
	editor projectModel announcer
		when: PyramidSelectionChangedEvent
		do: [ :evt | self updateSelection ]
		for: self
]

{ #category : #initialization }
PyramidNavigationTreePresenter >> initializePresenters [

	shouldUpdateSelection := true.

	treeTable := SpTreeTablePresenter new.
	treeTable
		beMultipleSelection;
		beResizable;
		roots: {  };
		children: [ :aBlElement | self childrenFor: aBlElement ];
		contextMenu: [ self actionEditorMenu ];
		whenSelectionChangedDo: [ :aSelection |
			self actionSelectionChanged: aSelection ];
		expandAll.
	self allTreeColumns do: [ :each | treeTable addColumn: each ]
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> navigationModel [

	^ navigationModel
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> navigationModel: anObject [

	navigationModel := anObject.
	navigationModel property: #displayAllChildren whenChangedDo: [
		(self treeTable selection selectedItems
			allSatisfy: [ :each | each parentsShouldSerializeChildren ])
			ifTrue: [
			self treeTable updateRootsKeepingSelection: self treeTable roots ]
			ifFalse: [ self treeTable roots: self treeTable roots ].
		self treeTable expandAll ]
]

{ #category : #api }
PyramidNavigationTreePresenter >> roots: aCollection [

	self treeTable roots: aCollection
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> shouldUpdateSelection [

	^ shouldUpdateSelection
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> shouldUpdateSelection: anObject [

	shouldUpdateSelection := anObject
]

{ #category : #accessing }
PyramidNavigationTreePresenter >> treeTable [

	^ treeTable
]

{ #category : #'as yet unclassified' }
PyramidNavigationTreePresenter >> updateRoots [

	| roots parent shouldOrder |
	self shouldUpdateSelection: false.

	roots := self editor projectModel firstLevelElements asArray.
	parent := nil.

	"If roots all have the same parent then it should be ordered by the parent children order."
	shouldOrder := (roots allSatisfy: [ :each |
		                parent ifNil: [ parent := each parent ].
		                each parent = parent ]) and: [
		               parent notNil and: [
			               parent childrenCount = roots size ] ].
	shouldOrder ifTrue: [ roots := parent children asArray ].

	[ self treeTable roots: roots ] ensure: [
		self shouldUpdateSelection: true ]
]

{ #category : #selection }
PyramidNavigationTreePresenter >> updateSelection [

	self editor projectModel ifNil: [ ^ self ].
	self shouldUpdateSelection ifFalse: [ ^ self ].
	self shouldUpdateSelection: false.
	[
	self treeTable unselectAll.
	self editor projectModel selection ifNotEmpty: [ :e |
		self treeTable selectItems: e ] ] ensure: [
		self shouldUpdateSelection: true ]
]
