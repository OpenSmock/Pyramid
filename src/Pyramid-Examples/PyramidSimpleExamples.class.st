Class {
	#name : 'PyramidSimpleExamples',
	#superclass : 'Object',
	#category : 'Pyramid-Examples',
	#package : 'Pyramid-Examples'
}

{ #category : 'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> imageProxy [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-02-04 21:39:53"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 200.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 200.0
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
			#background : BlImageBackground {
				#image : PyramidExternalRessourceProxy {
					#source : PyramidExternalRessourceSource {
						#selector : #''iconNamed:'',
						#target : #Object,
						#arguments : [
							#pharoBig
						]
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #A
			}
		},
		#layout : BlBasicLayout { }
	}
]'
]

{ #category : 'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> little_cat_in_black [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-06-12 10:16:55"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [
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
										#resizer : BlLayoutExactResizer {
											#size : 10.0
										}
									},
									#position : Point [ 43.0, 46.0 ],
									#margin : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @16,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : Float [ #infinity ],
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlEllipseGeometry {
										#extent : Point [ 10.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @19
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
										#identifier : #E
									}
								},
								#layout : BlBasicLayout { }
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @12
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @12
							},
							#position : Point [ -200, 0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @33,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 100.0,
										#bottom : 100.0
									}
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 12,
									#topRight : 12,
									#bottomLeft : 12,
									#bottomRight : 12
								},
								#center : Point [ 50.0, 50.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color [ #white ]
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #C
							}
						},
						#layout : @27
					},
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
										#resizer : BlLayoutExactResizer {
											#size : 10.0
										}
									},
									#position : Point [ 43.0, 46.0 ],
									#margin : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @54,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlEllipseGeometry {
										#extent : Point [ 10.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @56
										}
									},
									#background : @22
								},
								#userData : IdentityDictionary {
									#elementId : BlElementNamedId {
										#identifier : #E
									}
								},
								#layout : BlBasicLayout { }
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @12
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @12
							},
							#position : Point [ 150, 0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @67,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 100.0,
										#bottom : 100.0
									}
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 12,
									#topRight : 12,
									#bottomLeft : 12,
									#bottomRight : 12
								},
								#center : Point [ 50.0, 50.0 ]
							},
							#background : @39
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #D
							}
						},
						#layout : @27
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 50.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @77
					},
					#constraints : {
						Class [ #BlFrameLayout ] : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlVerticalCoordinateTopAlignment {
									#coordinate : 0.3,
									#relativeAlignment : BlTopAlignment { }
								},
								#weight : 1.0
							},
							#horizontal : BlFrameLayoutConstraintsHorizontal {
								#alignment : BlHorizontalCenterAlignment { },
								#weight : 1.0
							}
						},
						Class [ #BlProportionalLayout ] : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0.0,
								#bottom : 1.0
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 373.0, 166.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @81,
					#previouslyAccessedConstraintsType : @80,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlTransparentBackground {
						
					},
					#clipChildren : false
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #eyes
					}
				},
				#layout : @27
			},
			BlElement {
				#children : BlChildrenArray [
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @77
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @77
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 50.0, 50.0 ],
								#pathCache : BlPathCache {
									#geometry : @105
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @41
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #G
							}
						},
						#layout : @27
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 25.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @77
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 50.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @120
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 12,
									#topRight : 12,
									#bottomLeft : 0,
									#bottomRight : 0
								},
								#center : Point [ 25.0, 12.5 ]
							},
							#background : @108
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #H
							}
						},
						#layout : @27
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @77
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @77
					},
					#constraints : {
						@80 : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlVerticalCenterAlignment { },
								#weight : 1.0
							},
							#horizontal : BlFrameLayoutConstraintsHorizontal {
								#alignment : @86,
								#weight : 1.0
							}
						},
						@87 : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0.0,
								#bottom : 1.0
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 373.0, 263.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @131,
					#previouslyAccessedConstraintsType : @80,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlRectangleGeometry { },
					#background : @93
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #nose
					}
				},
				#layout : @27
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
									#size : 150.0
								}
							},
							#position : Point [ 100, 0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 150.0, 10.0 ],
								#pathCache : BlPathCache {
									#geometry : @154,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 150.0,
										#bottom : 10.0
									}
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @41
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #J
							}
						},
						#layout : @27
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
									#size : 150.0
								}
							},
							#position : Point [ 80, 30 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 150.0, 10.0 ],
								#pathCache : BlPathCache {
									#geometry : @171,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 150.0,
										#bottom : 10.0
									}
								}
							},
							#background : @158
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #K
							}
						},
						#layout : @27
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
									#size : 150.0
								}
							},
							#position : Point [ -200, 0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 150.0, 10.0 ],
								#pathCache : BlPathCache {
									#geometry : @186,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 150.0,
										#bottom : 10.0
									}
								}
							},
							#background : @158
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #L
							}
						},
						#layout : @27
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
									#size : 150.0
								}
							},
							#position : Point [ -180, 30 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 150.0, 10.0 ],
								#pathCache : BlPathCache {
									#geometry : @201,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 150.0,
										#bottom : 10.0
									}
								}
							},
							#background : @158
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #M
							}
						},
						#layout : @27
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @77
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @77
					},
					#constraints : {
						@80 : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlVerticalCoordinateTopAlignment {
									#coordinate : 0.6,
									#relativeAlignment : @84
								},
								#weight : 1.0
							},
							#horizontal : BlFrameLayoutConstraintsHorizontal {
								#alignment : @86,
								#weight : 1.0
							}
						},
						@87 : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0.0,
								#bottom : 1.0
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 373.0, 364.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @211,
					#previouslyAccessedConstraintsType : @80,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : @93,
					#clipChildren : false
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #mustach
					}
				},
				#layout : @27
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutMatchParentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @224
			},
			#position : Point [ 0, 0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : @24
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : BlFrameLayout { }
	}
]'
]

