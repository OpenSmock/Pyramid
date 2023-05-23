Class {
	#name : #PyramidBackgroundPropertyInputMixedValuesModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputMixedValuesModel >> preview [

	^ SpLabelPresenter new
		  label: 'Mixed values';
		  yourself
]
