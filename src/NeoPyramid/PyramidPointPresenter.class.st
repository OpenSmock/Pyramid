Class {
	#name : #PyramidPointPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputX',
		'inputY'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #layout }
PyramidPointPresenter >> defaultLayout [ 

^ SpBoxLayout newHorizontal add: self inputX; add: self inputY; yourself
]

{ #category : #'initialization - deprecated' }
PyramidPointPresenter >> initializePresenter [ 

	inputX := PyramidNumberPresenter new.
	inputY := PyramidNumberPresenter new.
]

{ #category : #'initialization - deprecated' }
PyramidPointPresenter >> inputX [
^ inputX
]

{ #category : #'initialization - deprecated' }
PyramidPointPresenter >> inputY [

	^ inputY
]

{ #category : #accessing }
PyramidPointPresenter >> point [

	^ self inputX number @ self inputY number
]

{ #category : #accessing }
PyramidPointPresenter >> point: aPoint [

	self inputX number: aPoint x.
	self inputY number: aPoint y
]
