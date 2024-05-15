Class {
	#name : 'PyramidGroupCommandModel',
	#superclass : 'Object',
	#instVars : [
		'originElement',
		'groupElement',
		'firstLevelElements',
		'originalChildrenElements',
		'originFirstLevelElements',
		'selectionInCorrectOrder'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-group',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-group'
}

{ #category : 'accessing' }
PyramidGroupCommandModel >> firstLevelElements [

	^ firstLevelElements
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> firstLevelElements: anObject [

	firstLevelElements := anObject
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> groupElement [

	^ groupElement
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> groupElement: anObject [

	groupElement := anObject
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> originElement [

	^ originElement
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> originElement: anObject [

	originElement := anObject
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> originFirstLevelElements [

	^ originFirstLevelElements
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> originFirstLevelElements: anObject [

	originFirstLevelElements := anObject
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> originalChildrenElements [

	^ originalChildrenElements
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> originalChildrenElements: anObject [

	originalChildrenElements := anObject
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> selectionInCorrectOrder [

	^ selectionInCorrectOrder
]

{ #category : 'accessing' }
PyramidGroupCommandModel >> selectionInCorrectOrder: anObject [

	selectionInCorrectOrder := anObject
]
