Class {
	#name : 'PyramidQuizQuestionsView',
	#superclass : 'PyramidQuizView',
	#instVars : [
		'questionsToAnswer',
		'currentQuestionNumber',
		'totalQuestionsNumber'
	],
	#category : 'Pyramid-Examples',
	#package : 'Pyramid-Examples'
}

{ #category : 'pyramid-serialized-bloc' }
PyramidQuizQuestionsView class >> pyston [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-06-20 17:11:00"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [
			BlTextElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutFitContentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#constraints : {
						Class [ #BlFrameLayout ] : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlVerticalCoordinateTopAlignment {
									#coordinate : 0.05,
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
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 0.0,
						#left : 0.0,
						#bottom : 0.0,
						#right : 0.0
					},
					#padding : @19,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : Float [ #infinity ],
					#maxWidth : @20,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @12,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlDefaultVisuals { },
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #number
					}
				},
				#layout : BlBasicLayout { },
				#text : BlRopedText {
					#rope : BlAttributeRope {
						#attributes : [
							BlFontSizeAttribute {
								#isOverwritableByStyler : true,
								#size : 22
							},
							BlTextForegroundAttribute {
								#isOverwritableByStyler : true,
								#paint : Color [ #white ]
							}
						],
						#rope : BlCollectionRope {
							#collection : ''<number>''
						}
					}
				}
			},
			BlTextElement {
				#children : BlChildrenArray [ ],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutFitContentResizer { }
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @36
					},
					#constraints : {
						@11 : BlFrameLayoutConstraints {
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
					#maxHeight : @20,
					#maxWidth : @20,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @39,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlDefaultVisuals { },
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #question
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
								#paint : Color [ #white ]
							}
						],
						#rope : BlCollectionRope {
							#collection : ''<question>''
						}
					}
				}
			},
			BlElement {
				#children : BlChildrenArray [
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutFitContentResizer { }
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutMatchParentResizer { }
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
								@11 : BlFrameLayoutConstraints {
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
								#top : 15.0,
								#left : 15.0,
								#bottom : 15.0,
								#right : 15.0
							},
							#padding : BlInsets {
								#top : 4.0,
								#left : 8.0,
								#bottom : 4.0,
								#right : 8.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @20,
							#maxWidth : @20,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @69,
							#previouslyAccessedConstraintsType : @68,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 470.0, 25.598 ],
								#pathCache : BlPathCache {
									#geometry : @83,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 470.0,
										#bottom : 25.598
									}
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 235.0, 12.799 ]
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
									#color : @57
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
								#identifier : #b1
							},
							#enabled : true,
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @64
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : BlLayoutMatchParentResizer { }
									},
									#constraints : {
										@68 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @71
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @73
											},
											#weight : 1
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @116,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @20,
									#maxWidth : @20,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @112,
									#previouslyAccessedConstraintsType : @68,
									#accountTransformation : false
								},
								#visuals : BlDefaultVisuals { },
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#enabled : true,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#constraints : {
												@11 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @15,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : BlHorizontalStartAlignment { },
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @19,
											#padding : @19,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @20,
											#maxWidth : @20,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @124,
											#previouslyAccessedConstraintsType : @11,
											#accountTransformation : false
										},
										#visuals : @21,
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
														#collection : ''<answer>''
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
										#layout : @141
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							}
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @142,
							#horizontalAlignment : @143,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @145
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutFitContentResizer { }
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @66
							},
							#constraints : {
								@68 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : BlTopAlignment { }
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : BlHorizontalStartAlignment { }
									},
									#weight : 1
								},
								@11 : BlFrameLayoutConstraints {
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
							#margin : @80,
							#padding : BlInsets {
								#top : 4.0,
								#left : 8.0,
								#bottom : 4.0,
								#right : 8.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @20,
							#maxWidth : @20,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @153,
							#previouslyAccessedConstraintsType : @68,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 470.0, 25.598 ],
								#pathCache : BlPathCache {
									#geometry : @166,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 470.0,
										#bottom : 25.598
									}
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 235.0, 12.799 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @91
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @93,
									#lineJoin : @94,
									#miterLimit : 4.0,
									#dashArray : @95,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @57
								}
							},
							#mouseCursor : @98
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #b2
							},
							#enabled : true,
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @150
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : BlLayoutMatchParentResizer { }
									},
									#constraints : {
										@68 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @155
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @157
											},
											#weight : 1
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @189,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @20,
									#maxWidth : @20,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @185,
									#previouslyAccessedConstraintsType : @68,
									#accountTransformation : false
								},
								#visuals : BlDefaultVisuals { },
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#enabled : true,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#constraints : {
												@11 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @15,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @127,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @19,
											#padding : @19,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @20,
											#maxWidth : @20,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @197,
											#previouslyAccessedConstraintsType : @11,
											#accountTransformation : false
										},
										#visuals : @21,
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
															#paint : @138
														}
													],
													#rope : BlCollectionRope {
														#collection : ''<answer>''
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
										#layout : @212
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							}
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @213,
							#horizontalAlignment : @214,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @216
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutFitContentResizer { }
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @66
							},
							#constraints : {
								@68 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : BlTopAlignment { }
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : BlHorizontalStartAlignment { }
									},
									#weight : 1
								},
								@11 : BlFrameLayoutConstraints {
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
							#margin : @80,
							#padding : BlInsets {
								#top : 4.0,
								#left : 8.0,
								#bottom : 4.0,
								#right : 8.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @20,
							#maxWidth : @20,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @224,
							#previouslyAccessedConstraintsType : @68,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 470.0, 25.597999999999985 ],
								#pathCache : BlPathCache {
									#geometry : @237,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 470.0,
										#bottom : 25.597999999999985
									}
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 235.0, 12.798999999999992 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @91
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @93,
									#lineJoin : @94,
									#miterLimit : 4.0,
									#dashArray : @95,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @57
								}
							},
							#mouseCursor : @98
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #b3
							},
							#enabled : true,
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @221
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : BlLayoutMatchParentResizer { }
									},
									#constraints : {
										@68 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @226
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @228
											},
											#weight : 1
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @260,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @20,
									#maxWidth : @20,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @256,
									#previouslyAccessedConstraintsType : @68,
									#accountTransformation : false
								},
								#visuals : BlDefaultVisuals { },
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#enabled : true,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#constraints : {
												@11 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @15,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @127,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @19,
											#padding : @19,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @20,
											#maxWidth : @20,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @268,
											#previouslyAccessedConstraintsType : @11,
											#accountTransformation : false
										},
										#visuals : @21,
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
															#paint : @138
														}
													],
													#rope : BlCollectionRope {
														#collection : ''<answer>''
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
										#layout : @283
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							}
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @284,
							#horizontalAlignment : @285,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @287
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutFitContentResizer { }
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @66
							},
							#constraints : {
								@68 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : BlTopAlignment { }
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : BlHorizontalStartAlignment { }
									},
									#weight : 1
								},
								@11 : BlFrameLayoutConstraints {
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
							#margin : @80,
							#padding : BlInsets {
								#top : 4.0,
								#left : 8.0,
								#bottom : 4.0,
								#right : 8.0
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @20,
							#maxWidth : @20,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @295,
							#previouslyAccessedConstraintsType : @68,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 470.0, 25.598000000000013 ],
								#pathCache : BlPathCache {
									#geometry : @308,
									#strokedBounds : BlBounds {
										#left : 0.0,
										#top : 0.0,
										#right : 470.0,
										#bottom : 25.598000000000013
									}
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 235.0, 12.799000000000007 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @91
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @93,
									#lineJoin : @94,
									#miterLimit : 4.0,
									#dashArray : @95,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @57
								}
							},
							#mouseCursor : @98
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #b4
							},
							#enabled : true,
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @292
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : BlLayoutMatchParentResizer { }
									},
									#constraints : {
										@68 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @297
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @299
											},
											#weight : 1
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : BlInsets {
										#top : 0.0,
										#left : 0.0,
										#bottom : 0.0,
										#right : 0.0
									},
									#padding : @331,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @20,
									#maxWidth : @20,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @327,
									#previouslyAccessedConstraintsType : @68,
									#accountTransformation : false
								},
								#visuals : BlDefaultVisuals { },
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#enabled : true,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @8
											},
											#constraints : {
												@11 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @15,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @127,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @19,
											#padding : @19,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @20,
											#maxWidth : @20,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @339,
											#previouslyAccessedConstraintsType : @11,
											#accountTransformation : false
										},
										#visuals : @21,
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
															#paint : @138
														}
													],
													#rope : BlCollectionRope {
														#collection : ''<answer>''
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
										#layout : @354
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							}
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @355,
							#horizontalAlignment : @356,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @358
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @8
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : BlLayoutExactResizer {
							#size : 500.0
						}
					},
					#constraints : {
						@11 : BlFrameLayoutConstraints {
							#vertical : BlFrameLayoutConstraintsVertical {
								#alignment : BlBottomAlignment { },
								#weight : 1.0
							},
							#horizontal : BlFrameLayoutConstraintsHorizontal {
								#alignment : @17,
								#weight : 1.0
							}
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : BlInsets {
						#top : 20.0,
						#left : 20.0,
						#bottom : 20.0,
						#right : 20.0
					},
					#padding : @19,
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @20,
					#maxWidth : @20,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @365,
					#previouslyAccessedConstraintsType : @11,
					#accountTransformation : false
				},
				#visuals : BlCustomVisuals {
					#background : BlTransparentBackground {
						
					}
				},
				#userData : IdentityDictionary {
					#elementId : BlElementNamedId {
						#identifier : #buttons
					}
				},
				#layout : BlLinearLayout {
					#weightSum : 0,
					#verticalAlignment : BlNullVerticalAlignment { },
					#horizontalAlignment : BlNullHorizontalAlignment { },
					#orientation : BlLinearLayoutVerticalOrientation {
						#layout : @375
					},
					#shouldUseLargestChild : false,
					#cellSpacing : 0.0,
					#interspace : 0.0
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutMatchParentResizer { }
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @381
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : BlInsets {
				#top : 0.0,
				#left : 0.0,
				#bottom : 0.0,
				#right : 0.0
			},
			#padding : @384,
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @20,
			#maxWidth : @20,
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

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> b1Button [

	^ ((self childWithId: #body) childWithId: #buttons) childWithId: #b1
]

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> b2Button [

	^ ((self childWithId: #body) childWithId: #buttons) childWithId: #b2
]

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> b3Button [

	^ ((self childWithId: #body) childWithId: #buttons) childWithId: #b3
]

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> b4Button [

	^ ((self childWithId: #body) childWithId: #buttons) childWithId: #b4
]

{ #category : 'accessing' }
PyramidQuizQuestionsView >> buttons [

	^ { self b1Button . self b2Button . self b3Button . self b4Button }
]

{ #category : 'initialization' }
PyramidQuizQuestionsView >> game: anObject [

	super game: anObject.
	questionsToAnswer := self game quizModel as: Stack.
	self nextQuestion
]

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> nextQuestion [

	| model buttons |
	self questionsToAnswer ifEmpty: [
		self game goEnd.
		^ self ].
	model := self questionsToAnswer pop.
	self questionLabel text: (model question asRopedText
			 fontSize: 40;
			 foreground: Color white;
			 yourself).
	self numberLabel text: (('<1p> / <2p>'
			 expandMacrosWith: self game currentQuestionNumber
			 with: (self game totalQuestionsNumber)) asRopedText
					  fontSize: 22;
					  foreground: Color white;
					  yourself).
	self game currentQuestionNumber: self game currentQuestionNumber + 1.
	buttons := self buttons shuffled.
	buttons do: [ :each | each whenClickedDo: [ self nextQuestion ] ].
	(buttons at: 1) whenClickedDo: [
		self game correctAnswers: self game correctAnswers + 1.
		self nextQuestion ].
	(buttons at: 1) labelText: model trueAnswer.
	(buttons at: 2) labelText: model falseAnswer1.
	(buttons at: 3) labelText: model falseAnswer2.
	(buttons at: 4) labelText: model falseAnswer3
]

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> numberLabel [

	^ (self childWithId: #body) childWithId: #number
]

{ #category : 'as yet unclassified' }
PyramidQuizQuestionsView >> questionLabel [

	^ (self childWithId: #body) childWithId: #question
]

{ #category : 'accessing' }
PyramidQuizQuestionsView >> questionsToAnswer [

	^ questionsToAnswer
]
