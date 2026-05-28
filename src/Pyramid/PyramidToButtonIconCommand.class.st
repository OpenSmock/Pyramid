Class {
	#name : #PyramidToButtonIconCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#instVars : [
		'iconName'
	],
	#category : #'Pyramid-plugin-editor'
}

{ #category : #testing }
PyramidToButtonIconCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject class = ToButton ]
]

{ #category : #getter }
PyramidToButtonIconCommand >> getValueFor: aToButton [

	^ iconName ifNil: [ ^ '' ]

]

{ #category : #setter }
PyramidToButtonIconCommand >> setValueFor: aToButton with: aSymbol [

	iconName := aSymbol.
	aToButton icon: (self toImageFromName: aSymbol)
]

{ #category : #private }
PyramidToButtonIconCommand >> toImageFromName: aSymbol [

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
