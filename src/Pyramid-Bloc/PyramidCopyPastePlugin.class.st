Class {
	#name : 'PyramidCopyPastePlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'projectModel'
	],
	#category : 'Pyramid-Bloc-plugin-copy-paste',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-copy-paste'
}

{ #category : 'adding' }
PyramidCopyPastePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self copyAsStonMenu: builder ]
]

{ #category : 'connecting' }
PyramidCopyPastePlugin >> connectOn: aPyramidEditor [

	self projectModel: aPyramidEditor projectModel
]

{ #category : 'copying' }
PyramidCopyPastePlugin >> copyAsStonInClipboard: aCollection [

	Clipboard clipboardText: (BlSerializer serialize: aCollection)
]

{ #category : 'copying' }
PyramidCopyPastePlugin >> copyAsStonMenu: aBuilder [

	aBuilder
		addGroupEmptySelection: [ :group :empty |
			group
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallCopy);
						name: 'Copy (select only one element)';
						enabled: false;
						yourself ];
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallPaste);
						name: 'Paste';
						action: [ self pasteAsStonInClipboardOnRoots ];
						yourself ];
				yourself ]
		order: 20.

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallCopy);
						name: 'Copy';
						action: [ self copyAsStonInClipboard: { single } ];
						yourself ];
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallPaste);
						name: 'Paste';
						action: [ self pasteAsStonInClipboard: single ];
						yourself ];
				yourself ]
		order: 20.

	aBuilder
		addGroupMultiSelection: [ :group :multi |
			group
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallCopy);
						name: 'Copy (select only one element)';
						enabled: false;
						yourself ];
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallPaste);
						name: 'Paste (select only one element)';
						enabled: false;
						yourself ];
				yourself ]
		order: 20
]

{ #category : 'copying' }
PyramidCopyPastePlugin >> pasteAsStonInClipboard: aBlElement [

	| copiedElement |
	[ copiedElement := BlSerializer materialize: Clipboard clipboardText ]
		on: BlocMaterializationError
		do: [
			UIManager default inform: 'Cannot paste the clipboard.'.
			^ self ].
	aBlElement addChildren: copiedElement.
	self projectModel informElementsChanged
]

{ #category : 'copying' }
PyramidCopyPastePlugin >> pasteAsStonInClipboardOnRoots [

	| copiedElement |
	[ copiedElement := BlSerializer materialize: Clipboard clipboardText ]
		on: BlocMaterializationError
		do: [
			UIManager default inform: 'Cannot paste the clipboard.'.
			^ self ].
	self projectModel firstLevelElements addAll: copiedElement.
	self projectModel informFirstLevelElementsChanged
]

{ #category : 'accessing' }
PyramidCopyPastePlugin >> projectModel [

	^ projectModel
]

{ #category : 'accessing' }
PyramidCopyPastePlugin >> projectModel: anObject [

	projectModel := anObject
]
