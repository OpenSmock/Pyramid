Class {
	#name : #PyController,
	#superclass : #Object,
	#category : #'Pyramid-Events'
}

{ #category : #'as yet unclassified' }
PyController >> endHover: aBlMouseLeaveEvent [ 
	aBlMouseLeaveEvent target background: Color red.
]

{ #category : #'as yet unclassified' }
PyController >> hoverOn: anEvent [

	anEvent target background: Color cyan muchLighter.
]

{ #category : #'as yet unclassified' }
PyController >> startHover: aBlMouseEnterEvent [ 
	aBlMouseEnterEvent target background: Color blue.
]
