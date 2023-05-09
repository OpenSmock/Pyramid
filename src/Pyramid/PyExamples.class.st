Class {
	#name : #PyExamples,
	#superclass : #Object,
	#category : #'Pyramid-YYY-Examples'
}

{ #category : #'bloc-STON' }
PyExamples class >> test1 [

	<pySTON>
	^ 'BlElement {
	#children : BlChildrenArray [ ],
	#constraints : BlLayoutCommonConstraints {
		#vertical : BlLayoutCommonConstraintsAxis {
			#resizer : BlLayoutExactResizer {
				#size : 50.0
			}
		},
		#horizontal : BlLayoutCommonConstraintsAxis {
			#resizer : @5
		},
		#position : Point [ 0.0, 0.0 ],
		#margin : BlInsets {
			#top : 0.0,
			#left : 0.0,
			#bottom : 0.0,
			#right : 0.0
		},
		#padding : @8,
		#minHeight : 0.0,
		#minWidth : 0.0,
		#maxHeight : Float[#infinity],
		#maxWidth : Float[#infinity],
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
	#userData : IdentityDictionary { }
}'
]

{ #category : #'bloc-STON' }
PyExamples class >> test2 [
<pySTON>


^ 'BlElement {
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
							#resizer : @9
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
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
						#maxWidth : @14,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @16,
								#strokedBounds : BlBounds {
									#left : 0.0,
									#top : 0.0,
									#right : 100.0,
									#bottom : 100.0
								}
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
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
										#alpha : 0.2
									},
									1 : Color {
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.8
									}
								],
								#center : Point [ 50, 50 ],
								#radius : 50
							}
						}
					},
					#userData : IdentityDictionary { }
				},
				BlElement {
					#children : BlChildrenArray [ ],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @9
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @9
						},
						#position : Point [ 1, 1 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : @13,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : @14,
						#maxWidth : @14,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @37,
								#strokedBounds : BlBounds {
									#left : 0.0,
									#top : 0.0,
									#right : 100.0,
									#bottom : 100.0
								}
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlRadialGradientPaint {
								#stops : [
									0 : Color [ #white ],
									0.9 : @24,
									1 : @24
								],
								#center : Point [ 10, 10 ],
								#radius : 90
							}
						}
					},
					#userData : IdentityDictionary { }
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : @9
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @9
				},
				#position : Point [ 0.0, 0.0 ],
				#margin : BlInsets {
					#top : 10.0,
					#left : 10.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : @14,
				#maxWidth : @14,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#geometry : BlCircleGeometry {
					#extent : Point [ 100.0, 100.0 ],
					#pathCache : BlPathCache {
						#geometry : @55,
						#strokedBounds : BlBounds {
							#left : 0.0,
							#top : 0.0,
							#right : 100.0,
							#bottom : 100.0
						}
					},
					#radius : 50.0,
					#origin : Point [ 0.0, 0.0 ]
				},
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.3225806451612903,
							#green : 0.8093841642228738,
							#blue : 0.4604105571847507,
							#alpha : 1.0
						}
					}
				}
			},
			#userData : IdentityDictionary { }
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
					#resizer : @9
				},
				#position : Point [ 0.0, 120 ],
				#margin : BlInsets {
					#top : 10.0,
					#left : 10.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @53,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : @14,
				#maxWidth : @14,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#geometry : BlEllipseGeometry {
					#extent : Point [ 100.0, 25.0 ],
					#pathCache : BlPathCache {
						#geometry : @73,
						#strokedBounds : BlBounds {
							#left : 0.0,
							#top : 0.0,
							#right : 100.0,
							#bottom : 25.0
						}
					}
				},
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.4
						}
					}
				}
			},
			#userData : IdentityDictionary { }
		}
	],
	#constraints : BlLayoutCommonConstraints {
		#vertical : BlLayoutCommonConstraintsAxis {
			#resizer : BlLayoutExactResizer {
				#size : 200.0
			}
		},
		#horizontal : BlLayoutCommonConstraintsAxis {
			#resizer : BlLayoutExactResizer {
				#size : 100.0
			}
		},
		#position : Point [ 0.0, 0.0 ],
		#margin : BlInsets {
			#top : 0.0,
			#left : 0.0,
			#bottom : 0.0,
			#right : 0.0
		},
		#padding : @87,
		#minHeight : 0.0,
		#minWidth : 0.0,
		#maxHeight : @14,
		#maxWidth : @14,
		#ignoredByLayout : false,
		#accountTransformation : false
	},
	#visuals : BlCustomVisuals {
		#background : BlPaintBackground {
			#paint : BlColorPaint {
				#color : Color {
					#red : 0.0,
					#green : 0.0,
					#blue : 0.0,
					#alpha : 0.0
				}
			}
		}
	},
	#userData : IdentityDictionary { }
}'
]

