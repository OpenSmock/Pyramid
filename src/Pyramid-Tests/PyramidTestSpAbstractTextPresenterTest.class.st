Class {
	#name : #PyramidTestSpAbstractTextPresenterTest,
	#superclass : #SpSmokeTest,
	#category : #'Pyramid-Tests'
}

{ #category : #testing }
PyramidTestSpAbstractTextPresenterTest class >> isAbstract [
	^ self = SpAbstractTextPresenterTest
]

{ #category : #accessing }
PyramidTestSpAbstractTextPresenterTest >> classToTest [
	^ SpTextInputFieldPresenter
]

{ #category : #initialization }
PyramidTestSpAbstractTextPresenterTest >> initializationText [
	presenter text: 'Text for tests.'
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testClearContent [
	self initializationText.
	self denyEmpty: presenter text.
	presenter clearContent.
	self assertEmpty: presenter text
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testClearSelection [
	self initializationText.
	self openInstance.
	presenter selectionInterval: (1 to: 10).
	self assert: presenter selectionInterval equals: (1 to: 10).
	presenter clearSelection.
	self assert: presenter selectionInterval isEmpty
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testContextMenu [
	| menu changed |
	
	self assert: presenter contextMenu isNil.
	menu := SpMenuPresenter new.
	changed := false.
	presenter whenMenuChangedDo: [ 
		changed := true. ].
	presenter contextMenu: menu.
	self assert: presenter contextMenu equals: menu.
	self assert: changed
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testPlaceholderIsSet [

	presenter placeholder: 'enter something...'.
	
	self assert: presenter placeholder equals: 'enter something...'
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testSelectAll [
	self initializationText.
	self openInstance.
	presenter selectAll.
	self assert: presenter selectionInterval equals: (1 to: 15)
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testWhenResetDo [
	| reseted |

	reseted := false.
	presenter whenResetDo: [ :aString | reseted := true ].
	
	self openInstance.
	
	self textInputAdapter
		keyDown: $l 
		shift: false
		meta: true 
		control: false 
		option: false.
		
	self assert: reseted
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testWhenSubmitDo [
	| submitted |

	submitted := false.
	presenter whenSubmitDo: [ :aString | submitted := true ].
	
	self openInstance.
	
	self textInputAdapter
		keyDown: $s 
		shift: false
		meta: true 
		control: false 
		option: false.
		
	self assert: submitted
]

{ #category : #tests }
PyramidTestSpAbstractTextPresenterTest >> testWhenSubmitDoReceivesAString [
	| submitted |

	submitted := false.
	presenter whenSubmitDo: [ :aString | submitted := aString ].
	
	self openInstance.
	
	presenter type: 'abc'.
	
	self textInputAdapter
		keyDown: $s 
		shift: false
		meta: true 
		control: false 
		option: false.
		
	self assert: submitted equals: 'abc'
]

{ #category : #private }
PyramidTestSpAbstractTextPresenterTest >> textInputAdapter [
	
	^ presenter adapter
]
