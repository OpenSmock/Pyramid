Class {
	#name : #PyramidGeometryPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'whenSubmitDo',
		'geometry',
		'shouldTrigger'
	],
	#category : #'Pyramid-Bloc-custom-specs-geometry'
}

{ #category : #accessing }
PyramidGeometryPresenter class >> default [

	^ self new
		  model:
				  PyramidGeometryModel default;
		  yourself
]

{ #category : #layout }
PyramidGeometryPresenter >> defaultLayout [

	| buttonLayout |
	buttonLayout := SpBoxLayout newVertical
		                spacing: 4;
		                yourself.
	self model do: [ :each |
		buttonLayout
			add: (SpBoxLayout newHorizontal
					 spacing: 4;
					 add: (SpImagePresenter new image: each icon) expand: false;
					 add: each buttonPresenter expand: true;
					 add: each associatedPresenter width: 48;
					 yourself)
			height: 24 ].
	^ buttonLayout
]

{ #category : #accessing }
PyramidGeometryPresenter >> defaultValue: aBlGeometry [

	self shouldTrigger: false.
	aBlGeometry pyramidSelectOnPresenter: self.
	self shouldTrigger: true
]

{ #category : #accessing }
PyramidGeometryPresenter >> geometry [
	^ geometry 
]

{ #category : #accessing }
PyramidGeometryPresenter >> geometry: aGeometry [

	geometry:= aGeometry
]

{ #category : #initialization }
PyramidGeometryPresenter >> initializePresenters [

	model := {  }.
	shouldTrigger := true
]

{ #category : #'as yet unclassified' }
PyramidGeometryPresenter >> makeRadioButton: aPyramidGeometryModel [

	^ SpRadioButtonPresenter new
		  label: aPyramidGeometryModel title;
		  whenActivatedDo: [ self submit: aPyramidGeometryModel ];
		  yourself
]

{ #category : #accessing }
PyramidGeometryPresenter >> model [

	^ model
]

{ #category : #accessing }
PyramidGeometryPresenter >> model: aCollection [

	| listOfButtons |
	model := aCollection.
	listOfButtons := aCollection collect: [ :each |
		                 | button |
							  each initializeBlock value: self.
		                 button := self makeRadioButton: each.
		                 each buttonPresenter: button.
		                 button ].
	listOfButtons first associatedRadioButtons: listOfButtons allButFirst.
	self layout: self defaultLayout
]

{ #category : #accessing }
PyramidGeometryPresenter >> shouldTrigger [

	^ shouldTrigger
]

{ #category : #accessing }
PyramidGeometryPresenter >> shouldTrigger: aBoolean [

	shouldTrigger:= aBoolean
]

{ #category : #'as yet unclassified' }
PyramidGeometryPresenter >> submit: aGeometryModel [

	self shouldTrigger ifFalse: [ ^ self ].
	self geometry: aGeometryModel makeGeometry.
	self whenSubmitDo value
]

{ #category : #accessing }
PyramidGeometryPresenter >> whenSubmitDo [

	whenSubmitDo ifNil: [ whenSubmitDo := [  ] ].
	^ whenSubmitDo
]

{ #category : #accessing }
PyramidGeometryPresenter >> whenSubmitDo: anObject [

	whenSubmitDo := anObject
]
