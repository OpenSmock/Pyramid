Class {
	#name : #PyViewProperties,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelRight',
	#classTraits : 'TPyEditorPanelRight classTrait',
	#instVars : [
		'properties'
	],
	#category : #'Pyramid-Editor-Side-Panel'
}

{ #category : #accessing }
PyViewProperties class >> pageIcon [

	^ self iconNamed: #edit
]

{ #category : #accessing }
PyViewProperties class >> pageTitle [

	^ 'Properties'
]

{ #category : #initialization }
PyViewProperties >> business: aBusiness [

	business := aBusiness.
	business selection addObserver: self.
	self properties do: [ :each | each pipeline: business pipeline.  each selection: business selection. ]
]

{ #category : #layout }
PyViewProperties >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newTopToBottom spacing: 4.
	self properties do: [ :each | defaultLayout add: each view expand: false ].
	defaultLayout add: self newNullPresenter expand: true.
	^ defaultLayout
]

{ #category : #accessing }
PyViewProperties >> properties [

	properties ifNil: [
		properties := (TPyPropertyChanger users collect: [ :each | each new ])
			              asArray sorted ].
	^ properties
]

{ #category : #'as yet unclassified' }
PyViewProperties >> pySelectionChanged [
	self properties do: [ :each | each selection: self selection ].
]

{ #category : #'as yet unclassified' }
PyViewProperties >> receiveNewBlElement: aBlElement [

	aBlElement ifNil: [ ^ self ].
	properties do: [ :each | each element: aBlElement ]
]

{ #category : #accessing }
PyViewProperties >> selection [
	 ^ self business selection
]
