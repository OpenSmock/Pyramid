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
	defaultLayout := SpBoxLayout newVertical.
	self properties do: [ :each | defaultLayout add: each expand: false ].
	defaultLayout
		add: (SpMorphPresenter new morph: (Morph new color: Color random))
		expand: true;
		yourself.
	^ defaultLayout
]

{ #category : #accessing }
PyViewProperties >> properties [

	properties ifNil: [ properties := (TPyViewProperty users collect: [ :each | each new ]) asArray
		  sort: [ :a :b | a < b ] ].
	^ properties
]

{ #category : #'as yet unclassified' }
PyViewProperties >> pySelectionChanged [
	self properties do: [ :each | each selection: self selection ].
]

{ #category : #accessing }
PyViewProperties >> selection [

	^ self business selection
]
