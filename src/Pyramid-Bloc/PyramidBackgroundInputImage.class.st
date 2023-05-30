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

{ #category : #initialization }
PyramidBackgroundInputImage >> initializePresenters [

	classMethodPresenter := PyramidClassMethodPresenter new
		                        packages: Smalltalk organization packages;
		                        submitBlock: [ :model |
			                        | selector |
			                        selector := model targetClass classSide compile:
					                                    model methodString.
			                        self form:
					                        (PyramidExternalRessourceProxy
						                         fromSource:
							                         (PyramidERClassSelector
								                          target: model targetClass
								                          selector: selector)) ];
		                        yourself
]

{ #category : #initialization }
PyramidBackgroundInputImage >> setImage: anImage [

	(anImage respondsTo: #pyramidExternalRessourceSource) ifTrue: [
		self classMethodPresenter setExternalProperty:
			anImage pyramidExternalRessourceSource ]
]
