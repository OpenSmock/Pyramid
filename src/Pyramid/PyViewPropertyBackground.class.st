Class {
	#name : #PyViewPropertyBackground,
	#superclass : #SpPresenter,
	#traits : 'TPyViewProperty',
	#classTraits : 'TPyViewProperty classTrait',
	#instVars : [
		'editButton',
		'simpleForm',
		'morph',
		'morphPresenter'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyViewPropertyBackground >> commandWith: aColor [ 
	| command args |
	args := PyCommandBackgroundArgs new background: aColor.
	command := PyCommandBackground new.
	command arguments: args.
	^ command
]

{ #category : #'as yet unclassified' }
PyViewPropertyBackground >> createSingleLineForm [

	^ PyFormColor new
]

{ #category : #'as yet unclassified' }
PyViewPropertyBackground >> differentsValue [
	^ Color white
]

{ #category : #'as yet unclassified' }
PyViewPropertyBackground >> emptyValue [

	^ Color transparent
]

{ #category : #accessing }
PyViewPropertyBackground >> name [

	^ 'Background'
]

{ #category : #accessing }
PyViewPropertyBackground >> order [

	^ 2
]

{ #category : #'as yet unclassified' }
PyViewPropertyBackground >> valueFromElement: aBlElement [
	| background |
	background := aBlElement background.
	background isTransparent ifTrue: [ ^ Color transparent ].
	^ background paint color
]
