Class {
	#name : #PyViewPreview,
	#superclass : #PyViewAbstract,
	#traits : 'PyBlocInput',
	#classTraits : 'PyBlocInput classTrait',
	#instVars : [
		'imagePreview'
	],
	#category : #'Pyramid-Deprecated'
}

{ #category : #layout }
PyViewPreview >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: imagePreview;
		  yourself
]

{ #category : #'as yet unclassified' }
PyViewPreview >> imageSize [

	^ 100 asPoint
]

{ #category : #initialization }
PyViewPreview >> initializePresenters [

	imagePreview := self newImage
]

{ #category : #accessing }
PyViewPreview >> pageIcon [

	^ self iconNamed: #smallScreenshot
]

{ #category : #accessing }
PyViewPreview >> pageTitle [

	^ 'Preview'
]

{ #category : #'as yet unclassified' }
PyViewPreview >> receiveNewBlElement: aBlElement [

	aBlElement ifNil: [ ^ self ].

	imagePreview image:
		(aBlElement exportAsForm scaledToSize: self imageSize)
]
