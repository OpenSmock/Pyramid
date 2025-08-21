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
	
	aPyramidEditor
		addShortcutSpecInCollection:
		$c command mac | $c control unix | $c control win
		action: [ self copyForShortcut ]
		name: 'Shortcut Spec Copy'.
		
	aPyramidEditor
		addShortcutSpecInCollection:
		$v command mac | $v control unix | $v control win
		action: [ self pasteForShortcut ]
		name: 'Shortcut Spec Paste'.
		
	aPyramidEditor
		addShortcutSpecInCollection:
		$x command mac | $x control unix | $x control win
		action: [ self cutForShortcut ]
		name: 'Shortcut Spec Cut'
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

{ #category : #copying }
PyramidCopyPastePlugin >> copyForShortcut [
	
	| elementCollectionSelected |
	
	elementCollectionSelected := self editor projectModel selection collection.
	elementCollectionSelected isEmpty ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
		ifTrue: [
			self copyAsStonInClipboard: elementCollectionSelected first ]
		ifFalse: [ self inform: 'Can not copy multiple element' ]
]

{ #category : #'as yet unclassified' }
PyramidCopyPastePlugin >> cutForShortcut [

	| projectModel |
	projectModel := self editor projectModel.

	projectModel selection collection isEmpty ifTrue: [ ^ self ].
	projectModel selection collection size = 1
		ifFalse: [ self inform: 'Cannot cut multiple element'. ^ self ].

	self copyAsStonInClipboard: projectModel selection collection first.

	self editor commandExecutor
		use: PyramidRemoveSelectedElementsCommand new
		on: projectModel selection
		with: projectModel firstLevelElements.

	"Update the selection after remove"
	projectModel updateSelection
]

{ #category : #accessing }
PyramidCopyPastePlugin >> editor [

	^ editor
]

{ #category : #accessing }
PyramidCopyPastePlugin >> editor: anObject [

	editor := anObject
]

{ #category : #'as yet unclassified' }
PyramidCopyPastePlugin >> pasteForShortcut [

	| elementCollectionSelected |
	
	elementCollectionSelected := self editor projectModel selection collection.

	elementCollectionSelected isEmpty ifTrue: [
		self pasteFromClipboardOnFirstLevelElements. ^ self ].
	elementCollectionSelected size = 1 ifTrue: [
		self pasteFromClipboardOnSelection:
			elementCollectionSelected first ]
		ifFalse: [ self inform: 'Cannot paste in multiple element' ]
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
