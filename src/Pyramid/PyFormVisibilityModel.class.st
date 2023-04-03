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

{ #category : #'api - properties' }
PyFormVisibilityModel class >> from: aBlVisibility [

	aBlVisibility isVisible ifTrue: [ ^ self visible ].
	aBlVisibility isGone ifTrue: [ ^ self gone ].
	^ self hidden
]

{ #category : #'api - properties' }
PyFormVisibilityModel class >> gone [

^ self new
			             visibility: BlVisibility gone;
			             label: 'gone';
			             icon: (self iconNamed: #haloDismiss)
]

{ #category : #'api - properties' }
PyFormVisibilityModel class >> hidden [

	^ self new
		  visibility: BlVisibility hidden;
		  label: 'hidden';
		  icon: (self iconNamed: #haloHelp)
]

{ #category : #'api - properties' }
PyFormVisibilityModel class >> visible [
^self new
			                visibility: BlVisibility visible;
			                label: 'visible';
			                icon: (self iconNamed: #haloView)
]

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
