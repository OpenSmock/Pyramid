Class {
	#name : #PySaveValidator,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Pyramid-Plugin-Save'
}

{ #category : #accessing }
PySaveValidator >> model [

	^ model
]

{ #category : #accessing }
PySaveValidator >> model: aPySaveModel [

	model := aPySaveModel
]

{ #category : #accessing }
PySaveValidator >> pragma [
	^ #pySTON
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validate: aPySaveModel [

	self model: aPySaveModel.

	self validateModelIsNotEmpty: aPySaveModel.
	self validatePackageDoesExist: aPySaveModel.
	self validateClassDoesExist: aPySaveModel.
	self validateOverridesMethod: aPySaveModel
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateAsBoolean: aPySaveModel [

	[[[[[[[ self validate: aPySaveModel ]
		on: PySaveWillOverrideANotPystonMethodException
		do: [ ^ true ]]
		on: PySaveOverridePyStonMethodException 
		do: [ ^ true ]]
		on: PySavePackageDontExistException 
		do: [ ^ true ]]
	   on: PySaveClassDontExistException 
		do: [ ^ true ]]
		on: PySavePackageMissingError 
		do: [ ^ false ]]
		on: PySaveClassMissingError 
		do: [ ^ false ]]
		on: PySaveMethodMissingError 
		do: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateClassDoesExist: aModel [

	self class environment at: aModel defaultClassName asSymbol ifAbsent: [ PySaveClassDontExistException signal:
				'There is no class named ' , aModel defaultPackageName ]
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateClassIsNotEmpty: aPySaveModel [

	aPySaveModel defaultClassName ifEmpty: [
		PySaveClassMissingError signal: 'No class found.' ]
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateMethodIsNotEmpty: aPySaveModel [

	aPySaveModel defaultMethodName ifEmpty: [
		PySaveMethodMissingError signal: 'No method found.' ]
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateModelIsNotEmpty: aModel [

	self validatePackageIsNotEmpty: aModel.
	self validateClassIsNotEmpty: aModel.
	self validateMethodIsNotEmpty: aModel.
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateOverridesMethod: aModel [

	self class environment
		at: aModel defaultClassName asSymbol
		ifPresent: [ :class |
			aModel isClassSide
				ifTrue: [ self validateOverridesMethod: aModel for: class ]
				ifFalse: [
				self validateOverridesMethod: aModel for: class basicNew ] ]
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateOverridesMethod: aModel for: anObject [

	(anObject respondsTo: aModel defaultMethodName asSymbol) ifTrue: [
		(anObject class pragmas anySatisfy: [ :each | each key = self pragma ])
			ifTrue: [ PySaveOverridePyStonMethodException signal: 'Saving will override a <', self pragma, '> method.' ]
			ifFalse: [ PySaveWillOverrideANotPystonMethodException signal: 'Saving will override a non <', self pragma, '> method.' ] ]
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validateOverridesMethodFor: anObject [

					(anObject respondsTo: self model defaultMethodName) ifTrue: [
						(anObject class pragmas contains: self pragmaSerialization)
							ifTrue: [
								PySaveOverridePyStonMethodException signal:
									'Will override the method : #' , self model defaultMethodName
									, ' that contain a pragma <' , self pragmaSerialization
									, '>.' ]
							ifFalse: [
								PySaveOverridePyStonMethodException signal:
									'Will override the method : #' , self model defaultMethodName
									, ' that do not contain a pragma <'
									, self pragmaSerialization , '>.' ] ] 
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validatePackageDoesExist: aModel [

	[ aModel defaultPackageName asPackage ]
		on: NotFound
		do: [
			PySavePackageDontExistException signal:
				'There is no package named ' , aModel defaultPackageName ]
]

{ #category : #'as yet unclassified' }
PySaveValidator >> validatePackageIsNotEmpty: aPySaveModel [

	aPySaveModel defaultPackageName ifEmpty: [
		PySavePackageMissingError signal: 'No package found.' ].


]
