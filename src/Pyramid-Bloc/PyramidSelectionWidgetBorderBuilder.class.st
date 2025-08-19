Class {
	#name : #PyramidSelectionWidgetBorderBuilder,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> borderElementWithMainColor: aMainColor andSecondaryColor: aSecondaryColor [

	^ BlElement new
		clipChildren: false;
		  background: aMainColor;
		  border: (BlBorderBuilder new
				   dashArray: self defaultDashArray;
				   width: self defaultWidth;
				   paint: aSecondaryColor) build;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> bottomChild [

	^ (self borderElementWithMainColor: self mainOtherColor  andSecondaryColor: self secondaryOtherColor)
		  constraintsDo: [ :c |
			  c vertical exact: self defaultWidth.
			  c horizontal matchParent.
			  c frame vertical alignBottom ]
]

{ #category : #building }
PyramidSelectionWidgetBorderBuilder >> build [

	^ BlElement new
		  id: #borders;
			clipChildren: false;
		  constraintsDo: [ :c |
			  c vertical matchParent.
			  c horizontal matchParent ];
		  layout: BlFrameLayout new;
		  addChild: self topChild;
		  addChild: self leftChild;
		  addChild: self bottomChild;
		  addChild: self rightChild;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> defaultDashArray [

	^ #( 3 7 )
]

{ #category : #accessing }
PyramidSelectionWidgetBorderBuilder >> defaultWidth [

	^ 2
]

{ #category : #'user interface' }
PyramidSelectionWidgetBorderBuilder >> labelWithColor: aColor [.

	^ 	BlTextElement new
		             background: aColor;
		             geometry: (BlRoundedRectangleGeometry cornerRadius: 8);
		             padding: (BlInsets all: 2);
		             text: '' asRopedText ;
		             yourself
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> leftChild [

	| leftChild |
	leftChild := (self
		   borderElementWithMainColor: self mainLeftColor
		   andSecondaryColor: self secondaryLeftColor).
	leftChild
		             constraintsDo: [ :c |
			             c horizontal exact: self defaultWidth.
			             c vertical matchParent.
			             c frame horizontal alignLeft ].
	leftChild addChild: (self leftLabelFor: leftChild).
	^ leftChild
]

{ #category : #'user interface' }
PyramidSelectionWidgetBorderBuilder >> leftLabelFor: aBlElement [

	| label |
	label := self labelWithColor: self mainLeftColor.
	label transformDo: [ :t | t rotateBy: -90 ].

	aBlElement addEventHandler: (BlEventHandler
			 on: BlElementExtentChangedEvent
			 do: [ :evt |
				 label text: (aBlElement height < 50
						  ifTrue: [ '' asRopedText ]
						  ifFalse: [ ((aBlElement height) roundTo:0.01) printString asRopedText ]).
				 label requestLayout.
				 label position: -22 @ (aBlElement height - 20 / 2) ]).
	^ label
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> mainLeftColor [

	^ Color green
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> mainOtherColor [

	^ Color yellow
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> mainTopColor [

	^ Color red
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> rightChild [

	^ (self borderElementWithMainColor: self mainOtherColor andSecondaryColor: self secondaryOtherColor)
		  constraintsDo: [ :c |
			  c horizontal exact: self defaultWidth.
			  c vertical matchParent.
			  c frame horizontal alignRight ]
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> secondaryLeftColor [

	^ self mainLeftColor muchDarker
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> secondaryOtherColor [

	^ self mainOtherColor muchDarker
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> secondaryTopColor [

	^ self mainTopColor muchDarker
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> topChild [

	| topChild |
	topChild := self
		             borderElementWithMainColor: self mainTopColor
		             andSecondaryColor: self secondaryTopColor.
	topChild 
		            constraintsDo: [ :c |
			            c vertical exact: self defaultWidth.
			            c horizontal matchParent.
			            c frame vertical alignTop ].
	topChild addChild: (self topLabelFor: topChild).
	^ topChild
]

{ #category : #'user interface' }
PyramidSelectionWidgetBorderBuilder >> topLabelFor: aBlElement [

	| label |
	label := self labelWithColor: self mainTopColor.

	aBlElement addEventHandler: (BlEventHandler
			 on: BlElementExtentChangedEvent
			 do: [ :evt |
				 label text: (aBlElement width < 50
						  ifTrue: [ '' asRopedText ]
						  ifFalse: [ ((aBlElement width) roundTo:0.01) printString asRopedText ]).
				 label requestLayout.
				 label position: aBlElement width - 20 / 2 @ -13 ]).
	^ label
]
