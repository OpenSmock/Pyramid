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

{ #category : #history }
PyramidUndoDynamicResizeBlocCommand >> commandInverse [ 

	^ PyramidDynamicResizeCommand new
]

{ #category : #getter }
PyramidUndoDynamicResizeBlocCommand >> getValueFor: anObject [

	^ anObject userData at: #pyramidPreviousDynamicResize
]

{ #category : #setter }
PyramidUndoDynamicResizeBlocCommand >> setValueFor: anObject with: anArgument [

	^ anObject constraintsDo: [ :c |
		  c horizontal exact: anArgument x.
		  c vertical exact: anArgument y ]
]
