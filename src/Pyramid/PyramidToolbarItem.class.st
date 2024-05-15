Class {
	#name : 'PyramidToolbarItem',
	#superclass : 'Object',
	#instVars : [
		'presenter',
		'constraints',
		'order'
	],
	#category : 'Pyramid-views',
	#package : 'Pyramid',
	#tag : 'views'
}

{ #category : 'comparing' }
PyramidToolbarItem >> <= aPyramidToolbarItem [

	^ self order <= aPyramidToolbarItem order
]

{ #category : 'adding' }
PyramidToolbarItem >> addOnLayout: aLayout [

	aLayout add: self presenter withConstraints: self constraints.
]

{ #category : 'accessing' }
PyramidToolbarItem >> constraints [

	^ constraints
]

{ #category : 'accessing' }
PyramidToolbarItem >> constraints: anObject [

	constraints := anObject
]

{ #category : 'accessing' }
PyramidToolbarItem >> order [

	^ order
]

{ #category : 'accessing' }
PyramidToolbarItem >> order: anObject [

	order := anObject
]

{ #category : 'accessing' }
PyramidToolbarItem >> presenter [

	^ presenter
]

{ #category : 'accessing' }
PyramidToolbarItem >> presenter: anObject [

	presenter := anObject
]
