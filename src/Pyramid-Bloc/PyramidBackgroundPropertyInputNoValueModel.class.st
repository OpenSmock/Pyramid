Class {
	#name : #PyramidBackgroundPropertyInputNoValueModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'Pyramid-Bloc-custom-specs'
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
