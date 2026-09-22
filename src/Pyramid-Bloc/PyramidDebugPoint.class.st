Class {
	#name : #PyramidDebugPoint,
	#superclass : #DebugPoint,
	#instVars : [
		'whenHitDo'
	],
	#category : #'Pyramid-Bloc-plugin-edit-on-running'
}

{ #category : #removing }
PyramidDebugPoint class >> removeAllPyramidDebugPoint [

	<script: 'self removeAllPyramidDebugPoint'>
	| pyramidDebugPoints |
	pyramidDebugPoints := PyramidDebugPoint allInstances.
	pyramidDebugPoints isEmptyOrNil ifTrue: [ ^ self ].
	pyramidDebugPoints do: [ :each | each link ifNotNil:[ each remove ] ]
]

{ #category : #API }
PyramidDebugPoint >> hitWithContext: aContext [

	| result |
	result := super hitWithContext: aContext.
	result ifTrue:[ self whenHitDo value: aContext ].
	
	^result
	
]

{ #category : #initialization }
PyramidDebugPoint >> initialize [

	super initialize.
	whenHitDo := [ :c | ]
]

{ #category : #testing }
PyramidDebugPoint >> isInstalled [

	^ self link methods isNotEmpty
]

{ #category : #accessing }
PyramidDebugPoint >> whenHitDo [

	^ whenHitDo
]

{ #category : #accessing }
PyramidDebugPoint >> whenHitDo: anObject [

	whenHitDo := anObject
]
