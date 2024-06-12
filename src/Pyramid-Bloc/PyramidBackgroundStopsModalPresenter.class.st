Class {
	#name : 'PyramidBackgroundStopsModalPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'tableStops',
		'buttonAddStops',
		'buttonRemoveStops',
		'positionInput',
		'colorInput',
		'stopsArray'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'adding' }
PyramidBackgroundStopsModalPresenter >> addNewStop [

	| association |
	association := self makeNewAssociation.
	self addToStopsArray: association.
	self tableStops selectItem: association.
]

{ #category : 'adding' }
PyramidBackgroundStopsModalPresenter >> addToStopsArray: association [

	self stopsArray: (self stopsArray , {association }) sorted.
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> buttonAddStops [

	^ buttonAddStops
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> buttonRemoveStops [

	^ buttonRemoveStops
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> colorInput [

	^ colorInput
]

{ #category : 'layout' }
PyramidBackgroundStopsModalPresenter >> defaultLayout [

	| inputPanelLayout |
	inputPanelLayout := SpBoxLayout newVertical
		                    add: (SpBoxLayout newHorizontal
				                     spacing: 4;
				                     add: self buttonAddStops;
				                     add: self buttonRemoveStops;
				                     yourself)
		                    expand: false;
		                    add: (SpLabelPresenter new
				                     label: 'Position';
				                     displayBold: [ :t | true ];
				                     yourself)
		                    expand: false;
		                    add: self positionInput;
		                    add: (SpLabelPresenter new
				                     label: 'Color';
				                     displayBold: [ :t | true ];
				                     yourself)
		                    expand: false;
		                    add: self colorInput;
		                    yourself.

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: self tableStops expand: true;
		  add: inputPanelLayout expand: false;
		  add: SpNullPresenter new height: 8;
		  yourself
]

{ #category : 'initialization' }
PyramidBackgroundStopsModalPresenter >> initializePresenters [

	stopsArray := {  }.
	buttonAddStops := SpButtonPresenter new
		                  label: 'Add a color';
		                  icon: (Smalltalk ui icons iconNamed: #add);
		                  action: [ self addNewStop ];
		                  yourself.
	buttonRemoveStops := SpButtonPresenter new
		                     label: 'Remove';
		                     icon: (Smalltalk ui icons iconNamed: #remove);
		                     yourself.
	colorInput := PyramidColorInputSingleLineWithPickupButtonPresenter
		              new.
	positionInput := PyramidNumberInputPresenter new strings:
		                 (PyramidInputStrings new help:
			                  'Set the position of the color in the gradiant (generally between 0 and 1).').
	tableStops := SpTablePresenter new
		              whenSelectedItemChangedDo: [ :stop |
			              self updateCurrentStop: stop ];
		              yourself.
	tableStops addColumn:
		((SpImageTableColumn title: '' evaluated: [ :association |
			  Morph new
				  extent: 16 asPoint;
				  color: association value;
				  asForm ]) width: 20).
	tableStops addColumn: ((SpStringTableColumn
			  title: 'Position'
			  evaluated: [ :association |
			  association key asFloat printShowingDecimalPlaces: 4 ]) width: 70).
	tableStops addColumn: (SpStringTableColumn
			 title: 'Color'
			 evaluated: [ :association | association value printString ]).
	self updateCurrentStop: nil
]

{ #category : 'adding' }
PyramidBackgroundStopsModalPresenter >> makeNewAssociation [

	| position color index |
	"Nothing in array. We add at 0.0"
	self stopsArray ifEmpty: [ ^ 0.0 -> Color black ].

	"1 in array, add oposite color, by default at 0.0 if not taken."
	self stopsArray size = 1 ifTrue: [
		position := (self stopsArray first key closeTo: 0)
			            ifTrue: [ 1.0 ]
			            ifFalse: [ 0.0 ].
		color := self stopsArray first value negated.
		^ position -> color ].

	"selected first or no selection: add between the first and the second."
	(self tableStops selectedItem isNil or: [
		 self tableStops selectedItem key closeTo: 0.0 ]) ifTrue: [
		position := self stopsArray second key / 2.
		color := self stopsArray first value
			         mixed: 1 / 2
			         with: self stopsArray second value.
		^ position -> color ].
	"selected last: add between the last and the secondLast."
	(self tableStops selectedItem key closeTo: 1.0) ifTrue: [
		| lastTwo |
		lastTwo := self stopsArray last: 2.
		position := lastTwo first key + lastTwo second key / 2.
		color := lastTwo first value mixed: 1 / 2 with: lastTwo second value.
		^ position -> color ].
	
	"add between the current and the next."
	index := self stopsArray indexOf: self tableStops selectedItem.
	position := (self stopsArray at: index) key + (self stopsArray at: index + 1) key / 2.
	color := (self stopsArray at: index) value mixed: 1 / 2 with: (self stopsArray at: index + 1) value.
	^ position -> color
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsModalPresenter >> orderStopsArray [

	|currentSelection|
	currentSelection := self tableStops selectedItem.
	self stopsArray: self stopsArray sorted.
	self tableStops selectItem: currentSelection
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> positionInput [

	^ positionInput
]

{ #category : 'removing' }
PyramidBackgroundStopsModalPresenter >> removeStop: anAssociation [

	self stopsArray: (self stopsArray copyWithout: anAssociation)
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> stopsArray [

	^ stopsArray
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> stopsArray: anObject [

	stopsArray := anObject.
	self tableStops items: stopsArray.
]

{ #category : 'accessing' }
PyramidBackgroundStopsModalPresenter >> tableStops [

	^ tableStops
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsModalPresenter >> updateCurrentStop: anAssociation [

	self positionInput enabled: anAssociation isNotNil.
	self colorInput enabled: anAssociation isNotNil.
	self buttonRemoveStops enabled: anAssociation isNotNil.
	anAssociation ifNil: [ 
		self colorInput emptyValue.
		^ self ].
	self buttonRemoveStops action: [ self removeStop: anAssociation ].
	self positionInput
		value: anAssociation key;
		whenValueChangedDo: [ :newPosition |
			(newPosition between: 0.0 and: 1.0)
				ifTrue: [
					anAssociation key: newPosition.
					self positionInput value: newPosition ]
				ifFalse: [
					| number |
					number := newPosition asInteger.
					number negative ifTrue: [ number := number negated ].
					number := number / (10 raisedTo: number decimalDigitLength).
					anAssociation key: number.
					self positionInput value: number ].
			self orderStopsArray ].
	self colorInput
		value: anAssociation value;
		whenValueChangedDo: [ :newColor |
			anAssociation value: newColor.
			self updatePresenter ]
]

{ #category : 'as yet unclassified' }
PyramidBackgroundStopsModalPresenter >> updatePresenter [

	self tableStops refresh.
	self layout: self defaultLayout
]
