Extension { #name : #BlPolylineGeometry }

{ #category : #'*Pyramid-Bloc' }
BlPolylineGeometry class >> pyramidDefaultValue [

	^ self vertices: {
			  (0 @ 50).
			  (0 @ 0).
			  (25 @ 25).
			  (50 @ 0).
			  (50 @ 50) }
]

{ #category : #'*Pyramid-Bloc' }
BlPolylineGeometry class >> pyramidDefaultValueForIcon [

	^ self vertices: (self pyramidDefaultValue vertices collect: [ :each | each / 4.2 ])
]
