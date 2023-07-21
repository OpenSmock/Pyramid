Class {
	#name : #PyramidBackgroundInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'notebook',
		'whenValueChangedDo',
		'modelPaintSolid',
		'modelPaintGradient',
		'modelImage',
		'modelTransparent'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #layout }
PyramidBackgroundInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self notebook;
		  yourself
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelImage [

	modelImage := PyramidBackgroundInputModel new
		              presenter:
			              (NeoPyramidColorInputSingleLinePresenter new
				               whenValueChangedDo: [ :x |
					               self whenValueChangedDo value: x asBlBackground ];
				               yourself);
		              page: (SpNotebookPage
				               title: ''
				               icon: (self iconNamed: #open)
				               provider: [ self modelImage presenter ]);
		              yourself.

	notebook addPage: modelImage page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelPaintGradient [

	modelPaintGradient := PyramidBackgroundInputModel new
		                      presenter:
			                      (NeoPyramidGradientPaintInputPresenter new
				                       whenValueChangedDo: [ :x |
					                       self whenValueChangedDo value:
							                       x asBlBackground ];
				                       yourself);
		                      page: (SpNotebookPage
				                       title: ''
				                       icon: (self iconNamed: #image)
				                       provider: [
				                       self modelPaintGradient presenter ]);
		                      yourself.

	notebook addPage: modelPaintGradient page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelPaintSolid [

	modelPaintSolid := PyramidBackgroundInputModel new
		                   presenter:
			                   (NeoPyramidColorInputSingleLinePresenter new
				                    whenValueChangedDo: [ :x |
					                    self whenValueChangedDo value:
							                    x asBlBackground ];
				                    yourself);
		                   page: (SpNotebookPage
				                    title: ''
				                    icon: (self iconNamed: #smallSelect)
				                    provider: [ self modelPaintSolid presenter ]);
		                   yourself.

	notebook addPage: modelPaintSolid page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelTransparent [

	modelTransparent := PyramidBackgroundInputModel new
		                    presenter:
			                    (NeoPyramidMonoValueInputPresenter new value: BlBackground transparent;
				                     whenValueChangedDo: [ :x |
					                     self whenValueChangedDo value:
							                     x asBlBackground ];
				                     yourself);
		                    page: (SpNotebookPage
				                     title: ''
				                     icon: (self iconNamed: #changeRemove)
				                     provider: [ self modelTransparent presenter ]);
		                    yourself.

	notebook addPage: modelTransparent page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :back |  ].
	notebook := SpNotebookPresenter new.
	self initializeModelPaintSolid.
	self initializeModelPaintGradient.
	self initializeModelTransparent.
	self initializeModelImage.

	notebook whenSelectedPageChangedDo: [ :page |
		self whenValueChangedDo value: self value ]
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelImage [

	^ modelImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelPaintGradient [

	^ modelPaintGradient
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelPaintSolid [

	^ modelPaintSolid
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelTransparent [

	^ modelTransparent
]

{ #category : #layout }
PyramidBackgroundInputPresenter >> notebook [

	^ notebook
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectPaintGradientWith: aBlColorPaint [

	self notebook selectPage: self modelPaintGradient page.
	self modelPaintGradient presenter value: aBlColorPaint
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectPaintSolidWith: aBlColorPaint [

	self notebook selectPage: self modelPaintSolid page.
	self modelPaintSolid presenter value: aBlColorPaint color
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectTransparent [

	self notebook selectPage: self modelTransparent page
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> value [

	^ self notebook selectedPage presenterProvider value value asBlBackground
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> value: aBackground [
	| temp |
	temp := self whenValueChangedDo.
	self whenValueChangedDo: [ :something |  ].
	aBackground selectOnBackgroundInput: self.
	self whenValueChangedDo: temp.
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
