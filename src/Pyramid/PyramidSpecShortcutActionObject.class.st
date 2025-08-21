"
This class is used to simplify the mass shortcut to add in Spec.
"
Class {
	#name : #PyramidSpecShortcutActionObject,
	#superclass : #Object,
	#instVars : [
		'shortcut',
		'action',
		'name'
	],
	#category : #'Pyramid-core'
}

{ #category : #accessing }
PyramidSpecShortcutActionObject >> action [

	^ action
]

{ #category : #accessing }
PyramidSpecShortcutActionObject >> action: aBlock [

	action := aBlock
]

{ #category : #initialization }
PyramidSpecShortcutActionObject >> initialize [ 

	"Do nothing"
]

{ #category : #accessing }
PyramidSpecShortcutActionObject >> name [

	^ name
]

{ #category : #accessing }
PyramidSpecShortcutActionObject >> name: aString [

	name := aString
]

{ #category : #accessing }
PyramidSpecShortcutActionObject >> shortcut [

	^ shortcut
]

{ #category : #accessing }
PyramidSpecShortcutActionObject >> shortcut: aShortcut [

	shortcut := aShortcut 
]
