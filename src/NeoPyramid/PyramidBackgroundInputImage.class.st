Class {
	#name : #PyramidBackgroundInputImage,
	#superclass : #PyramidBackgroundAbstractBackgroundInput,
	#instVars : [
		'externalRessourceInput'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundInputImage >> background [

	^ BlBackground image: self form
]

{ #category : #layout }
PyramidBackgroundInputImage >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: 'Image, There will be something here';
		add: self externalRessourceInput ;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundInputImage >> externalRessourceInput [
	^ externalRessourceInput
]

{ #category : #accessing }
PyramidBackgroundInputImage >> form [

	^ self externalRessourceInput externalRessource.
]

{ #category : #initialization }
PyramidBackgroundInputImage >> initializePresenters [ 

	externalRessourceInput := PyramidExternalPropertyPresenter new.
]
