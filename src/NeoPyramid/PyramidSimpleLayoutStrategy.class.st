Class {
	#name : #PyramidSimpleLayoutStrategy,
	#superclass : #PyramidLayoutStrategy,
	#category : #'NeoPyramid-views'
}

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> buttonsPanelFrom: aCollection [

	^ PyramidButtonsBarView new
		  beHorizontal;
		  spacing: 4;
		  builder: (PyramidButtonBuilder new
				   buttonContraints: [ :c |
					   c height: 36.
					   c width: 36 ];
					popoverStrategy: PyramidButtonPopoverStrategy new;
				   yourself);
		  addAllButtons: aCollection;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> centerPanelFrom: aCollection [

	| defaultLayout |
	defaultLayout := SpBoxLayout newTopToBottom
		                 spacing: 4;
		                 yourself.

	aCollection do: [ :each |
		defaultLayout add: each presenter withConstraints: each constraints ].

	^ defaultLayout
]

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> layoutOf: aPyramidEditorModel [

	^ SpBoxLayout newTopToBottom
		  spacing: 16;
		  add: (self buttonsPanelFrom: aPyramidEditorModel tools)
		  withConstraints: [ :c | c height: PyNavigationAbstract height ];
		  add: (self mainPanelFrom: aPyramidEditorModel)
		  withConstraints: [ :c | c fill: true ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSimpleLayoutStrategy >> mainPanelFrom: aPyramidEditorModel [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 1 / 5;
		  add: (self tabPanelFrom: aPyramidEditorModel leftTabs);
		  add: (SpPanedLayout newLeftToRight
				   positionOfSlider: 3 / 4;
				   add: (self centerPanelFrom: aPyramidEditorModel centralViews);
				   add: (self tabPanelFrom: aPyramidEditorModel rightTabs);
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
