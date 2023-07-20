Class {
	#name : #PyramidBackgroundInputPresenterDeprecated,
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
PyramidBackgroundInputPresenterDeprecated >> allButtons [

	^ { self buttonImage . self buttonPaintGradient . self buttonPaintSolid . self buttonTransparent }
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> buttonImage [

	^ buttonImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> buttonPaintGradient [

	^ buttonPaintGradient
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> buttonPaintSolid [

	^ buttonPaintSolid
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> buttonTransparent [

	^ buttonTransparent
]

{ #category : #layout }
PyramidBackgroundInputPresenterDeprecated >> defaultLayout [

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
PyramidBackgroundInputPresenterDeprecated >> initializeImage [

	buttonImage := SpButtonPresenter new
		               icon: (self iconNamed: #emptyPackage);
							action: [ self selectButton: buttonImage andPresenter: presenterImage ];
		               help: 'Select an image as background.';
		               yourself.
	presenterImage := SpNullPresenter new
]

{ #category : #initialization }
PyramidBackgroundInputPresenterDeprecated >> initializePaintGradient [

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
PyramidBackgroundInputPresenterDeprecated >> initializePaintSolid [

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
PyramidBackgroundInputPresenterDeprecated >> initializePresenters [

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
PyramidBackgroundInputPresenterDeprecated >> initializeTransparent [

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
PyramidBackgroundInputPresenterDeprecated >> presenterImage [

	^ presenterImage
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> presenterPaintGradient [

	^ presenterPaintGradient
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> presenterPaintSolid [

	^ presenterPaintSolid
]

{ #category : #accessing }
PyramidBackgroundInputPresenterDeprecated >> presenterTransparent [

	^ presenterTransparent
]

{ #category : #initialization }
PyramidBackgroundInputPresenterDeprecated >> selectButton: aButton andPresenter: aPresenter [

	self allButtons do: [ :each | each color: self theme buttonPlainMiddleColor ].
	aButton color: self theme selectionColor.
	self selectedPresenter: aPresenter.
	self layout: self defaultLayout
]

{ #category : #initialization }
PyramidBackgroundInputPresenterDeprecated >> selectedPresenter [

	^ selectedPresenter 
]

{ #category : #initialization }
PyramidBackgroundInputPresenterDeprecated >> selectedPresenter: aPresenter [

	selectedPresenter:= aPresenter
]
