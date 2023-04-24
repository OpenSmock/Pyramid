Class {
	#name : #PyramidTreeView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver + TPyramidPipelineObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait + TPyramidPipelineObserver classTrait',
	#instVars : [
		'tree',
		'roots',
		'activeProject'
	],
	#category : #'NeoPyramid-plugin-tree'
}

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

{ #category : #layout }
PyramidTreeView >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #tree expand: true;
		  yourself
]

{ #category : #initialization }
PyramidTreeView >> initializePresenters [

	tree := self newTreeTable.

	tree whenSelectionChangedDo: [ :newSelection |
		self activeProject removeObserver: self.
		self activeProject selection replaceAll: newSelection selectedItems.
		self activeProject addObserver: self ].

	tree
		beMultipleSelection;
		beResizable;
		roots: {  };
		children: [ :each | each children ];
		contextMenu: [ self contextMenu ];
		expandRoots.

	self columns do: [ :each | "tree acceptDrop: true.
	tree wantsDrop: [ :transfert |
		self validatedrop: transfert passenger ].
	tree acceptDrop: [ :transfert | ""self acceptDrop: transfert passenger""
		 ]"
		tree addColumn: each ]
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> pyramidActiveProjectChangedChanged [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> pyramidPipelineExecuteCommand [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> pyramidRootsChangedOnActiveProject [

	self updateRoots
]

{ #category : #accessing }
PyramidTreeView >> tree [
^ tree
]

{ #category : #accessing }
PyramidTreeView >> updateRoots [

	self tree roots: self currentRoots
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> validatedrop: aCollection [

	^ aCollection allSatisfy: [ :each | self validatedropForAnObject: each ]
]

{ #category : #'as yet unclassified' }
PyramidTreeView >> validatedropForAnObject: anObject [

	^ anObject isKindOf: BlElement
]
