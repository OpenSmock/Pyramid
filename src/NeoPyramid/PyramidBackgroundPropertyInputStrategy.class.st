Class {
	#name : #PyramidBackgroundPropertyInputStrategy,
	#superclass : #Object,
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputStrategy >> button [

	^ SpButtonPresenter new
		  icon: (self iconNamed: #smallCogInitialState);
		  action: [ self modal openModal ]; yourself
]

{ #category : #accessing }
PyramidBackgroundPropertyInputStrategy >> modal [

	^ self shouldBeImplemented
]

{ #category : #accessing }
PyramidBackgroundPropertyInputStrategy >> preview [

	^ self shouldBeImplemented
]
