Class {
	#name : #PyramidBackgroundInputImage,
	#superclass : #PyramidBackgroundAbstractBackgroundInput,
	#instVars : [
		'form',
		'classMethodPresenter'
	],
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #accessing }
PyramidBackgroundInputImage >> background [

	self form ifNil: [ ^ BlBackground transparent ].
	^ BlBackground image: self form
]

{ #category : #accessing }
PyramidBackgroundInputImage >> classMethodPresenter [

	^ classMethodPresenter
]

{ #category : #layout }
PyramidBackgroundInputImage >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: 'Image, There will be something here';
		  add: self classMethodPresenter;
		  yourself
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

	self flag: #TODO. "Create a better presenter working with the new Proxy."
	classMethodPresenter := PyramidPCMWithPreviewPresenter new yourself
	" whenSelectionChangedDo: [ :model |
			                        (self validateSelection: model) ifTrue: [
					                        self
						                        formFromClass: model targetClass
						                        andSelector: model methodSelector ] ];
		                        presenterFromModelBlock: [ :model | self previewPresenterFrom: model.
			                        ];"
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
		self classMethodPresenter selectFromExternalRessource: 
			anImage pyramidExternalRessourceSource ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundInputImage >> validateSelection: model [

	model targetClass ifNil: [ ^ false ].
	model methodSelector ifNil: [ ^ false ].
	(model targetClass class canUnderstand: model methodSelector) ifFalse: [ ^ false ].
	^ (model targetClass perform: model methodSelector withArguments: model methodArguments) isKindOf: Form
	
]
