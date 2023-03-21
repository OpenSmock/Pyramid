"
I represente the layout of Pyramid with the top bar, the center panel visible and the right panel.
"
Class {
	#name : #PyEditorLayoutStrategyCenterRight,
	#superclass : #PyEditorLayoutStrategy,
	#category : #'Pyramid-Editor'
}

{ #category : #accessing }
PyEditorLayoutStrategyCenterRight >> layout [

	| mainPanel |
	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.8;
		             add: self panelCenter;
		             add: self panelRight;
		             yourself.

	^ SpBoxLayout newTopToBottom
		  add: self panelTop
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: mainPanel withConstraints: [ :c | c fill: true ];
		  yourself
]
