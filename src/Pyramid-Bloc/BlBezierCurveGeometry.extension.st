Extension { #name : #BlBezierCurveGeometry }

{ #category : #'*Pyramid-Bloc' }
BlBezierCurveGeometry class >> asIcon [

	^ super asIcon copy: (0 @ 12 extent: 16 @ 12)
]

{ #category : #'*Pyramid-Bloc' }
BlBezierCurveGeometry class >> pyramidDefaultValue [

	^ self controlPoints: {
			  (0 @ 0).
			  (0 @ 75).
			  (50 @ -25).
			  (50 @ 50) }
]

{ #category : #'*Pyramid-Bloc' }
BlBezierCurveGeometry class >> pyramidDefaultValueForIcon [

	^ self controlPoints: {
			  (0 @ 0).
			  (0 @ 24).
			  (16 @ -12).
			  (16 @ 12) }
]
