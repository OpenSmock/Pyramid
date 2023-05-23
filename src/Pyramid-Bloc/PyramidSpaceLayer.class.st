Class {
	#name : #PyramidSpaceLayer,
	#superclass : #Object,
	#instVars : [
		'root',
		'canvas'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidSpaceLayer >> addPanelsOn: aPyramidSimpleWindow [
]

{ #category : #accessing }
PyramidSpaceLayer >> canvas [

	canvas ifNil: [ canvas := BlElement new constraintsDo: [ :c |
				        c horizontal matchParent.
				        c vertical matchParent ]; yourself ].
	^ canvas
]

{ #category : #accessing }
PyramidSpaceLayer >> configureSpaceBuilder: aPyramidSpaceBuilder [

	
]

{ #category : #'as yet unclassified' }
PyramidSpaceLayer >> connectOn: aPyramidEditor [
]

{ #category : #accessing }
PyramidSpaceLayer >> root [

	root ifNil: [
		root := BlElement new
			        addChild: self canvas;
			constraintsDo: [ :c |
			  c horizontal matchParent.
			  c vertical matchParent ];
			        yourself ].
	^ root
]
