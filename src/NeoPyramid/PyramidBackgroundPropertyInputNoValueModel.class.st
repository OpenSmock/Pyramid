Class {
	#name : #PyramidBackgroundPropertyInputNoValueModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #testing }
PyramidBackgroundPropertyInputNoValueModel >> hasModal [

	^ false
]

{ #category : #accessing }
PyramidBackgroundPropertyInputNoValueModel >> preview [

	^ SpLabelPresenter new
		  label: 'No values';
		  yourself
]
