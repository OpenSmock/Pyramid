Extension { #name : #PyramidProjectModel }

{ #category : #'*Pyramid-Bloc' }
PyramidProjectModel >> allElements [

	^ PyramidElementsManipulationHelper flattenChildrenOfCollection:
		  self firstLevelElements
]

{ #category : #'*Pyramid-Bloc' }
PyramidProjectModel >> numberOfElements [

	^ PyramidElementsManipulationHelper countElementsIn:
		  self firstLevelElements.
]
