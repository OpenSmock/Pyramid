Class {
	#name : #PyramidToImageInnerImageCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'iconName'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToImageInnerImageCommand >> canBeUsedFor: anObject [
    ^ (super canBeUsedFor: anObject) and: [ anObject class = ToImage ]
]

{ #category : #getter }
PyramidToImageInnerImageCommand >> getValueFor: aToImage [

	^ iconName ifNil: [ ^ '' ]
]

{ #category : #setter }
PyramidToImageInnerImageCommand >> setValueFor: aToImage with: aSymbol [

	iconName := aSymbol.
	aToImage innerImage: (self toImageFromName: aSymbol)
]

{ #category : #private }
PyramidToImageInnerImageCommand >> toImageFromName: aSymbol [

	| element |
	(Smalltalk ui icons iconNamed: aSymbol)
	= (Smalltalk ui icons iconNamed: #blank) ifTrue: [
			element := (PyramidToploThemePlugin
				            toploIconThemeCategoryFromClass:
				            ToAntDesignIconProvider
				            withCategoryPrefix: '') , (PyramidToploThemePlugin
				            toploIconThemeCategoryFromClass:
				            ToMaterialDesignIconProvider
				            withCategoryPrefix: '')
				           inject: nil
				           into: [ :found :cat |
						           found ifNil: [
							           cat elements
								           detect: [ :e | e name = aSymbol ]
								           ifNone: [ nil ] ] ].
			element ifNotNil: [ ^ element block value first ] ].
	^ ToImage new
		  innerImage: (PyramidExternalRessourceProxy fromSource:
					   (PyramidExternalRessourceSource
						    target: Object
						    selector: #iconNamed:
						    arguments: { aSymbol }));
		  yourself
]
