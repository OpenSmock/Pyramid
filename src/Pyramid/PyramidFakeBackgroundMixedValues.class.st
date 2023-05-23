Class {
	#name : #PyramidFakeBackgroundMixedValues,
	#superclass : #Object,
	#category : #'Pyramid-plugin-properties-custom'
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
PyramidFakeBackgroundMixedValues >> pyramidSelectMenuOnModal: aModal [
]