{ #category : #'bloc-STON' }
PyExamples class >> test3 [
<pySTON>


^ 'BlElement {
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
									#resizer : @11
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
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
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @18
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @11
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @11
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @15,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @38
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : Color [ #white ],
											0.9 : @25,
											1 : @25
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : BlLayoutExactResizer {
								#size : 100.0
							}
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @56
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.7898338220918866,
									#green : 0.458455522971652,
									#blue : 0.5141739980449658,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : BlElementNoId { }
					}
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
							#resizer : @50
						},
						#position : Point [ 0.0, 120 ],
						#margin : @53,
						#padding : @54,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @73
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.6
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 0.0, 0.0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @85,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @99
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @105
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @99
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @99
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @103,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @125
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @112,
											1 : @112
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @140
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.002932551319648094,
									#green : 0.4868035190615836,
									#blue : 0.16129032258064516,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @53,
						#padding : @138,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @155
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 150, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @166,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @180
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @186
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @180
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @180
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @184,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @206
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @193,
											1 : @193
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @221
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.7067448680351907,
									#green : 0.2678396871945259,
									#blue : 0.2375366568914956,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @53,
						#padding : @219,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @236
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 300, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @247,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @261
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @267
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @261
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @261
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @265,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @287
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @274,
											1 : @274
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @302
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.603128054740958,
									#green : 0.8807429130009775,
									#blue : 0.24633431085043989,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @53,
						#padding : @300,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @317
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 450, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @328,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @342
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @348
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @342
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @342
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @346,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @368
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @355,
											1 : @355
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @383
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.5972629521016618,
									#green : 0.5141739980449658,
									#blue : 0.750733137829912,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @53,
						#padding : @381,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @398
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 600, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @409,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @423
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @429
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @423
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @423
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @427,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @449
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @436,
											1 : @436
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @464
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.603128054740958,
									#green : 0.9208211143695014,
									#blue : 0.9921798631476051,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : @462,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @480
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 0.0, 200 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @491,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @505
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @511
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @505
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @505
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @509,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @531
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @518,
											1 : @518
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @547
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.13587487781036167,
									#green : 0.19941348973607037,
									#blue : 0.6119257086999023,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @53,
						#padding : @545,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @562
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 150, 200 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @573,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @587
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @593
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @587
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @587
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @591,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @613
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @600,
											1 : @600
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @628
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.9912023460410557,
									#green : 0.8240469208211144,
									#blue : 0.4633431085043988,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @478,
						#padding : @626,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @643
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 300, 200 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @654,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @668
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @674
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @668
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @668
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @672,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @694
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @681,
											1 : @681
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @709
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.4975562072336266,
									#green : 0.15347018572825025,
									#blue : 0.6226783968719453,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @53,
						#padding : @707,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @724
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 450, 200 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @735,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		},
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
									#resizer : @749
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @755
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @749
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @749
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @753,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @775
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @762,
											1 : @762
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @790
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.4682306940371456,
									#green : 0.043010752688172046,
									#blue : 0.20821114369501467,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @478,
						#padding : @788,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @805
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @78
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 600, 200 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @816,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @64
			}
		}
	],
	#constraints : BlLayoutCommonConstraints {
		#vertical : BlLayoutCommonConstraintsAxis {
			#resizer : BlLayoutExactResizer {
				#size : 600.0
			}
		},
		#horizontal : BlLayoutCommonConstraintsAxis {
			#resizer : BlLayoutExactResizer {
				#size : 800.0
			}
		},
		#position : Point [ 0.0, 0.0 ],
		#margin : BlInsets {
			#top : 0.0,
			#left : 0.0,
			#bottom : 0.0,
			#right : 0.0
		},
		#padding : @828,
		#minHeight : 0.0,
		#minWidth : 0.0,
		#maxHeight : 0.0,
		#maxWidth : 0.0,
		#ignoredByLayout : false,
		#accountTransformation : false
	},
	#visuals : BlCustomVisuals {
		#background : BlPaintBackground {
			#paint : BlColorPaint {
				#color : Color {
					#red : 0.0,
					#green : 0.0,
					#blue : 0.0,
					#alpha : 0.0
				}
			}
		}
	},
	#userData : IdentityDictionary {
		#elementId : @64
	}
}'
]

