Class {
	#name : 'PyramidTreeBaseColumnsBuilder',
	#superclass : 'PyramidAbstractColumnsBuilder',
	#category : 'Pyramid-Bloc-plugin-tree-library',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-tree-library'
}

{ #category : 'as yet unclassified' }
PyramidTreeBaseColumnsBuilder >> buildOn: aPyramidTreePlugin [

	aPyramidTreePlugin addColumns: { self nameAndTypeColumn . self hashColumn . self zIndexColumn . self visibilityColumn  }
]

{ #category : 'accessing' }
PyramidTreeBaseColumnsBuilder >> hashColumn [

	^ SpStringTableColumn new
			              title: 'Hash';
			              evaluated: [ :aBlElement |
				              aBlElement identityHash printString ];
			              displayColor: [ :aBlElement | Color gray ];
			              width: 60;
			              yourself
]

{ #category : 'accessing' }
PyramidTreeBaseColumnsBuilder >> nameAndTypeColumn [

	^ SpCompositeTableColumn new
		  title: 'Elements';
		  addColumn:
			  (SpImageTableColumn evaluated: [ :aBlElement | aBlElement asIcon ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Identifier';
				   evaluated: [ :aBlElement |
					   aBlElement elementId isNoId
						   ifTrue: [ '@\no name\' ]
						   ifFalse: [ aBlElement id asSymbol ] ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Class';
				   evaluated: [ :aBlElement | aBlElement class name ];
				   displayColor: [ :aBlElement | Color gray ];
				   displayItalic: [ :aBlElement | true ];
				   yourself);
		  yourself
]

{ #category : 'initialization' }
PyramidTreeBaseColumnsBuilder >> setVisibility: aBlVisibility of: aBlElement onEditor: aPyramidEditor [

	aPyramidEditor propertiesManager commandExecutor
		use: PyramidVisibilityCommand new
		on: { aBlElement }
		with: aBlVisibility
]

{ #category : 'accessing' }
PyramidTreeBaseColumnsBuilder >> visibilityColumn [

	^ SpCompositeTableColumn new
		  title: 'Visibility';
		  width: 80;
		  addColumn: (SpImageTableColumn evaluated: [ :aBlElement |
					   aBlElement
						   allParentsDetect: [ :parent | parent isVisible not ]
						   ifFound: [ :parent | Smalltalk ui icons iconNamed: #uncommentedClass ]
						   ifNone: [ Smalltalk ui icons iconNamed: #blank16 ] ]);
		  addColumn: (SpImageTableColumn evaluated: [ :aBlElement |
					   aBlElement visibility asIcon ]);
		  addColumn: (SpLinkTableColumn new
				   title: 'Visible';
				   url: [ :aBlElement | '' ];
				   action: [ :aBlElement |
					   self
						   setVisibility: aBlElement visibility nextVisibilityForTree
						   of: aBlElement
						   onEditor: self editor ];
				   evaluated: [ :aBlElement | aBlElement visibility asString ];
				   yourself);
		  yourself
]

{ #category : 'accessing' }
PyramidTreeBaseColumnsBuilder >> zIndexColumn [

	^ SpStringTableColumn new
		  title: 'z';
		  evaluated: [ :aBlElement |
			  aBlElement elevation elevation = 0
				  ifTrue: [ '' ]
				  ifFalse: [ aBlElement elevation elevation printString ] ];
		  width: 16;
		  yourself
]
