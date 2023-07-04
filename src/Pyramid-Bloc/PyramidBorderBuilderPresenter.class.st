Class {
	#name : #PyramidBorderBuilderPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'builder',
		'buttonCaps',
		'buttonJoins',
		'paintInput',
		'widthInput',
		'previewCap',
		'previewJoin'
	],
	#category : #'Pyramid-Bloc-custom-specs-border'
}

{ #category : #accessing }
PyramidBorderBuilderPresenter >> builder [

	^ builder
]

{ #category : #accessing }
PyramidBorderBuilderPresenter >> buttonCaps [

	^ buttonCaps
]

{ #category : #accessing }
PyramidBorderBuilderPresenter >> buttonJoins [

	^ buttonJoins
]

{ #category : #layout }
PyramidBorderBuilderPresenter >> capsLayout [

	| capsLayout |
	capsLayout := SpBoxLayout newVertical
		              spacing: 4;
		              yourself.
	self buttonCaps do: [ :each | capsLayout add: each expand: false ].
	^ capsLayout
]

{ #category : #layout }
PyramidBorderBuilderPresenter >> defaultLayout [

	^ SpBoxLayout newVertical
						    spacing: 4;
						    add: self previewPresenter expand: true;
						    add: self paintInput expand: false;
						    add: self widthInput expand: false;
						    add: (SpBoxLayout newHorizontal
								     spacing: 4;
								     add: self capsLayout;
								     add: self joinsLayout;
								     yourself);
						    yourself
]

{ #category : #initialization }
PyramidBorderBuilderPresenter >> initializeButtonCaps [

	| round square butt |
	round := SpRadioButtonPresenter new
		         label: 'cap round';
		         yourself.
	square := SpRadioButtonPresenter new
		          label: 'cap square';
		          yourself.
	butt := SpRadioButtonPresenter new
		        label: 'cap butt';
		        yourself.

	round associatedRadioButtons: {
			square.
			butt }.
	round whenActivatedDo: [ self builder capRound. self updatePreview ].
	square whenActivatedDo: [ self builder capSquare. self updatePreview ].
	butt whenActivatedDo: [ self builder capButt. self updatePreview ].

	buttonCaps := {
		              round.
		              square.
		              butt }
]

{ #category : #initialization }
PyramidBorderBuilderPresenter >> initializeButtonJoins [

	| bevel miter round |
	bevel := SpRadioButtonPresenter new
		         label: 'join bevel';
		         yourself.
	miter := SpRadioButtonPresenter new
		         label: 'join miter';
		         yourself.
	round := SpRadioButtonPresenter new
		         label: 'join round';
		         yourself.

	bevel associatedRadioButtons: {
			miter.
			round }.
	bevel whenActivatedDo: [ self builder joinBevel. self updatePreview ].
	miter whenActivatedDo: [ self builder joinMiter. self updatePreview ].
	round whenActivatedDo: [ self builder joinRound. self updatePreview ].

	buttonJoins := {
		               bevel.
		               miter.
		               round }
]

{ #category : #initialization }
PyramidBorderBuilderPresenter >> initializePresenters [

	builder := BlBorderBuilder new
		           paint: Color black;
		           width: 1;
		           yourself.
	paintInput := PyramidColorInputPresenter new
		              whenSubmitDo: [ :color |
			              self builder paint: color.
			              self updatePreview ];
		              yourself.
	widthInput := PyramidNumberPresenter new
		              number: 1;
		              whenSubmitDo: [ :width |
			              self builder width: width.
			              self updatePreview ];
		              yourself.
	previewCap := SpImagePresenter new.
	previewJoin := SpImagePresenter new.
	self initializeButtonCaps.
	self initializeButtonJoins.
	self updatePreview
]

{ #category : #layout }
PyramidBorderBuilderPresenter >> joinsLayout [

	| joinsLayout |
	joinsLayout := SpBoxLayout newVertical
		               spacing: 4;
		               yourself.
	self buttonJoins do: [ :each | joinsLayout add: each expand: false ].
	^ joinsLayout
]

{ #category : #accessing }
PyramidBorderBuilderPresenter >> paintInput [

	^ paintInput
]

{ #category : #accessing }
PyramidBorderBuilderPresenter >> previewPresenter [

	^ previewPresenter
]

{ #category : #actions }
PyramidBorderBuilderPresenter >> updatePreview [

	| element |
	element := BlElement new
		           geometry: (BlPolylineGeometry vertices: {
						            (0 @ 0).
						            (100 @ 0).
						            (50 @ 25).
						            (50 @ 50).
						            (0 @ 50) });
		           outskirts: BlOutskirts centered;
		           position: 10 @ 10;
		           border: self builder build;
		           yourself.
	self previewPresenter image: element exportAsForm
]

{ #category : #accessing }
PyramidBorderBuilderPresenter >> widthInput [

	^ widthInput
]
