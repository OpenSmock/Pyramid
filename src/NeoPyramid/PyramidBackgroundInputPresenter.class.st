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
				               provider: [ self presenterPaintSolid ]);
		              yourself.

	notebook addPage: modelImage page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelPaintGradient [

	modelPaintGradient := PyramidBackgroundInputModel new
		                      presenter:
			                      (NeoPyramidColorInputSingleLinePresenter new
				                       whenValueChangedDo: [ :x |
					                       self whenValueChangedDo value:
							                       x asBlBackground ];
				                       yourself);
		                      page: (SpNotebookPage
				                       title: ''
				                       icon: (self iconNamed: #image)
				                       provider: [ self presenterPaintSolid ]);
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
				                    provider: [ self presenterPaintSolid ]);
		                   yourself.
	
	notebook addPage: modelPaintSolid page.
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelTransparent [

	modelTransparent := PyramidBackgroundInputModel new
		                    presenter:
			                    (NeoPyramidColorInputSingleLinePresenter new
				                     whenValueChangedDo: [ :x |
					                     self whenValueChangedDo value:
							                     x asBlBackground ];
				                     yourself);
		                    page: (SpNotebookPage
				                     title: ''
				                     icon: (self iconNamed: #changeRemove)
				                     provider: [ self presenterPaintSolid ]);
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
	self modelPaintSolid value: aBlColorPaint
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectPaintSolidWith: aBlColorPaint [

	self notebook selectPage: self modelPaintSolid page.
	self modelPaintSolid value: aBlColorPaint color
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> value [

	^ self notebook selectedPage presenterProvider value value

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
