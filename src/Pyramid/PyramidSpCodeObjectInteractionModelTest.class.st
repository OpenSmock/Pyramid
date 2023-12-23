Class {
	#name : #PyramidSpCodeObjectInteractionModelTest,
	#superclass : #TestCase,
	#instVars : [
		'projectModel',
		'interactionModel',
		'firstLevelElements'
	],
	#category : #'Pyramid-plugin-selection'
}

{ #category : #running }
PyramidSpCodeObjectInteractionModelTest >> firstLevelElements [

	^ firstLevelElements
]

{ #category : #running }
PyramidSpCodeObjectInteractionModelTest >> interactionModel [

	^ interactionModel
]

{ #category : #running }
PyramidSpCodeObjectInteractionModelTest >> projectModel [
	^ projectModel
]

{ #category : #running }
PyramidSpCodeObjectInteractionModelTest >> setUp [

	super setUp.

	firstLevelElements := Object new.
	projectModel := PyramidProjectModel new.
	projectModel firstLevelElements add: firstLevelElements.

	interactionModel := PyramidSpCodeObjectInteractionModel new
		                    projectModel: projectModel;
		                    yourself
]

{ #category : #tests }
PyramidSpCodeObjectInteractionModelTest >> testDoItReceiver [

	| obj1 obj2 |
	obj1 := Object new.
	obj2 := Object new.
	self projectModel setSelection: #(  ).
	self assert: (interactionModel doItReceiver isKindOf: Collection).
	self assert: interactionModel doItReceiver size equals: 1.
	self assert:
		(interactionModel doItReceiver includes: self firstLevelElements).

	self projectModel setSelection: { obj1 }.
	self assert: interactionModel doItReceiver equals: obj1.

	self projectModel setSelection: {
			obj1.
			obj2 }.
	self assert: (interactionModel doItReceiver isKindOf: Collection).
	self assert: interactionModel doItReceiver size equals: 2.
	self assert: (interactionModel doItReceiver includes: obj1).
	self assert: (interactionModel doItReceiver includes: obj2)
]

{ #category : #tests }
PyramidSpCodeObjectInteractionModelTest >> testDoItReceiverString [

	self projectModel setSelection: #(  ).
	self
		assert: interactionModel doItReceiverString
		equals: 'the collection of first level elements'.

	self projectModel setSelection: { 1 }.
	self
		assert: interactionModel doItReceiverString
		equals: 'the selected element'.

	self projectModel setSelection: { 1. 2 }.
	self assert: interactionModel doItReceiverString equals: 'an array of 2 selected elements'.

	self projectModel setSelection: { 1. 2. 3. 4. 5 }.
	self assert: interactionModel doItReceiverString equals: 'an array of 5 selected elements'
]
