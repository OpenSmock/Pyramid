Class {
	#name : #PyramidInputOrNilPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'inputPresenter',
		'nilSelector',
		'whenValueChangedDo',
		'isSettingValue'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidInputOrNilPresenter >> applyStrings [

	self inputPresenter applyStrings
]

{ #category : #layout }
PyramidInputOrNilPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self nilSelector width: 24;
		  add: self inputPresenter expand: true;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidInputOrNilPresenter >> emptyValue [

	self nilSelector state: false.
	self value: PyramidEmptyValue new
]

{ #category : #initialization }
PyramidInputOrNilPresenter >> initializePresenters [

	isSettingValue := false.
	nilSelector := SpCheckBoxPresenter new
		               whenChangedDo: [ :aBoolean |
			                self valueChanged ] ;
		               yourself
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> inputPresenter [

	^ inputPresenter
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> inputPresenter: anObject [

	inputPresenter := anObject.
	inputPresenter whenValueChangedDo: [ :arg | self valueChanged ]. 
]

{ #category : #initialization }
PyramidInputOrNilPresenter >> isSettingValue [

	^ isSettingValue
]

{ #category : #initialization }
PyramidInputOrNilPresenter >> isSettingValue: aBoolean [

	isSettingValue := aBoolean
]

{ #category : #'as yet unclassified' }
PyramidInputOrNilPresenter >> mixedValues [

	self nilSelector state: false.
	self value: PyramidMixedValues new
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> nilSelector [

	^ nilSelector
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> strings [

	^ self inputPresenter strings
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> strings: anObject [

	self inputPresenter strings: anObject.
]

{ #category : #'as yet unclassified' }
PyramidInputOrNilPresenter >> value [

	self nilSelector state ifFalse: [ ^ nil ].
	^ self inputPresenter value.
]

{ #category : #'as yet unclassified' }
PyramidInputOrNilPresenter >> value: anObject [

	self isSettingValue: true.
	self nilSelector state: anObject isNotNil.
	self inputPresenter enabled: anObject isNotNil.
	self inputPresenter value: anObject.
	self isSettingValue: false
]

{ #category : #announcing }
PyramidInputOrNilPresenter >> valueChanged [

	self isSettingValue ifTrue: [ ^ self].
	self nilSelector state
		ifFalse: [ self whenValueChangedDo value: nil ]
		ifTrue: [ self whenValueChangedDo value: self inputPresenter value ]
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidInputOrNilPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
