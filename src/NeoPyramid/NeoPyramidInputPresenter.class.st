"
I am a `SpPresenter` used to view and changed the property of a collection of objects.

+ emptyValue > i set myself to an empty value state where the property as no value.
+ mixedValues > i set myself to a mixed values state where objects inside the collection have different values.
+ value > return the value set by the presenter.
+ value: anObject > set the value of a presenter without triggering whenValueChangedDo block.
+ whenValueChangedDo: aBlock > a block to trigger when the value is updated. As one argument who is the new value of the property.


"
Class {
	#name : #NeoPyramidInputPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #testing }
NeoPyramidInputPresenter class >> isAbstract [

	^ self == NeoPyramidInputPresenter
]

{ #category : #accessing }
NeoPyramidInputPresenter class >> modelClass [

	^ PyramidInputModel
]

{ #category : #'as yet unclassified' }
NeoPyramidInputPresenter >> applyModel [

	
]

{ #category : #'as yet unclassified' }
NeoPyramidInputPresenter >> emptyValue [

	self value: PyramidEmptyValue new
]

{ #category : #'as yet unclassified' }
NeoPyramidInputPresenter >> mixedValues [

	self value: PyramidMixedValues new
]

{ #category : #accessing }
NeoPyramidInputPresenter >> model [

	^ model
]

{ #category : #accessing }
NeoPyramidInputPresenter >> model: anObject [

	model := anObject.
	self applyModel
]

{ #category : #'as yet unclassified' }
NeoPyramidInputPresenter >> value [

	
]

{ #category : #'as yet unclassified' }
NeoPyramidInputPresenter >> value: anObject [
]

{ #category : #'as yet unclassified' }
NeoPyramidInputPresenter >> whenValueChangedDo: aBlock [
]
