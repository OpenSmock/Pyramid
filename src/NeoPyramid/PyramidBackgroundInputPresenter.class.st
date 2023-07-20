Class {
	#name : #PyramidBackgroundInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'notebook',
		'presenterTransparent',
		'presenterImage',
		'presenterPaintSolid',
		'presenterPaintGradient',
		'whenValueChangedDo'
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
PyramidBackgroundInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :back | ].
	presenterTransparent := NeoPyramidColorInputSingleLinePresenter new
		                        whenValueChangedDo: [ :x |
			                        self whenValueChangedDo value:
					                        x asBlBackground ];
		                        yourself.
	presenterPaintSolid := NeoPyramidColorInputSingleLinePresenter new
		                       whenValueChangedDo: [ :x |
			                       self whenValueChangedDo value:
					                       x asBlBackground ];
		                       yourself.
	presenterPaintGradient := NeoPyramidColorInputSingleLinePresenter new
		                          whenValueChangedDo: [ :x |
			                          self whenValueChangedDo value:
					                          x asBlBackground ];
		                          yourself.
	presenterImage := NeoPyramidColorInputSingleLinePresenter new
		                  whenValueChangedDo: [ :x |
			                  self whenValueChangedDo value: x asBlBackground ];
		                  yourself.

	notebook := SpNotebookPresenter new.
	notebook addPage: (SpNotebookPage
			 title: ''
			 icon: (self iconNamed: #changeRemove)
			 provider: [ self presenterTransparent ]).
	notebook addPage: (SpNotebookPage
			 title: ''
			 icon: (self iconNamed: #smallSelect)
			 provider: [ self presenterPaintSolid ]).
	notebook addPage: (SpNotebookPage
			 title: ''
			 icon: (self iconNamed: #image)
			 provider: [ self presenterPaintGradient ]).
	notebook addPage: (SpNotebookPage
			 title: ''
			 icon: (self iconNamed: #open)
			 provider: [ self presenterImage ]).

	notebook whenSelectedPageChangedDo: [ :page |
		self whenValueChangedDo value: self value ]
]

{ #category : #layout }
PyramidBackgroundInputPresenter >> notebook [

	^ notebook
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterImage [

	^ presenterImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterPaintGradient [

	^ presenterPaintGradient
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterPaintSolid [

	^ presenterPaintSolid
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterTransparent [

	^ presenterTransparent
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