{ #category : #'bloc-STON' }
PyExamples class >> test4 [
<pySTON>


^ 'BlElement {
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
									#resizer : @11
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
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
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @18
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @11
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @11
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @15,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @38
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : Color [ #white ],
											0.9 : @25,
											1 : @25
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : BlLayoutExactResizer {
								#size : 100.0
							}
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @56
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.07429130009775171,
									#green : 0.7321603128054741,
									#blue : 0.9433040078201369,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : BlElementNamedId {
							#identifier : #color
						}
					}
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
							#resizer : @50
						},
						#position : Point [ 0.0, 120 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : @54,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @74
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.0,
									#green : 0.0,
									#blue : 0.0,
									#alpha : 0.4
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : BlElementNamedId {
							#identifier : #shadow
						}
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 0.0, 0.0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @87,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : BlElementNamedId {
					#identifier : #ball
				}
			}
		},
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
									#resizer : @102
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @108
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @102
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @102
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @106,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @128
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @115,
											1 : @115
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @144
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.056695992179863146,
									#green : 0.47409579667644186,
									#blue : 0.03812316715542522,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @72,
						#padding : @142,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @159
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @79
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @81
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 100, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @170,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @93
			}
		},
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
									#resizer : @184
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @190
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @184
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @184
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @188,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @210
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @197,
											1 : @197
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @141,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @225
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.8250244379276638,
									#green : 0.18475073313782991,
									#blue : 0.4525904203323558,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : BlInsets {
							#top : 10.0,
							#left : 10.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#padding : @223,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @241
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @79
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @81
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 200, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @252,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @93
			}
		},
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
									#resizer : @266
								},
								#position : Point [ 0.0, 0.0 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : BlInsets {
									#top : 0.0,
									#left : 0.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @272
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
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
												#alpha : 0.2
											},
											1 : Color {
												#red : 0.0,
												#green : 0.0,
												#blue : 0.0,
												#alpha : 0.8
											}
										],
										#center : Point [ 50, 50 ],
										#radius : 50
									}
								}
							},
							#userData : IdentityDictionary { }
						},
						BlElement {
							#children : BlChildrenArray [ ],
							#constraints : BlLayoutCommonConstraints {
								#vertical : BlLayoutCommonConstraintsAxis {
									#resizer : @266
								},
								#horizontal : BlLayoutCommonConstraintsAxis {
									#resizer : @266
								},
								#position : Point [ 1, 1 ],
								#margin : BlInsets {
									#top : 10.0,
									#left : 10.0,
									#bottom : 0.0,
									#right : 0.0
								},
								#padding : @270,
								#minHeight : 0.0,
								#minWidth : 0.0,
								#maxHeight : @16,
								#maxWidth : @16,
								#ignoredByLayout : false,
								#accountTransformation : false
							},
							#visuals : BlCustomVisuals {
								#geometry : BlCircleGeometry {
									#extent : Point [ 100.0, 100.0 ],
									#pathCache : BlPathCache {
										#geometry : @292
									},
									#radius : 50.0,
									#origin : Point [ 0.0, 0.0 ]
								},
								#background : BlPaintBackground {
									#paint : BlRadialGradientPaint {
										#stops : [
											0 : @45,
											0.9 : @279,
											1 : @279
										],
										#center : Point [ 10, 10 ],
										#radius : 90
									}
								}
							},
							#userData : IdentityDictionary { }
						}
					],
					#constraints : BlLayoutCommonConstraints {
						#vertical : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#horizontal : BlLayoutCommonConstraintsAxis {
							#resizer : @50
						},
						#position : Point [ 0.0, 0.0 ],
						#margin : @53,
						#padding : BlInsets {
							#top : 0.0,
							#left : 0.0,
							#bottom : 0.0,
							#right : 0.0
						},
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlCircleGeometry {
							#extent : Point [ 100.0, 100.0 ],
							#pathCache : BlPathCache {
								#geometry : @307
							},
							#radius : 50.0,
							#origin : Point [ 0.0, 0.0 ]
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : Color {
									#red : 0.906158357771261,
									#green : 0.7565982404692082,
									#blue : 0.044965786901270774,
									#alpha : 1.0
								}
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @64
					}
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
							#resizer : @50
						},
						#position : @71,
						#margin : @72,
						#padding : @305,
						#minHeight : 0.0,
						#minWidth : 0.0,
						#maxHeight : 0.0,
						#maxWidth : 0.0,
						#ignoredByLayout : false,
						#accountTransformation : false
					},
					#visuals : BlCustomVisuals {
						#geometry : BlEllipseGeometry {
							#extent : Point [ 100.0, 25.0 ],
							#pathCache : BlPathCache {
								#geometry : @322
							}
						},
						#background : BlPaintBackground {
							#paint : BlColorPaint {
								#color : @79
							}
						}
					},
					#userData : IdentityDictionary {
						#elementId : @81
					}
				}
			],
			#constraints : BlLayoutCommonConstraints {
				#vertical : BlLayoutCommonConstraintsAxis {
					#resizer : BlLayoutExactResizer {
						#size : 200.0
					}
				},
				#horizontal : BlLayoutCommonConstraintsAxis {
					#resizer : @50
				},
				#position : Point [ 300, 0 ],
				#margin : BlInsets {
					#top : 0.0,
					#left : 0.0,
					#bottom : 0.0,
					#right : 0.0
				},
				#padding : @333,
				#minHeight : 0.0,
				#minWidth : 0.0,
				#maxHeight : 0.0,
				#maxWidth : 0.0,
				#ignoredByLayout : false,
				#accountTransformation : false
			},
			#visuals : BlCustomVisuals {
				#background : BlPaintBackground {
					#paint : BlColorPaint {
						#color : Color {
							#red : 0.0,
							#green : 0.0,
							#blue : 0.0,
							#alpha : 0.0
						}
					}
				}
			},
			#userData : IdentityDictionary {
				#elementId : @93
			}
		}
	],
	#constraints : BlLayoutCommonConstraints {
		#vertical : BlLayoutCommonConstraintsAxis {
			#resizer : BlLayoutExactResizer {
				#size : 50.0
			}
		},
		#horizontal : BlLayoutCommonConstraintsAxis {
			#resizer : @341
		},
		#position : Point [ 0.0, 0.0 ],
		#margin : BlInsets {
			#top : 0.0,
			#left : 0.0,
			#bottom : 0.0,
			#right : 0.0
		},
		#padding : @344,
		#minHeight : 0.0,
		#minWidth : 0.0,
		#maxHeight : 0.0,
		#maxWidth : 0.0,
		#ignoredByLayout : false,
		#accountTransformation : false
	},
	#visuals : BlCustomVisuals {
		#background : BlPaintBackground {
			#paint : BlColorPaint {
				#color : Color {
					#red : 0.0,
					#green : 0.0,
					#blue : 0.0,
					#alpha : 0.0
				}
			}
		}
	},
	#userData : IdentityDictionary {
		#elementId : BlElementNamedId {
			#identifier : #canvas
		}
	}
}'
]

