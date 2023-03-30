Class {
	#name : #PyPanelProperties,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelRight',
	#classTraits : 'TPyEditorPanelRight classTrait',
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #accessing }
PyPanelProperties class >> pageIcon [

	^ self iconNamed: #edit
]

{ #category : #accessing }
PyPanelProperties class >> pageTitle [

	^ 'Properties'
]

{ #category : #initialization }
PyPanelProperties >> business: aBusiness [

	business := aBusiness.
	business selection addObserver: self.
	self properties do: [ :each | each pipeline: business pipeline.  each selection: business selection. ]
]

{ #category : #layout }
PyPanelProperties >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical spacing: 4.
	self properties do: [ :each |
		defaultLayout add: each view expand: false ].
	defaultLayout add: self newNullPresenter expand: true.
	^ PySidePanelHelper defaultLayoutFrom: defaultLayout
]

{ #category : #accessing }
PyPanelProperties >> order [

	^ 1
]

{ #category : #accessing }
PyPanelProperties >> properties [

	properties ifNil: [
		properties := (PyEditorPanelLocator classPanelProperties collect: [ :each | each new ])
			              asArray sorted ].
	^ properties
]

{ #category : #'as yet unclassified' }
PyPanelProperties >> pySelectionChanged [
	self properties do: [ :each | each selection: self selection ].
]

{ #category : #'as yet unclassified' }
PyPanelProperties >> receiveNewBlElement: aBlElement [

	aBlElement ifNil: [ ^ self ].
	properties do: [ :each | each element: aBlElement ]
]

{ #category : #accessing }
PyPanelProperties >> selection [
	 ^ self business selection
]
