Class {
	#name : #PyramidContextMenuPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-context-menu'
}

{ #category : #'meta-data' }
PyramidContextMenuPlugin class >> dependencies [
	"Put symbol as the class name for each dependencies."

	^ {  #PyramidSpacePlugin }
]

{ #category : #'class initialization' }
PyramidContextMenuPlugin class >> initialize [

	"Remove the plugin in case of already install (reset)"
	PyramidPluginManager uniqueInstance removePlugin: self.
	
	"Add the plugin"
	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidContextMenuPlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #selectionMenu addItem: [ :builder |
		self menuContextOn: builder.
		self menuBrowseAndInspectOn: builder ]
]

{ #category : #connecting }
PyramidContextMenuPlugin >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
]

{ #category : #accessing }
PyramidContextMenuPlugin >> editor [

	^ editor
]

{ #category : #accessing }
PyramidContextMenuPlugin >> editor: anObject [

	editor := anObject
]

{ #category : #'as yet unclassified' }
PyramidContextMenuPlugin >> getNameForSingle: aBlElement [

	aBlElement id ifNil: [ ^ '@\no name\ ' , aBlElement className, ' ', aBlElement hash printString ].
	^ aBlElement id , ' ' , aBlElement className, ' ', aBlElement hash printString
]

{ #category : #'as yet unclassified' }
PyramidContextMenuPlugin >> menuBrowseAndInspectOn: aBuilder [

	aBuilder addGroupSingleSelection: [ :group :single |
		group
			addItem: [ :item |
				item
					icon: (self iconNamed: #nautilus);
					name: 'Browse selected item';
					action: [ single browse ];
					yourself ];
			addItem: [ :item |
				item
					icon: (self iconNamed: #smallInspectIt);
					name: 'Inspect selected item';
					action: [ single inspect ];
					yourself ];
			yourself ] order: 1.

	aBuilder addGroupMultiSelection: [ :group :multi |
		group
			addItem: [ :item |
				item
					icon: (self iconNamed: #nautilus);
					name: 'Browse first item';
					action: [ multi first browse ];
					yourself ];
			addItem: [ :item |
				item
					icon: (self iconNamed: #smallInspectIt);
					name: 'Inspect all items';
					action: [ multi inspect ];
					yourself ];
			yourself ] order: 1
]

{ #category : #'as yet unclassified' }
PyramidContextMenuPlugin >> menuContextOn: aBuilder [

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group
				addItem: [ :item |
					item
						icon: (self iconNamed: single systemIconName);
						name: (self getNameForSingle: single);
						enabled: false;
						yourself ];
				yourself ]
		order: 0.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group
				addItem: [ :item |
					item
						icon: (self iconNamed: #collection);
						name: multi size printString , ' elements';
						enabled: false;
						yourself ];
				yourself ]
		order: 0
]
