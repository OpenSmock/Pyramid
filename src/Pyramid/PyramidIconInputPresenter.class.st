Class {
	#name : #PyramidIconInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'textInput',
		'button',
		'whenValueChangedDo',
		'categoryList',
		'iconList'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #private }
PyramidIconInputPresenter class >> findToploIconNamed: aSymbol [
    ^ (self
        toploIconThemeCategoryFromClass: ToAntDesignIconProvider
        withCategoryPrefix: '') ,
      (self
        toploIconThemeCategoryFromClass: ToMaterialDesignIconProvider
        withCategoryPrefix: '')
      inject: nil
      into: [ :found :cat |
          found ifNil: [
              cat elements
                  detect: [ :e | e name = aSymbol ]
                  ifNone: [ nil ] ] ]
]

{ #category : #private }
PyramidIconInputPresenter class >> innerElementFromName: aSymbol [

	(Smalltalk ui icons iconNamed: aSymbol)
	= (Smalltalk ui icons iconNamed: #blank) ifTrue: [
			| element |
			element := self findToploIconNamed: aSymbol.
			element ifNotNil: [ ^ element block value first asForm ] ].
	^ PyramidExternalRessourceProxy fromSource:
		  (PyramidExternalRessourceSource
			   target: Object
			   selector: #iconNamed:
			   arguments: { aSymbol })
]

{ #category : #private }
PyramidIconInputPresenter class >> toImageFromName: aSymbol [

	(Smalltalk ui icons iconNamed: aSymbol)
	= (Smalltalk ui icons iconNamed: #blank) ifTrue: [
			| element |
			element := self findToploIconNamed: aSymbol.
			element ifNotNil: [^ element block value first ] ]. 
	^ ToImage new
		  innerImage: (PyramidExternalRessourceProxy fromSource:
					   (PyramidExternalRessourceSource
						    target: Object
						    selector: #iconNamed:
						    arguments: { aSymbol }));
		  yourself
]

{ #category : #adding }
PyramidIconInputPresenter class >> toploAntIconCategory [

	^ self
		  toploIconThemeCategoryFromClass: ToAntDesignIconProvider
		  withCategoryPrefix: 'Ant Design - '
]

{ #category : #adding }
PyramidIconInputPresenter class >> toploIconThemeCategoryFromClass: aClass withCategoryPrefix: aString [

	| categoriesMethods |
	categoriesMethods := aClass class methods select: [ :method |
			                     method selector first = $_ and: [
				                     ($_ split: method selector) last = 'loaded' ] ].

	^ categoriesMethods collect: [ :method |
			  | prefix elementSelectors elements |
			  prefix := ($_ split: method selector) second.

			  elementSelectors := (aClass perform: method selector) collect: [
				                      :suffix | prefix , '_' , suffix ].

			  elements := elementSelectors collect: [ :selector |
					              PyramidLibraryElement new
						              name: selector;
						              icon: (Smalltalk ui icons iconNamed: #blank);
						              block: [
								              | image |
								              image := ToImage new
									                       extent: 48 asPoint;
									                       innerImage:
										                       (PyramidExternalRessourceProxy new
											                        pyramidExternalRessourceSource:
												                        (PyramidExternalRessourceSource
													                         new
													                         postConstructionBlock: [ :obj |
															                         obj constraints horizontal
																                         matchParent.
															                         obj constraints vertical
																                         matchParent ];
													                         target: BlSvgConverter;
													                         selector: #convertFromString:;
													                         arguments:
														                         { (PyramidExternalRessourceProxy
															                          new
															
															                          pyramidExternalRessourceSource:
																                          (PyramidExternalRessourceSource
																	                           new
																	                           target: aClass;
																	                           selector:
																		                           selector asSymbol;
																	                           arguments: {  };
																	                           yourself);
															                          yourself) };
													                         yourself);
											                        yourself).
								              { image } ];
						              yourself ].
			  PyramidLibraryCategory new
				  name: aString , prefix;
				  icon: (Smalltalk ui icons iconNamed: #image);
				  elements: elements;
				  yourself ]
]

{ #category : #adding }
PyramidIconInputPresenter class >> toploMaterialIconCategory [

	^ self
		  toploIconThemeCategoryFromClass: ToMaterialDesignIconProvider
		  withCategoryPrefix: 'Material Design - '
]

{ #category : #private }
PyramidIconInputPresenter >> buildIconPickerPresenter [

	| categories presenter |
	categories := OrderedCollection new.
	categories add: (PyramidLibraryCategory new
			 name: 'Smalltalk Icons';
			 icon: (Smalltalk ui icons iconNamed: #image);
			 elements:
				 (Smalltalk ui icons allIconNames asSortedCollection collect: [
							  :name |
							  PyramidLibraryElement new
								  name: name asString;
								  icon: (Smalltalk ui icons iconNamed: name);
								  yourself ]);
			 yourself).

	categories addAll: self class toploAntIconCategory.
	categories addAll: self class toploMaterialIconCategory.

	categoryList := SpListPresenter new.
	categoryList
		items: categories asArray;
		display: [ :category | category name ];
		displayIcon: [ :category | category icon ].


	iconList := SpFilteringListPresenter new.
	iconList
		display: [ :element | element name ];
		displayIcon: [ :element |
				| icon |
				icon := element icon.
				(icon isNil or: [ icon = (Smalltalk ui icons iconNamed: #blank) ])
					ifTrue: [
							[ element asForm scaledToSize: 16 @ 16 ]
								on: Error
								do: [ Smalltalk ui icons iconNamed: #blank ] ]
					ifFalse: [ icon ] ];
		itemFilter: [ :element :filter |
				filter isEmpty or: [
						element asLowercase includesSubstring: filter asLowercase ] ].

	categoryList whenSelectionChangedDo: [ :selection |
			selection isEmpty
				ifTrue: [ iconList items: #(  ) ]
				ifFalse: [
				iconList items: selection selectedItem elements asArray ] ].
	categories isNotEmpty ifTrue: [ categoryList selectIndex: 1 ].
	presenter := SpPresenter new.
	presenter layout: (SpBoxLayout newHorizontal
			 add: categoryList width: 220;
			 add: iconList;
			 yourself).
	^ presenter -> iconList
]

{ #category : #layout }
PyramidIconInputPresenter >> defaultLayout [
    ^ SpBoxLayout newHorizontal
          spacing: 2;
          add: textInput;
          add: button width: 24;
          yourself
]

{ #category : #initialization }
PyramidIconInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :v |  ].
	textInput := SpTextInputFieldPresenter new.
	textInput whenSubmitDo: [ :text | whenValueChangedDo value: text ].
	button := SpButtonPresenter new
		          help: 'Select an icon';
		          icon: (Smalltalk ui icons iconNamed: #image);
		          action: [ self openIconModal ];
		          yourself
]

{ #category : #private }
PyramidIconInputPresenter >> openIconModal [

	| result modalPresenter window dialog selected |
	result := self buildIconPickerPresenter.
	modalPresenter := result key.
	iconList := result value.
	window := modalPresenter asModalWindow.
	window title: 'Choose an icon'.
	window centered.
	dialog := window open.
	dialog isOk ifFalse: [ ^ self ].
	selected := iconList selectedItem.
	selected ifNil: [ ^ self ].
	self value: selected name.
	whenValueChangedDo value: selected name
]

{ #category : #accessing }
PyramidIconInputPresenter >> value [
    ^ textInput text
]

{ #category : #accessing }
PyramidIconInputPresenter >> value: aString [

	textInput text: (aString ifNil: [ '' ])
]

{ #category : #accessing }
PyramidIconInputPresenter >> whenValueChangedDo: aBlock [
    whenValueChangedDo := aBlock
]
