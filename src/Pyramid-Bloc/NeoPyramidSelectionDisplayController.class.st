Class {
	#name : #NeoPyramidSelectionDisplayController,
	#superclass : #Object,
	#traits : 'TPyramidProjectModelObserver + TPyramidPipelineObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait + TPyramidPipelineObserver classTrait',
	#instVars : [
		'activeProject',
		'overlay',
		'allSelectionPreviews',
		'origin'
	],
	#category : #'Pyramid-Bloc-plugin-overlays'
}

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> activeProject [

	^ activeProject
]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> activeProject: anObject [

	activeProject ifNotNil: [ anObject removeObserver: self ].
	activeProject := anObject.
	anObject addObserver: self
]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> allSelectionPreviews [

	^ allSelectionPreviews
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionDisplayController >> createSelectionPreview: anElement [

	| element offset |
	offset := 10.
	anElement requestParentLayout.
	
	element := BlElement new
		           zIndex: 200;
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
		           yourself.
	element size: anElement size + (offset * 2) asPoint.
	element position: anElement constraints position - offset asPoint.
	self allSelectionPreviews add: element
]

{ #category : #initialization }
NeoPyramidSelectionDisplayController >> initialize [

	allSelectionPreviews := OrderedCollection new.
]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> origin [

	^ origin
]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> origin: anObject [

	origin := anObject.
]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> overlay [

	^ overlay
]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> overlay: anObject [

	overlay := anObject.

]

{ #category : #accessing }
NeoPyramidSelectionDisplayController >> pipeline: aPipeline [

	pipeline ifNotNil: [ pipeline removeObserver: self ].
	pipeline := aPipeline.
	pipeline addObserver: self
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionDisplayController >> pyramidPipelineExecuteCommand [

	self updateSelectionPreviews
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionDisplayController >> pyramidSelectionChanged [

	self updateSelectionPreviews.
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionDisplayController >> updateOriginPreviews [

	self allSelectionPreviews do: [ :each |
		each transformDo: [ :t | t translateBy: self origin object ] ]
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionDisplayController >> updateSelectionPreviews [

	self activeProject ifNil: [ ^ self ].

	self overlay overlayElement removeChildren: self allSelectionPreviews.
	self allSelectionPreviews removeAll.
	self activeProject selection do: [ :each |
		self createSelectionPreview: each ].
	self overlay overlayElement addChildren: self allSelectionPreviews.
	self updateOriginPreviews
]
