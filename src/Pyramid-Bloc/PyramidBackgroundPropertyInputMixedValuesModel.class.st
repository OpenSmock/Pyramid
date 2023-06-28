Class {
	#name : #PyramidBackgroundPropertyInputMixedValuesModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'Pyramid-Bloc-custom-specs-background'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputMixedValuesModel >> preview [

	^ SpLabelPresenter new
		  label: 'Mixed values';
		  yourself
]
