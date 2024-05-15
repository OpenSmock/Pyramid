Class {
	#name : 'PyramidBackgroundStopsInputPresenter',
	#superclass : 'PyramidInputPresenter',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'buttonEdit',
		'stops',
		'whenValueChangedDo'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'accessing' }
PyramidBackgroundStopsInputPresenter >> buttonEdit [

	^ buttonEdit
]

{ #category : 'layout' }
PyramidBackgroundStopsInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: self buttonEdit;
		  yourself
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> editStops [

	| dialog window stopsPresenter stopsArray |
	self stops isCollection
		ifFalse: [ stopsArray := {  } ]
		ifTrue: [ stopsArray := self stops ].
	stopsPresenter := PyramidBackgroundStopsModalPresenter new
		          stopsArray: stopsArray; yourself.
	window := stopsPresenter asModalWindow.
	window title: 'Choose colors for the gradient'.
	dialog := window open.
	dialog isOk ifTrue: [
		self whenValueChangedDo value: stopsPresenter stopsArray ]
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> emptyValue [

	self stops: nil.
	self buttonEdit label: 'Mixed'.
	self buttonEdit icon: nil
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> iconForEditButton [

	| morph |
	self stops ifEmpty: [^ nil ].
	morph := Morph new
		         extent: 128 @ 16;
		         fillWithRamp: self stops oriented: 1;
		         yourself.
	^ morph asForm
]

{ #category : 'initialization' }
PyramidBackgroundStopsInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :value |  ].
	buttonEdit := SpButtonPresenter new
		              label: 'Unknow';
		              action: [ self editStops ];
		              yourself
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> mixedValues [

	self stops: nil.
	self buttonEdit label: 'Mixed'.
	self buttonEdit icon: nil.
]

{ #category : 'accessing' }
PyramidBackgroundStopsInputPresenter >> stops [

	^ stops
]

{ #category : 'accessing' }
PyramidBackgroundStopsInputPresenter >> stops: anObject [

	stops := anObject
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> updatePresenter [

	self stops ifNil: [
		^ self ].
	self buttonEdit label: ''.
	self buttonEdit icon: self iconForEditButton
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> value [

	self stops isCollection
		ifTrue: [ ^ self stops ]
		ifFalse: [ ^ PyramidUnknowState new ]
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsInputPresenter >> value: aCollection [

	self stops: aCollection.
	self updatePresenter.
	self buttonEdit icon: self iconForEditButton
]

{ #category : 'accessing' }
PyramidBackgroundStopsInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : 'accessing' }
PyramidBackgroundStopsInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
