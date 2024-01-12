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
		'strings'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #testing }
PyramidInputPresenter class >> isAbstract [

	^ self == PyramidInputPresenter
]

{ #category : #accessing }
PyramidInputPresenter class >> stringsClass [

	^ PyramidInputStrings
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> applyStrings [

	
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> emptyValue [

	self value: PyramidEmptyValue new
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> mixedValues [

	self value: PyramidMixedValues new
]

{ #category : #'as yet unclassified' }
PyramidInputPresenter >> orNil [

	^ PyramidInputOrNilPresenter new inputPresenter: self; yourself.
]

{ #category : #accessing }
PyramidInputPresenter >> strings [

	^ strings
]

{ #category : #accessing }
PyramidInputPresenter >> strings: anObject [

	strings := anObject.
	self applyStrings
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
