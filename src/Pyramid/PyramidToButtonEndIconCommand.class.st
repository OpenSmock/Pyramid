Class {
	#name : #PyramidToButtonEndIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'endIconName'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonEndIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonEndIconCommand >> getValueFor: aToButton [

	^ endIconName ifNil: [ ^ '' ]
]

{ #category : #setter }
PyramidToButtonEndIconCommand >> setValueFor: aToButton with: aSymbol [

	endIconName := aSymbol.
	aToButton endIcon: (self toImageFromName: aSymbol)
]

{ #category : #private }
PyramidToButtonEndIconCommand >> toImageFromName: aSymbol [

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
