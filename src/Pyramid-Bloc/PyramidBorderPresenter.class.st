Class {
	#name : #PyramidBorderPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'dashList',
		'paintPreviewPresenter',
		'widthInput',
		'moreOptionButton'
	],
	#category : #'Pyramid-Bloc-custom-specs-border'
}

{ #category : #accessing }
PyramidBorderPresenter >> dashList [

	^ dashList
]

{ #category : #layout }
PyramidBorderPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self dashList width: PyramidBorderPresenterModel defaultPresenterLenght;
		  add: self widthInput;
		  add: self paintPreviewPresenter;
		  add: self moreOptionButton withConstraints: [ :c |
			  c width: 24.
			  c height: 24 ];
		  yourself
]

{ #category : #initialization }
PyramidBorderPresenter >> initializePresenters [

	dashList := SpDropListPresenter new
		            items: PyramidBorderPresenterModel allModel;
		            displayIcon: [ :m | m icon ];
		            display: [ :m | '' ];
		            yourself.
	paintPreviewPresenter := PyramidPaintPreviewAbstract new.
	widthInput := PyramidNumberPresenter new.
	moreOptionButton := SpButtonPresenter new
]

{ #category : #accessing }
PyramidBorderPresenter >> moreOptionButton [

	^ moreOptionButton
]

{ #category : #accessing }
PyramidBorderPresenter >> paintPreviewPresenter [

	^ paintPreviewPresenter
]

{ #category : #accessing }
PyramidBorderPresenter >> widthInput [

	^ widthInput
]
