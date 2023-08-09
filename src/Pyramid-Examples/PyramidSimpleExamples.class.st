Class {
	#name : #PyramidSimpleExamples,
	#superclass : #Object,
	#category : #'Pyramid-Examples'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> little_cat [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-07-27 12:03:13"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 50.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#position : Point [ 200, 80 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color [ #green ]
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #eyeLeft
					}
				},
				#layout : BlBasicLayout { },
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @4,
					#handlers : [ ]
				}
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#position : Point [ 20, 80 ],
					#margin : @11,
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @12,
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : @16
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #eyeRight
					}
				},
				#layout : @19,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @22,
					#handlers : [ ]
				}
			},
			BlElement {
				#children : BlChildrenArray [
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 10.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 200.0
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @11,
							#padding : @11,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @12,
							#maxWidth : @12,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color [ #blue ]
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #mustach1
							}
						},
						#layout : @19,
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
									#size : 10.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 200.0
								}
							},
							#position : Point [ 0, 20 ],
							#margin : @11,
							#padding : @11,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @12,
							#maxWidth : @12,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @16
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #mustach2
							}
						},
						#layout : @19,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @53,
							#handlers : [ ]
						}
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 10.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 200.0
								}
							},
							#position : Point [ 0, 40 ],
							#margin : @11,
							#padding : @11,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @12,
							#maxWidth : @12,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @16
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #mustach3
							}
						},
						#layout : @19,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @68,
							#handlers : [ ]
						}
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 10.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 200.0
								}
							},
							#position : Point [ -200, 0 ],
							#margin : @11,
							#padding : @11,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @12,
							#maxWidth : @12,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @16
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #mustach4
							}
						},
						#layout : @19,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @83,
							#handlers : [ ]
						}
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 10.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 200.0
								}
							},
							#position : Point [ -200, 20 ],
							#margin : @11,
							#padding : @11,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @12,
							#maxWidth : @12,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @16
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #mustach5
							}
						},
						#layout : @19,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @98,
							#handlers : [ ]
						}
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 10.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 200.0
								}
							},
							#position : Point [ -200, 40 ],
							#margin : @11,
							#padding : @11,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @12,
							#maxWidth : @12,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @16
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #mustach6
							}
						},
						#layout : @19,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @113,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#position : Point [ 100, 150 ],
					#margin : @11,
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @12,
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : @48
						}
					},
					#clipChildren : false
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #nose
					}
				},
				#layout : @19,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @35,
					#handlers : [ ]
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 300.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 300.0
				}
			},
			#position : Point [ 0.0, 1.0 ],
			#margin : @11,
			#padding : @11,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @12,
			#maxWidth : @12,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 300.0, 300.0 ],
				#pathCache : BlPathCache {
					#geometry : @146,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 300.0,
						#bottom : 300.0
					}
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #red ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : @19,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-09 10:46:08"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutMatchParentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 300.0, 300.0 ],
						#pathCache : BlPathCache {
							#geometry : @14
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.0
								},
								0.3 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.0
								},
								0.6 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.2
								},
								1 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.8
								}
							],
							#center : Point [ 150, 150 ],
							#radius : 150
						}
					},
					#visibility : BlVisibilityVisible { }
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #innerShadow
					}
				},
				#layout : BlBasicLayout { }
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 280.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 280.0
						}
					},
					#position : Point [ 4.0, 4.0 ],
					#margin : @11,
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @12,
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 280.0, 280.0 ],
						#pathCache : BlPathCache {
							#geometry : @38
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color [ #white ],
								1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.0
								}
							],
							#center : Point [ 50, 50 ],
							#radius : 120
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #lightSource
					}
				},
				#layout : @28
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 300.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 300.0
				}
			},
			#position : Point [ 0.0, 1.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @55,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @12,
			#maxWidth : @12,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 300.0, 300.0 ],
				#pathCache : BlPathCache {
					#geometry : @57
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.9296187683284457,
						#green : 0.40371456500488756,
						#blue : 0.8396871945259042,
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
		#layout : BlBasicLayout { }
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble2 [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-03 16:26:21"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutMatchParentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 300.0, 300.0 ],
						#pathCache : BlPathCache {
							#geometry : @14
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.0
								},
								0.3 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.0
								},
								0.6 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.2
								},
								1 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.8
								}
							],
							#center : Point [ 150, 150 ],
							#radius : 150
						}
					},
					#visibility : BlVisibilityVisible { }
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #innerShadow
					}
				},
				#layout : BlBasicLayout { },
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @4,
					#handlers : [ ]
				}
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 280.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 280.0
						}
					},
					#position : Point [ 5, 5 ],
					#margin : @11,
					#padding : @11,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @12,
					#maxWidth : @12,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 280.0, 280.0 ],
						#pathCache : BlPathCache {
							#geometry : @40
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color [ #white ],
								1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.0
								}
							],
							#center : Point [ 50, 50 ],
							#radius : 120
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #lightSource
					}
				},
				#layout : @28,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @31,
					#handlers : [ ]
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 300.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 300.0
				}
			},
			#position : Point [ 0.0, 1.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @59,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @12,
			#maxWidth : @12,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 300.0, 300.0 ],
				#pathCache : BlPathCache {
					#geometry : @61,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 300.0,
						#bottom : 300.0
					}
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.3724340175953079,
						#green : 0.855327468230694,
						#blue : 0.8670576735092864,
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
PyramidSimpleExamples class >> simpleFlowLayout [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-08-09 13:29:22"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 100.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						Class [ #BlFlowLayout ] : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : BlTopAlignment { }
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : BlHorizontalStartAlignment { }
							},
							#newLine : false,
							#weight : 0,
							#display : BlFlowLayoutInline { }
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 5.0,
						#left : 5.0,
						#bottom : 5.0,
						#right : 5.0
					},
					#padding : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @12,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.6764418377321603,
								#green : 0.7908113391984359,
								#blue : 0.9726295210166178,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #B
					}
				},
				#layout : BlBasicLayout { }
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						@11 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @14
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @16
							},
							#newLine : false,
							#weight : 0,
							#display : @17
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @20,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @35,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.2482893450635386,
								#green : 0.6451612903225806,
								#blue : 0.6148582600195504,
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
				#layout : @28
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						@11 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @14
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @16
							},
							#newLine : false,
							#weight : 0,
							#display : @17
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @20,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @51,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.8983382209188661,
								#green : 0.3128054740957967,
								#blue : 0.5053763440860215,
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
				#layout : @28
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						@11 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @14
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @16
							},
							#newLine : false,
							#weight : 0,
							#display : @17
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @20,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @67,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.15640273704789834,
								#green : 0.20625610948191594,
								#blue : 0.7223851417399805,
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
				#layout : @28
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						@11 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @14
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @16
							},
							#newLine : false,
							#weight : 0,
							#display : @17
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @20,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @83,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.8778103616813294,
								#green : 0.83088954056696,
								#blue : 0.4868035190615836,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #F
					}
				},
				#layout : @28
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						@11 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @14
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @16
							},
							#newLine : false,
							#weight : 0,
							#display : @17
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @19,
					#padding : @20,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @21,
					#maxWidth : @21,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @99,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.16911045943304007,
								#green : 0.5141739980449658,
								#blue : 0.7429130009775171,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #G
					}
				},
				#layout : @28
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutFitContentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @111
			},
			#position : Point [ 0, 0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @114,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @21,
			#maxWidth : @21,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlTransparentBackground {
				
			},
			#clipChildren : false
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #A
			}
		},
		#layout : BlFlowLayout {
			#measurer : BlFlowLayoutMeasurer {
				#layout : @119,
				#children : OrderedCollection [
					BlFlowLayoutInlineChild {
						#width : 100.0,
						#height : 100.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 0,
						#startBreadth : 0,
						#element : @4,
						#alignment : BlCompositeAlignment {
							#vertical : @14,
							#horizontal : @16,
							#direction : BlLayoutLeftToRight { }
						},
						#measurer : @120,
						#display : @17
					},
					BlFlowLayoutInlineChild {
						#width : 100.0,
						#height : 100.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 110.0,
						#startBreadth : 0.0,
						#element : @29,
						#alignment : BlCompositeAlignment {
							#vertical : @14,
							#horizontal : @16,
							#direction : @124
						},
						#measurer : @120,
						#display : @17
					},
					BlFlowLayoutInlineChild {
						#width : 100.0,
						#height : 100.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 220.0,
						#startBreadth : 0.0,
						#element : @45,
						#alignment : BlCompositeAlignment {
							#vertical : @14,
							#horizontal : @16,
							#direction : @124
						},
						#measurer : @120,
						#display : @17
					},
					BlFlowLayoutInlineChild {
						#width : 100.0,
						#height : 100.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 330.0,
						#startBreadth : 0.0,
						#element : @61,
						#alignment : BlCompositeAlignment {
							#vertical : @14,
							#horizontal : @16,
							#direction : @124
						},
						#measurer : @120,
						#display : @17
					},
					BlFlowLayoutInlineChild {
						#width : 100.0,
						#height : 100.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 440.0,
						#startBreadth : 0.0,
						#element : @77,
						#alignment : BlCompositeAlignment {
							#vertical : @14,
							#horizontal : @16,
							#direction : @124
						},
						#measurer : @120,
						#display : @17
					},
					BlFlowLayoutInlineChild {
						#width : 100.0,
						#height : 100.0,
						#margin : @19,
						#weight : 0,
						#newLine : false,
						#startLength : 550.0,
						#startBreadth : 0.0,
						#element : @93,
						#alignment : BlCompositeAlignment {
							#vertical : @14,
							#horizontal : @16,
							#direction : @124
						},
						#measurer : @120,
						#display : @17
					}
				],
				#lines : OrderedCollection [
					BlFlowLayoutLine {
						#children : OrderedCollection [
							@122,
							@125,
							@127,
							@129,
							@131,
							@133
						],
						#startLength : 0,
						#startBreadth : 0,
						#length : 660.0,
						#breadth : 110.0,
						#measurer : @120
					}
				],
				#orientation : BlFlowLayoutHorizontal { },
				#maxWidth : 0.0,
				#maxHeight : 0.0,
				#widthMode : BlMeasurementSpec {
					#size : 0.0,
					#mode : BlMeasurementUnspecifiedMode { }
				},
				#heightMode : BlMeasurementSpec {
					#size : 0.0,
					#mode : @140
				},
				#checkCanFit : false
			},
			#orientation : BlLayoutHorizontal { },
			#horizontalAlignment : @16,
			#verticalAlignment : @14
		}
	}
]'
]
