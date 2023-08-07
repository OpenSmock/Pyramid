Class {
	#name : #PyramidSelectionWidgetBorderBuilder,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> bottomChild [

	^ BlElement new
		  background: self mainOtherColor;
		  border: (BlBorderBuilder new
				   dashArray: self defaultDashArray;
				   width: self defaultWidth;
				   paint: self secondaryOtherColor) build;
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

	^ #( 10 )
]

{ #category : #accessing }
PyramidSelectionWidgetBorderBuilder >> defaultWidth [

	^ 3
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetBorderBuilder >> leftChild [

	| leftChild |
	leftChild := BlElement new
						 clipChildren: false;
		             background: self mainLeftColor;
		             border: (BlBorderBuilder new
				              dashArray: self defaultDashArray;
				              width: self defaultWidth;
				              paint: self secondaryLeftColor) build;
		             constraintsDo: [ :c |
			             c horizontal exact: self defaultWidth.
			             c vertical matchParent.
			             c frame horizontal alignLeft ];
		             yourself.
	leftChild addChild: (self leftLabelFor: leftChild).
	^ leftChild
]

{ #category : #'user interface' }
PyramidSelectionWidgetBorderBuilder >> leftLabelFor: aBlElement [

	| leftLabel |
	leftLabel := BlTextElement new
						 background: self mainLeftColor;
		             geometry: (BlRoundedRectangleGeometry cornerRadius: 8);
		             padding: (BlInsets all: 4);
		             text: aBlElement height printString asRopedText;
		             yourself.

	aBlElement when: BlElementExtentChangedEvent do: [ :evt |
		leftLabel text: (aBlElement height < 50
				 ifTrue: [ '' asRopedText ]
				 ifFalse: [ aBlElement height printString asRopedText ]).
		leftLabel requestLayout.
		leftLabel position:
			leftLabel requestedWidth negated / 2 @ (aBlElement height - 20 / 2) ].
	^ leftLabel
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

	^ BlElement new
		  background: self mainOtherColor;
		  border: (BlBorderBuilder new
				   dashArray:self defaultDashArray;
				   width: self defaultWidth;
				   paint: self secondaryOtherColor) build;
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
	topChild := BlElement new
		            clipChildren: false;
		            background: self mainTopColor;
		            border: (BlBorderBuilder new
				             dashArray: self defaultDashArray;
				             width: self defaultWidth;
				             paint: self secondaryTopColor) build;
		            constraintsDo: [ :c |
			            c vertical exact: self defaultWidth.
			            c horizontal matchParent.
			            c frame vertical alignTop ].
	topChild addChild: (self topLabelFor: topChild).
	^ topChild
]

{ #category : #'user interface' }
PyramidSelectionWidgetBorderBuilder >> topLabelFor: aBlElement [

	| leftLabel |
	leftLabel := BlTextElement new
		             background: self mainTopColor;
		             geometry: (BlRoundedRectangleGeometry cornerRadius: 8);
		             padding: (BlInsets all: 4);
		             text: aBlElement width printString asRopedText;
		             yourself.

	aBlElement when: BlElementExtentChangedEvent do: [ :evt |
		leftLabel text: (aBlElement width < 50
				 ifTrue: [ '' asRopedText ]
				 ifFalse: [ aBlElement width printString asRopedText ]).
		leftLabel requestLayout.
		leftLabel position: aBlElement width - leftLabel width / 2
			@ -10 ].
	^ leftLabel
]
