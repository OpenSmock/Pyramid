Class {
	#name : #PyramidTreeView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver + TPyramidPipelineObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait + TPyramidPipelineObserver classTrait',
	#instVars : [
		'tree',
		'roots',
		'activeProject',
		'shouldChangeSelection'
	],
	#category : #'Pyramid-Bloc-plugin-tree'
}

{ #category : #visiting }
PyramidTreeView >> acceptDrop: aCollection on: aTarget [

	| elementsToAdd |
	elementsToAdd := aCollection collect: [ :each | each asElement ].
	aTarget ifNil: [
		self activeProject roots addAll: elementsToAdd.
		^ self ].
	aTarget addChildren: elementsToAdd.
	self activeProject roots informCollectionChanged
]

{ #category : #accessing }
PyramidTreeView >> activeProject [

	activeProject ifNil: [ activeProject := PyramidNilPrjectModel new. ].
	^ activeProject
]

{ #category : #accessing }
PyramidTreeView >> activeProject: aPyramidActiveProject [

	activeProject := aPyramidActiveProject.
	activeProject addObserver: self.
	self updateRoots
]

{ #category : #accessing }
PyramidTreeView >> columns [

	^ { SpCompositeTableColumn new
		          title: 'Elements';
		          addColumn: (SpImageTableColumn evaluated: [ :aClass |
					           self iconNamed: aClass systemIconName ]);
		          addColumn: (SpStringTableColumn new
				           title: 'Class';
				           evaluated: [ :aClass | aClass class name ];
				           yourself);
		          addColumn: (SpStringTableColumn new
				           title: 'Identity';
				           evaluated: [ :aClass | aClass identityHash printString ];
				           displayColor: [ :aClass | Color gray ];
				           yourself);
		          addColumn: (SpStringTableColumn new
				           title: 'Identifier';
				           evaluated: [ :aClass |
					           aClass id isNoId
						           ifTrue: [ '' ]
						           ifFalse: [ aClass id asSymbol ] ];
				           displayColor: [ :aClass |
					           aClass id isNoId
						           ifTrue: [ Color green ]
						           ifFalse: [ Smalltalk ui theme textColor ] ];
				           yourself);
		          yourself .  }
]

{ #category : #api }
PyramidTreeView >> contextMenu [

	| menu |
	menu := SpMenuPresenter new.
	menu addGroup: [ :group |
		group addItem: [ :item |
			item
				name: 'inspect';
				action: [ tree selectedItem inspect ];
				icon: (self iconNamed: #glamorousInspect);
				yourself ].
		group addItem: [ :item |
			item
				name: 'open in other editor';
				action: [ tree selectedItem openEditor ];
				icon: (self iconNamed: #glamorousSaveToUrl);
				yourself ] ].
	menu addGroup: [ :group |
		group addItem: [ :item |
			item
				name: 'Copy shape';
				shortcut: $c ctrl;
				icon: (self iconNamed: #smallCopy);
				yourself ].
		group addItem: [ :item |
			item
				name: 'Export as png';
				icon: (self iconNamed: #smallScreenshot);
				yourself ] ].
	^ menu
]

{ #category : #accessing }
PyramidTreeView >> currentRoots [

	^ self activeProject roots elements
]

{ #category : #accessing }
PyramidTreeView >> currentSelection [

	^ self activeProject selection elements
]

{ #category : #layout }
PyramidTreeView >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #tree expand: true;
		  yourself
]

{ #category : #initialization }
PyramidTreeView >> initializePresenters [

	shouldChangeSelection := true.
	tree := self newTreeTable.

	tree whenSelectionChangedDo: [ :newSelection |
		self activeProject removeObserver: self.
		self shouldChangeSelection ifTrue: [
			self activeProject selection replaceAll: newSelection selectedItems ].
		self activeProject addObserver: self ].

	tree
		beMultipleSelection;
		beResizable;
		roots: {  };
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandRoots.

	tree acceptDrop: true.
	tree wantsDrop: [ :transfert |
		self validatedrop: transfert passenger ].
	tree acceptDrop: [ :transfert | 
		self acceptDrop: transfert passenger on: transfert target].

	self columns do: [ :each | tree addColumn: each ]
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> pyramidActiveProjectChangedChanged [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> pyramidPipelineTerminateCommand [

	self updateTree
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> pyramidRootsChangedOnActiveProject [

	self updateTree
]

{ #category : #accessing }
PyramidTreeView >> shouldChangeSelection [
	^ shouldChangeSelection
]

{ #category : #accessing }
PyramidTreeView >> shouldChangeSelection: anObject [

	shouldChangeSelection := anObject
]

{ #category : #accessing }
PyramidTreeView >> tree [
^ tree
]

{ #category : #accessing }
PyramidTreeView >> updateRoots [

	self tree roots: self currentRoots
]

{ #category : #accessing }
PyramidTreeView >> updateSelection [

	self tree selectItems: self currentSelection
]

{ #category : #accessing }
PyramidTreeView >> updateTree [

	self activeProject selection lock.
	self shouldChangeSelection: false.
	self updateRoots.
	self updateSelection.
		self shouldChangeSelection: true.
	self activeProject selection unlock
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> validatedrop: aCollection [

	^ aCollection allSatisfy: [ :each | self validatedropForAnObject: each ]
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> validatedropForAnObject: anObject [

	^ anObject respondsTo: #asElement
]