{ #category : 'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-23 16:44:14"

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
					#constraints : {
						Class [ #BlProportionalLayout ] : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0,
								#bottom : 0.5
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @12,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 1.0,
								#green : 0.6197458455522972,
								#blue : 0.5689149560117303,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #background-top
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
						@11 : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0.5,
								#bottom : 1
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @31,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.7487781036168133,
								#green : 0.46236559139784944,
								#blue : 0.4232649071358749,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #background-bottom
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutMatchParentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @43
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlTransparentBackground {
				
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : BlProportionalLayout { }
	},
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 250.0 ],
						#pathCache : BlPathCache {
							#geometry : @60
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
								0.8 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.4
								},
								1 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.6
								}
							],
							#innerCenter : Point [ 125, 125 ],
							#innerRadius : 0.0,
							#outerCenter : @69,
							#outerRadius : 125
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #darkShade
					}
				},
				#layout : @24
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0, 0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 250.0 ],
						#pathCache : BlPathCache {
							#geometry : @79
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.6980392156862745
								},
								0.1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.4980392156862745
								},
								1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.0
								}
							],
							#innerCenter : Point [ 70, 70 ],
							#innerRadius : 0.0,
							#outerCenter : @88,
							#outerRadius : 125
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #lightShade
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#position : Point [ 274.0, 126.0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 250.0, 250.0 ],
				#pathCache : BlPathCache {
					#geometry : @98,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 250.0,
						#bottom : 250.0
					}
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.11339198435972629,
						#green : 0.6432062561094819,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #ball
			}
		},
		#layout : @24
	}
]'
]

