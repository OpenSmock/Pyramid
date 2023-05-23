Class {
	#name : #PyramidBackgroundPropertyInputNoValueModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'Pyramid-plugin-properties-custom'
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
