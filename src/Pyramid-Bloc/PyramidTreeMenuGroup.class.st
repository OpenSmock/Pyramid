Class {
	#name : #PyramidTreeMenuGroup,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #'as yet unclassified' }
PyramidTreeMenuGroup class >> browseAndInspect: aPyramidTreePresenter [

	^ [ :aGroup |
	  aGroup
		  addItem: [ :anItem |
			  anItem
				  name: 'Browse';
				  icon: (self iconNamed: #nautilus);
				  action: [
					  aPyramidTreePresenter treePresenter selectedItem browse ] ];
		  addItem: [ :anItem |
			  anItem
				  name: 'Inspect selection';
				  icon: (self iconNamed: #smallInspectIt);
				  action: [
					  aPyramidTreePresenter project selection size = 1
						  ifTrue: [
							  aPyramidTreePresenter project selection first inspect ]
						  ifFalse: [ aPyramidTreePresenter project selection inspect ] ] ] ]
]
