Class {
	#name : 'PyramidColorInputPresenter',
	#superclass : 'PyramidInputPresenter',
	#instVars : [
		'aMorph',
		'hMorph',
		'svMorph',
		'whenValueChangedDo'
	],
	#category : 'Pyramid-specs-custom',
	#package : 'Pyramid',
	#tag : 'specs-custom'
}

{ #category : 'accessing' }
PyramidColorInputPresenter >> aMorph [

	^ aMorph
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> alphaSelected: aScale [

	self whenValueChangedDo value: self value.
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> colorSelected: aColor [
	"A color has been selected. Make the hue match."

	"self hMorph value: aColor hue / 360.
	self svMorph basicColor: (Color h: aColor hue s: 1.0 v: 1.0)."

	self whenValueChangedDo value: self value.
	self aMorph color: aColor
]

{ #category : 'initialization' }
PyramidColorInputPresenter >> defaultColor [
^ Color red
]

{ #category : 'layout' }
PyramidColorInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical spacing: 4;
		  add: (SpMorphPresenter new morph: self svMorph);
		  add: (SpMorphPresenter new morph: self hMorph) height: 24;
		  add: (SpMorphPresenter new morph: self aMorph) height: 24;
		  yourself
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> hMorph [

	^ hMorph
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> hue: aFloat [
	"Set the hue in the range 0.0 - 1.0. Update the SV morph and hMorph."

	self hMorph value: aFloat.
	self svMorph color: (Color h: aFloat * 359.9 s: 1.0 v: 1.0)
]

{ #category : 'initialization - deprecated' }
PyramidColorInputPresenter >> initializePresenter [

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

{ #category : 'accessing' }
PyramidColorInputPresenter >> svMorph [

	^ svMorph
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> value [
	"Answer the selected color."

	^ self svMorph selectedColor alpha: self aMorph value
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> value: aColor [
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

{ #category : 'accessing' }
PyramidColorInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : 'accessing' }
PyramidColorInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
