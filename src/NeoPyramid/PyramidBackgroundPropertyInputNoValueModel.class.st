Class {
	#name : #PyramidBackgroundPropertyInputNoValueModel,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputNoValueModel >> button [
^ super button
		  enabled: false;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundPropertyInputNoValueModel >> preview [

	^ SpLabelPresenter new
		  label: 'No values';
		  yourself
]
