Class {
	#name : #PyramidBackgroundInputImage,
	#superclass : #PyramidBackgroundAbstractBackgroundInput,
	#instVars : [
		'form',
		'classMethodPresenter'
	],
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #accessing }
PyramidBackgroundInputImage >> background [

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
		  (PyramidERClassSelector target: class selector: selector))
]

{ #category : #initialization }
PyramidBackgroundInputImage >> initializePresenters [

	classMethodPresenter := PyramidClassMethodPresenter new
		                        packages: Smalltalk organization packages;
		                        whenSelectionChangedDo: [ :model |
			(self validateSelection: model) ifTrue: [ 
			                        self
				                        formFromClass: model targetClass
				                        andSelector: model methodSelector ] ];
		                        whenCompiledDo: [ :model |
			                        | selector |
			                        selector := model targetClass compile:
					                                    model methodString.
			                        self
				                        formFromClass: model targetClass
				                        andSelector: selector ];
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
	^ (model targetClass perform: model methodSelector) isKindOf: Form
	
]
