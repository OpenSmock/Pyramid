Class {
	#name : 'PyramidWindowTest',
	#superclass : 'TestCase',
	#instVars : [
		'window'
	],
	#category : 'Pyramid-Tests-cases-views',
	#package : 'Pyramid-Tests',
	#tag : 'cases-views'
}

{ #category : 'running' }
PyramidWindowTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	window := PyramidTestWindow new.
]

{ #category : 'tests' }
PyramidWindowTest >> testServices [

	| t1 t2 t3 t4 presenter buttons |
	t1 := SpButtonPresenter new.
	t2 := SpButtonPresenter new.
	t3 := SpButtonPresenter new.
	t4 := SpButtonPresenter new.

	presenter := self window presenter.
	self assert: self window services size equals: 3.
	self assert: presenter layout presenters size equals: 3.
	self assert: (self window services at: #top) items size equals: 0.

	(self window services at: #top) addItem: [ :builder |
		builder makeButtonWithIcon: t2 order: 2 ].
	(self window services at: #top) addItem: [ :builder |
		builder makeButtonWithIcon: t1 order: 3 ].
	(self window services at: #top) addItem: [ :builder |
		builder makeButtonWithIcon: t3 order: 1 ].
	self assert: (self window services at: #top) items size equals: 3.

	buttons := (presenter layout presenters at: 1) presenters.
	self assert: buttons size equals: 3.
	self assert:( buttons at: 1) equals: t3.
	self assert:( buttons at: 2) equals: t2.
	self assert:( buttons at: 3) equals: t1.

	(self window services at: #top) addItem: [ :builder |
		builder makeButtonWithIcon: t4 order: 4 ].
	buttons := (presenter layout presenters at: 1) presenters.
	self assert: buttons size equals: 4.
	self assert:( buttons at: 1) equals: t3.
	self assert:( buttons at: 2) equals: t2.
	self assert:( buttons at: 3) equals: t1.
	self assert:( buttons at: 4) equals: t4.
]

{ #category : 'accessing' }
PyramidWindowTest >> window [
^ window
]
