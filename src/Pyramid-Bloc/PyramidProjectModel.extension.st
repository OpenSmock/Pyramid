Extension { #name : 'PyramidProjectModel' }

{ #category : '*Pyramid-Bloc' }
PyramidProjectModel >> allElements [

	^ PyramidElementsManipulationHelper flattenChildrenOfCollection:
		  self firstLevelElements
]
