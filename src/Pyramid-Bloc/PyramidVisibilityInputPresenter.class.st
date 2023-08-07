Class {
	#name : #PyramidVisibilityInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonVisible',
		'whenValueChangedDo',
		'value',
		'buttonNotVisible'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocEyeClose [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 13:53:35"

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
					#size : 32.0
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
				#extent : Point [ 32.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @13,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 32.0,
						#bottom : 16.0
					}
				}
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
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
						#alpha : 1.0
					}
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
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocEyeOpen [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 13:56:27"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 8.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 8.0
						}
					},
					#position : Point [ 12, 4 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @12,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @13,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlCircleGeometry {
						#extent : Point [ 8.0, 8.0 ],
						#pathCache : BlPathCache {
							#geometry : @15
						},
						#radius : 4.0,
						#origin : Point [ 0.0, 0.0 ]
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
								#red : 0.6862170087976539,
								#green : 0.8357771260997068,
								#blue : 0.9804496578690127,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #iris
					}
				},
				#layout : BlBasicLayout { },
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @4,
					#handlers : [ ]
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 32.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @12,
			#padding : @12,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @13,
			#maxWidth : @13,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 32.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @41,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 32.0,
						#bottom : 16.0
					}
				}
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : @21
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @23,
					#lineJoin : @24,
					#miterLimit : 4.0,
					#dashArray : @25,
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.9022482893450635,
						#green : 0.9022482893450635,
						#blue : 0.9022482893450635,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : @31,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocEyeUnknow [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 13:55:32"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 8.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 8.0
						}
					},
					#position : Point [ 12, 4 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @12,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @13,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlCircleGeometry {
						#extent : Point [ 8.0, 8.0 ],
						#pathCache : BlPathCache {
							#geometry : @15,
							#strokedBounds : BlBounds {
								#left : 0.0,
								#top : 0.0,
								#right : 8.0,
								#bottom : 8.0
							}
						},
						#radius : 4.0,
						#origin : Point [ 0.0, 0.0 ]
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
					#background : BlTransparentBackground {
						
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #iris
					}
				},
				#layout : BlBasicLayout { },
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @4,
					#handlers : [ ]
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 16.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 32.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @12,
			#padding : @12,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @13,
			#maxWidth : @13,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 32.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @40,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 32.0,
						#bottom : 16.0
					}
				}
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
					#color : Color {
						#red : 1.0,
						#green : 0.8592375366568915,
						#blue : 0.2590420332355816,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : @30,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocGone [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 15:00:30"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 0, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 1.0,
						#blue : 0.3333333333333333,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
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
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 11, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.3333333333333333,
						#green : 0.3333333333333333,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #E
			}
		},
		#layout : @18,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @21,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocHidden [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 15:00:12"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 0, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 1.0,
						#blue : 0.3333333333333333,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
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
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 11, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 1.0,
						#green : 0.3333333333333333,
						#blue : 0.3333333333333333,
						#alpha : 0.2980392156862745
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #D
			}
		},
		#layout : @18,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @21,
			#handlers : [ ]
		}
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 22, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.3333333333333333,
						#green : 0.3333333333333333,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #E
			}
		},
		#layout : @18,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @37,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocVisibilityUnknow [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 15:04:00"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 0, 3 ],
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
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 1.0
						},
						1 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 0.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 8.0, 0.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
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
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 11, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 1.0
						},
						1 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 0.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 8.0, 0.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #D
			}
		},
		#layout : @22,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @25,
			#handlers : [ ]
		}
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 22, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 1.0
						},
						1 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 0.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 8.0, 0.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #E
			}
		},
		#layout : @22,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @45,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocVisible [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-02 14:59:48"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 0, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 1.0,
						#blue : 0.3333333333333333,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
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
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 11, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 1.0,
						#green : 0.3333333333333333,
						#blue : 0.3333333333333333,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #D
			}
		},
		#layout : @18,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @21,
			#handlers : [ ]
		}
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 22, 3 ],
			#margin : @10,
			#padding : @10,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @11,
			#maxWidth : @11,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.3333333333333333,
						#green : 0.3333333333333333,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #E
			}
		},
		#layout : @18,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @37,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formEyeClose [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocEyeClose materializeAsBlElement) exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formEyeOpen [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocEyeOpen materializeAsBlElement) exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formEyeUnknow [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocEyeUnknow materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formGone [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocGone materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formHidden [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocHidden materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formVisibilityUnknow [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocVisibilityUnknow materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formVisible [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocVisible materializeAsBlElement) exportAsForm
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> buttonNotVisible [

	^ buttonNotVisible
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> buttonVisible [

	^ buttonVisible
]

{ #category : #layout }
PyramidVisibilityInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonVisible expand: false;
		  add: self buttonNotVisible expand: true;
		  yourself
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :visibility |  ].
	buttonVisible := SpButtonPresenter new
		                 icon: self class formEyeUnknow;
		                 action: [
			                 self value switchVisibleOn: self.
			                 self whenValueChangedDo value: self value ];
		                 enabled: false;
		                 yourself.
	buttonNotVisible := SpButtonPresenter new
		                    icon: self class formVisibilityUnknow;
								  label: 'No value';
		                    action: [
			                    self value switchNotVisibleOn: self.
			                    self whenValueChangedDo value: self value ];
		                    enabled: false;
		                    yourself
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> setVisibilityEmptyValue [

	self buttonNotVisible
		enabled: false;
		label: 'No value';
		icon: self class formVisibilityUnknow.
	self buttonVisible
		enabled: false;
		icon: self class formEyeUnknow
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityGone [

	self buttonNotVisible
		enabled: true;
		label: 'Gone';
		icon: self class formGone.
	self buttonVisible
		enabled: true;
		icon: self class formEyeClose
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityHidden [

	self buttonNotVisible
		enabled: true;
		label: 'Hidden';
		icon: self class formHidden.
	self buttonVisible
		enabled: true;
		icon: self class formEyeClose
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> setVisibilityMixedValues [

	self buttonNotVisible
		enabled: false;
		label: 'Mixed';
		icon: self class formVisibilityUnknow.
	self buttonVisible
		enabled: false;
		icon: self class formEyeUnknow
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityVisible [

	self buttonNotVisible
		enabled: true;
		label: 'Visible';
		icon: self class formVisible.
	self buttonVisible
		enabled: true;
		icon: self class formEyeOpen
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter >> value [

	^ value
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter >> value: aBlVisibility [

	value := aBlVisibility.
	aBlVisibility setVisibilityOn: self
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
