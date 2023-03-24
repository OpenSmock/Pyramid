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

	^ self globalLayout: self panelCenter
]
