Class {
	#name : #PyramidInputPreviewPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'image',
		'label'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #testing }
PyramidInputPreviewPresenter class >> isAbstract [

	^ self == PyramidInputPreviewPresenter
]

{ #category : #layout }
PyramidInputPreviewPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal spacing: 4; vAlignCenter;
		  add: self image expand: false;
		add: self label;
		  yourself
]

{ #category : #accessing }
PyramidInputPreviewPresenter >> image [

	^ image
]

{ #category : #'initialization - deprecated' }
PyramidInputPreviewPresenter >> initializePresenter [

	image := SpImagePresenter new autoScale: true; yourself.
	label := SpLabelPresenter new
]

{ #category : #accessing }
PyramidInputPreviewPresenter >> label [

	^ label
]

{ #category : #'as yet unclassified' }
PyramidInputPreviewPresenter >> value [

	^ PyramidUnknowState new.
]
