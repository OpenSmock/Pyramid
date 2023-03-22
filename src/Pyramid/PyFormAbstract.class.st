Class {
	#name : #PyFormAbstract,
	#superclass : #SpPresenter,
	#instVars : [
		'action'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #accessing }
PyFormAbstract >> action [

	action ifNil: [ action := [ :something | ] ].
	^ action
]

{ #category : #accessing }
PyFormAbstract >> action: aFullBlocClosure [
	action := aFullBlocClosure
]

{ #category : #accessing }
PyFormAbstract >> currentValue [

	^ self shouldBeImplemented
]

{ #category : #accessing }
PyFormAbstract >> currentValue: anObject [

	self shouldBeImplemented
]

{ #category : #accessing }
PyFormAbstract >> enabled: aBoolean [

	self shouldBeImplemented
]
