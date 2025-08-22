Class {
	#name : #PyramidUndoDynamicResizeBlocCommand,
	#superclass : #PyramidBasicConstraintsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #testing }
PyramidUndoDynamicResizeBlocCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject size ]
]

{ #category : #'as yet unclassified' }
PyramidUndoDynamicResizeBlocCommand >> commandInverse [ 

	^ PyramidDynamicResizeCommand new
]

{ #category : #'as yet unclassified' }
PyramidUndoDynamicResizeBlocCommand >> getValueFor: anObject [

	^ anObject userData at: #pyramidPreviousDynamicResize
]

{ #category : #'as yet unclassified' }
PyramidUndoDynamicResizeBlocCommand >> setValueFor: anObject with: anArgument [

	^ anObject constraintsDo: [ :c |
		  c horizontal exact: anArgument x.
		  c vertical exact: anArgument y ]
]
