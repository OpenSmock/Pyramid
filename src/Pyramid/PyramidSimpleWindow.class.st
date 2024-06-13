Class {
	#name : 'PyramidSimpleWindow',
	#superclass : 'PyramidWindow',
	#category : 'Pyramid-views',
	#package : 'Pyramid',
	#tag : 'views'
}

{ #category : 'specs' }
PyramidSimpleWindow >> centerLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 5;
		  add: (self services at: #tabLeft) presenter;
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: 3 / 4;
				   add: (self services at: #space) presenter;
				   add: (self services at: #tabRight) presenter;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
PyramidSimpleWindow >> layout [

	| mainLayout |
	mainLayout := SpBoxLayout new
		              spacing: 4;
		              yourself.
	mainLayout add: self topLayout expand: false.
	mainLayout add: self centerLayout expand: true.
	^ mainLayout
]

{ #category : 'specs' }
PyramidSimpleWindow >> topLayout [

	| layout |
	layout := SpBoxLayout newHorizontal.
	layout add: (self services at: #topLeft) presenter expand: false.
	layout add: SpNullPresenter new expand: true.
	layout add: (self services at: #topCenter) presenter expand: false.
	layout add: SpNullPresenter new expand: true.
	layout add: (self services at: #topRight) presenter expand: false.
	^ layout
]
