Class {
	#name : #PyramidBackgroundInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'buttonTransparent',
		'buttonImage',
		'buttonPaintSolid',
		'buttonPaintGradient',
		'presenterTransparent',
		'presenterImage',
		'presenterPaintSolid',
		'presenterPaintGradient',
		'selectedPresenter'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #initialization }
PyramidBackgroundInputPresenter >> allButtons [

	^ { self buttonImage . self buttonPaintGradient . self buttonPaintSolid . self buttonTransparent }
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> buttonImage [

	^ buttonImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> buttonPaintGradient [

	^ buttonPaintGradient
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> buttonPaintSolid [

	^ buttonPaintSolid
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> buttonTransparent [

	^ buttonTransparent
]

{ #category : #layout }
PyramidBackgroundInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self buttonTransparent width: 24;
				   add: self buttonPaintSolid width: 24;
				   add: self buttonPaintGradient width: 24;
				   add: self buttonImage width: 24;
				   yourself)
		  height: 24;
		  add: self selectedPresenter;
		  yourself
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeImage [

	buttonImage := SpButtonPresenter new
		               icon: (self iconNamed: #emptyPackage);
							action: [ self selectButton: buttonImage andPresenter: presenterImage ];
		               help: 'Select an image as background.';
		               yourself.
	presenterImage := SpNullPresenter new
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializePaintGradient [

	buttonPaintGradient := SpButtonPresenter new
		                       icon: (Morph new
				                        extent: 16 @ 16;
				                        color: Color red;
				                        addMorph: (Morph new
						                         extent: 8 @ 16;
						                         color: Color blue;
						                         yourself);
				                        yourself) asForm;
		                       action: [
		                       self
			                       selectButton: buttonPaintGradient
			                       andPresenter: presenterPaintGradient ];
		                       help: 'Select a gradiant as background.';
		                       yourself.
	presenterPaintGradient := SpNullPresenter new
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializePaintSolid [

	buttonPaintSolid := SpButtonPresenter new
		                    icon: (Morph new
				                     extent: 16 @ 16;
				                     color: Color blue;
				                     yourself) asForm;
		                    action: [
		                    self
			                    selectButton: buttonPaintSolid
			                    andPresenter: presenterPaintSolid ];
		                    help: 'Select a single color as background.';
		                    yourself.
	presenterPaintSolid := SpNullPresenter new
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializePresenters [

	selectedPresenter := SpNullPresenter new.
	self initializeTransparent.
	self initializeImage.
	self initializePaintSolid.
	self initializePaintGradient.
	self
		selectButton: self buttonPaintSolid
		andPresenter: self presenterPaintSolid
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> initializeTransparent [

	buttonTransparent := SpButtonPresenter new
		                     icon: (self iconNamed: #windowCloseInactive);
		                     help: 'Remove the background.';
		                     action: [
			                     self
				                     selectButton: buttonTransparent
				                     andPresenter: presenterTransparent ];
		                     yourself.
	presenterTransparent := SpNullPresenter new
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterImage [

	^ presenterImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterPaintGradient [

	^ presenterPaintGradient
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterPaintSolid [

	^ presenterPaintSolid
]

{ #category : #accessing }
PyramidBackgroundInputPresenter >> presenterTransparent [

	^ presenterTransparent
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> selectButton: aButton andPresenter: aPresenter [

	self allButtons do: [ :each | each color: self theme buttonPlainMiddleColor ].
	aButton color: self theme selectionColor.
	self selectedPresenter: aPresenter.
	self layout: self defaultLayout
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> selectedPresenter [

	^ selectedPresenter 
]

{ #category : #initialization }
PyramidBackgroundInputPresenter >> selectedPresenter: aPresenter [

	selectedPresenter:= aPresenter
]
