Class {
	#name : #PyramidCopyPastePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-copy-paste'
}

{ #category : #adding }
PyramidCopyPastePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self copyAsStonMenu: builder ]
]

{ #category : #connecting }
PyramidCopyPastePlugin >> connectOn: aPyramidEditor [

	self editor: aPyramidEditor.
]

{ #category : #copying }
PyramidCopyPastePlugin >> copyAsStonInClipboard: aCollection [

	Clipboard clipboardText: (BlSerializer serialize: aCollection)
]

{ #category : #copying }
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
						action: [ self pasteFromClipboardOnFirstLevelElements ];
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
						action: [ self copyAsStonInClipboard: single ];
						yourself ];
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #smallPaste);
						name: 'Paste';
						action: [ self pasteFromClipboardOnSelection: single ];
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

{ #category : #accessing }
PyramidCopyPastePlugin >> editor [

	^ editor
]

{ #category : #accessing }
PyramidCopyPastePlugin >> editor: anObject [

	editor := anObject
]

{ #category : #copying }
PyramidCopyPastePlugin >> pasteFromClipboard: aBlock [

	| copiedElement |
	[
	copiedElement := BlSerializer materialize: Clipboard clipboardText.
	copiedElement isCollection ifFalse: [
		copiedElement := { copiedElement } ] ]
		on: BlocMaterializationError
		do: [
			UIManager default inform: 'Cannot materialize the clipboard.'.
			^ self ].

	[TBlSerializer verifyCollection: copiedElement] on: BlocSerializationError do: [ UIManager default inform: 'No BlElements in the clipboard.'.
			^ self ].

	aBlock value: copiedElement
]

{ #category : #copying }
PyramidCopyPastePlugin >> pasteFromClipboardOnFirstLevelElements [

	self pasteFromClipboard: [ :copiedElement | self editor commandExecutor
		use: PyramidAddAllToCollectionCommand new
		on: { self editor projectModel firstLevelElements }
		with: copiedElement ]
	
]

{ #category : #copying }
PyramidCopyPastePlugin >> pasteFromClipboardOnSelection: aBlElement [

	self pasteFromClipboard: [ :copiedElement |
	self editor commandExecutor
		use: PyramidAddChildrenCommand new
		on: self editor projectModel selection
		with: copiedElement ]
]
