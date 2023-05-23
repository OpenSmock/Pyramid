Class {
	#name : #PyramidMorphicAlexandrieHost,
	#superclass : #BlMorphicSteppingHost,
	#instVars : [
		'containerMorph'
	],
	#category : #'Pyramid-Spec'
}

{ #category : #'driver selection' }
PyramidMorphicAlexandrieHost class >> label [

	^ 'Morphic Alexandrie'
]

{ #category : #'driver selection' }
PyramidMorphicAlexandrieHost class >> priority [

	^ 20
]

{ #category : #accessing }
PyramidMorphicAlexandrieHost >> containerMorph [
	<return: #Morph>

	^ containerMorph
]

{ #category : #accessing }
PyramidMorphicAlexandrieHost >> containerMorph: aMorph [
	containerMorph := aMorph
]

{ #category : #'host - api' }
PyramidMorphicAlexandrieHost >> createHostSpaceFor: aSpace [
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
PyramidMorphicAlexandrieHost >> createMorphFor: aSpace [

	^ BlMorphicSpaceHostMorph new
		  color: Color transparent;
		  extent: aSpace extent;
		  yourself
]

{ #category : #'host - api' }
PyramidMorphicAlexandrieHost >> destroyHostSpaceFor: aSpace [

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
PyramidMorphicAlexandrieHost >> initialize [
	super initialize.

	containerMorph := Morph new
]
