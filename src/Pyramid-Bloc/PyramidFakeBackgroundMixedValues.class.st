Class {
	#name : #PyramidFakeBackgroundMixedValues,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #testing }
PyramidFakeBackgroundMixedValues >> isNil [

	^ true
]

{ #category : #testing }
PyramidFakeBackgroundMixedValues >> isNotNil [

	^ false
]

{ #category : #'as yet unclassified' }
PyramidFakeBackgroundMixedValues >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputMixedValuesModel new
]

{ #category : #'as yet unclassified' }
PyramidFakeBackgroundMixedValues >> pyramidModalDefaultPaint: aPyramidPaintInputPresenter [
]

{ #category : #'as yet unclassified' }
PyramidFakeBackgroundMixedValues >> pyramidSelectMenuOnModal: aModal [
]
