Class {
	#name : #PyFormSpec,
	#superclass : #SpPresenter,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #activation }
PyFormSpec >> activate [

	self activateCallbacks
]

{ #category : #'as yet unclassified' }
PyFormSpec >> activateCallbacks [
]

{ #category : #adding }
PyFormSpec >> addOn: aLayout [

	aLayout add: self expand: false
]

{ #category : #removing }
PyFormSpec >> removeCallbacks [
]

{ #category : #accessing }
PyFormSpec >> value: anObject [

]

{ #category : #'as yet unclassified' }
PyFormSpec >> widthLabel [

	^ 40
]
