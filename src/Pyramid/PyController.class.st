Class {
	#name : #PyController,
	#superclass : #Object,
	#category : #'Pyramid-YYY-Examples'
}

{ #category : #'as yet unclassified' }
PyController >> endHover: aBlMouseLeaveEvent [ 
	aBlMouseLeaveEvent target background: Color red.
]

{ #category : #'as yet unclassified' }
PyController >> startHover: aBlMouseEnterEvent [ 
	aBlMouseEnterEvent target background: Color blue.
]
