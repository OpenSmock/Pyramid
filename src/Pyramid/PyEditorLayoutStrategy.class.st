"
I represent a strategy to define the layout of a Pyramid Editor.

I combine different panels to create the UI of Pyramid Editor.

- layout this method return the spec layout

    Instance Variables
	panelCenter:		<PyPanelCenter>
	panelLeft:		<PyPanelSide>
	panelRight:		<PyPanelSide>
	panelTop:			<PyPanelTop>
"
Class {
	#name : #PyEditorLayoutStrategy,
	#superclass : #Object,
	#instVars : [
		'panelLeft',
		'panelRight',
		'panelCenter',
		'panelTop'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #'as yet unclassified' }
PyEditorLayoutStrategy class >> center: aPanelCenter top: aPanelTop left: aPanelLeft right: aPanelRight [

	^ self new
		  panelCenter: aPanelCenter;
		  panelTop: aPanelTop;
		  panelLeft: aPanelLeft;
		  panelRight: aPanelRight;
		  yourself
]

{ #category : #testing }
PyEditorLayoutStrategy class >> isAbstract [
	^ self = PyEditorLayoutStrategy
]

{ #category : #'as yet unclassified' }
PyEditorLayoutStrategy >> globalLayout: aLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 16;
		  add: self panelTop
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: aLayout withConstraints: [ :c | c fill: true ];
		  yourself
]

{ #category : #accessing }
PyEditorLayoutStrategy >> layout [

^ self shouldBeImplemented 
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelCenter [

	^ panelCenter
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelCenter: anObject [

	panelCenter := anObject
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelLeft [

	^ panelLeft
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelLeft: anObject [

	panelLeft := anObject
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelRight [

	^ panelRight
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelRight: anObject [

	panelRight := anObject
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelTop [

	^ panelTop
]

{ #category : #accessing }
PyEditorLayoutStrategy >> panelTop: anObject [

	panelTop := anObject
]
