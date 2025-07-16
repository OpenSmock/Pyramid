Class {
	#name : #PyramidBreakpoint,
	#superclass : #Breakpoint,
	#instVars : [
		'whenHitDo'
	],
	#category : #'Pyramid-Bloc-plugin-edit-on-running'
}

{ #category : #removing }
PyramidBreakpoint class >> removeAllPyramidBreakpoint [

	<script: 'self removeAllPyramidBreakpoint'>
	| pyramidBreakpoints |
	pyramidBreakpoints := self all select: [ :each | each class = self ].
	pyramidBreakpoints ifEmpty: [ ^ self ].
	pyramidBreakpoints do: [ :each | each remove ]
]

{ #category : #removing }
PyramidBreakpoint class >> removeAllPyramidBreakpointExceptOne [

	<script: 'self removeAllPyramidBreakpointExceptOne'>
	| pyramidBreakpoints |
	pyramidBreakpoints := self all select: [ :each | each class = self ].
	pyramidBreakpoints ifEmpty: [ ^ self ].
	pyramidBreakpoints allButFirstDo: [ :each | each remove ]
]

{ #category : #api }
PyramidBreakpoint >> breakInContext: aContext node: aNode [

	self class notifyBreakpointHit: self inContext: aContext node: aNode.
	self isEnabled ifFalse: [ ^ self ].
	self onCount ifTrue: [
		self increaseCount = self breakOnCount ifFalse: [ ^ self ] ].
	self once ifTrue: [ self disable ].
	self whenHitDo value: aContext.
]

{ #category : #initialization }
PyramidBreakpoint >> initialize [

	super initialize.
	whenHitDo := [ :c | ]
]

{ #category : #testing }
PyramidBreakpoint >> isInstalled [

	^ self link methods isNotEmpty
]

{ #category : #accessing }
PyramidBreakpoint >> whenHitDo [

	^ whenHitDo
]

{ #category : #accessing }
PyramidBreakpoint >> whenHitDo: anObject [

	whenHitDo := anObject
]
