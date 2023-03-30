Class {
	#name : #PyFormVisibilityModel,
	#superclass : #Object,
	#instVars : [
		'visibility',
		'label',
		'icon'
	],
	#category : #'Pyramid-Editor-Properties-Form'
}

{ #category : #accessing }
PyFormVisibilityModel >> icon [

	^ icon 
]

{ #category : #accessing }
PyFormVisibilityModel >> icon: anIcon [

	icon:= anIcon
]

{ #category : #accessing }
PyFormVisibilityModel >> label [

	^ label
]

{ #category : #accessing }
PyFormVisibilityModel >> label: aString [

	label:= aString
]

{ #category : #accessing }
PyFormVisibilityModel >> visibility [

	^ visibility
]

{ #category : #accessing }
PyFormVisibilityModel >> visibility: aBlVisibility [
	visibility := aBlVisibility
]
