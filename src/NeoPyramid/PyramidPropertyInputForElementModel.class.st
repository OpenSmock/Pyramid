Class {
	#name : #PyramidPropertyInputForElementModel,
	#superclass : #PyramidPropertyInputForModel,
	#instVars : [
		'referenceObject'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForElementModel >> preview [

	^ SpLabelPresenter new
		         label: self referenceObject hash printString;
		         yourself.
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> previewConstraints [

	^ [ :c | c width: 70 ]
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> referenceObject [

	^ referenceObject
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> referenceObject: anObject [

	referenceObject := anObject
]
