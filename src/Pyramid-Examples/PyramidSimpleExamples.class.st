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

{ #category : 'pyramid-serialized-bloc' }
PyramidSimpleExamples class >> svgCat [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-06-18 10:01:40"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
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
								#resizer : @10
							},
							#position : Point [ -20, 1380 ],
							#margin : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : Float [ #infinity ],
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @16,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M8860 12794 c-14 -2 -59 -9 -100 -15 -239 -33 -517 -147 -776 -317 -253 -167 -443 -325 -819 -682 -289 -274 -407 -378 -542 -479 -519 -386 -1257 -658 -2443 -901 l-156 -32 -89 58 c-553 357 -1131 620 -1767 804 -195 57 -477 122 -628 146 -125 19 -378 22 -470 5 -396 -73 -610 -344 -660 -836 -17 -158 -8 -489 20 -755 94 -917 291 -1732 625 -2595 130 -336 155 -428 155 -568 -1 -133 -47 -238 -167 -378 -26 -31 -117 -129 -200 -218 -84 -89 -193 -216 -242 -281 -327 -434 -515 -957 -583 -1620 -17 -164 -17 -713 0 -895 41 -446 102 -807 228 -1360 75 -325 82 -363 100 -490 18 -130 46 -197 103 -251 33 -32 139 -89 148 -80 2 1 -15 56 -37 122 -331 981 -467 2193 -345 3069 63 449 180 794 364 1066 84 125 155 206 249 283 417 340 958 352 1592 35 731 -366 1229 -927 1365 -1539 26 -118 31 -375 10 -501 -81 -484 -404 -847 -863 -971 -121 -33 -373 -37 -520 -9 -458 88 -858 409 -1068 857 -25 55 -62 131 -80 171 -64 135 -170 194 -224 125 -50 -62 -4 -272 106 -482 83 -160 174 -280 324 -431 228 -229 457 -359 755 -427 138 -32 259 -42 645 -52 374 -10 459 -19 603 -65 115 -37 218 -87 326 -159 133 -89 222 -165 476 -406 251 -238 343 -317 469 -402 118 -79 219 -129 347 -171 94 -32 188 -52 609 -132 404 -78 626 -196 775 -414 l46 -68 -25 -89 c-67 -241 -97 -383 -87 -403 12 -22 107 -61 151 -61 58 0 66 17 130 273 86 350 118 437 206 568 110 164 210 287 348 425 394 392 882 646 1363 709 611 80 1175 -201 1482 -740 132 -232 196 -482 189 -743 l-3 -132 30 -12 c96 -40 221 27 261 139 18 52 17 209 -2 318 -47 272 -223 638 -431 895 -61 75 -221 235 -320 320 l-53 45 236 415 c707 1245 769 1347 864 1433 94 85 219 109 337 65 78 -28 185 -136 231 -229 96 -197 82 -365 -63 -767 -116 -325 -141 -460 -132 -720 8 -257 61 -471 177 -711 149 -307 359 -552 628 -732 123 -83 235 -137 379 -185 180 -61 272 -48 338 45 l30 43 -2 236 c-4 659 -168 1348 -472 1977 -103 213 -190 365 -326 570 -138 207 -243 342 -456 585 -195 223 -275 333 -340 465 -66 136 -89 237 -89 395 0 160 16 253 94 563 104 407 141 633 155 939 22 501 -50 960 -239 1510 -33 97 -128 346 -211 555 -364 913 -411 1112 -454 1933 -24 472 -43 684 -76 880 -79 471 -251 842 -508 1101 -185 185 -377 292 -623 345 -70 15 -326 27 -378 18z m310 -389 c418 -154 764 -684 909 -1391 108 -528 85 -1038 -69 -1488 -33 -99 -38 -156 -15 -200 8 -15 57 -85 109 -155 564 -762 742 -1203 850 -2111 61 -511 54 -960 -25 -1530 -45 -325 -135 -704 -195 -821 -7 -15 -50 -134 -95 -265 -44 -131 -103 -288 -130 -349 -194 -433 -500 -797 -942 -1118 -234 -171 -447 -291 -883 -498 -1049 -498 -1480 -649 -1998 -700 -175 -17 -564 -6 -736 20 -370 58 -792 181 -1245 363 -458 184 -929 419 -971 483 -24 37 -11 67 55 124 33 29 83 84 112 124 29 40 73 99 97 132 54 72 105 178 127 260 23 84 30 291 16 411 -18 141 -54 305 -116 526 -122 439 -218 648 -386 848 -30 36 -77 94 -104 130 -28 36 -78 96 -112 133 -96 105 -96 126 1 238 35 41 100 116 145 168 219 254 389 514 675 1034 277 502 376 870 445 1652 40 444 37 631 -13 829 -44 172 -163 438 -242 542 -49 64 -64 98 -64 149 0 41 5 51 45 94 95 102 276 168 815 299 380 93 898 177 1175 191 102 5 150 12 177 25 68 33 188 172 323 374 71 106 165 237 209 290 104 125 381 407 508 520 360 316 881 621 1175 686 109 25 279 16 373 -19z m-7618 -2080 c128 -22 260 -69 398 -142 439 -231 634 -454 690 -793 32 -188 -30 -385 -184 -590 -123 -164 -422 -426 -566 -497 -173 -85 -303 -10 -472 273 -146 245 -255 484 -322 707 -44 145 -122 492 -136 601 -29 233 80 406 280 445 72 14 220 12 312 -4z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : BlSvgColor {
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.0
									}
								},
								#width : 1.0,
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
									#color : Color [ #black ]
								}
							},
							#outskirts : BlOutskirtsCentered { }
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @39,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M8851 11829 c-71 -12 -216 -61 -288 -98 -259 -131 -535 -391 -766 -724 -137 -196 -187 -308 -187 -419 0 -132 69 -206 275 -293 50 -21 252 -119 449 -218 198 -98 387 -190 420 -202 177 -66 342 -72 461 -17 221 104 336 414 322 872 -6 190 -21 294 -86 585 -44 196 -55 235 -96 314 -85 168 -265 239 -504 200z m64 -342 c64 -67 101 -182 179 -547 47 -223 67 -393 69 -586 2 -146 0 -164 -17 -183 -37 -41 -114 -24 -335 70 -210 90 -382 193 -576 344 -163 127 -194 188 -142 284 37 70 256 350 350 448 138 143 260 212 376 213 51 0 57 -3 96 -43z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @56,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M8896 7075 c-33 -13 -110 -58 -170 -98 -61 -41 -150 -100 -197 -131 -98 -63 -185 -152 -220 -223 -35 -72 -38 -174 -7 -232 36 -68 87 -103 153 -109 53 -4 57 -3 89 32 23 24 48 72 76 143 69 180 119 240 260 306 113 54 177 42 294 -55 32 -27 73 -56 90 -66 42 -22 141 -22 184 1 69 37 92 129 53 206 -30 58 -123 137 -215 181 -156 75 -282 90 -390 45z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : Color [ #black ]
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @74,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M10005 6115 c-133 -23 -455 -129 -567 -186 -47 -24 -78 -64 -78 -101 0 -39 32 -100 70 -132 51 -42 99 -36 233 29 98 48 126 57 222 71 86 12 126 24 184 52 85 43 92 55 95 159 1 60 -2 75 -19 91 -28 28 -60 31 -140 17z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @91,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M4960 5864 c-14 -2 -52 -9 -85 -15 -143 -25 -289 -131 -389 -282 -146 -222 -157 -309 -46 -384 44 -31 106 -30 151 0 21 14 49 50 74 97 52 97 186 236 266 274 115 55 216 53 379 -9 109 -41 160 -44 221 -12 84 45 90 109 18 191 -61 70 -113 91 -289 120 -93 16 -261 27 -300 20z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @108,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M10045 5513 c-332 -90 -336 -92 -371 -128 -34 -37 -49 -87 -34 -115 5 -10 24 -23 41 -29 58 -20 114 -13 226 30 99 38 117 41 223 45 146 5 244 21 263 42 40 45 32 125 -18 177 -29 31 -38 35 -81 34 -27 -1 -139 -26 -249 -56z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @125,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M7263 5475 c-261 -47 -493 -195 -623 -396 -63 -98 -77 -186 -41 -264 42 -90 132 -142 318 -181 267 -56 316 -74 332 -117 19 -49 62 -389 62 -490 0 -96 -4 -117 -37 -217 -58 -176 -123 -258 -246 -315 -193 -88 -433 -28 -636 159 -51 46 -108 90 -127 96 -53 18 -98 -8 -131 -76 -23 -48 -26 -63 -22 -124 8 -113 72 -196 203 -262 158 -81 327 -113 544 -105 286 10 431 83 523 260 77 148 159 236 242 258 36 10 49 9 106 -12 59 -22 84 -24 260 -27 107 -2 253 1 324 7 156 13 204 32 295 117 35 32 107 95 159 139 127 106 138 128 164 331 12 92 17 175 13 201 -8 55 -51 106 -103 121 -53 16 -155 15 -195 -2 -62 -26 -70 -45 -78 -179 -9 -136 -37 -262 -70 -309 -30 -42 -101 -85 -184 -111 -89 -28 -266 -30 -365 -4 -151 40 -271 128 -304 222 -8 26 -20 93 -27 149 -21 189 10 317 129 534 116 209 135 255 140 341 3 71 2 79 -26 123 -58 90 -226 148 -422 147 -58 0 -137 -7 -177 -14z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @142,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M9828 4739 c-44 -13 -88 -60 -88 -95 0 -40 25 -88 61 -118 32 -27 36 -28 99 -20 142 18 180 12 282 -39 102 -51 140 -57 193 -31 43 20 135 117 135 142 0 56 -99 111 -257 143 -115 23 -369 34 -425 18z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @159,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M4855 4609 c-171 -59 -384 -188 -478 -289 -56 -60 -86 -123 -74 -154 11 -29 57 -39 114 -28 68 14 505 196 566 236 68 45 76 168 15 234 -27 28 -64 28 -143 1z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @176,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M4830 3973 c-14 -2 -60 -15 -102 -29 -195 -64 -340 -225 -308 -343 14 -52 62 -108 101 -116 43 -10 125 33 185 96 27 28 58 56 69 62 12 6 71 11 140 12 104 0 126 4 162 23 70 37 88 93 54 167 -46 102 -162 151 -301 128z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @193,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M4955 3331 c-46 -21 -106 -77 -227 -215 -117 -131 -132 -191 -66 -256 89 -89 261 -41 354 100 35 52 61 67 144 85 139 29 180 62 180 146 0 57 -18 80 -85 109 -47 20 -188 50 -234 50 -14 0 -44 -9 -66 -19z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @210,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M3003 4475 c-34 -15 -37 -23 -33 -95 5 -94 71 -212 180 -320 86 -87 153 -125 201 -115 42 9 95 59 109 100 15 46 3 83 -59 177 -95 145 -182 220 -290 252 -65 19 -67 19 -108 1z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @227,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M2341 4194 c-13 -9 -29 -32 -37 -50 -25 -60 -19 -78 47 -136 70 -60 99 -106 133 -205 45 -131 81 -159 188 -147 83 9 102 29 95 98 -10 94 -53 189 -118 260 -98 107 -222 196 -271 196 -8 0 -24 -7 -37 -16z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					},
					BlElement {
						#children : BlChildrenArray [ ],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @10
							},
							#position : @12,
							#margin : @13,
							#padding : @13,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @14,
							#maxWidth : @14,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlSvgPath {
								#extent : Point [ 150, 100 ],
								#pathCache : BlPathCache {
									#geometry : @244,
									#strokedBounds : BlBounds {
										#left : -0.5,
										#top : -0.5,
										#right : 150.5,
										#bottom : 100.5
									}
								},
								#fillRule : #winding,
								#pathString : ''M1684 3875 c-26 -40 -14 -104 34 -177 56 -87 87 -157 116 -267 14 -52 33 -102 41 -110 10 -10 33 -16 61 -16 40 0 50 5 79 36 83 91 38 290 -100 438 -108 115 -195 151 -231 96z''
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @22
								},
								#width : 1.0,
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
									#color : @29
								}
							},
							#outskirts : @30
						},
						#userData : IdentityDictionary { },
						#layout : BlSvgGroupLayout { }
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @10
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @10
					},
					#position : Point [ 0, 0 ],
					#margin : @13,
					#padding : @13,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @14,
					#maxWidth : @14,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#outskirts : @30,
					#clipChildren : false
				},
				#userData : IdentityDictionary { },
				#layout : BlSvgGroupLayout { }
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 1280.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 1279.0
				}
			},
			#position : Point [ 0, 0 ],
			#margin : @13,
			#padding : @13,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @14,
			#maxWidth : @14,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#outskirts : @30,
			#clipChildren : false
		},
		#userData : IdentityDictionary { },
		#layout : BlSvgGroupLayout { }
	}
]'
]

{ #category : 'see class side' }
PyramidSimpleExamples >> seeClassSide [ 
]
