Class {
	#name : 'PyramidPopoverFactory',
	#superclass : 'Object',
	#category : 'Pyramid-views',
	#package : 'Pyramid',
	#tag : 'views'
}

{ #category : 'as yet unclassified' }
PyramidPopoverFactory class >> makeWithPresenter: aPresenter relativeTo: anInput position: aPopoverPosition [

	| popover popupPresenter closeButton |
	closeButton := SpButtonPresenter new
		               label: 'Close';
		               yourself.
	popupPresenter := SpPresenter new
		                  layout: (SpBoxLayout newTopToBottom
				                   borderWidth: 3;
				                   spacing: 5;
				                   add: aPresenter;
				                   add: closeButton; yourself);
		                  yourself.
	popover := SpPopoverPresenter new
		           borderColor: Color black;
		           relativeTo: anInput;
		           position: aPopoverPosition;
		           presenter: popupPresenter yourself.
	closeButton action: [ popover dismiss ].
	^ popover
]
