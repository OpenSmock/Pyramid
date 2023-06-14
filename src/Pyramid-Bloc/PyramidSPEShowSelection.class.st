Class {
	#name : #PyramidSPEShowSelection,
	#superclass : #PyramidSpacePluginExtension,
	#traits : 'TPyramidActiveProjectModelObserver + TPyramidPipelineObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait + TPyramidPipelineObserver classTrait',
	#instVars : [
		'rootSelectionElement',
		'showSelectionOverlay',
		'selection'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> connectOn: aPyramidEditor [

	aPyramidEditor activeProject addObserver: self.
	aPyramidEditor commandPipeline addObserver: self.
	self selection: aPyramidEditor activeProject selection
]

{ #category : #initialization }
PyramidSPEShowSelection >> initialize [

	| root |
	root := BlElement new
		        id: #show_selection_root;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        clipChildren: false;
		        yourself.

	showSelectionOverlay := PyramidOverlay new
		                        position: 200;
		                        element: root;
		                        whenReceiveDo: [
			                        rootSelectionElement := BlElement new
				                                                clipChildren:
					                                                false;
				                                                id:
					                                                #show_selection_elements;
				                                                constraintsDo: [
					                                                :c |
					                                                c horizontal
						                                                matchParent.
					                                                c vertical
						                                                matchParent ];
				                                                yourself.
			                        root addChild: rootSelectionElement ];
		                        yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self showSelectionOverlay.
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> makeEmptySelectionElement [

	^ BlElement new
		  border: (BlBorderBuilder new
				   width: 1;
				   paint: Color black;
				   build);
		  clipChildren: false;
		  addChild: (BlElement new
				   clipChildren: false;
				   constraintsDo: [ :c |
					   c vertical matchParent.
					   c horizontal matchParent ];
				   border: (BlBorderBuilder new
						    width: 1;
						    paint: Color white;
						    capButt;
						    dashArray: #( 3 3 );
						    joinBevel;
						    build);
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> makeRootSelectionElement [

	self rootSelectionElement ifNotNil: [
		self showSelectionOverlay element removeChild: rootSelectionElement ].
	rootSelectionElement := BlElement new
		                        clipChildren: false;
		                        id: #show_selection_elements;
		                        constraintsDo: [ :c |
			                        c horizontal matchParent.
			                        c vertical matchParent ];
		                        yourself.
	self showSelectionOverlay element addChild: rootSelectionElement
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> makeSelectionFor: anElement [

	| element aBoundsInLocal aBoundsInGlobal offset |
	offset := 10.
	anElement requestParentLayout.
	aBoundsInLocal := (anElement effectBounds: BlBounds new)
		                  merge: anElement boundsInLocal;
		                  merge: anElement visualBounds.

	aBoundsInGlobal := anElement localBoundsToGlobal: aBoundsInLocal copy.
	element := self makeEmptySelectionElement.
	element size: aBoundsInGlobal extent + (offset * 2) asPoint.
	element position:
		aBoundsInGlobal origin - self rootSelectionElement positionInSpace
		- offset asPoint.
	^ element
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> pyramidPipelineExecuteCommand [

	self updateRootSelectionElement
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> pyramidSelectionChangedOnActiveProject [

	self updateRootSelectionElement
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> rootSelectionElement [

	^  rootSelectionElement
]

{ #category : #accessing }
PyramidSPEShowSelection >> selection [
	^ selection
]

{ #category : #accessing }
PyramidSPEShowSelection >> selection: aCollection [

	selection := aCollection
]

{ #category : #accessing }
PyramidSPEShowSelection >> showSelectionOverlay [

	^ showSelectionOverlay
]

{ #category : #'as yet unclassified' }
PyramidSPEShowSelection >> updateRootSelectionElement [

	self makeRootSelectionElement.
	self selection elements do: [ :each |
		self rootSelectionElement addChild: (self makeSelectionFor: each) ]
]
