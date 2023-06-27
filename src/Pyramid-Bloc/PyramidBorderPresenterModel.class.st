Class {
	#name : #PyramidBorderPresenterModel,
	#superclass : #Object,
	#instVars : [
		'icon',
		'border'
	],
	#category : #'Pyramid-Bloc-custom-specs-border'
}

{ #category : #'as yet unclassified' }
PyramidBorderPresenterModel class >> allModel [

	^ { self regularBorder . self shortDashBorder . self longDashBorder }
]

{ #category : #initialization }
PyramidBorderPresenterModel class >> defaultBorderWidth [

	^ 1
]

{ #category : #initialization }
PyramidBorderPresenterModel class >> defaultIconLenght [

	^ 50
]

{ #category : #initialization }
PyramidBorderPresenterModel class >> defaultPresenterLenght [

	^ self defaultIconLenght + 15
]

{ #category : #'as yet unclassified' }
PyramidBorderPresenterModel class >> longDashBorder [

	^ self makeModelFrom: [ :b |
		  b
			  width: self defaultBorderWidth;
			  paint: Color black;
			  dashed ]
]

{ #category : #'as yet unclassified' }
PyramidBorderPresenterModel class >> makeFormFrom: aBorder [

	| container element |
	element := BlElement new
		           background: Color black;
		           outskirts: BlOutskirts outside;
		           position: 0 @ 10;
		           geometry: (BlLineGeometry from: 0 @ 0 to: 200 @ 0);
		           border: aBorder;
		           yourself.
	container := BlElement new
		             size: 50 @ 20;
		             background: Color cyan muchLighter;
		             yourself.
	container addChild: element.

	^ container exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidBorderPresenterModel class >> makeModelFrom: aBlock [

	| builder border |
	builder := BlBorderBuilder new.
	aBlock value: builder.
	border := builder build.
	^ self new border: border; icon: (self makeFormFrom: border); yourself
]

{ #category : #'as yet unclassified' }
PyramidBorderPresenterModel class >> regularBorder [

	^ self makeModelFrom: [ :b |
		  b
			  width: self defaultBorderWidth;
			  paint: Color black ]
]

{ #category : #'as yet unclassified' }
PyramidBorderPresenterModel class >> shortDashBorder [

	^ self makeModelFrom: [ :b |
		  b
			  width: self defaultBorderWidth;
			  paint: Color black;
			  dashedSmall ]
]

{ #category : #accessing }
PyramidBorderPresenterModel >> border [

	^ border
]

{ #category : #accessing }
PyramidBorderPresenterModel >> border: anObject [

	border := anObject
]

{ #category : #accessing }
PyramidBorderPresenterModel >> icon [

	^ icon
]

{ #category : #accessing }
PyramidBorderPresenterModel >> icon: anObject [

	icon := anObject
]
