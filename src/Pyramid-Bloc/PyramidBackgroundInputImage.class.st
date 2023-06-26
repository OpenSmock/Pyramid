Class {
	#name : #PyramidBackgroundInputImage,
	#superclass : #PyramidBackgroundAbstractBackgroundInput,
	#instVars : [
		'form',
		'classMethodPresenter',
		'pathInput',
		'exploreButton'
	],
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundInputImage >> actionOpenFileExplorer [

	| dialog result |
	dialog := FileDialogWindow onFileSystem: FileSystem disk.
	result := dialog openModal answer.
	result
		ifNil: [ self pathInput text: '' ]
		ifNotNil: [ self pathInput text: result ].
]

{ #category : #accessing }
PyramidBackgroundInputImage >> background [

	self submitFormFromText: self pathInput text.
	self form ifNil: [ ^ BlBackground transparent ].
	^ BlBackground image: self form
]

{ #category : #layout }
PyramidBackgroundInputImage >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self pathInput expand: true;
		add: self exploreButton expand: false;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundInputImage >> exploreButton [
^ exploreButton
]

{ #category : #accessing }
PyramidBackgroundInputImage >> form [

	^ form
]

{ #category : #accessing }
PyramidBackgroundInputImage >> form: anObject [

	form := anObject
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputImage >> formFromClass: class andSelector: selector [

	self form: (PyramidExternalRessourceProxy fromSource:
		  (PyramidExternalRessourceSource target: class selector: selector))
]

{ #category : #initialization }
PyramidBackgroundInputImage >> initializePresenters [

	pathInput := SpTextInputFieldPresenter new whenSubmitDo: [ :text |
		             self submitFormFromText: text ].
	exploreButton := SpButtonPresenter new
		                 icon: (self iconNamed: #configNew);
		                 action: [ self actionOpenFileExplorer ];
		                 yourself
]

{ #category : #accessing }
PyramidBackgroundInputImage >> pathInput [

	^ pathInput
]

{ #category : #initialization }
PyramidBackgroundInputImage >> previewPresenterFrom: model [

	| object |
	model targetClass ifNil: [
		^ SpLabelPresenter new
			  label: 'No class selected.';
			  yourself ].
	(model targetClass canUnderstand: model methodSelector) ifFalse: [
		^ SpLabelPresenter new
			  label: 'Can not perform method.';
			  yourself ].
	object := model targetClass perform: model methodSelector.
	(object isKindOf: Form) ifFalse: [ ^ SpLabelPresenter new
			  label: 'Image is not a Form. Will be remplaced by a BlTransparentBackground.';
			  yourself ].
	^ SpImagePresenter new
		  image: object;
		  yourself
]

{ #category : #initialization }
PyramidBackgroundInputImage >> setImage: anImage [

	(anImage respondsTo: #pyramidExternalRessourceSource) ifTrue: [
		self pathInput text: anImage pyramidExternalRessourceSource arguments first fullName ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputImage >> submitFormFromText: aString [

	aString asFileReference exists ifFalse: [ self pathInput text: '' ].
	self form: (PyramidExternalRessourceProxy fromSource:
			 (PyramidExternalRessourceSource formFromFileNamed:
				  (aString)))
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputImage >> validateSelection: model [

	model targetClass ifNil: [ ^ false ].
	model methodSelector ifNil: [ ^ false ].
	(model targetClass class canUnderstand: model methodSelector) ifFalse: [ ^ false ].
	^ (model targetClass perform: model methodSelector withArguments: model methodArguments) isKindOf: Form
	
]