{ #category : #'pyramid-serialized-bloc' }
PyExamples class >> test5 [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-05-09 11:33:28"

	<pySTON>
	^ 'OrderedCollection [
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
			#position : Point [ 0.0, 0.0 ],
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
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color [ #red ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #red
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
			#position : Point [ 0.0, 0.0 ],
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
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : @14
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #red
			}
		},
		#layout : @17,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @20,
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
			#position : Point [ 0.0, 0.0 ],
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
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : @14
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #red
			}
		},
		#layout : @17,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @33,
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
			#position : Point [ 0.0, 0.0 ],
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
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : @14
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #red
			}
		},
		#layout : @17,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @46,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'bloc-STON' }
PyExamples class >> testABC [
	<pySTON>


	^ 'OrderedCollection [
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
								#resizer : @10
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : BlInsets {
								#top : 10.0,
								#left : 10.0,
								#bottom : 0.0,
								#right : 0.0
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
							#maxWidth : @15,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @17
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
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
											#alpha : 0.2
										},
										1 : Color {
											#red : 0.0,
											#green : 0.0,
											#blue : 0.0,
											#alpha : 0.8
										}
									],
									#center : Point [ 50, 50 ],
									#radius : 50
								}
							}
						},
						#userData : IdentityDictionary { },
						#layout : BlBasicLayout { },
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @6,
							#handlers : [ ]
						}
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
							#position : Point [ 1, 1 ],
							#margin : BlInsets {
								#top : 10.0,
								#left : 10.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#padding : @14,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @15,
							#maxWidth : @15,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @40
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlRadialGradientPaint {
									#stops : [
										0 : Color [ #white ],
										0.9 : @24,
										1 : @24
									],
									#center : Point [ 10, 10 ],
									#radius : 90
								}
							}
						},
						#userData : IdentityDictionary { },
						#layout : @29,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @32,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @10
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @10
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 10.0,
						#left : 10.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @15,
					#maxWidth : @15,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlCircleGeometry {
						#extent : Point [ 100.0, 100.0 ],
						#pathCache : BlPathCache {
							#geometry : @59
						},
						#radius : 50.0,
						#origin : Point [ 0.0, 0.0 ]
					},
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.3225806451612903,
								#green : 0.8093841642228738,
								#blue : 0.4604105571847507,
								#alpha : 1.0
							}
						}
					},
					#visibility : BlVisibilityVisible { }
				},
				#userData : IdentityDictionary { },
				#layout : @29,
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
							#size : 25.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @10
					},
					#position : Point [ 0.0, 120 ],
					#margin : BlInsets {
						#top : 10.0,
						#left : 10.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @57,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @15,
					#maxWidth : @15,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlEllipseGeometry {
						#extent : Point [ 100.0, 25.0 ],
						#pathCache : BlPathCache {
							#geometry : @79
						}
					},
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.4
							}
						}
					},
					#visibility : BlVisibilityVisible { }
				},
				#userData : IdentityDictionary { },
				#layout : @29,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @70,
					#handlers : [ ]
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 200.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 100.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @95,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @15,
			#maxWidth : @15,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.0,
						#green : 0.0,
						#blue : 0.0,
						#alpha : 0.0
					}
				}
			}
		},
		#userData : IdentityDictionary { },
		#layout : @29,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]

