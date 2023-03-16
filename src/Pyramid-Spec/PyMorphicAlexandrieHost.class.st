Class {
	#name : #PyMorphicAlexandrieHost,
	#superclass : #BlMorphicSteppingHost,
	#instVars : [
		'containerMorph'
	],
	#category : #'Pyramid-Spec'
}

{ #category : #'driver selection' }
PyMorphicAlexandrieHost class >> label [

	^ 'Morphic Alexandrie'
]

{ #category : #'driver selection' }
PyMorphicAlexandrieHost class >> priority [

	^ 20
]

{ #category : #accessing }
PyMorphicAlexandrieHost >> containerMorph [
	<return: #Morph>

	^ containerMorph
]

{ #category : #accessing }
PyMorphicAlexandrieHost >> containerMorph: aMorph [
	containerMorph := aMorph
]

{ #category : #'host - api' }
PyMorphicAlexandrieHost >> createHostSpaceFor: aSpace [
	"Create and assign a new morphic host space for given bloc space"

	| aMorph aHostSpace|
	self
		assert: [ aSpace hasHostSpace not ]
		description: [ 'Space must not have a host!' ].

	aMorph := self createMorphFor: aSpace.

	aHostSpace := BlMorphicHostSpace new
		spaceHostMorph: aMorph;
		universe: self universe;
		host: self;
		space: aSpace;
		withAlexandrieRenderer;
		yourself.

	aSpace hostSpace: aHostSpace
]

{ #category : #private }
PyMorphicAlexandrieHost >> createMorphFor: aSpace [

	^ BlMorphicSpaceHostMorph new
		  color: Color transparent;
		  extent: aSpace extent;
		  yourself
]

{ #category : #'host - api' }
PyMorphicAlexandrieHost >> destroyHostSpaceFor: aSpace [

	self
		assert: [ aSpace hasHostSpace ]
		description: [ 'Space must have a host!' ].
	
	aSpace hostSpace
		close;
		detachSpace;
		detachHost;
		detachUniverse.

	aSpace detachHostSpace
]

{ #category : #'host - api' }
PyMorphicAlexandrieHost >> initialize [
	super initialize.

	containerMorph := Morph new
]
