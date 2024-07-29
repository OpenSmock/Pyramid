Class {
	#name : #PyramidVisibilityInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonVisible',
		'whenValueChangedDo',
		'value',
		'buttonNotVisible'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocGone [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #C;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.3333333333333333 g: 1.0 b: 0.3333333333333333 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 0 @ 3 ];
   yourself) . 
(BlElement new
   id: #E;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.3333333333333333 g: 0.3333333333333333 b: 1.0 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 11 @ 3 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocHidden [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #C;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.3333333333333333 g: 1.0 b: 0.3333333333333333 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 0 @ 3 ];
   yourself) . 
(BlElement new
   id: #D;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.3333333333333333 b: 0.3333333333333333 alpha: 0.2980392156862745);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 11 @ 3 ];
   yourself) . 
(BlElement new
   id: #E;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.3333333333333333 g: 0.3333333333333333 b: 1.0 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 22 @ 3 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocVisibilityUnknow [
<pyStash>
	^ [ "BlStashSerializer"
| blpaintbackground1 |
blpaintbackground1 := BlPaintBackground new.
{(BlElement new
   id: #C;
   background: (blpaintbackground1
         opacity: 1.0;
         paint: (BlLinearGradientPaint new
               stops: {(0 -> (Color r: 1.0 g: 0.8592375366568915 b: 0.2590420332355816 alpha: 1.0)) . 
                  (1.0 -> (Color r: 1.0 g: 0.8592375366568915 b: 0.2590420332355816 alpha: 0.0))};
               start: 0 @ 0;
               end: 8.0 @ 0;
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 0 @ 3 ];
   yourself) . 
(BlElement new
   id: #D;
   background: blpaintbackground1;
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 11 @ 3 ];
   yourself) . 
(BlElement new
   id: #E;
   background: blpaintbackground1;
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 22 @ 3 ];
   yourself)}
	] value
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocVisible [
<pyStash>
	^ [ "BlStashSerializer"
{(BlElement new
   id: #C;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.3333333333333333 g: 1.0 b: 0.3333333333333333 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 0 @ 3 ];
   yourself) . 
(BlElement new
   id: #D;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.3333333333333333 b: 0.3333333333333333 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 11 @ 3 ];
   yourself) . 
(BlElement new
   id: #E;
   background: (BlPaintBackground new
         opacity: 1.0;
         paint: (BlColorPaint new
               color: (Color r: 0.3333333333333333 g: 0.3333333333333333 b: 1.0 alpha: 1.0);
               yourself);
         yourself);
   layout: BlBasicLayout uniqueInstance;
   constraintsDo: [:constraints |  constraints horizontal exact: 8.0.
      constraints vertical exact: 8.0.
      constraints position: 22 @ 3 ];
   yourself)}
	] value
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formGone [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocGone materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formHidden [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocHidden materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formVisibilityUnknow [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocVisibilityUnknow materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formVisible [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocVisible materializeAsBlElement) exportAsForm
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> buttonNotVisible [

	^ buttonNotVisible
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> buttonVisible [

	^ buttonVisible
]

{ #category : #layout }
PyramidVisibilityInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonVisible expand: false;
		  add: self buttonNotVisible expand: true;
		  yourself
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :visibility |  ].
	buttonVisible := SpButtonPresenter new
		                 action: [
			                 self value switchVisibleOn: self.
			                 self whenValueChangedDo value: self value ];
		                 enabled: false;
		                 yourself.
	buttonNotVisible := SpButtonPresenter new
		                    label: 'No value';
		                    action: [
			                    self value switchNotVisibleOn: self.
			                    self whenValueChangedDo value: self value ];
		                    enabled: false;
		                    yourself
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> setVisibilityEmptyValue [

	self buttonNotVisible
		enabled: false;
		label: 'No value';
		help: 'Nothing selected.';
		icon: self class formVisibilityUnknow.
	self buttonVisible
		enabled: false;
		help: 'Nothing selected.';
		icon: self value asIcon
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityGone [

	self buttonNotVisible
		enabled: true;
		label: 'Gone';
		help:
			'The selection is "Gone". It will not display and will not affect the parent layout. Clic to set as "Hidden".';
		icon: self class formGone.
	self buttonVisible
		enabled: true;
		help:
			'The selection is "Gone". It will not display and will not affect the parent layout. Clic to set as "Visible".';
		icon: self value asIcon
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityHidden [

	self buttonNotVisible
		enabled: true;
		label: 'Hidden';
		help:
			'The selection is "Hidden". It will not display and will affect the parent layout. Clic to set as "Gone".';
		icon: self class formHidden.
	self buttonVisible
		enabled: true;
		help:
			'The selection is "Hidden". It will not display and will affect the parent layout. Clic to set as "Visible".';
		icon: self value asIcon
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> setVisibilityMixedValues [

	self buttonNotVisible
		enabled: false;
		label: 'Mixed';
		help:
			'The visibility is unknow. Use the popup to edit the visibility';
		icon: self class formVisibilityUnknow.
	self buttonVisible
		enabled: false;
		icon: self value asIcon
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityVisible [

	self buttonNotVisible
		enabled: true;
		label: 'Visible';
		help:
			'The selection is "Visible". It will display and will affect the parent layout. Clic on the left button to set as "Hidden".';
		icon: self class formVisible.

	self buttonVisible
		enabled: true;
		help:
			'The selection is "Visible". It will display and will affect the parent layout. Clic to set as "Hidden".';
		icon: self value asIcon
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter >> value [

	^ value
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter >> value: aBlVisibility [

	value := aBlVisibility.
	aBlVisibility setVisibilityOn: self
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