{ #category : 'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble2 [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-23 16:44:03"

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
					#constraints : {
						Class [ #BlProportionalLayout ] : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0,
								#bottom : 0.5
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @12,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 1.0,
								#green : 0.6197458455522972,
								#blue : 0.5689149560117303,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #background-top
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
						@11 : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0.5,
								#bottom : 1
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @31,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.7487781036168133,
								#green : 0.46236559139784944,
								#blue : 0.4232649071358749,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #background-bottom
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutMatchParentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @43
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlTransparentBackground {
				
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : BlProportionalLayout { }
	},
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 250.0 ],
						#pathCache : BlPathCache {
							#geometry : @60
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
								0.8 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.4
								},
								1 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.6
								}
							],
							#innerCenter : Point [ 125, 125 ],
							#innerRadius : 0.0,
							#outerCenter : @69,
							#outerRadius : 125
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #darkShade
					}
				},
				#layout : @24
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0, 0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 250.0 ],
						#pathCache : BlPathCache {
							#geometry : @79
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.6980392156862745
								},
								0.1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.4980392156862745
								},
								1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.0
								}
							],
							#innerCenter : Point [ 70, 70 ],
							#innerRadius : 0.0,
							#outerCenter : @88,
							#outerRadius : 125
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #lightShade
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#position : Point [ 274.0, 126.0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 250.0, 250.0 ],
				#pathCache : BlPathCache {
					#geometry : @98,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 250.0,
						#bottom : 250.0
					}
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.11339198435972629,
						#green : 0.6432062561094819,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #ball
			}
		},
		#layout : @24
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 100.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#position : Point [ 300, 416 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @115,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 250.0, 100.0 ],
				#pathCache : BlPathCache {
					#geometry : @117,
					#strokedBounds : BlBounds {
						#left : 0.0,
						#top : 0.0,
						#right : 250.0,
						#bottom : 100.0
					}
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.0,
						#green : 0.0,
						#blue : 0.0,
						#alpha : 0.12941176470588237
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #ballShadow
			}
		},
		#layout : BlBasicLayout { }
	}
]'
]

