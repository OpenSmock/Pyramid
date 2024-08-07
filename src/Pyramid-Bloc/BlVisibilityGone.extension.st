Extension { #name : #BlVisibilityGone }

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> asString [

	^ 'gone'
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone class >> blocIcon [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-08-02 09:26:40"

	<pyStash>
	^ [
	  | blinsets1 |
	  blinsets1 := BlInsets
		               top: 0.0
		               right: 2.0
		               bottom: 0.0
		               left: 0.0.
	  { (BlElement new
		   geometry: BlRectangleGeometry new;
		   constraintsDo: [ :constraints |
			   constraints horizontal exact: 24.0.
			   constraints vertical exact: 12.0 ];
		   layout: BlLinearLayout horizontal;
		   addChildren: {
				   (BlElement new
					    background: (BlPaintBackground new
							     paint: (BlColorPaint new
									      color: (Color
											       r: 0.5728250244379277
											       g: 0.8191593352883676
											       b: 1.0
											       alpha: 1.0);
									      yourself);
							     opacity: 1.0;
							     yourself);
					    border: (BlBorderBuilder new
							     paint: (BlColorPaint new
									      color: (Color
											       r: 0.0
											       g: 0.0
											       b: 0.0
											       alpha: 1.0);
									      yourself);
							     build);
					    geometry: BlRectangleGeometry new;
					    constraintsDo: [ :constraints |
						    constraints horizontal matchParent.
						    constraints vertical matchParent.
						    constraints margin: blinsets1 ];
					    id: #B;
					    yourself).
				   (BlElement new
					    background: (BlPaintBackground new
							     paint: (BlColorPaint new
									      color: (Color
											       r: 0.5728250244379277
											       g: 0.8191593352883676
											       b: 1.0
											       alpha: 1.0);
									      yourself);
							     opacity: 1.0;
							     yourself);
					    border: (BlBorderBuilder new
							     paint: (BlColorPaint new
									      color: (Color
											       r: 0.0
											       g: 0.0
											       b: 0.0
											       alpha: 1.0);
									      yourself);
							     build);
					    geometry: BlRectangleGeometry new;
					    constraintsDo: [ :constraints |
						    constraints horizontal matchParent.
						    constraints vertical matchParent.
						    constraints margin: blinsets1 ];
					    id: #C;
					    yourself).
				   (BlElement new
					    background: (BlPaintBackground new
							     paint: (BlColorPaint new
									      color: (Color
											       r: 0.5728250244379277
											       g: 0.8191593352883676
											       b: 1.0
											       alpha: 1.0);
									      yourself);
							     opacity: 1.0;
							     yourself);
					    border: (BlBorderBuilder new
							     paint: (BlColorPaint new
									      color: (Color
											       r: 0.0
											       g: 0.0
											       b: 0.0
											       alpha: 1.0);
									      yourself);
							     build);
					    geometry: BlRectangleGeometry new;
					    visibility: BlVisibility hidden;
					    constraintsDo: [ :constraints |
						    constraints horizontal matchParent.
						    constraints vertical matchParent ];
					    id: #D;
					    yourself) };
		   id: #A;
		   yourself) } ] value
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> nextVisibilityForTree [

	^ BlVisibility visible
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> setVisibilityOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter setVisibilityGone
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> switchNotVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility hidden.
]

{ #category : #'*Pyramid-Bloc' }
BlVisibilityGone >> switchVisibleOn: aPyramidVisibilityInputPresenter [

	aPyramidVisibilityInputPresenter value: BlVisibility visible
]
