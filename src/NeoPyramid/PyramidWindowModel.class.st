Class {
	#name : #PyramidWindowModel,
	#superclass : #Object,
	#instVars : [
		'panels',
		'layoutStrategy'
	],
	#category : #'NeoPyramid-aaa-views'
}

{ #category : #accessing }
PyramidWindowModel >> at: aSymbol [

	^ self panels
		at: aSymbol
		
]

{ #category : #accessing }
PyramidWindowModel >> at: aSymbol put: aPanelModel [
	self panels at: aSymbol ifPresent: [ self halt. "Error try to add a panel on top of another" ] ifAbsentPut: [ aPanelModel ]
]

{ #category : #initialization }
PyramidWindowModel >> initialize [ 

	panels := Dictionary new.
]

{ #category : #accessing }
PyramidWindowModel >> layout [
	self layoutStrategy layoutFor: self panels
]

{ #category : #accessing }
PyramidWindowModel >> panels [

	^ panels
]

{ #category : #accessing }
PyramidWindowModel >> panels: anObject [

	panels := anObject
]
