Class {
	#name : #PyramidBackgroundPropertyInputUnknownStrategy,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputUnknownStrategy >> button [

	^ super button
		  enabled: false;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundPropertyInputUnknownStrategy >> hasModal [

	^ false
]

{ #category : #accessing }
PyramidBackgroundPropertyInputUnknownStrategy >> preview [

	^ SpLabelPresenter new
		  label: 'Unknown strategy';
		  yourself
]
