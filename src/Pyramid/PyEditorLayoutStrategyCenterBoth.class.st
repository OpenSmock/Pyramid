"
I represente the layout of Pyramid with the top bar, the center panel visible and both sides panels.
"
Class {
	#name : #PyEditorLayoutStrategyCenterBoth,
	#superclass : #PyEditorLayoutStrategy,
	#category : #'Pyramid-Editor'
}

{ #category : #accessing }
PyEditorLayoutStrategyCenterBoth >> layout [

	| mainPanel |
	mainPanel := SpPanedLayout newLeftToRight
		             positionOfSlider: 0.2;
		             add: self panelLeft;
		             add: (SpPanedLayout newLeftToRight
				              positionOfSlider: 0.75;
				              add: self panelCenter;
				              add: self panelRight;
				              yourself);
		             yourself.

	^ SpBoxLayout newTopToBottom
		  add: self panelTop
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: mainPanel withConstraints: [ :c | c fill: true ];
		  yourself
]
