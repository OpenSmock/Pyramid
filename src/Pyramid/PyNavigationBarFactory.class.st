Class {
	#name : #PyNavigationBarFactory,
	#superclass : #Object,
	#instVars : [
		'navigationButtons'
	],
	#category : #'Pyramid-Editor-Toolbar'
}

{ #category : #adding }
PyNavigationBarFactory >> add: aNav [

	self presenters add: aNav
]

{ #category : #building }
PyNavigationBarFactory >> build [

	self presenters ifEmpty: [ ^ self buildEmptyNavigation ] ifNotEmpty: [ ^ self buildNavigation ].
]

{ #category : #building }
PyNavigationBarFactory >> buildEmptyNavigation [
	^ SpBoxLayout newLeftToRight
				 add: SpNullPresenter new expand: true fill: true;
				 yourself
]

{ #category : #'as yet unclassified' }
PyNavigationBarFactory >> buildNavigation [

	| layout |
	layout := SpBoxLayout newLeftToRight.

	self presenters
		do: [ :nav | layout add: nav expand: false ]
		separatedBy: [ 
		layout add: SpNullPresenter new expand: true fill: true ].

	^ layout
]

{ #category : #accessing }
PyNavigationBarFactory >> presenters [

	navigationButtons ifNil: [ navigationButtons := OrderedCollection new ].
	^ navigationButtons
]
