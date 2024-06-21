Class {
	#name : 'PyramidQuizStartView',
	#superclass : 'PyramidQuizView',
	#category : 'Pyramid-Examples',
	#package : 'Pyramid-Examples'
}

{ #category : 'pyramid-serialized-bloc' }
PyramidQuizStartView class >> pyston [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-06-20 17:02:20"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			ToButton {
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutFitContentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @7
					},
					#constraints : {
						Class [ #BlLinearLayout ] : BlLinearLayoutConstraints {
							#vertical : BlLinearLayoutConstraintsVertical {
								#alignment : BlTopAlignment { }
							},
							#horizontal : BlLinearLayoutConstraintsHorizontal {
								#alignment : BlHorizontalStartAlignment { }
							},
							#weight : 1
						},
						Class [ #BlFrameLayout ] : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlVerticalCenterAlignment { },
								#weight : 1.0
							},
							#horizontal : BlFrameLayoutConstraintsHorizontal {
								#alignment : BlHorizontalCenterAlignment { },
								#weight : 1.0
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
					#padding : BlInsets {
						#top : 4.0,
						#left : 8.0,
						#bottom : 4.0,
						#right : 8.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @25,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @17,
					#previouslyAccessedConstraintsType : @16,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#geometry : BlRoundedRectangleGeometry {
						#extent : Point [ 79.09800000000001, 25.598000000000013 ],
						#pathCache : BlPathCache {
							#geometry : @27
						},
						#cornerRadii : BlCornerRadii {
							#topLeft : 6,
							#topRight : 6,
							#bottomLeft : 6,
							#bottomRight : 6
						},
						#center : Point [ 39.54900000000001, 12.799000000000007 ]
					},
					#border : BlBorder {
						#paint : BlColorPaint {
							#color : Color {
								#red : 0.8514173998044966,
								#green : 0.8514173998044966,
								#blue : 0.8514173998044966,
								#alpha : 1.0
							}
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
							#color : Color [ #white ]
						}
					},
					#mouseCursor : CursorWithMask {
						#bits : Bitmap [
							0,
							1073741824,
							1610612736,
							1879048192,
							2013265920,
							2080374784,
							2113929216,
							2130706432,
							2080374784,
							2080374784,
							1275068416,
							100663296,
							100663296,
							50331648,
							50331648,
							0
						],
						#width : 16,
						#height : 16,
						#depth : 1,
						#offset : Point [ -1, -1 ],
						#maskForm : Form {
							#bits : Bitmap [
								3221225472,
								3758096384,
								4026531840,
								4160749568,
								4227858432,
								4261412864,
								4278190080,
								4286578688,
								4278190080,
								4261412864,
								4261412864,
								3472883712,
								251658240,
								125829120,
								125829120,
								50331648
							],
							#width : 16,
							#height : 16,
							#depth : 1,
							#offset : Point [ 0, 0 ]
						}
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #start
					},
					#enabled : true,
					#stonLabeledIcon : ToLabeledIcon {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : @7
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutMatchParentResizer { }
							},
							#constraints : {
								@10 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @13
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @15
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @23,
							#padding : @23,
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @25,
							#maxWidth : @25,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @56,
							#previouslyAccessedConstraintsType : @10,
							#accountTransformation : false
						},
						#visuals : BlDefaultVisuals { },
						#userData : IdentityDictionary {
							#stonToImage : nil,
							#enabled : true,
							#stonToLabel : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : BlLayoutFitContentResizer { }
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @65
									},
									#constraints : {
										@16 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : BlTopAlignment { },
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : BlHorizontalStartAlignment { },
												#weight : 1.0
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
									#padding : @74,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @25,
									#maxWidth : @25,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @68,
									#previouslyAccessedConstraintsType : @16,
									#accountTransformation : false
								},
								#visuals : BlDefaultVisuals { },
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlAttributeRope {
											#attributes : [
												BlFontWeightAttribute {
													#isOverwritableByStyler : true,
													#weight : 600
												},
												BlFontFamilyDefaultAttribute {
													#isOverwritableByStyler : true,
													#name : ''SFMono-Regular''
												},
												BlFontSizeDefaultAttribute {
													#isOverwritableByStyler : true,
													#size : 14
												},
												AlbTextParagraphLineSpacingAttribute {
													#isOverwritableByStyler : true,
													#lineSpacing : 1.5
												},
												BlTextForegroundAttribute {
													#isOverwritableByStyler : true,
													#paint : Color [ #black ]
												}
											],
											#rope : BlCollectionRope {
												#collection : ''New Game''
											}
										}
									}
								},
								#layout : BlFrameLayout { }
							}
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : BlNullVerticalAlignment { },
							#horizontalAlignment : BlNullHorizontalAlignment { },
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @88
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					}
				},
				#layout : BlLinearLayout {
					#weightSum : 0,
					#verticalAlignment : @89,
					#horizontalAlignment : @90,
					#orientation : BlLinearLayoutHorizontalOrientation {
						#layout : @92
					},
					#shouldUseLargestChild : false,
					#cellSpacing : 0.0,
					#interspace : 0.0
				}
			},
			BlTextElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutFitContentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @98
					},
					#constraints : {
						@16 : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlVerticalCoordinateTopAlignment {
									#coordinate : 0.25,
									#relativeAlignment : BlTopAlignment { }
								},
								#weight : 1.0
							},
							#horizontal : BlFrameLayoutConstraintsHorizontal {
								#alignment : BlHorizontalCenterAlignment { },
								#weight : 1.0
							}
						}
					},
					#position : Point [ 0, 0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
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
					#maxHeight : @25,
					#maxWidth : @25,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @101,
					#previouslyAccessedConstraintsType : @16,
					#accountTransformation : false
				},
				#visuals : BlDefaultVisuals { },
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #title
					}
				},
				#layout : BlBasicLayout { },
				#text : BlRopedText {
					#rope : BlAttributeRope {
						#attributes : [
							BlFontSizeAttribute {
								#isOverwritableByStyler : true,
								#size : 40
							},
							BlTextForegroundAttribute {
								#isOverwritableByStyler : true,
								#paint : @41
							}
						],
						#rope : BlCollectionRope {
							#collection : ''My Super Quizz !''
						}
					}
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutMatchParentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @122
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @125,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @25,
			#maxWidth : @25,
			#ignoredByLayout : false,
			#accountTransformation : false
		},
		#visuals : BlCustomVisuals {
			#background : BlPaintBackground {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.31671554252199413,
						#green : 0.38025415444770283,
						#blue : 0.5835777126099707,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #body
			}
		},
		#layout : BlFrameLayout { }
	}
]'
]

{ #category : 'initialization' }
PyramidQuizStartView >> game: anObject [

	super game: anObject.
	self startButton whenClickedDo: [ self game goQuestions ].
	self game correctAnswers: 0.
]

{ #category : 'accessing' }
PyramidQuizStartView >> startButton [

	^ (self childWithId: #body) childWithId: #start
]
