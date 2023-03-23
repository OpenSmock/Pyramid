Class {
	#name : #PyEditorPanelModel,
	#superclass : #Object,
	#instVars : [
		'observers',
		'right',
		'left'
	],
	#category : #'Pyramid-Editor'
}

{ #category : #adding }
PyEditorPanelModel >> addObserver: anObserver [

	self observers add: anObserver.
]

{ #category : #initialization }
PyEditorPanelModel >> initialize [

	observers := Set new.
	left := true.
	right := true
]

{ #category : #accessing }
PyEditorPanelModel >> isLeftOpen [

	^ left
]

{ #category : #accessing }
PyEditorPanelModel >> isRightOpen [

	^ right
]

{ #category : #accessing }
PyEditorPanelModel >> left: aBoolean [

	left = aBoolean ifTrue: [ ^ self ].
	left := aBoolean.
	self notifyObservers
]

{ #category : #notifying }
PyEditorPanelModel >> notifyObservers [

	observers do: [ :each | each triggerEvent: #pyEditorPanelModelChange ]
]

{ #category : #accessing }
PyEditorPanelModel >> observers [
	
	^ observers
]

{ #category : #adding }
PyEditorPanelModel >> removeObserver: anObserver [

	self observers remove: anObserver
]

{ #category : #accessing }
PyEditorPanelModel >> right: aBoolean [

	right = aBoolean ifTrue: [ ^ self ].
	right := aBoolean.
	self notifyObservers
]
