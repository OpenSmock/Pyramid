Class {
	#name : #PyramidSearchAndSelectModel,
	#superclass : #Object,
	#instVars : [
		'code',
		'isTree',
		'name'
	],
	#category : #'Pyramid-Bloc-plugin-tree'
}

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> all [

	^ self new
		isTree: false;
		code: 'self';
		name: 'Select all';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> allChildrenOf [

	^ self new
		  isTree: false;
		  code:
			  '(self select: [ :e | e id asSymbol = #toto ]) flatCollect: [ :each | each children ]';
		  name: 'Select all children elements of all elements named #toto';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> blTextElement [

	^ self new
		  isTree: false;
		  code: 'self select: [ :e | e isKindOf: BlTextElement ]';
		  name: 'Select all text element';
		  yourself
]

{ #category : #accessing }
PyramidSearchAndSelectModel class >> default [

	^ { self noSelection . self all. self named. self roots. self transparentBackground . self blTextElement . self notVisible . self allChildrenOf }
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> named [

	^ self new
		  isTree: false;
		  code: 'self select: [ :e | e id asSymbol = #toto ]';
		  name: 'Select all elements named #toto';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> noSelection [

	^ self new
		isTree: true;
		code: '{ }';
		name: 'Unselect all';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> notVisible [

	^ self new
		  isTree: false;
		  code: 'self select: [ :e | e visibility isVisible not ]';
		  name: 'Select all non visible element';
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> roots [

	^ self new
		isTree: true;
		code: 'self';
		name: 'Select all roots';
		yourself
]

{ #category : #'as yet unclassified' }
PyramidSearchAndSelectModel class >> transparentBackground [

	^ self new
		  isTree: false;
		  code: 'self select: [ :e | e background isTransparent ]';
		  name: 'Select all elements with transparent background';
		  yourself
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> code [

	^ code
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> code: anObject [

	code := anObject
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> isTree [

	^ isTree
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> isTree: anObject [

	isTree := anObject
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> name [

	^ name
]

{ #category : #accessing }
PyramidSearchAndSelectModel >> name: anObject [

	name := anObject
]
