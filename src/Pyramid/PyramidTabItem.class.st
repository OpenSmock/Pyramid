Class {
	#name : #PyramidTabItem,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'order',
		'label',
		'icon'
	],
	#category : #'Pyramid-views'
}

{ #category : #comparing }
PyramidTabItem >> <= anObject [

	^ self order <= anObject order
]

{ #category : #adding }
PyramidTabItem >> addOnNotebook: aNotebook [

	aNotebook addPage: (SpNotebookPage
		       title: self label
		       icon: self icon
		       provider: self presenter)
]

{ #category : #accessing }
PyramidTabItem >> icon [

	^ icon
]

{ #category : #accessing }
PyramidTabItem >> icon: anObject [

	icon := anObject
]

{ #category : #accessing }
PyramidTabItem >> label [

	^ label
]

{ #category : #accessing }
PyramidTabItem >> label: anObject [

	label := anObject
]

{ #category : #accessing }
PyramidTabItem >> order [

	^ order
]

{ #category : #accessing }
PyramidTabItem >> order: anObject [

	order := anObject
]

{ #category : #accessing }
PyramidTabItem >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidTabItem >> presenter: anObject [

	presenter := anObject
]