{ #category : 'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> marble3 [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-23 16:43:23"

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
					#constraints : {
						Class [ #BlProportionalLayout ] : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0,
								#bottom : 0.5
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @12,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 1.0,
								#green : 0.6197458455522972,
								#blue : 0.5689149560117303,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #background-top
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
						@11 : BlProportionalLayoutConstraints {
							#vertical : BlProportionalLayoutConstraintsVertical {
								#top : 0.5,
								#bottom : 1
							},
							#horizontal : BlProportionalLayoutConstraintsHorizontal {
								#left : 0.0,
								#right : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @31,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.7487781036168133,
								#green : 0.46236559139784944,
								#blue : 0.4232649071358749,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #background-bottom
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutMatchParentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @43
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlTransparentBackground {
				
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #background
			}
		},
		#layout : BlProportionalLayout { }
	},
	BlElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 250.0 ],
						#pathCache : BlPathCache {
							#geometry : @60
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
								0.8 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.4
								},
								1 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.6
								}
							],
							#innerCenter : Point [ 125, 125 ],
							#innerRadius : 0.0,
							#outerCenter : @69,
							#outerRadius : 125
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #darkShade
					}
				},
				#layout : @24
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0, 0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 250.0 ],
						#pathCache : BlPathCache {
							#geometry : @79
						}
					},
					#background : BlPaintBackground {
						#paint : BlRadialGradientPaint {
							#stops : [
								0 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.6980392156862745
								},
								0.1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.4980392156862745
								},
								1 : Color {
									#red : 1.0,
									#green : 1.0,
									#blue : 1.0,
									#alpha : 0.0
								}
							],
							#innerCenter : Point [ 70, 70 ],
							#innerRadius : 0.0,
							#outerCenter : @88,
							#outerRadius : 125
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #lightShade
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#position : Point [ 274.0, 126.0 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 250.0, 250.0 ],
				#pathCache : BlPathCache {
					#geometry : @98
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.11339198435972629,
						#green : 0.6432062561094819,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #ball
			}
		},
		#layout : @24
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 100.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#position : Point [ 361.0, 416.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @114,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlEllipseGeometry {
				#extent : Point [ 250.0, 100.0 ],
				#pathCache : BlPathCache {
					#geometry : @116
				}
			},
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.0,
						#green : 0.0,
						#blue : 0.0,
						#alpha : 0.12941176470588237
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #ballShadow
			}
		},
		#layout : BlBasicLayout { }
	},
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
						#resizer : BlLayoutExactResizer {
							#size : 280.0
						}
					},
					#position : Point [ 0, 52 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @135,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 280.0, 50.0 ],
						#pathCache : BlPathCache {
							#geometry : @137
						}
					},
					#background : BlPaintBackground {
						#paint : BlLinearGradientPaint {
							#stops : [
								0 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.6980392156862745
								},
								0.8 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.6980392156862745
								},
								1 : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.0
								}
							],
							#start : Point [ 0, 0 ],
							#end : Point [ 280.0, 0.0 ]
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #tableShadow
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
						#resizer : @43
					},
					#position : Point [ 0.0, 50.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 50.0 ],
						#pathCache : BlPathCache {
							#geometry : @158
						}
					},
					#background : BlPaintBackground {
						#paint : BlLinearGradientPaint {
							#stops : [
								0 : Color {
									#red : 0.11339198435972629,
									#green : 0.6432062561094819,
									#blue : 1.0,
									#alpha : 1.0
								},
								0.25 : Color {
									#red : 0.5571847507331378,
									#green : 0.823069403714565,
									#blue : 1.0,
									#alpha : 1.0
								},
								0.75 : Color {
									#red : 0.23558162267839688,
									#green : 0.5219941348973607,
									#blue : 0.7096774193548387,
									#alpha : 1.0
								},
								1 : Color {
									#red : 0.08211143695014662,
									#green : 0.45454545454545453,
									#blue : 0.7018572825024438,
									#alpha : 1.0
								}
							],
							#start : Point [ 0, 0 ],
							#end : Point [ 250.0, 0.0 ]
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #bottom
					}
				},
				#layout : @24
			},
			BlElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0, 25 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : @161
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #medium
					}
				},
				#layout : @24
			},
			BlElement {
				#children : BlChildrenArray [
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 125.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 250.0
								}
							},
							#position : Point [ 69.0, -65.0 ],
							#margin : @16,
							#padding : @16,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @17,
							#maxWidth : @17,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#background : BlPaintBackground {
								#paint : BlRadialGradientPaint {
									#stops : [
										0 : Color {
											#red : 0.0,
											#green : 0.0,
											#blue : 0.0,
											#alpha : 0.4980392156862745
										},
										0.5 : Color {
											#red : 0.0,
											#green : 0.0,
											#blue : 0.0,
											#alpha : 0.4
										},
										1 : Color {
											#red : 0.0,
											#green : 0.0,
											#blue : 0.0,
											#alpha : 0.0
										}
									],
									#innerCenter : Point [ 125, 50 ],
									#innerRadius : 0.0,
									#outerCenter : @198,
									#outerRadius : 125
								}
							}
						},
						#userData : IdentityDictionary {
							#shouldHandleMousePickOutsideEvent : false,
							#elementId : BlElementNamedId {
								#identifier : #ballShadow
							}
						},
						#layout : @24
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @43
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @16,
					#padding : @16,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @17,
					#maxWidth : @17,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 250.0, 50.0 ],
						#pathCache : BlPathCache {
							#geometry : @206
						}
					},
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.4115347018572825,
								#green : 0.7644183773216031,
								#blue : 1.0,
								#alpha : 1.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#shouldHandleMousePickOutsideEvent : false,
					#elementId : BlElementNamedId {
						#identifier : #top
					}
				},
				#layout : @24
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : @110
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 250.0
				}
			},
			#position : Point [ 274, 429 ],
			#margin : @16,
			#padding : @16,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @17,
			#maxWidth : @17,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#geometry : BlRectangleGeometry { },
			#background : @47,
			#clipChildren : false
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #table
			}
		},
		#layout : @24
	}
]'
]

{ #category : 'pyramid-serialized-bloc' }
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

{ #category : 'see class side' }
PyramidSimpleExamples >> seeClassSide [ 
]
