Class {
	#name : 'NeoPyramidLibraryModel',
	#superclass : 'Object',
	#instVars : [
		'categories'
	],
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
NeoPyramidLibraryModel class >> addDefaultOnLibrary: library [

	| factoryElement factoryTextElement |

	factoryElement := NeoPyramidLibraryFactory new
				             elementIcon:
					             (Smalltalk ui icons iconNamed: #class);
				             elementName: 'Simple Element';
				             elementBlock: [ {BlElement new background: Color random; yourself} ];
				             yourself.
	factoryTextElement := NeoPyramidLibraryFactory new
				             elementIcon:
					             (Smalltalk ui icons iconNamed: #haloFontSize);
				             elementName: 'Simple Element';
				             elementBlock: [ {BlTextElement new text: 'Change me' asRopedText; yourself} ];
				             yourself.

	library
		addCategoryWithName: '(Default)'
		withIcon: (Smalltalk ui icons iconNamed: #box)
		withAllFactories: { factoryElement . factoryTextElement } sorted.

	^ library
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryModel class >> addPystonOnLibrary: library [
	| pragmas methods packages |
	pragmas := Pragma allNamed: #pySTON.
	methods := (pragmas collect: #method) asSet.
	packages := (methods collect: #package) asSet.

	packages do: [ :package |
		| factories |
		factories := methods
			             select: [ :method | method package = package ]
			             thenCollect: [ :method |
				             NeoPyramidLibraryFactory new
					             elementIcon: (Smalltalk ui icons iconNamed:
								              method methodClass soleInstance systemIconName);
					             elementName: method selector;
					             elementBlock: [
						             BlSerializer materialize:
								             (method methodClass soleInstance perform:
										              method selector) ];
					             yourself ].
		library
			addCategoryWithName: package name
			withIcon: (Smalltalk ui icons iconNamed: #smallInfo)
			withAllFactories: factories asArray sorted ].

	^ library
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryModel class >> addToploOnLibrary: library [

	| classes factories |
	classes := ToElement allSubclasses.
	factories := classes
		             reject: [ :each | each isAbstract ]
		             thenCollect: [ :class |
			             NeoPyramidLibraryFactory new
				             elementIcon:
					             (Smalltalk ui icons iconNamed: class systemIconName);
				             elementName: class name;
				             elementBlock: [ {class new} ];
				             yourself ].


	library
		addCategoryWithName: 'Toplo'
		withIcon: (Smalltalk ui icons iconNamed: #smallInfo)
		withAllFactories: factories asArray sorted.

	^ library
]

{ #category : 'as yet unclassified' }
NeoPyramidLibraryModel class >> defaultLibrary [

	| library |
	library := self new.

	self addDefaultOnLibrary: library.
	self addPystonOnLibrary: library.
	self addToploOnLibrary: library.

	^ library
]

{ #category : 'adding' }
NeoPyramidLibraryModel >> addCategoryWithName: aCategoryName withIcon: aCategoryIcon withAllFactories: aCollection [

	| newCategory |
	newCategory := NeoPyramidLibraryCategory new
		               name: aCategoryName;
		               icon: aCategoryIcon;
		               factories: aCollection;
		               yourself.
	categories add: newCategory
]

{ #category : 'initialization' }
NeoPyramidLibraryModel >> allCategories [

	^ categories
]

{ #category : 'initialization' }
NeoPyramidLibraryModel >> initialize [

	categories := OrderedCollection new.
]
