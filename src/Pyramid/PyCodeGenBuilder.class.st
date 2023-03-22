Class {
	#name : #PyCodeGenBuilder,
	#superclass : #Object,
	#category : #'Pyramid-Business'
}

{ #category : #accessing }
PyCodeGenBuilder >> categoryName [

	^ self class category
]

{ #category : #utilities }
PyCodeGenBuilder >> createClassNamed: aSymbol superclass: aClass uses: aTraitComposition [

	| class |
	class := self class classInstaller make: [ :aBuilder | 
		         aBuilder
			         name: aSymbol;
			         superclass: aClass;
			         traitComposition: aTraitComposition asTraitComposition;
			         package: self categoryName ].

	^ class
]

{ #category : #'as yet unclassified' }
PyCodeGenBuilder >> generateFromATrait: aTrait named: aString [

	self
		createClassNamed: ('PyMemento' , aString) asSymbol
		superclass: PyMemento
		uses: aTrait.

	self
		createClassNamed: ('PyArguments' , aString) asSymbol
		superclass: Object
		uses: aTrait
]
