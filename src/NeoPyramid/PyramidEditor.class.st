Class {
	#name : #PyramidEditor,
	#superclass : #Object,
	#instVars : [
		'plugins'
	],
	#category : #NeoPyramid
}

{ #category : #initialization }
PyramidEditor >> initialize [ 
	plugins:= {  }
]

{ #category : #'as yet unclassified' }
PyramidEditor >> makeGlobalView [

	| builder leftElements topElements rightElements |
	builder := PyramidGlobalViewBuilder new.
	leftElements := OrderedCollection new.
	topElements := OrderedCollection new.
	rightElements := OrderedCollection new.

	self plugins values do: [ :each |
		topElements := topElements , each topElements.
		leftElements := leftElements , each leftElements.
		rightElements := rightElements , each rightElements ].

	^ builder
		  topElements: topElements;
		  leftElements: leftElements;
		  rightElements: rightElements;
		  build
]

{ #category : #accessing }
PyramidEditor >> plugins [

	^ plugins
]

{ #category : #accessing }
PyramidEditor >> plugins:aCollection [
	plugins:=aCollection
]
