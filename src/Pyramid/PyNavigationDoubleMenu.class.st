Class {
	#name : #PyNavigationDoubleMenu,
	#superclass : #PyNavigationAbstract,
	#instVars : [
		'leftMenu',
		'rightMenu'
	],
	#category : #'Pyramid-Editor-Toolbar'
}

{ #category : #'as yet unclassified' }
PyNavigationDoubleMenu >> callbackLeft: aBlock [

	leftMenu action: aBlock
]

{ #category : #'as yet unclassified' }
PyNavigationDoubleMenu >> callbackRight: aBlock [

	rightMenu action: aBlock
]

{ #category : #layout }
PyNavigationDoubleMenu >> defaultLayout [

	^ self layoutFor: { 
			  leftMenu.
			  rightMenu }
]

{ #category : #initialization }
PyNavigationDoubleMenu >> initializePresenters [

	leftMenu := self makeButtonWithIcon: #solidMenu.
	rightMenu := self makeButtonWithIcon: #solidMenu
]

{ #category : #'as yet unclassified' }
PyNavigationDoubleMenu >> stateLeft: aBoolean [

	aBoolean
		ifTrue: [ leftMenu color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ leftMenu color: (Color fromHexString: #e6e6e6) ]
]

{ #category : #'as yet unclassified' }
PyNavigationDoubleMenu >> stateRight: aBoolean [

	aBoolean
		ifTrue: [ rightMenu color: (Color fromHexString: #afd5fa) ]
		ifFalse: [ rightMenu color: (Color fromHexString: #e6e6e6) ]
]
