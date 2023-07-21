Class {
	#name : #PyramidBackgroundInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'notebook',
		'whenValueChangedDo',
		'modelPaintSolid',
		'modelPaintGradient',
		'modelImage',
		'modelTransparent',
		'modelMixedValues',
		'modelEmptyValue'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> bypassTrigger [

	self flag: #TO_REMOVE. "I added it to make the test pass but it should be removed."
	self whenValueChangedDo value: self value.
]

{ #category : #layout }
PyramidBackgroundInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self notebook;
		  yourself
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelEmptyValue [

	modelEmptyValue := PyramidBackgroundInputModel new
		                   presenter:
			                   (NeoPyramidMonoValueInputPresenter new
				                    value: PyramidEmptyValue new;
				                    yourself);
		                   page: (SpNotebookPage
				                    title: '@ Empty'
				                    icon: (self iconNamed: #smallDebug)
				                    provider: [ self modelEmptyValue presenter ]);
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
				               title: 'Image'
				               icon: (self iconNamed: #open)
				               provider: [ self modelImage presenter ]);
		              yourself.

	notebook addPage: modelImage page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelMixedValues [

	modelMixedValues := PyramidBackgroundInputModel new
		                    presenter:
			                    (NeoPyramidMonoValueInputPresenter new
				                     value: PyramidMixedValues new;
				                     yourself);
		                    page: (SpNotebookPage
				                     title: '@ Mixed'
				                     icon: (self iconNamed: #smallDebug)
				                     provider: [ self modelMixedValues presenter ]);
		                    yourself
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
				                       title: 'Gradient'
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
				                    title: 'Paint'
				                    icon: (self iconNamed: #smallSelect)
				                    provider: [ self modelPaintSolid presenter ]);
		                   yourself.

	notebook addPage: modelPaintSolid page
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeModelTransparent [

	modelTransparent := PyramidBackgroundInputModel new
		                    presenter:
			                    (NeoPyramidMonoValueInputPresenter new
				                     value: BlBackground transparent;
				                     whenValueChangedDo: [ :x |
					                     self whenValueChangedDo value:
							                     x asBlBackground ];
				                     yourself);
		                    page: (SpNotebookPage
				                     title: 'Transparent'
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
	self initializeModelMixedValues.
	self initializeModelEmptyValue.

	notebook whenSelectedPageChangedDo: [ :page |
		self whenValueChangedDo value: self value ]
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelEmptyValue [

	^ modelEmptyValue
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelImage [

	^ modelImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> modelMixedValues [
^ modelMixedValues
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

{ #category : #accessing }
PyramidBackgroundInputPresenter >> selectEmptyValue [

	self notebook addPage: self modelEmptyValue page.
	self notebook selectPage: self modelEmptyValue page
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> selectMixedValues [

	self notebook addPage: self modelMixedValues page.
	self notebook selectPage: self modelMixedValues page
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectPaintGradientWith: aBlColorPaint [

	self notebook selectPage: self modelPaintGradient page.
	self modelPaintGradient presenter value: aBlColorPaint.
	[ self notebook removePage: self modelMixedValues page ]
		on: NotFound
		do: [ "nothing" ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectPaintSolidWith: aBlColorPaint [

	self notebook selectPage: self modelPaintSolid page.
	self modelPaintSolid presenter value: aBlColorPaint color.
	
	[self notebook removePage: self modelMixedValues page] on: NotFound do: [ "nothing" ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputPresenter >> selectTransparent [

	self notebook selectPage: self modelTransparent page.
	[ self notebook removePage: self modelMixedValues page ]
		on: NotFound
		do: [ "nothing" ]
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
