Class {
	#name : #PyramidWindow,
	#superclass : #Object,
	#traits : 'TPyramidWindowWithMessages + (TPyramidWindowOpennable - {#open. #close})',
	#classTraits : 'TPyramidWindowWithMessages classTrait + TPyramidWindowOpennable classTrait',
	#instVars : [
		'presenter',
		'services',
		'title',
		'spec',
		'whenClosedDo'
	],
	#category : #'Pyramid-views'
}

{ #category : #'window - properties' }
PyramidWindow class >> aboutText [

	^ 'Pyramid is an User-Interface (UI) editor.

https://github.com/OpenSmock/Pyramid

LICENSE
Licensed under the MIT License
Copyright (c) 2022-2023 OpenSmock

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.'
]

{ #category : #'window - properties' }
PyramidWindow class >> aboutTitle [

	^ 'Pyramid'
]

{ #category : #'window - properties' }
PyramidWindow class >> defaultTitle [

	^ 'New project | ' , self aboutTitle
]

{ #category : #accessing }
PyramidWindow >> at: aSymbol addItem: aBlock [

	(self services at: aSymbol) addItem: aBlock
]

{ #category : #accessing }
PyramidWindow >> doesServiceExists: aSymbol [
	^ services includesKey: aSymbol
]

{ #category : #initialization }
PyramidWindow >> initialize [

	title := self class defaultTitle.
	whenClosedDo := [  ].

	PyramidPanelModel toolbarHorizontal installOn: self at: #topLeft.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topCenter.
	PyramidPanelModel toolbarHorizontal installOn: self at: #topRight.
	PyramidPanelModel presenter installOn: self at: #space.
	PyramidPanelModel tab installOn: self at: #tabLeft.
	PyramidPanelModel tab installOn: self at: #tabRight.
	PyramidPanelModel menu installOn: self at: #selectionMenu
]

{ #category : #initialization }
PyramidWindow >> initializePresenter [
	"a Spec presenter using the services as an entry"

	presenter := PyramidSpPresenter new layout: self layout; yourself.
	^ presenter
]

{ #category : #accessing }
PyramidWindow >> layout [

	^ self shouldBeImplemented
]

{ #category : #private }
PyramidWindow >> panelUpdated [

	self presenter layout: self layout
]

{ #category : #accessing }
PyramidWindow >> presenter [
	"a Spec presenter using the services as an entry"

	presenter ifNil: [ presenter := self initializePresenter ].
	^ presenter
]

{ #category : #accessing }
PyramidWindow >> services [
	"Collection of key -> value
	key : aSymbol
	value : aPyramidPanelModel"

	services ifNil: [ services := Dictionary new ].
	^ services
]

{ #category : #accessing }
PyramidWindow >> spec [

	^ spec
]

{ #category : #accessing }
PyramidWindow >> spec: aSpec [

	 spec :=aSpec
]
