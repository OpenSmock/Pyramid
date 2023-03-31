Class {
	#name : #PySidePanelHistory,
	#superclass : #SpPresenter,
	#traits : 'TPyEditorPanelRight + TPyHistroyObserver',
	#classTraits : 'TPyEditorPanelRight classTrait + TPyHistroyObserver classTrait',
	#instVars : [
		'properties',
		'historyTree',
		'roots'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #accessing }
PySidePanelHistory class >> pageIcon [

	^ self iconNamed: #history
]

{ #category : #accessing }
PySidePanelHistory class >> pageTitle [

	^ 'History'
]

{ #category : #initialization }
PySidePanelHistory >> business: aBusiness [

	business := aBusiness.
	self history: (aBusiness getPlugin: PyPluginHistory) history.
	self roots: self history mementos asArray reverse
]

{ #category : #layout }
PySidePanelHistory >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical.
	defaultLayout
		add: #historyTree
		expand: true;
		yourself.
	^ PySidePanelHelper defaultLayoutFrom: defaultLayout
]

{ #category : #accessing }
PySidePanelHistory >> historyTree [
	^ historyTree
]

{ #category : #initialization }
PySidePanelHistory >> initializePresenters [

	historyTree := self newTree.
	historyTree
		beSingleSelection;
		roots: self roots;
		display: [ :each |
			each isSequence
				ifTrue: [ each printString ]
				ifFalse: [
					each command printString , ' ' , each element printString , ' '
					, each value printString ] ];
		children: [ :each |
			each isSequence
				ifTrue: [ each mementos ]
				ifFalse: [ {  } ] ];
		expandRoots
]

{ #category : #accessing }
PySidePanelHistory >> order [

	^ 10
]

{ #category : #'as yet unclassified' }
PySidePanelHistory >> pyHistoryUpdated [

	self roots: self history mementos asArray reverse
]

{ #category : #accessing }
PySidePanelHistory >> roots [
	roots ifNil: [ roots := {  } ].
	^ roots
]

{ #category : #accessing }
PySidePanelHistory >> roots: anArray [

	roots := anArray.
	self historyTree roots: anArray.
]
