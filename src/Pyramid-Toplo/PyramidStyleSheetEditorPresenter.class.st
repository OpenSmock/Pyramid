Class {
	#name : #PyramidStyleSheetEditorPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'themeSelector',
		'styleSheetEditor',
		'stampPresenter'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #accessing }
PyramidStyleSheetEditorPresenter >> defaultLayout [

	^ SpBoxLayout new
		  spacing: 4;
		  add: (SpLabelPresenter new
						    label: 'Stamps edition';
						    displayBold: [ :t | true ];
						    yourself) expand: false;
		  add: self stampPresenter expand: true;
		  yourself
]

{ #category : #initialization }
PyramidStyleSheetEditorPresenter >> initializePresenters [

	stampPresenter := SpNullPresenter new
]

{ #category : #accessing }
PyramidStyleSheetEditorPresenter >> stampPresenter [

	^ stampPresenter
]

{ #category : #accessing }
PyramidStyleSheetEditorPresenter >> stampPresenter: anObject [

	stampPresenter := anObject
]
