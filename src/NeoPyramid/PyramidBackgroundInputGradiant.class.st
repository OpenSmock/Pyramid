Class {
	#name : #PyramidBackgroundInputGradiant,
	#superclass : #SpPresenter,
	#instVars : [
		'modeSelector',
		'stopsColor'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #layout }
PyramidBackgroundInputGradiant >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self modeSelector;
		  add: self stopsColor
		  height: 300;
		  yourself
]

{ #category : #'initialization - deprecated' }
PyramidBackgroundInputGradiant >> initializePresenter [

	modeSelector := PyramidBackgroundInputGradiantMode new.
	stopsColor := PyramidBackgroundInputGradiantColor new
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> modeSelector [
^ modeSelector
]

{ #category : #accessing }
PyramidBackgroundInputGradiant >> stopsColor [

	^ stopsColor
]
