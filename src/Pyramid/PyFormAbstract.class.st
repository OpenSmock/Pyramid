Class {
	#name : #PyFormAbstract,
	#superclass : #SpPresenter,
	#instVars : [
		'action'
	],
	#category : #'Pyramid-Editor-Properties-Form'
}

{ #category : #'as yet unclassified' }
PyFormAbstract class >> numberOfEntriesBeforeScrolling [

	^ 11
]

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

{ #category : #'as yet unclassified' }
PyFormAbstract >> defaultEmptyText [
	^ 'No element'
]

{ #category : #private }
PyFormAbstract >> defaultMixedText [

	^ '# Mixed values'
]

{ #category : #'as yet unclassified' }
PyFormAbstract >> differentsValue [
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyFormAbstract >> emptyValue [

	self shouldBeImplemented
]

{ #category : #accessing }
PyFormAbstract >> enabled: aBoolean [

	self shouldBeImplemented
]
