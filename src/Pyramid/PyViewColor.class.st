Class {
	#name : #PyViewColor,
	#superclass : #PyViewAbstract,
	#instVars : [
		'presenter'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #layout }
PyViewColor >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: presenter;
		  yourself
]

{ #category : #initialization }
PyViewColor >> initializePresenters [

	presenter := SpClassMethodBrowser new
		             classes: self class environment allClasses;
		             yourself
]

{ #category : #accessing }
PyViewColor >> pageIcon [

	^ self iconNamed: #image
]

{ #category : #accessing }
PyViewColor >> pageTitle [

	^ 'Color'
]
