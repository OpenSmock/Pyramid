Class {
	#name : #PyramidNavigationDefaultColumns,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #column }
PyramidNavigationDefaultColumns >> columnElevation [

	<pyramidNavigationColumn: 2>
	^ SpStringTableColumn new
		  title: 'z';
		  evaluated: [ :aBlElement |
			  aBlElement elevation elevation = 0
				  ifTrue: [ '' ]
				  ifFalse: [ aBlElement elevation elevation printString ] ];
		  width: 16;
		  yourself
]

{ #category : #column }
PyramidNavigationDefaultColumns >> columnHash [

	<pyramidNavigationColumn: 1>
	^ SpStringTableColumn new
		  title: 'Hash';
		  evaluated: [ :aBlElement | aBlElement identityHash printString ];
		  displayColor: [ :aBlElement |
					   aBlElement parentsShouldSerializeChildren
						   ifTrue: [ self theme disabledTextColor ]
						   ifFalse: [ self theme dangerTextColor ] ];
		  width: 60;
		  yourself.
]

{ #category : #column }
PyramidNavigationDefaultColumns >> columnIconAndName [

	<pyramidNavigationColumn: 0>
	^ SpCompositeTableColumn new
		  title: 'Elements';
		  addColumn:
			  (SpImageTableColumn evaluated: [ :aBlElement | aBlElement asIcon ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Identifier';
				   displayColor: [ :aBlElement |
					   aBlElement parentsShouldSerializeChildren
						   ifTrue: [ self theme textColor ]
						   ifFalse: [ self theme dangerTextColor ] ];
				   evaluated: [ :aBlElement |
					   aBlElement elementId isNoId
						   ifTrue: [ '@\no name\' ]
						   ifFalse: [ aBlElement id asSymbol ] ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Class';
				   evaluated: [ :aBlElement | aBlElement class name ];
				   displayColor: [ :aBlElement | self theme disabledTextColor ];
				   displayItalic: [ :aBlElement | true ];
				   yourself);
		  yourself
]

{ #category : #column }
PyramidNavigationDefaultColumns >> columnVisibility [

	<pyramidNavigationColumn: 4>
	^ SpCompositeTableColumn new
		  title: 'Visibility';
		  width: 80;
		  addColumn: (SpImageTableColumn evaluated: [ :aBlElement |
					   aBlElement
						   allParentsDetect: [ :parent | parent isVisible not ]
						   ifFound: [ :parent |
							   Smalltalk ui icons iconNamed: #uncommentedClass ]
						   ifNone: [ Smalltalk ui icons iconNamed: #blank16 ] ]);
		  addColumn: (SpImageTableColumn evaluated: [ :aBlElement |
					   aBlElement visibility asIcon ]);
		  addColumn: (SpLinkTableColumn new
				   title: 'Visible';
				   url: [ :aBlElement | '' ];
				   action: [ :aBlElement |
					   self flag: #explanations.
					   "self editor is present on the class that will recover the pragma <pyramidNavigationColumn:>.
					This class should be: PyramidNavigationTreePresenter."
					   self editor ifNotNil: [ :e |
							   e commandExecutor
								   use: PyramidVisibilityCommand new
								   on: { aBlElement }
								   with: aBlElement visibility nextVisibilityForTree ] ];
				   evaluated: [ :aBlElement | aBlElement visibility asString ];
				   yourself);
		  yourself
]

{ #category : #accessing }
PyramidNavigationDefaultColumns >> editor [

	^ nil
]
