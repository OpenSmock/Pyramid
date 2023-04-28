Class {
	#name : #PyramidButtonWithPopover,
	#superclass : #PyramidButton,
	#instVars : [
		'presenter',
		'spec',
		'popover',
		'button',
		'position'
	],
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #converting }
PyramidButtonWithPopover >> asSpecButtonFor: anObject [

	self position: (anObject popoverStrategy positionFor: self).
	button := SpButtonPresenter new
		          icon: self icon;
		          action: [
			          self showPopover.
			          self callback value ];
		          yourself.
	^ button
]

{ #category : #accessing }
PyramidButtonWithPopover >> button [
	^ button
]

{ #category : #'as yet unclassified' }
PyramidButtonWithPopover >> createPopover [

	^ SpPopoverPresenter new
		  borderColor: Color black;
		  relativeTo: self button;
		  position: self position;
		  presenter: (SpPresenter new
				   layout: (SpBoxLayout newTopToBottom
						    borderWidth: 3;
						    spacing: 5;
						    add: self presenter;
						    add: (SpButtonPresenter new
								     label: 'Close';
								     action: [ popover dismiss ];
								     yourself);
						    yourself);
				   yourself);
		  yourself
]

{ #category : #accessing }
PyramidButtonWithPopover >> popover [

	popover ifNil: [ popover := self createPopover ].
	^ popover
]

{ #category : #accessing }
PyramidButtonWithPopover >> position [
	position ifNil: [ position := SpPopoverPosition bottom ].
	^ position
]

{ #category : #accessing }
PyramidButtonWithPopover >> position: anObject [

	
	 position := anObject
]

{ #category : #initialization }
PyramidButtonWithPopover >> presenter [

	^ presenter
]

{ #category : #initialization }
PyramidButtonWithPopover >> presenter: anObject [

	presenter:= anObject
]

{ #category : #'as yet unclassified' }
PyramidButtonWithPopover >> showPopover [

	self button ifNil: [ ^ self ].
	self popover popup
]
