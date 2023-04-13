Class {
	#name : #PyramidToggleButton,
	#superclass : #PyramidButton,
	#instVars : [
		'state',
		'spec'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #converting }
PyramidToggleButton >> asSpecButtonFor: anObject [

	spec := SpButtonPresenter new
		        icon: self icon;
		        action: [
			        self state: self state not.
			        self updateSpec.
			        self callback value ];
		        yourself.
	^ spec
]

{ #category : #accessing }
PyramidToggleButton >> spec [

	^ spec
]

{ #category : #'as yet unclassified' }
PyramidToggleButton >> specActivate [

	self spec color: (Color fromHexString: #afd5fa)
]

{ #category : #'as yet unclassified' }
PyramidToggleButton >> specDeactivate [

	self spec color: (Color fromHexString: #e6e6e6)
]

{ #category : #accessing }
PyramidToggleButton >> state [

	state ifNil: [ state := false ].
	^ state
]

{ #category : #accessing }
PyramidToggleButton >> state: anObject [

	state := anObject
]

{ #category : #'as yet unclassified' }
PyramidToggleButton >> updateSpec [

	state ifTrue: [ self specActivate ] ifFalse: [ self specDeactivate ]
]
