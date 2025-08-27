Class {
	#name : #PyramidFilteringListNavigationAddElementPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'navigationPlugin',
		'libraryPresenter'
	],
	#category : #'Pyramid-Bloc-plugin-filtering-list-navigation-add-element'
}

{ #category : #connecting }
PyramidFilteringListNavigationAddElementPlugin >> connectOn: aPyramidEditor [

	self pluginFromPyramid: aPyramidEditor.
	
	self installOnAddElementFilteringList.
	
	libraryPresenter libraryController initializeCategories.
	
	
	
	
]

{ #category : #'as yet unclassified' }
PyramidFilteringListNavigationAddElementPlugin >> installOnAddElementFilteringList [
		
	| elementPresenter categoryPresenter |
	
	elementPresenter := SpFilteringListPresenter new
		                    display: [ :class | class name ];
		                    displayIcon: [ :each | each icon ].
	elementPresenter whenSelectionChangedDo: [ :e |
		| index element |
		index := e selectedIndex.
		index <= 0 ifFalse: [
			element := elementPresenter items at: index.
			libraryPresenter addButtonPresenter enabled: element isNotNil.
			libraryPresenter addButtonPresenter action: [
				libraryPresenter libraryController addNewElement: element ].
			element
				ifNil: [ libraryPresenter imagePresenter image: (Form extent: 1 asPoint) ]
				ifNotNil: [ libraryPresenter imagePresenter image: element asForm ] ] ].
	
	categoryPresenter := SpFilteringListPresenter new
		                    display: [ :class | class name ];
		                    displayIcon: [ :each | each icon ].
	categoryPresenter whenSelectionChangedDo: [ :category | | index elements |
		index := category selectedIndex.
		
		index <= 0 ifFalse: [
			elements := (categoryPresenter items at: index).
			elementPresenter items: elements elements ] ].

	libraryPresenter categoryPresenter: categoryPresenter.
	libraryPresenter elementPresenter: elementPresenter.
]

{ #category : #'accessing - classes' }
PyramidFilteringListNavigationAddElementPlugin >> pluginFromPyramid: aPyramidEditor [

	| listOfPlugins pluginSorted |
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidNavigationPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	navigationPlugin := pluginSorted asArray first.
	
	libraryPresenter := navigationPlugin navigation library
]
