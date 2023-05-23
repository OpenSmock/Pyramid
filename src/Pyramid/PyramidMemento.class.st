Class {
	#name : #PyramidMemento,
	#superclass : #PyramidMementoAbstract,
	#instVars : [
		'target',
		'command'
	],
	#category : #'Pyramid-plugin-history'
}

{ #category : #accessing }
PyramidMemento >> command [

	^ command
]

{ #category : #accessing }
PyramidMemento >> command: anObject [

	command := anObject
]

{ #category : #'window management' }
PyramidMemento >> restore [

	| state |
	state := self command state.

	self pipeline
		useCommand: self command
		on: (PyramidPipelineTarget new
				 collection: { target };
				 yourself).
	
	"Recycle the state of the command for redo purpose"
	self command state: state.
	
]

{ #category : #accessing }
PyramidMemento >> target [

	^ target
]

{ #category : #accessing }
PyramidMemento >> target: anObject [

	target := anObject
]
