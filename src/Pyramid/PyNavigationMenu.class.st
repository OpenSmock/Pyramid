Class {
	#name : #PyNavigationMenu,
	#superclass : #PyNavigationAbstract,
	#instVars : [
		'button'
	],
	#category : #'Pyramid-Editor-Toolbar'
}

{ #category : #'as yet unclassified' }
PyNavigationMenu >> callback: aBlock [

	button action: aBlock
]

{ #category : #'as yet unclassified' }
PyNavigationMenu >> defaultLayout [

	^ self layoutFor: { 
button
			   }
]

{ #category : #'as yet unclassified' }
PyNavigationMenu >> initializePresenters [

	button := self makeButtonWithIcon: #solidMenu
]

{ #category : #'as yet unclassified' }
PyNavigationMenu >> state: aBoolean [

	aBoolean
		ifTrue: [ button color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ button color: (Color fromHexString: #e6e6e6) ]
]
