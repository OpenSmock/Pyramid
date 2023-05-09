Class {
	#name : #PyramidBackgroundModeSelector,
	#superclass : #PyramidBackgroundPresenterElement,
	#instVars : [
		'dropList',
		'backgroundInput'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundModeSelector >> backgroundInput [

	^ backgroundInput
]

{ #category : #accessing }
PyramidBackgroundModeSelector >> backgroundInput: anObject [

	backgroundInput := anObject
]

{ #category : #layout }
PyramidBackgroundModeSelector >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: self dropList;
		  yourself
]

{ #category : #accessing }
PyramidBackgroundModeSelector >> dropList [
^ dropList
]

{ #category : #initialization }
PyramidBackgroundModeSelector >> initializePresenters [

	dropList := SpDropListPresenter new.
	self items do: [ :each | dropList addItemLabeled: each label do: [ self select: each ] icon: each icon ].
]

{ #category : #accessing }
PyramidBackgroundModeSelector >> items [

	^ { PyramidBackgroundCompositeMode new . PyramidBackgroundImageMode new. PyramidBackgroundPaintMode new . PyramidBackgroundTransparentMode new}
]

{ #category : #enumerating }
PyramidBackgroundModeSelector >> select: aMode [

	self backgroundInput ifNil: [ ^ self ].
	self backgroundInput changeMode: aMode
]
