Class {
	#name : #PyramidFakeBackgroundNoValue,
	#superclass : #Object,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #testing }
PyramidFakeBackgroundNoValue >> isNil [

	^ true
]

{ #category : #testing }
PyramidFakeBackgroundNoValue >> isNotNil [

	^ false
]

{ #category : #'as yet unclassified' }
PyramidFakeBackgroundNoValue >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputNoValueModel new
]

{ #category : #'as yet unclassified' }
PyramidFakeBackgroundNoValue >> pyramidSelectMenuOnModal: aModal [

	
]
