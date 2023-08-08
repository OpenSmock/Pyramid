Class {
	#name : #PyramidSearchAndSelectModel,
	#superclass : #Object,
	#instVars : [
		'code',
		'name',
		'isRoots',
		'isAll',
		'isSelection'
	],
	#category : #'Pyramid-Incubator-plugin-hierarchy-selection-helper'
}

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> all [

	^ self new
		  beAll;
		  code: 'self';
		  name: 'Select all';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> allChildrenOf [

	^ self new
		  beAll;
		  code:
			  '(self select: [ :e | e id asSymbol = #toto ]) flatCollect: [ :each | each children ]';
		  name: 'Select all children elements of all elements named #toto';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> blTextElement [

	^ self new
		  beAll;
		  code: 'self select: [ :e | e isKindOf: BlTextElement ]';
		  name: 'Select all text element';
		  yourself
]

{ #category : #accessing }
PyramidSearchAndSelectModel class >> default [

	^ {
		  self all.
		  self noSelection.
		self named.
		  self roots.
		  self transparentBackground.
		  self blTextElement.
		  self notVisible.
		  self allChildrenOf }
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> named [

	^ self new
		 beAll;
		  code: 'self select: [ :e | e id asSymbol = #toto ]';
		  name: 'Select all elements named #toto';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> noSelection [

	^ self new
		  beAll;
		  code: '{ }';
		  name: 'Unselect all';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> notVisible [

	^ self new
		  beAll;
		  code: 'self select: [ :e | e visibility isVisible not ]';
		  name: 'Select all non visible element';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> roots [

	^ self new
		  beRoots;
		  code: 'self';
		  name: 'Select all roots';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> transparentBackground [

	^ self new
		  beAll;
		  code: 'self select: [ :e | e background isTransparent ]';
		  name: 'Select all elements with transparent background';
		  yourself
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> beAll [

	isAll := true.
	isRoots := false.
	isSelection := false
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> beRoots [

	isAll := false.
	isRoots := true.
	isSelection := false
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> beSelection [

	isAll := false.
	isRoots := false.
	isSelection := true
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> code [

	^ code
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> code: anObject [

	code := anObject
]

{ #category : #initialization }
PyramidSearchAndSelectModel >> initialize [

	self beAll
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> isAll [

	^ isAll
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> isRoots [

	^ isRoots
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> isSelection [

	^ isSelection
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> name [

	^ name
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> name: anObject [

	name := anObject
]
