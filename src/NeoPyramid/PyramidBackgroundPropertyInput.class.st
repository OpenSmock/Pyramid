Class {
	#name : #PyramidBackgroundPropertyInput,
	#superclass : #SpPresenter,
	#instVars : [
		'submitBlock',
		'preview',
		'strategy',
		'modalButton',
		'modal',
		'background'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #'api - text style' }
PyramidBackgroundPropertyInput >> background [

	^ background
]

{ #category : #'api - text style' }
PyramidBackgroundPropertyInput >> background: aBlBackground [

	background := aBlBackground.
	self strategy:
		aBlBackground pyramidBackgroundStrategy.
	self submitBlock value
]

{ #category : #layout }
PyramidBackgroundPropertyInput >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self preview expand: true;
		  add: self modalButton withConstraints: [ :c |
			  c width: 24.
			  c height: 24 ];
		  yourself
]

{ #category : #initialization }
PyramidBackgroundPropertyInput >> initializePresenters [

	modal := PyramidBackgroundModalPresenter new whenSubmitDo: [ :back |
		         self background: back ].
	modalButton := SpButtonPresenter new
		               icon: (self iconNamed: #smallCogInitialState);
		               action: [ self modal selectBackground: self background; openDialog ];
		               yourself
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> modal [

	^ modal
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> modalButton [

	^ modalButton
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> preview [

	^ preview
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> preview: anObject [

	preview := anObject
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> strategy [

	strategy ifNil: [
		strategy := PyramidBackgroundPropertyInputUnknownStrategy new ].
	^ strategy
]

{ #category : #'api - text style' }
PyramidBackgroundPropertyInput >> strategy: aStrategy [

	strategy := aStrategy.
	self layout replace: self preview with: aStrategy preview.
	self preview: aStrategy preview
]

{ #category : #accessing }
PyramidBackgroundPropertyInput >> submitBlock [

	^ submitBlock
]

{ #category : #enumerating }
PyramidBackgroundPropertyInput >> whenSubmitDo: aBlock [

	submitBlock := aBlock
]
