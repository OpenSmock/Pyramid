Class {
	#name : #PyramidMockSpecPresenter,
	#superclass : #Object,
	#instVars : [
		'text',
		'submitBloc'
	],
	#category : #'Pyramid-Tests-cases-plugin-bloc-properties'
}

{ #category : #accessing }
PyramidMockSpecPresenter >> enabled: aBoolean [
]

{ #category : #submit }
PyramidMockSpecPresenter >> submit [

	^ self submitBloc value: self text
]

{ #category : #accessing }
PyramidMockSpecPresenter >> submitBloc [
	^ submitBloc
]

{ #category : #accessing }
PyramidMockSpecPresenter >> text [

	^ text
]

{ #category : #accessing }
PyramidMockSpecPresenter >> text: anObject [

	text := anObject
]

{ #category : #enumerating }
PyramidMockSpecPresenter >> whenSubmitDo: aBlock [

	submitBloc := aBlock
]
