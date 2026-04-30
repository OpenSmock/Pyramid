Class {
	#name : #PyramidToploThemePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'themePresenter',
		'themePropertyManager'
	],
	#classInstVars : [
		'defaultTheme'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #'as yet unclassified' }
PyramidToploThemePlugin class >> defaultTheme [

	defaultTheme ifNil: [
		defaultTheme := (ToTheme withAllSubclasses select: [ :e | e canBeDefault ]) last ].
	^ defaultTheme
]

{ #category : #'as yet unclassified' }
PyramidToploThemePlugin class >> defaultTheme: anObject [

	defaultTheme := anObject
]

{ #category : #'as yet unclassified' }
PyramidToploThemePlugin class >> defaultThemeSettingOn: aBuilder [

	<systemsettings>
	(aBuilder pickOne: #defaultTheme)
		parent: #pyramid;
		label: 'Choose the default theme.';
		target: self;
		domainValues:
			(ToTheme withAllSubclasses select: #canBeDefault);
		description:
			'Define the theme that will be used by default when a new editor is opened.'
]

{ #category : #adding }
PyramidToploThemePlugin class >> toploAntIconCategory [

	<pyramidLibraryCategory: 11>
	^ PyramidToploThemePlugin
		  toploIconThemeCategoryFromClass: ToAntDesignIconProvider
		  withCategoryPrefix: 'Ant Design - '
]

{ #category : #adding }
PyramidToploThemePlugin class >> toploIconThemeCategoryFromClass: aClass withCategoryPrefix: aString [

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
									                        (PyramidExternalRessourceSource new
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
														                           selector: selector asSymbol;
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
PyramidToploThemePlugin class >> toploLibraryCategory [

	<pyramidLibraryCategory: 1>
	| classes elements knownBroken testClass okElements unserializedElements |
	knownBroken := #( #ToCircularMenuInnerElement
	                  #ToCircularMenuList #ToExPicsumNode #ToAnimatedIcon ).
	testClass := Smalltalk at: #ToSerializerTest.
	classes := ToElement allSubclasses , { ToElement }.
	classes := classes reject: [ :each |
		           each isAbstract or: [
			           (each name findString: 'Abstract') > 0 ] ].
	elements := classes collect: [ :class |
			            | broken serializable status |
			            broken := [
				                      class new.
				                      false ]
				                      on: Error
				                      do: [ :e | true ].
			            broken := broken or: [
				                      knownBroken includes: class name asSymbol ].
			            serializable := [
				                            | suite prefix |
				                            prefix := 'test' , class name.
				                            suite := testClass suite tests
					                                     select: [ :t |
							                                     (t selector beginsWith:
								                                      prefix) and: [
									                                     t selector size
									                                     = prefix size or: [
											                                     | suffix |
											                                     suffix := t selector
												                                               copyFrom:
												                                               prefix size
												                                               + 1
												                                               to:
												                                               t selector
													                                               size.
											                                     suffix allSatisfy: [
												                                     :c | c isDigit ] ] ] ].
				                            suite isNotEmpty ]
				                            on: Error
				                            do: [ false ].
			            status := broken
				                      ifTrue: [ #broken ]
				                      ifFalse: [
						                      serializable
							                      ifTrue: [ #ok ]
							                      ifFalse: [ #unserialized ] ].
			            PyramidLibraryElement new
				            icon:
					            (Smalltalk ui icons iconNamed: (status = #broken
								              ifTrue: [ #error ]
								              ifFalse: [
										              status = #unserialized
											              ifTrue: [ #warning ]
											              ifFalse: [ class systemIconName ] ]));
				            name: class name;
				            block: [ { class new } ];
				            status: status;
				            yourself ].
	elements := elements reject: [ :e | e status = #broken ].
	okElements := elements select: [ :e | e status = #ok ].
	unserializedElements := elements select: [ :e |
		                        e status = #unserialized ].
	^ {
		  (PyramidLibraryCategory new
			   name: 'Toplo';
			   icon: (Smalltalk ui icons iconNamed: #box);
			   elements: (okElements sorted: [ :a :b | a name < b name ]);
			   yourself).
		  (PyramidLibraryCategory new
			   name: 'Unstable';
			   icon: (Smalltalk ui icons iconNamed: #warning);
			   elements:
				   (unserializedElements sorted: [ :a :b | a name < b name ]);
			   yourself) }
]

{ #category : #adding }
PyramidToploThemePlugin class >> toploMaterialIconCategory [

	<pyramidLibraryCategory: 12>
	^ PyramidToploThemePlugin
		  toploIconThemeCategoryFromClass: ToMaterialDesignIconProvider
		  withCategoryPrefix: 'Material Design - '
]

{ #category : #adding }
PyramidToploThemePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self themePresenter
			label: 'Toplo-Theme'
			icon: (Smalltalk ui icons iconNamed: #smallPushpin)
			order: 6 ]
]

{ #category : #actions }
PyramidToploThemePlugin >> configureBuilder: aPyramidEditorBuilder [

	| spacePlugin listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditorBuilder plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidSpacePlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	spacePlugin := pluginSorted asArray first.
	
	self themePresenter pyramidSpaceBuilderConfigurationOn: spacePlugin builder
]

{ #category : #connecting }
PyramidToploThemePlugin >> connectOn: aPyramidEditor [

	self themePresenter editor: aPyramidEditor.
	
	self themePropertyManager projectModel: aPyramidEditor projectModel.
	
	self themePresenter projectModel: aPyramidEditor projectModel.
	
	self themePresenter treeTableStampPresenter projectModel: aPyramidEditor projectModel.
]

{ #category : #initialization }
PyramidToploThemePlugin >> initialize [

	themePresenter := PyramidThemePresenter new.
	themePropertyManager := PyramidPropertiesManagerForSelection new
		                        presenterStrategy:
			                        PyramidThemePropertyStrategy new;
		                        yourself.
	
	themePresenter treeTableStampPresenter pyramidPropertiesStrategy: PyramidThemePropertyStrategy new.
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePresenter [

	^ themePresenter
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePropertyManager [

	^ themePropertyManager
]
