Class {
	#name : #PyramidSelectionWidgetExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension + TPyramidProjectModelObserver',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait + TPyramidProjectModelObserver classTrait',
	#instVars : [
		'display',
		'projectModel',
		'widgetElement'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> alphaFactor [

	^ 0.5
]

{ #category : #initialization }
PyramidSelectionWidgetExtension >> initialize [

	widgetElement := BlElement new clipChildren: false; yourself
]

{ #category : #displaying }
PyramidSelectionWidgetExtension >> installOn: aBuilder [

	self builder: aBuilder.
	
	self elementAtWidgets addChild: self widgetElement
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> makeMonoSelectionFor: aBlElement [

	| monoSelection formElement |
	aBlElement requestParentLayout.
	formElement := (aBlElement exportAsForm collectColors: [ :color |
		                | l |
		                l := color luminance.
		                Color
			                r: l
			                g: l
			                b: l
			                alpha: (color alpha min: self alphaFactor) ])
		               asElement.

	monoSelection := BlElement new
		                 border: (BlBorderBuilder new
				                  width: 1;
				                  paint: Color black;
				                  build);
		                 size: aBlElement size + (self offset * 2) asPoint;
		                 position:
		                 aBlElement constraints position
		                 - self offset asPoint;
		                 yourself.
	monoSelection addChild: (formElement
			 position: self offset asPoint;
			 yourself).
	"formElement
		when: BlPrimaryMouseDownEvent
		do: [ :evt | self dragStart: evt ].
	formElement when: BlMouseEvent do: [ :evt | self dragEvent: evt ].
	formElement
		when: BlPrimaryMouseUpEvent
		do: [ :evt | self dragEnd: evt ]."
	^ monoSelection
]

{ #category : #removing }
PyramidSelectionWidgetExtension >> makeNewSelection [

	self projectModel selection do: [ :each | self widgetElement addChild: (self makeMonoSelectionFor: each)]
	
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> offset [
	^ 10
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSelectionWidgetExtension >> projectModel: aProjectModel [

	projectModel := aProjectModel.
	projectModel addObserver: self.
	self makeNewSelection.
]

{ #category : #'as yet unclassified' }
PyramidSelectionWidgetExtension >> pyramidSelectionChanged [

	self removeSelection.
	self makeNewSelection.
]

{ #category : #removing }
PyramidSelectionWidgetExtension >> removeSelection [

	self widgetElement removeChildren.
]

{ #category : #removing }
PyramidSelectionWidgetExtension >> widgetElement [

	^ widgetElement
]
