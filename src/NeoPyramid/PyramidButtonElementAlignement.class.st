Class {
	#name : #PyramidButtonElementAlignement,
	#superclass : #Object,
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #accessing }
PyramidButtonElementAlignement class >> center [

	^ PyramidButtonElementAlignementCenter new
]

{ #category : #accessing }
PyramidButtonElementAlignement class >> end [

	^ PyramidButtonElementAlignementEnd new
]

{ #category : #accessing }
PyramidButtonElementAlignement class >> start [

	^ PyramidButtonElementAlignementStart new
]

{ #category : #adding }
PyramidButtonElementAlignement >> addButton: aSpButtonPresenter withConstraints: aBlock on: aPyramidButtonView [

	self shouldBeImplemented
]

{ #category : #adding }
PyramidButtonElementAlignement >> getHorizontalPopoverDirection [

	self shouldBeImplemented
]
