Class {
	#name : 'PyramidElementToAddModel',
	#superclass : 'Object',
	#instVars : [
		'categories'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
PyramidElementToAddModel class >> defaultLibrary [

	| library |
	library := self new.
	TPyramidElementToAdd users do: [ :class | class addOnLibrary: library ].
	^ library
]

{ #category : 'adding' }
PyramidElementToAddModel >> addCategoryWithName: aCategoryName withIcon: aCategoryIcon withAllFactories: aCollection [

	| newCategory |
	newCategory := PyramidElementToAddCategory new
		               name: aCategoryName;
		               icon: aCategoryIcon;
		               factories: aCollection;
		               yourself.
	categories add: newCategory
]

{ #category : 'initialization' }
PyramidElementToAddModel >> allCategories [

	^ categories
]

{ #category : 'initialization' }
PyramidElementToAddModel >> initialize [

	categories := OrderedCollection new.
]
