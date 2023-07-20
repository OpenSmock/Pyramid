Class {
	#name : #NeoPyramidColorInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'aMorph',
		'hMorph',
		'svMorph',
		'whenValueChangedDo'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #accessing }
NeoPyramidColorInputPresenter >> aMorph [

	^ aMorph
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> colorSelected: aColor [
	"A color has been selected. Make the hue match."

	"self hMorph value: aColor hue / 360.
	self svMorph basicColor: (Color h: aColor hue s: 1.0 v: 1.0)."

	self whenValueChangedDo value: self value.
	self aMorph color: aColor
]

{ #category : #initialization }
NeoPyramidColorInputPresenter >> defaultColor [
^ Color red
]

{ #category : #layout }
NeoPyramidColorInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4;
		  add: (SpMorphPresenter new morph: self svMorph);
		  add: (SpMorphPresenter new morph: self hMorph) height: 24;
		  add: (SpMorphPresenter new morph: self aMorph) height: 24;
		  yourself
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> hMorph [

	^ hMorph
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> hue: aFloat [
	"Set the hue in the range 0.0 - 1.0. Update the SV morph and hMorph."

	self hMorph value: aFloat.
	self svMorph color: (Color h: aFloat * 359.9 s: 1.0 v: 1.0)
]

{ #category : #'initialization - deprecated' }
NeoPyramidColorInputPresenter >> initializePresenter [

	whenValueChangedDo := [ :color | ].
	aMorph := AColorSelectorMorph new
		          model: self;
		          setValueSelector: #alphaSelected:;
		          yourself.
	hMorph := HColorSelectorMorph new
		          model: self;
		          setValueSelector: #hue:;
		          yourself.
	svMorph := SVColorSelectorMorph new
		           when: #colorSelected send: #colorSelected: to: self;
		           yourself.
	self value: self defaultColor
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> svMorph [

	^ svMorph
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> value [
	"Answer the selected color."

	^ self svMorph selectedColor alpha: self aMorph value
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> value: aColor [
	"Set the hue and sv components."
	| whenValueChangedDoTemp |
	whenValueChangedDoTemp := self whenValueChangedDo.
	self whenValueChangedDo: [ :color |  ].
	[aColor isColor ifFalse: [
		self value: self defaultColor.
		^ self ].
	self hue: aColor hue / 360.
	self svMorph selectedColor: aColor.
	self aMorph value: aColor alpha] ensure: [ self whenValueChangedDo: whenValueChangedDoTemp ]
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
NeoPyramidColorInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
