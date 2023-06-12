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
		                        position: 101;
		                        element: root;
		                        whenReceiveDo: [
			                        rootSelectionElement := BlElement new
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
PyramidSPEShowSelection >> makeSelectionFor: anElement [

	| element aBoundsInLocal aBoundsInParent |
	anElement requestParentLayout.
	aBoundsInLocal := (anElement effectBounds: BlBounds new)
		                  merge: anElement boundsInLocal;
		                  merge: anElement visualBounds.

	aBoundsInParent := anElement localBoundsToParent: aBoundsInLocal copy.
	element := BlElement new.
	element border: (BlBorderBuilder new
			 width: 2;
			 paint: Color black;
			 build).
	element outskirts: BlOutskirts outside.
	element size: aBoundsInParent extent.
	element clipChildren: false.
	element position: aBoundsInParent origin.
	element addChild: (BlElement new
			 size: aBoundsInParent extent;
			 outskirts: BlOutskirts outside;
			 border: (BlBorderBuilder new
					  width: 2;
					  paint: Color white;
					  capButt;
					  dashArray: #( 3 3 );
					  joinBevel;
					  build);
			 yourself).
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

	self rootSelectionElement removeChildren.
	self selection elements do: [ :each | self rootSelectionElement addChild: (self makeSelectionFor: each) ]
]
