Class {
	#name : #PyramidTestWindow,
	#superclass : #PyramidWindow,
	#category : #'NeoPyramid-Tests-Utils'
}

{ #category : #initialization }
PyramidTestWindow >> initialize [

	PyramidPanelModel toolbarHorizontal installOn: self at: #top.
	PyramidPanelModel tab installOn: self at: #center.
	PyramidPanelModel toolbarHorizontal installOn: self at: #bottom.
]

{ #category : #accessing }
PyramidTestWindow >> layout [

	| mainLayout |
	mainLayout := SpBoxLayout new
		              spacing: 4;
		              yourself.
	mainLayout add: (self services at: #top) presenter expand: false.
	mainLayout add: (self services at: #center) presenter expand: true.
	mainLayout add: (self services at: #bottom) presenter expand: false.
	^ mainLayout
]
