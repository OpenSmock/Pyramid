Extension { #name : #BlLineGeometry }

{ #category : #'*Pyramid-Bloc' }
BlLineGeometry class >> pyramidDefaultValue [

	^ self from: 0 asPoint to: 50 asPoint
]

{ #category : #'*Pyramid-Bloc' }
BlLineGeometry class >> pyramidDefaultValueForIcon [

	^ self from: 0 asPoint to: 12 asPoint
]
