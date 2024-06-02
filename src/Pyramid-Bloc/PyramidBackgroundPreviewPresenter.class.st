Class {
	#name : 'PyramidBackgroundPreviewPresenter',
	#superclass : 'PyramidInputPreviewPresenter',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'initialization' }
PyramidBackgroundPreviewPresenter >> image: aForm label: aString [

	self image image: aForm.
	self label label: aString
]

{ #category : 'initialization' }
PyramidBackgroundPreviewPresenter >> setBackgroundValue: anObject [

	
	self image: anObject asForm label: anObject asString
]

{ #category : 'initialization' }
PyramidBackgroundPreviewPresenter >> setUnknowValue [

	self image: (Smalltalk ui icons iconNamed: #help) label: PyramidUnknowState new asString
]

{ #category : 'initialization' }
PyramidBackgroundPreviewPresenter >> setUnknowValue: anObject [

	self image: (Smalltalk ui icons iconNamed: #help) label: anObject asString
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPreviewPresenter >> value: anObject [
	"Class test is not a good patern, maybe it should be directly on the object ?"

	(anObject class inheritsFrom: BlBackground )ifTrue: [ ^ self setBackgroundValue: anObject ].
	(anObject class inheritsFrom: PyramidUnknowState )ifTrue: [ ^ self setUnknowValue: anObject ].
	self setUnknowValue
]
