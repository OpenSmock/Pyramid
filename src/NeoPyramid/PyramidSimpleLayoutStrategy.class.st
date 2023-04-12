Class {
	#name : #PyramidSimpleLayoutStrategy,
	#superclass : #PyramidLayoutStrategy,
	#category : #'NeoPyramid-views'
}

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> layoutOf: aPyramidEditorModel [

	^ SpBoxLayout newTopToBottom
		  spacing: 16;
		  add: (self toolsPanelFrom: aPyramidEditorModel tools)
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: (self mainPanelFrom: aPyramidEditorModel)
		  withConstraints: [ :c | c fill: true ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> mainPanelFrom: aPyramidEditorModel [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 5;
		  add: (self tabPanelFrom: aPyramidEditorModel browsers);
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: 3 / 4;
				   add: (self tabPanelFrom: aPyramidEditorModel rootsViewers);
				   add: (self tabPanelFrom: aPyramidEditorModel propertiesViewers);
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> tabPanelFrom: aCollection [

	^ PyramidTabsContainerView new
	builder: PyramidTabBuilder new;
		  addAllTabs: aCollection;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> toolsPanelFrom: aCollection [

	^ PyramidButtonsBarView new
		  beHorizontal;
		  spacing: 4;
		  builder: (PyramidButtonBuilder new
				   buttonContraints: [ :c |
					   c height: 36.
					   c width: 36 ];
				   yourself);
			addAllButtons: aCollection;
		  yourself
]
