Class {
	#name : #PyramidThemeCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #getter }
PyramidThemeCommand >> getValueFor: anObject [

	^ anObject localTheme
]

{ #category : #setter }
PyramidThemeCommand >> setValueFor: anObject with: nilOrToTheme [

	anObject localTheme: nilOrToTheme
]
