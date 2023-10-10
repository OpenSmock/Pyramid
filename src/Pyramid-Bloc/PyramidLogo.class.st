Class {
	#name : 'PyramidLogo',
	#superclass : 'Object',
	#category : 'Pyramid-Bloc-utils',
	#package : 'Pyramid-Bloc',
	#tag : 'utils'
}

{ #category : 'pyramid-serialized-bloc' }
PyramidLogo class >> logoMedium [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-07 13:52:07"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 50.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @6
			},
			#position : Point [ 0, 0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @9,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : Float [ #infinity ],
			#maxWidth : @10,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlPolygonGeometry {
				#extent : Point [ 50.0, 50.0 ],
				#pathCache : BlPathCache {
					#geometry : @12,
					#strokedBounds : BlBounds {
						#left : -0.5,
						#top : -0.5,
						#right : 30.5,
						#bottom : 60.5
					}
				},
				#vertices : [
					Point [ 0.0, 34.0 ],
					Point [ 30.0, 60.0 ],
					Point [ 30.0, 0.0 ]
				]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : BlStrokeLineButtCap { },
					#lineJoin : BlStrokeLineMiterJoin { },
					#miterLimit : 4.0,
					#dashArray : [ ],
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.38807429130009774,
						#green : 0.7800586510263929,
						#blue : 0.38807429130009774,
						#alpha : 1.0
					}
				}
			},
			#outskirts : BlOutskirtsCentered { }
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
			}
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : @6
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @6
			},
			#position : Point [ 0, 0 ],
			#margin : @9,
			#padding : @9,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @10,
			#maxWidth : @10,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlPolygonGeometry {
				#extent : Point [ 50.0, 50.0 ],
				#pathCache : BlPathCache {
					#geometry : @41,
					#strokedBounds : BlBounds {
						#left : 29.5,
						#top : -0.5,
						#right : 70.5,
						#bottom : 60.5
					}
				},
				#vertices : [
					Point [ 70.0, 30.0 ],
					Point [ 30.0, 60.0 ],
					Point [ 30.0, 0.0 ]
				]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : @22
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @24,
					#lineJoin : @25,
					#miterLimit : 4.0,
					#dashArray : @26,
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #white ]
				}
			},
			#outskirts : @30
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #D
			}
		},
		#layout : @33
	}
]'
]

{ #category : 'pyramid-serialized-bloc' }
PyramidLogo class >> logoOpenInPyramid [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-07-31 13:52:21"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 50.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @6
			},
			#position : Point [ 9.0, 8.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @9,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : Float [ #infinity ],
			#maxWidth : @10,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlPolygonGeometry {
				#extent : Point [ 50.0, 50.0 ],
				#pathCache : BlPathCache {
					#geometry : @12,
					#strokedBounds : BlBounds {
						#left : -0.5,
						#top : -0.5,
						#right : 30.5,
						#bottom : 60.5
					}
				},
				#vertices : [
					Point [ 0.0, 34.0 ],
					Point [ 30.0, 60.0 ],
					Point [ 30.0, 0.0 ]
				]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : BlStrokeLineButtCap { },
					#lineJoin : BlStrokeLineMiterJoin { },
					#miterLimit : 4.0,
					#dashArray : [ ],
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.38807429130009774,
						#green : 0.7800586510263929,
						#blue : 0.38807429130009774,
						#alpha : 1.0
					}
				}
			},
			#outskirts : BlOutskirtsCentered { },
			#elevation : BlRelativeElevation {
				#elevation : 2
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #logo1
			}
		},
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : @6
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @6
			},
			#position : Point [ 9.0, 8.0 ],
			#margin : @9,
			#padding : @9,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @10,
			#maxWidth : @10,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlPolygonGeometry {
				#extent : Point [ 50.0, 50.0 ],
				#pathCache : BlPathCache {
					#geometry : @44,
					#strokedBounds : BlBounds {
						#left : 29.5,
						#top : -0.5,
						#right : 70.5,
						#bottom : 60.5
					}
				},
				#vertices : [
					Point [ 70.0, 30.0 ],
					Point [ 30.0, 60.0 ],
					Point [ 30.0, 0.0 ]
				]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : @22
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @24,
					#lineJoin : @25,
					#miterLimit : 4.0,
					#dashArray : @26,
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #white ]
				}
			},
			#outskirts : @30,
			#elevation : BlRelativeElevation {
				#elevation : 2
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #logo2
			}
		},
		#layout : @34,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @37,
			#handlers : [ ]
		}
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 80.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 260.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @71,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @10,
			#maxWidth : @10,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : @22
				},
				#width : 2,
				#style : BlStrokeStyle {
					#lineCap : BlStrokeLineButtCap { },
					#lineJoin : BlStrokeLineMiterJoin { },
					#miterLimit : 4.0,
					#dashArray : [ ],
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : BlPaintBackground {
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 0.855327468230694,
							#green : 0.7644183773216031,
							#blue : 0.42717497556207235,
							#alpha : 1.0
						},
						1 : Color {
							#red : 0.9100684261974584,
							#green : 0.8592375366568915,
							#blue : 0.6549364613880743,
							#alpha : 1.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 0.0, 80.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @63,
			#handlers : [ ]
		}
	},
	BlTextElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutFitContentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @95
			},
			#position : Point [ 92, 30 ],
			#margin : @71,
			#padding : @71,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @10,
			#maxWidth : @10,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlDefaultVisuals { },
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #label
			}
		},
		#layout : @88,
		#text : BlRopedText {
			#rope : BlAttributeRope {
				#attributes : [
					BlFontSizeAttribute {
						#isOverwritableByStyler : true,
						#size : 20
					},
					BlFontWeightAttribute {
						#isOverwritableByStyler : true,
						#weight : 700
					}
				],
				#rope : BlCollectionRope {
					#collection : ''Open in Pyramid''
				}
			}
		}
	}
]'
]
