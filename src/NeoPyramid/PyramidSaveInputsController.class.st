Class {
	#name : #PyramidSaveInputsController,
	#superclass : #Object,
	#instVars : [
		'view',
		'model'
	],
	#category : #'NeoPyramid-plugin-save'
}

{ #category : #accessing }
PyramidSaveInputsController >> model [

	model ifNil: [ model := PyramidSaveModel new yourself ].
	^ model
]

{ #category : #accessing }
PyramidSaveInputsController >> model: aPyramidSaveModel [

	model := aPyramidSaveModel.
	self view model: aPyramidSaveModel
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> radioUpdatedOnClassSide: aBoolean [

	
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> textUpdatedFromClass: aString [

	
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> textUpdatedFromMethod: aString [

	
]

{ #category : #'as yet unclassified' }
PyramidSaveInputsController >> textUpdatedFromPackage: aString [
]

{ #category : #accessing }
PyramidSaveInputsController >> view [

	view ifNil: [ view := PyramidSaveInputsView new controller: self; model: self model; yourself ].
	^ view
]

{ #category : #accessing }
PyramidSaveInputsController >> view: anObject [

	view := anObject
]
