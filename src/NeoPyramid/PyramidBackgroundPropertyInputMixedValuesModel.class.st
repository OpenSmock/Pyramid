Class {
	#name : #PyramidBackgroundPropertyInputMixedValuesModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputMixedValuesModel >> preview [

	^ SpLabelPresenter new
		  label: 'Mixed values';
		  yourself
]
