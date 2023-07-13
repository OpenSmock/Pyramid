Class {
	#name : #PyramidMainExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension + TPyramidProjectModelObserver + TPyramidEditorTransformationObserver',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait + TPyramidProjectModelObserver classTrait + TPyramidEditorTransformationObserver classTrait',
	#instVars : [
		'isDragging',
		'origin',
		'containerElement',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #accessing }
PyramidMainExtension >> containerElement [

	^ containerElement
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> informTransformationChanged [

	self elementAtEvents transformDo: [ :t |
		t translateBy: self currentTransformTranslation negated ].
]

{ #category : #initialization }
PyramidMainExtension >> initialize [ 

containerElement := BlElement new clipChildren: false; yourself
]

{ #category : #displaying }
PyramidMainExtension >> installOn: aBuilder [

	self builder: aBuilder.
	aBuilder addTransformationObserver: self.
	self elementAtMain addChild: self containerElement.
	self elementAtTransforms transformDo: [ :t |
		t translateBy: self offsetTranslation ].
	self builder signalTransformationChanged
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> offsetTranslation [

	^ 50 @ 50
]

{ #category : #accessing }
PyramidMainExtension >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidMainExtension >> projectModel: aProjectModel [

	projectModel:= aProjectModel.
	aProjectModel addObserver: self.
]

{ #category : #'as yet unclassified' }
PyramidMainExtension >> pyramidRootsChanged [

	self containerElement removeChildren.
	self projectModel roots do: [ :each | each parent ifNotNil: [ :p | p removeChild: each  ]. self containerElement addChild: each ]. 
]
