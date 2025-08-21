"
This class is used for moving the view with CTRL + PrimaryMouseDown and movement on the workspace.
"
Class {
	#name : #PyramidSpaceMovePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'positionOrigin',
		'currentTranslation',
		'moveEvent',
		'pyramidWheelTransformExtension'
	],
	#category : #'Pyramid-Bloc-plugin-space-zoom-move'
}

{ #category : #connecting }
PyramidSpaceMovePlugin >> connectOn: aPyramidEditor [

	self pluginFromPyramid: aPyramidEditor.
	
	pyramidWheelTransformExtension ifNil: [ ^ self ].

	self installOnMoveSpace.
	
	pyramidWheelTransformExtension elementAtDisplaysAddons zIndex: 1001.
	
	pyramidWheelTransformExtension elementAtDisplaysAddons addChild: self defaultViewPositionButton
]

{ #category : #accessing }
PyramidSpaceMovePlugin >> currentTranslation [

	^ currentTranslation
]

{ #category : #accessing }
PyramidSpaceMovePlugin >> currentTranslation: aPosition [

	currentTranslation := aPosition.
]

{ #category : #'as yet unclassified' }
PyramidSpaceMovePlugin >> defaultViewPosition [

	pyramidWheelTransformExtension elementAtTransforms transformDo: [ :t | 
				t translateBy: (50@50 - pyramidWheelTransformExtension elementAtTransforms position) ]
]

{ #category : #'as yet unclassified' }
PyramidSpaceMovePlugin >> defaultViewPositionButton [

	| button image |
	
	image := (BlElement new
         constraintsDo: [:constraints |  constraints horizontal exact: 16.0.
            constraints vertical exact: 16.0.
            constraints frame horizontal alignCenter.
            constraints frame vertical alignCenter ];
         background: (BlImageBackground new
               image: (PyramidExternalRessourceProxy new
                     pyramidExternalRessourceSource: (PyramidExternalRessourceSource new
                           target: Object;
                           selector: #iconNamed:;
                           arguments: {#haloDrag};
                           yourself);
                     yourself);
               opacity: 1.0;
               yourself)).
	button := BlElement new
   constraintsDo: [:constraints |  constraints horizontal exact: 20.0.
      constraints vertical exact: 20.0 ];
   background: (BlPaintBackground new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 1.0 b: 1.0 alpha: 1.0);
               yourself);
         opacity: 1.0;
         yourself);
	position: 0@35;
	border: Color black;
   layout: BlFrameLayout new;
   id: #defaultViewPositionButton;
	addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt | 
				self defaultViewPosition.
				evt consumed: true ]).

	button addChild: image.
	
	^ button
]

{ #category : #initialization }
PyramidSpaceMovePlugin >> initialize [

	moveEvent := self moveSpaceEvent
]

{ #category : #displaying }
PyramidSpaceMovePlugin >> installOnMoveSpace [

	pyramidWheelTransformExtension elementAtMain addEventHandler:
		(BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt |
				 | moveTo |
				 moveTo := nil.
				 pyramidWheelTransformExtension isOnlyCtrlKeyPressed ifTrue: [
					 moveTo := evt position ].
				 moveTo ifNotNil: [
					 self positionOrigin: evt position
						 - pyramidWheelTransformExtension currentTransformTranslation.
					 pyramidWheelTransformExtension elementAtMain addEventHandler:
						 moveEvent.
					 evt consumed: true ] ]) 
	
]

{ #category : #'as yet unclassified' }
PyramidSpaceMovePlugin >> moveSpaceEvent [

	^ BlEventHandler
		  on: BlMouseMoveEvent
		  do: [ :evt |
			  evt primaryButtonPressed ifFalse: [
				  pyramidWheelTransformExtension elementAtMain
					  removeEventHandler: moveEvent ].
				
			  pyramidWheelTransformExtension isOnlyCtrlKeyPressed ifTrue: [
				  self currentTranslation: evt position - self positionOrigin.
				  pyramidWheelTransformExtension elementAtTransforms transformDo: [
					  :t | t translateBy: self currentTranslation ].
				  evt consumed: true ] ]
]

{ #category : #'accessing - classes' }
PyramidSpaceMovePlugin >> pluginFromPyramid: aPyramidEditor [

	| spacePlugin listOfSpaceExtension pyramidWheelTransformExtensionSet listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidSpacePlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	spacePlugin := pluginSorted asArray first.

	listOfSpaceExtension := spacePlugin builder extensions.

	pyramidWheelTransformExtensionSet := listOfSpaceExtension select: [
		                                     :extensions |
		                                     extensions isKindOf:
			                                     PyramidWheelTransformExtension ].
	pyramidWheelTransformExtensionSet size = 1 ifFalse: [ ^ self ].

	pyramidWheelTransformExtension := pyramidWheelTransformExtensionSet
		                                  asArray first
]

{ #category : #accessing }
PyramidSpaceMovePlugin >> positionOrigin [

	^ positionOrigin
]

{ #category : #accessing }
PyramidSpaceMovePlugin >> positionOrigin: aPosition [

	positionOrigin := aPosition.
]
