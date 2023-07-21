"
I am a `SpPresenter` used to view and changed the property of a collection of objects.

+ emptyValue > i set myself to an empty value state where the property as no value.
+ mixedValues > i set myself to a mixed values state where objects inside the collection have different values.
+ value > return the value set by the presenter.
+ value: anObject > set the value of a presenter without triggering whenValueChangedDo block.
+ whenValueChangedDo: aBlock > a block to trigger when the value is updated. As one argument who is the new value of the property.


"
Class {
	#name : #PyramidInputPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #testing }
PyramidInputPresenter class >> isAbstract [

	^ self == PyramidInputPresenter
]

{ #category : #accessing }
PyramidInputPresenter class >> modelClass [

	^ PyramidInputStrings
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> applyModel [

	
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> emptyValue [

	self value: PyramidEmptyValue new
]

{ #category : #initialization }
PyramidInputPresenter >> initialize [

	super initialize.
	self model: self class modelClass new.
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> mixedValues [

	self value: PyramidMixedValues new
]

{ #category : #accessing }
PyramidInputPresenter >> model [

	^ model
]

{ #category : #accessing }
PyramidInputPresenter >> model: anObject [

	model := anObject.
	self applyModel
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> value [

	
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> value: anObject [
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> whenValueChangedDo: aBlock [
]