{ #category : #'see class side' }
PyExamples >> seeClassSide [
]

{ #category : #'bloc-STON' }
PyExamples >> test3b [
	<pySTON>


	^ 'OrderedCollection [
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
										#resizer : @12
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
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
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @19
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : BlBasicLayout { },
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @8,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @12
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @12
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @16,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @42
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : Color [ #white ],
												0.9 : @26,
												1 : @26
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @34,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 100.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : BlInsets {
								#top : 10.0,
								#left : 10.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @62
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color {
										#red : 0.0,
										#green : 0.5933528836754643,
										#blue : 0.6754643206256109,
										#alpha : 1.0
									}
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNoId { }
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @6,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : Point [ 0.0, 120 ],
							#margin : @59,
							#padding : @60,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @81
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color {
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.6
									}
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @73,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @95,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @4,
					#handlers : [ ]
				}
			},
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
										#resizer : @111
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @117
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @107,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @111
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @111
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
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
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @139
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @124,
												1 : @124
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @131,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @156
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @105,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @59,
							#padding : @154,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @172
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @165,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 150, 0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @185,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @103,
					#handlers : [ ]
				}
			},
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
										#resizer : @201
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @207
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @197,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @201
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @201
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @205,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @229
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @214,
												1 : @214
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @221,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @246
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @195,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @59,
							#padding : @244,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @262
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @255,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 300, 0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @275,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @193,
					#handlers : [ ]
				}
			},
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
										#resizer : @291
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @297
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @287,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @291
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @291
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @295,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @319
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @304,
												1 : @304
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @311,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @336
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @285,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @59,
							#padding : @334,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @352
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @345,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 450, 0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @365,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @283,
					#handlers : [ ]
				}
			},
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
										#resizer : @381
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @387
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @377,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @381
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @381
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @385,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @409
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @394,
												1 : @394
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @401,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @426
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @375,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @59,
							#padding : @424,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @442
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @435,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 600, 0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @455,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @373,
					#handlers : [ ]
				}
			},
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
										#resizer : @471
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @477
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @467,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @471
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @471
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @475,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @499
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @484,
												1 : @484
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @491,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @516
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @465,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : BlInsets {
								#top : 10.0,
								#left : 10.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#padding : @514,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @533
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @525,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 0.0, 200 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @546,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @463,
					#handlers : [ ]
				}
			},
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
										#resizer : @562
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @568
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @558,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @562
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @562
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @566,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @590
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @575,
												1 : @575
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @582,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : BlInsets {
								#top : 10.0,
								#left : 10.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @608
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @556,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @59,
							#padding : @606,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @624
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @617,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 150, 200 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @637,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @554,
					#handlers : [ ]
				}
			},
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
										#resizer : @653
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @659
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @649,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @653
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @653
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @657,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @681
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @666,
												1 : @666
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @673,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @698
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @647,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @531,
							#padding : @696,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @714
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @707,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 300, 200 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @727,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @645,
					#handlers : [ ]
				}
			},
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
										#resizer : @743
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @749
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @739,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @743
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @743
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @747,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @771
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @756,
												1 : @756
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @763,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @788
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @737,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @59,
							#padding : @786,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @804
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @797,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 450, 200 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @817,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @735,
					#handlers : [ ]
				}
			},
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
										#resizer : @833
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @839
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
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
													#alpha : 0.2
												},
												1 : Color {
													#red : 0.0,
													#green : 0.0,
													#blue : 0.0,
													#alpha : 0.8
												}
											],
											#center : Point [ 50, 50 ],
											#radius : 50
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @829,
									#handlers : [ ]
								}
							},
							BlElement {
								#children : BlChildrenArray [ ],
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @833
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @833
									},
									#position : Point [ 1, 1 ],
									#margin : BlInsets {
										#top : 10.0,
										#left : 10.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @837,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @17,
									#maxWidth : @17,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : BlCustomVisuals {
									#geometry : BlCircleGeometry {
										#extent : Point [ 100.0, 100.0 ],
										#pathCache : BlPathCache {
											#geometry : @861
										},
										#radius : 50.0,
										#origin : Point [ 0.0, 0.0 ]
									},
									#background : BlPaintBackground {
										#paint : BlRadialGradientPaint {
											#stops : [
												0 : @49,
												0.9 : @846,
												1 : @846
											],
											#center : Point [ 10, 10 ],
											#radius : 90
										}
									}
								},
								#userData : IdentityDictionary { },
								#layout : @31,
								#eventDispatcher : BlElementEventDispatcher {
									#owner : @853,
									#handlers : [ ]
								}
							}
						],
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @56
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @59,
							#padding : BlInsets {
								#top : 0.0,
								#left : 0.0,
								#bottom : 0.0,
								#right : 0.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlCircleGeometry {
								#extent : Point [ 100.0, 100.0 ],
								#pathCache : BlPathCache {
									#geometry : @878
								},
								#radius : 50.0,
								#origin : Point [ 0.0, 0.0 ]
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @68
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @827,
							#handlers : [ ]
						}
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
								#resizer : @56
							},
							#position : @79,
							#margin : @531,
							#padding : @876,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : 0.0,
							#maxWidth : 0.0,
							#ignoredByLayout : false,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlEllipseGeometry {
								#extent : Point [ 100.0, 25.0 ],
								#pathCache : BlPathCache {
									#geometry : @894
								}
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @86
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : @70
						},
						#layout : @31,
						#eventDispatcher : BlElementEventDispatcher {
							#owner : @887,
							#handlers : [ ]
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 200.0
						}
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @56
					},
					#position : Point [ 600, 200 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @907,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : 0.0,
					#maxWidth : 0.0,
					#ignoredByLayout : false,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlPaintBackground {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.0,
								#green : 0.0,
								#blue : 0.0,
								#alpha : 0.0
							}
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : @70
				},
				#layout : @31,
				#eventDispatcher : BlElementEventDispatcher {
					#owner : @825,
					#handlers : [ ]
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 600.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 800.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @921,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : 0.0,
			#maxWidth : 0.0,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.0,
						#green : 0.0,
						#blue : 0.0,
						#alpha : 0.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : @70
		},
		#layout : @31,
		#eventDispatcher : BlElementEventDispatcher {
			#owner : @2,
			#handlers : [ ]
		}
	}
]'
]
