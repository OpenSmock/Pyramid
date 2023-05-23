Class {
	#name : #PyramidPointPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputX',
		'inputY',
		'submitBlock'
	],
	#category : #'Pyramid-properties-custom'
}

{ #category : #layout }
PyramidPointPresenter >> defaultLayout [ 

^ SpBoxLayout newHorizontal add: self inputX; add: self inputY; yourself
]

{ #category : #'initialization - deprecated' }
PyramidPointPresenter >> initializePresenter [

	inputX := PyramidNumberPresenter new whenSubmitDo: [ :n | self submit ]; yourself.
	inputY := PyramidNumberPresenter new whenSubmitDo: [ :n | self submit ]; yourself.
]

{ #category : #'initialization - deprecated' }
PyramidPointPresenter >> inputX [
^ inputX
]

{ #category : #'initialization - deprecated' }
PyramidPointPresenter >> inputY [

	^ inputY
]

{ #category : #accessing }
PyramidPointPresenter >> point [

	self inputX number ifNil: [ ^ nil ].
	self inputY number ifNil: [ ^ nil ].
	self inputX number isInfinite ifTrue: [ ^ nil ].
	self inputY number isInfinite ifTrue: [ ^ nil ].
	self inputX number isNaN ifTrue: [ ^ nil ].
	self inputY number isNaN ifTrue: [ ^ nil ].
	
	^ self inputX number @ self inputY number
]

{ #category : #accessing }
PyramidPointPresenter >> point: aPoint [

	aPoint
		ifNil: [
			self inputX number: nil.
			self inputY number: nil.
			^ self ].
	self inputX number: aPoint x.
	self inputY number: aPoint y
]

{ #category : #submit }
PyramidPointPresenter >> submit [

	self submitBlock value: self point
]

{ #category : #enumerating }
PyramidPointPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :point |  ] ].
	^ submitBlock
]

{ #category : #enumerating }
PyramidPointPresenter >> whenSubmitDo: aBlock [

	submitBlock := aBlock
]
