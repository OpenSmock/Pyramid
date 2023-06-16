Class {
	#name : #PyramidCollectionWithCallbacksTest,
	#superclass : #TestCase,
	#instVars : [
		'valueToCheck',
		'collection'
	],
	#category : #'Pyramid-Tests-Cases'
}

{ #category : #accessing }
PyramidCollectionWithCallbacksTest >> collection [

	^ collection
]

{ #category : #running }
PyramidCollectionWithCallbacksTest >> setUp [
	super setUp.

	valueToCheck := 0.
	collection := PyramidCollectionWithCallbacks new.
	collection subscribe: self withCallback: [ valueToCheck := valueToCheck + 1 ]
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testAdd [

	self assert: self valueToCheck equals: 0.
	self collection add: #a.
	self assert: self valueToCheck equals: 1.
	self collection add: #b.
	self assert: self valueToCheck equals: 2.
	self collection add: #c.
	self assert: self valueToCheck equals: 3.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c)
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testAddAll [

	self assert: self valueToCheck equals: 0.
	self collection addAll: {  }.
	self assert: self valueToCheck equals: 0.
	self collection addAll: { #a. #b. #c }.
	self assert: self valueToCheck equals: 1.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c)
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testNew [

	self assert: PyramidCollectionWithCallbacks new collection class equals: OrderedCollection.
	self assert: (PyramidCollectionWithCallbacks new: Bag) collection class equals: Bag.
	self assert: (PyramidCollectionWithCallbacks new: Set) collection class equals: Set.
	self assert: (PyramidCollectionWithCallbacks new: Dictionary) collection class equals: Dictionary.
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testRemove [

	self assert: self valueToCheck equals: 0.
	self collection addAll: { #a. #b. #c }.
	self assert: self valueToCheck equals: 1.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c).
	self collection remove: #a.
	self assert: self valueToCheck equals: 2.
	self assert: (self collection includes: #a) not.
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c)
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testRemoveAll [

	self assert: self valueToCheck equals: 0.
	self collection addAll: { #a. #b. #c }.
	self assert: self valueToCheck equals: 1.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c).
	self assert: (self collection size) equals: 3.
	self collection removeAll.
	self assert: self valueToCheck equals: 2.
	self assert: (self collection size) equals: 0.
	self collection addAll: { #a. #b. #c }.
	self assert: self valueToCheck equals: 3.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c).
	self collection removeAll: { #a . #b }.
	self assert: self valueToCheck equals: 4.
	self assert: (self collection size) equals: 1.
	self assert: (self collection includes: #c).
	
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testRemoveIfAbsent [

	| secondValueToCheck |
	self assert: self valueToCheck equals: 0.
	self collection addAll: { #a. #b. #c }.
	self assert: self valueToCheck equals: 1.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c).
	secondValueToCheck := 0.
	self collection remove: #a ifAbsent: [ secondValueToCheck := secondValueToCheck + 1 ].
	self assert: self valueToCheck equals: 2.
	self assert: secondValueToCheck equals: 0.
	self assert: (self collection includes: #a) not.
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c).
	self collection remove: #d ifAbsent: [ secondValueToCheck := secondValueToCheck + 1 ].
	self assert: self valueToCheck equals: 2.
	self assert: secondValueToCheck equals: 1.
	self assert: (self collection includes: #a) not.
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c)
]

{ #category : #tests }
PyramidCollectionWithCallbacksTest >> testReplaceAll [

	self assert: self valueToCheck equals: 0.
	self collection addAll: { #a. #b. #c }.
	self assert: (self collection includes: #a).
	self assert: (self collection includes: #b).
	self assert: (self collection includes: #c).
	self assert: self valueToCheck equals: 1.
	self collection replaceAll: { #e. #f. #g }.
	self assert: (self collection includes: #e).
	self assert: (self collection includes: #f).
	self assert: (self collection includes: #g).
	self assert: self valueToCheck equals: 2.
]

{ #category : #accessing }
PyramidCollectionWithCallbacksTest >> valueToCheck [
^ valueToCheck
]
