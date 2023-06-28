Class {
	#name : #PyramidBackgroundPropertyInputNoValueModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'Pyramid-Bloc-custom-specs-background'
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
