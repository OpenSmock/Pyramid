Class {
	#name : #PyViewBrowser,
	#superclass : #PyViewAbstract,
	#instVars : [
		'browser',
		'presenter'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #layout }
PyViewBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: presenter;
		  yourself
]

{ #category : #initialization }
PyViewBrowser >> initializePresenters [

	presenter := SpClassMethodBrowser new
		           classes: self class environment allClasses;
		           yourself
]

{ #category : #accessing }
PyViewBrowser >> pageIcon [

	^ self iconNamed: #nautilusIcon
]

{ #category : #accessing }
PyViewBrowser >> pageTitle [

	^ 'Browser'
]
