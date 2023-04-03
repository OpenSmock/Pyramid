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

	self properties do: [ :each |
		each pipeline: aBusiness pipeline.
		each selection: aBusiness selection ]
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
		properties := (PyEditorPanelLocator classPanelProperties select: [ :each | each shouldInstall ] thenCollect: [
			               :each | each new ]) asArray sorted ].
	^ properties
]
