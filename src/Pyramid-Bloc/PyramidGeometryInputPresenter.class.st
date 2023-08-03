Class {
	#name : #PyramidGeometryInputPresenter,
	#superclass : #PyramidInputPresenter,
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#instVars : [
		'whenValueChangedDo',
		'buttonRectangle',
		'buttonEllipse',
		'buttonRoundedRectangle',
		'buttonVertices',
		'geometry'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidGeometryInputPresenter class >> ellipse [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-03 16:03:22"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : Float [ #infinity ],
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 16.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @13
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #geometry
			}
		},
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter class >> iconOf: aBloc inColor: aColor [.

	^ (aBloc background: aColor) exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter class >> iconOfEllipseinColor: aColor [

	^ self iconOf: self ellipse materializeAsBlElement first inColor: aColor
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter class >> iconOfRectangleinColor: aColor [

	^ self iconOf: self rectangle materializeAsBlElement first inColor: aColor
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter class >> iconOfRoudedRectangleinColor: aColor [

	^ self iconOf: self roundedRectangle materializeAsBlElement first inColor: aColor
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter class >> iconOfVerticesinColor: aColor [

	^ self iconOf: self vertices materializeAsBlElement first inColor: aColor
]

{ #category : #'pyramid-serialized-bloc' }
PyramidGeometryInputPresenter class >> rectangle [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-03 16:02:46"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : Float [ #infinity ],
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #geometry
			}
		},
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidGeometryInputPresenter class >> roundedRectangle [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-03 16:05:04"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : Float [ #infinity ],
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlRoundedRectangleGeometry {
				#extent : Point [ 16.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @13
				},
				#cornerRadii : BlCornerRadii {
					#topLeft : 5,
					#topRight : 5,
					#bottomLeft : 5,
					#bottomRight : 5
				},
				#center : Point [ 8.0, 8.0 ]
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #geometry
			}
		},
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidGeometryInputPresenter class >> vertices [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-03 16:33:29"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : Float [ #infinity ],
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlPolygonGeometry {
				#extent : Point [ 16.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @13
				},
				#vertices : [
					Point [ 8.0, 0.0 ],
					Point [ 13.0, 16.0 ],
					Point [ 0.0, 6.0 ],
					Point [ 16.0, 6.0 ],
					Point [ 3.0, 16.0 ]
				]
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #geometry
			}
		},
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> buttonEllipse [

	^ buttonEllipse
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> buttonRectangle [

	^ buttonRectangle
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> buttonRoundedRectangle [

	^ buttonRoundedRectangle
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> buttonVertices [

	^ buttonVertices
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> colorError [

	^ Color orange
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> colorNormal [

	^ Color black
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> colorSelected [

	^ Color blue lighter
]

{ #category : #layout }
PyramidGeometryInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonRectangle width: 24;
		add: self buttonEllipse width: 24;
		add: self buttonRoundedRectangle width: 24;
		add: self buttonVertices width: 24;
		  yourself
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> geometry [

	^ geometry.
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> geometry: anObject [

	geometry := anObject
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :geo |  ].
	buttonRectangle := SpButtonPresenter new.
	buttonEllipse := SpButtonPresenter new.
	buttonRoundedRectangle := SpButtonPresenter new.
	buttonVertices := SpButtonPresenter new.

	self setUnknowGeometry
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> resetAllButtons [

	self buttonRectangle
		icon: (self class iconOfRectangleinColor: self colorNormal);
		action: [
			self value: BlRectangleGeometry new.
			self whenValueChangedDo value: self value ];
		help: 'Change to rectangle geometry'.
	self buttonEllipse
		icon: (self class iconOfEllipseinColor: self colorNormal);
		action: [
			self value: BlEllipseGeometry new.
			self whenValueChangedDo value: self value ];
		help: 'Change to ellipse geometry'.
	self buttonRoundedRectangle
		icon: (self class iconOfRoudedRectangleinColor: self colorNormal);
		action: [
			self value: (BlRoundedRectangleGeometry cornerRadius: 16).
			self whenValueChangedDo value: self value ];
		help: 'Change to rounded rectangle geometry'.
	self buttonVertices
		icon: (self class iconOfVerticesinColor: self colorNormal);
		action: [
			self value: (BlPolygonGeometry vertices: {
								 (80 @ 0).
								 (130 @ 160).
								 (0 @ 60).
								 (160 @ 60).
								 (30 @ 160) }).
			self whenValueChangedDo value: self value ];
		help: 'Change to vertices geometry'
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> setEllipseGeometry [

	self resetAllButtons.
	self buttonEllipse
		action: [  ];
		icon: (self class iconOfEllipseinColor: self colorSelected)
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> setRectangleGeometry [

	self resetAllButtons.
	self buttonRectangle
		action: [  ];
		icon: (self class iconOfRectangleinColor: self colorSelected)
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> setRoundedRectangleGeometry [

	self resetAllButtons.
	self buttonRoundedRectangle
		action: [  ];
		icon: (self class iconOfRoudedRectangleinColor: self colorSelected)
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> setUnknowGeometry [

	self buttonRectangle
		icon: (self class iconOfRectangleinColor: self colorError);
		action: [  ];
		help: 'Will do nothing.'.
	self buttonRoundedRectangle
		icon: (self class iconOfRoudedRectangleinColor: self colorError);
		action: [  ];
		help: 'Will do nothing.'.
	self buttonEllipse
		icon: (self class iconOfEllipseinColor: self colorError);
		action: [  ];
		help: 'Will do nothing.'.
	self buttonVertices
		icon: (self class iconOfVerticesinColor: self colorError);
		action: [  ];
		help: 'Will do nothing.'
]

{ #category : #initialization }
PyramidGeometryInputPresenter >> setVerticesGeometry [

	self resetAllButtons.
	self buttonVertices
		action: [  ];
		icon: (self class iconOfVerticesinColor: self colorSelected)
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> value [

	^ self geometry
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> value: aBlGeometry [

	self geometry: aBlGeometry.
	aBlGeometry setGeometryOn: self
]

{ #category : #accessing }
PyramidGeometryInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #'as yet unclassified' }
PyramidGeometryInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
