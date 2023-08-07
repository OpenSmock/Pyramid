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
	2023-08-03 15:51:07"

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
							#geometry : @14,
							#strokedBounds : BlBounds {
								#left : 0.0,
								#top : 0.0,
								#right : 300.0,
								#bottom : 300.0
							}
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
							#geometry : @41,
							#strokedBounds : BlBounds {
								#left : 0.0,
								#top : 0.0,
								#right : 280.0,
								#bottom : 280.0
							}
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
				#layout : @29,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @32,
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
			#padding : @61,
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
					#geometry : @63,
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
		#layout : BlBasicLayout { },
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
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
