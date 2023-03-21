"
I represente the layout of Pyramid with only the top bar and the center panel.
"
Class {
	#name : #PyEditorLayoutStrategyCenter,
	#superclass : #PyEditorLayoutStrategy,
	#category : #'Pyramid-Editor'
}

{ #category : #accessing }
PyEditorLayoutStrategyCenter >> layout [

	^ SpBoxLayout newTopToBottom
		  add: self panelTop
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: self panelCenter withConstraints: [ :c | c fill: true ];
		  yourself
]
