Class {
	#name : 'PyramidCopyPastePlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#category : 'Pyramid-Bloc-plugin-copy-paste',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-copy-paste'
}

{ #category : 'class initialization' }
PyramidCopyPastePlugin class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : 'adding' }
PyramidCopyPastePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self copyAsStonMenu: builder ]
]

{ #category : 'copying' }
PyramidCopyPastePlugin >> copyAsStonInClipboard: aCollection [

	Clipboard clipboardText: (BlSerializer serialize: aCollection)
]

{ #category : 'copying' }
PyramidCopyPastePlugin >> copyAsStonMenu: aBuilder [

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group
				addItem: [ :item |
					item
						icon: (self iconNamed: #smallCopy);
						name: 'Copy';
						action: [ self copyAsStonInClipboard: { single } ];
						yourself ];
				yourself ]
		order: 20.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group
				addItem: [ :item |
					item
						icon: (self iconNamed: #smallCopy);
						name: 'Copy (select only one element)';
						enabled: false;
						yourself ];
				yourself ]
		order: 20
]
