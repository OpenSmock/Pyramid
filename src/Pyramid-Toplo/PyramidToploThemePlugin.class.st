Class {
	#name : #PyramidToploThemePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'themePresenter',
		'themePropertyManager'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #asserting }
PyramidToploThemePlugin class >> shouldInstall [

	^ false
]

{ #category : #adding }
PyramidToploThemePlugin class >> toploAntIconCategory [

	<pyramidLibraryCategory: 11>
	^ PyramidToploThemePlugin toploIconThemeCategoryFromClass: ToAntDesignIconProvider
]

{ #category : #adding }
PyramidToploThemePlugin class >> toploIconThemeCategoryFromClass: aClass [

	| categoriesMethods |
	categoriesMethods := aClass class methods select: [ :m |
		                     m selector first = $_ and: [
			                     ($_ split: m selector) last = 'loaded' ] ].

	^ categoriesMethods collect: [ :method |
		  | libraryCategory elements elementSelectors |
		  libraryCategory := PyramidLibraryCategory new
			                     name: method selector allButFirst;
			                     icon: (Smalltalk ui icons iconNamed: #image);
			                     yourself.

		  elementSelectors := (aClass perform: method selector) collect: [
			                      :suffix |
			                      ($_ split: method selector) second , '_'
			                      , suffix ].

		  elements := elementSelectors collect: [ :selector |
			              PyramidLibraryElement new
				              name: selector;
				              icon: (Smalltalk ui icons iconNamed: #blank);
				              block: [
					              | image |
					              image := PyramidExternalRessourceProxy
						                       fromTarget: ToImage new
						                       selector: #innerImage:
						                       arguments:
							                       { (PyramidExternalRessourceProxy new
								                        pyramidExternalRessourceSource:
									                        (PyramidExternalRessourceSource new
										                         target: BlSvgConverter;
										                         selector: #convertFromString:;
										                         arguments:
											                         { (PyramidExternalRessourceProxy
												                          new
												                          pyramidExternalRessourceSource:
													                          (PyramidExternalRessourceSource
														                           new
														                           target: aClass;
														                           selector: selector asSymbol;
														                           arguments: {  };
														                           yourself);
												                          yourself) };
										                         yourself);
								                        yourself) }.
					              image size: 48 asPoint.
					              { image } ];
				              yourself ].
		  libraryCategory elements: elements.
		  libraryCategory ]
]

{ #category : #adding }
PyramidToploThemePlugin class >> toploLibraryCategory [

	<pyramidLibraryCategory: 1>
	| classes elements |
	classes := ToElement allSubclasses , { ToElement }.
	elements := classes
		            reject: [ :each |
			            each isAbstract or: [
				            (each name findString: 'Abstract') > 0 or: [
					            [
					            each new.
					            false ]
						            on: Error
						            do: [ true ] ] ] ]
		            thenCollect: [ :class |
			            PyramidLibraryElement new
				            icon:
					            (Smalltalk ui icons iconNamed: class systemIconName);
				            name: class name;
				            block: [ { class new } ];
				            yourself ].

	^ { (PyramidLibraryCategory new
		   name: 'Toplo';
		   icon: (Smalltalk ui icons iconNamed: #box);
		   elements: (elements sorted: [ :a :b | a name < b name ]);
		   yourself) }
]

{ #category : #adding }
PyramidToploThemePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self themePresenter
			label: 'Toplo-Theme'
			icon: (Smalltalk ui icons iconNamed: #smallPushpin)
			order: 1 ]
]

{ #category : #actions }
PyramidToploThemePlugin >> configureBuilder: aPyramidEditorBuilder [

	| spacePlugin |
	spacePlugin := aPyramidEditorBuilder findPlugin: #PyramidSpacePlugin.
	self themePresenter pyramidSpaceBuilderConfigurationOn: spacePlugin builder
]

{ #category : #connecting }
PyramidToploThemePlugin >> connectOn: aPyramidEditor [

	self themePresenter editor: aPyramidEditor.
	self themePropertyManager projectModel: aPyramidEditor projectModel 
]

{ #category : #initialization }
PyramidToploThemePlugin >> initialize [

	themePresenter := PyramidThemePresenter new.
	themePropertyManager := PyramidPropertiesManagerForSelection new
		                        presenterStrategy:
			                        PyramidThemePropertyStrategy new;
		                        yourself.
	themePresenter styleSheetEditor stampPresenter: themePropertyManager presenter
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePresenter [

	^ themePresenter
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePropertyManager [

	^ themePropertyManager
]
