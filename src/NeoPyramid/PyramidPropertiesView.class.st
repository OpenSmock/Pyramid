Class {
	#name : #PyramidPropertiesView,
	#superclass : #SpPresenter,
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #layout }
PyramidPropertiesView >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	defaultLayout add: SpNullPresenter new expand: true.
	^ defaultLayout
]
