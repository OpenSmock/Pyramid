Extension { #name : #BlElementGeometry }

{ #category : #'*Pyramid-Bloc' }
BlElementGeometry class >> asIcon [

	| element |
	element := BlElement new
		           size: 16 @ 12;
		           background: (Color gray: 0.75);
		           border: (BlBorder paint: Color black width: 1);
		           geometry: self pyramidDefaultValueForIcon;
		           yourself.
	^ element exportAsForm
]

{ #category : #'*Pyramid-Bloc' }
BlElementGeometry class >> asPyramidMagicButton [

	^ PyramidMagicButtonModel new
		  icon: self asIcon;
		  helpSelected:
			  ('The geometry is <1s>.' expandMacrosWith: self name);
		  helpNotSelected:
			  ('Set the geometry to <1s>.' expandMacrosWith: self name);
		  label: '';
		  inputValue: self pyramidDefaultValue;
		  inputValidation: [ :value | value isKindOf: self ];
		  yourself
]

{ #category : #'*Pyramid-Bloc' }
BlElementGeometry class >> pyramidDefaultValue [

	^ self new
]

{ #category : #'*Pyramid-Bloc' }
BlElementGeometry class >> pyramidDefaultValueForIcon [

	^ self pyramidDefaultValue
]
