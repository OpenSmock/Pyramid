Class {
	#name : #PyramidToploExamples,
	#superclass : #Object,
	#category : #'Pyramid-Toplo-Examples'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidToploExamples class >> buttons [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-02-01 17:33:55"

	<pySTON>
	^ '[
	ToElement {
		#children : BlChildrenArray [
			BlElement {
				#children : BlChildrenArray [
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutFitContentResizer { }
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
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : Float [ #infinity ],
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @14,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 107.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @24
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 53.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : Color {
										#red : 0.08602150537634409,
										#green : 0.4662756598240469,
										#blue : 1.0,
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
									#color : @31
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonA
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : BlVerticalCenterAlignment { }
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : BlHorizontalCenterAlignment { }
											},
											#weight : 1
										},
										Class [ #BlFrameLayout ] : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @45,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : BlDefaultVisuals { },
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @62,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : Color [ #white ]
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Primary Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : BlNullVerticalAlignment { },
									#horizontalAlignment : BlNullHorizontalAlignment { },
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @87
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#primary : ToStampProperty {
									#name : #primary,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @104
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @112,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 104.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @118
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 52.0, 16.0 ]
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
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color [ #white ]
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonB
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @137,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @150,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
														#collection : ''Default Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @175
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @189
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @197,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 105.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @203
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 52.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @125
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : [
										3,
										3
									],
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @129
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonC
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @221,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @234,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @163
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Dashed Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @258
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#dashed : ToStampProperty {
									#name : #dashed,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @273
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @281,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 86.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @287
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 43.0, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : Color {
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.0
									}
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @129
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonD
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @305,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @318,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @163
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Text Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @342
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#text : ToStampProperty {
									#name : #text,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @357
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @365,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 85.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @371
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 42.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @294
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @129
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonE
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @388,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @401,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : Color {
																#red : 0.08602150537634409,
																#green : 0.4662756598240469,
																#blue : 1.0,
																#alpha : 1.0
															}
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Link Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @426
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#link : ToStampProperty {
									#name : #link,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @441
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @11
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @11
					},
					#constraints : {
						Class [ #BlFlowLayout ] : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @16
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @18
							},
							#newLine : false,
							#weight : 0,
							#display : BlFlowLayoutInline { }
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @20,
					#padding : BlInsets {
						#top : 5.0,
						#left : 5.0,
						#bottom : 5.0,
						#right : 5.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @22,
					#maxWidth : @22,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @448,
					#previouslyAccessedConstraintsType : @447,
					#accountTransformation : false
				},
				#visuals : @55,
				#userData : IdentityDictionary { },
				#layout : BlLinearLayout {
					#weightSum : 0,
					#verticalAlignment : @88,
					#horizontalAlignment : @89,
					#orientation : BlLinearLayoutHorizontalOrientation {
						#layout : @455
					},
					#shouldUseLargestChild : false,
					#cellSpacing : 5.0,
					#interspace : 0.0
				}
			},
			BlElement {
				#children : BlChildrenArray [
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @465,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 107.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @471
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 53.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : Color {
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.2
									}
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color {
										#red : 0.0,
										#green : 0.0,
										#blue : 0.0,
										#alpha : 0.0392156862745098
									}
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonA
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @490,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @503,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : Color [ #lightGray ]
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Primary Button''
													}
												}
											},
											#enabled : false,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : false,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @528
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : false,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#primary : ToStampProperty {
									#name : #primary,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @543
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @551,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 104.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @557
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 52.0, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @478
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @482
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonB
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @574,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @587,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @516
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Default Button''
													}
												}
											},
											#enabled : false,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : false,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @611
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : false,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @625
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @633,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 105.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @639
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 52.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @478
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @211,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @482
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonC
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @656,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @669,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @516
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Dashed Button''
													}
												}
											},
											#enabled : false,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : false,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @693
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : false,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#dashed : ToStampProperty {
									#name : #dashed,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @708
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @716,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 86.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @722
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 43.0, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @294
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @294
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonD
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @739,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @752,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @516
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Text Button''
													}
												}
											},
											#enabled : false,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : false,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @776
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : false,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#text : ToStampProperty {
									#name : #text,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @791
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @799,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 85.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @805
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 42.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @294
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @294
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonE
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @822,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @835,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @516
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Link Button''
													}
												}
											},
											#enabled : false,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : false,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @859
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : false,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#link : ToStampProperty {
									#name : #link,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @874
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @11
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @11
					},
					#constraints : {
						@447 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @16
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @18
							},
							#newLine : false,
							#weight : 0,
							#display : @451
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @20,
					#padding : BlInsets {
						#top : 5.0,
						#left : 5.0,
						#bottom : 5.0,
						#right : 5.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @22,
					#maxWidth : @22,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @880,
					#previouslyAccessedConstraintsType : @447,
					#accountTransformation : false
				},
				#visuals : @55,
				#userData : IdentityDictionary { },
				#layout : BlLinearLayout {
					#weightSum : 0,
					#verticalAlignment : @88,
					#horizontalAlignment : @89,
					#orientation : BlLinearLayoutHorizontalOrientation {
						#layout : @886
					},
					#shouldUseLargestChild : false,
					#cellSpacing : 5.0,
					#interspace : 0.0
				}
			},
			BlElement {
				#children : BlChildrenArray [
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @896,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 107.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @902
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 53.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : Color {
										#red : 1.0,
										#green : 0.3020527859237537,
										#blue : 0.3098729227761486,
										#alpha : 1.0
									}
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @909
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonA
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @920,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @933,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @75
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Primary Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @957
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#danger : ToStampProperty {
									#name : #danger,
									#value : true
								},
								#primary : ToStampProperty {
									#name : #primary,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @973
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @981,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 104.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @987
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 52.0, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @909
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @129
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonB
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @1004,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @1017,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : Color {
																#red : 1.0,
																#green : 0.3020527859237537,
																#blue : 0.3098729227761486,
																#alpha : 1.0
															}
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Default Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @1042
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#danger : ToStampProperty {
									#name : #danger,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @1057
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @1065,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 105.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @1071
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 52.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @909
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @211,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @129
								}
							}
						},
						#userData : IdentityDictionary {
							#elementId : BlElementNamedId {
								#identifier : #buttonC
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @1088,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @1101,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @1030
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Dashed Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @1125
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#dashed : ToStampProperty {
									#name : #dashed,
									#value : true
								},
								#danger : ToStampProperty {
									#name : #danger,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @1141
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @1149,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 86.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @1155
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 43.0, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @294
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : Color [ #white ]
								}
							}
						},
						#userData : IdentityDictionary {
							#closeTooltipWindowOnMouseLeave : true,
							#elementId : BlElementNamedId {
								#identifier : #buttonD
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @1173,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @1186,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @1030
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Text Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @1210
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#danger : ToStampProperty {
									#name : #danger,
									#value : true
								},
								#text : ToStampProperty {
									#name : #text,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @1226
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					},
					ToButton {
						#constraints : BlLayoutCommonConstraints {
							#vertical : BlLayoutCommonConstraintsAxis {
								#resizer : BlLayoutExactResizer {
									#size : 32.0
								}
							},
							#horizontal : BlLayoutCommonConstraintsAxis {
								#resizer : @11
							},
							#constraints : {
								@13 : BlLinearLayoutConstraints {
									#vertical : BlLinearLayoutConstraintsVertical {
										#alignment : @16
									},
									#horizontal : BlLinearLayoutConstraintsHorizontal {
										#alignment : @18
									},
									#weight : 1
								}
							},
							#position : Point [ 0.0, 0.0 ],
							#margin : @20,
							#padding : BlInsets {
								#top : 4.0,
								#left : 7.5,
								#bottom : 4.0,
								#right : 7.5
							},
							#minHeight : 0.0,
							#minWidth : 0.0,
							#maxHeight : @22,
							#maxWidth : @22,
							#ignoredByLayout : false,
							#previouslyAccessedConstraints : @1234,
							#previouslyAccessedConstraintsType : @13,
							#accountTransformation : false
						},
						#visuals : BlCustomVisuals {
							#geometry : BlRoundedRectangleGeometry {
								#extent : Point [ 85.0, 32.0 ],
								#pathCache : BlPathCache {
									#geometry : @1240
								},
								#cornerRadii : BlCornerRadii {
									#topLeft : 6,
									#topRight : 6,
									#bottomLeft : 6,
									#bottomRight : 6
								},
								#center : Point [ 42.5, 16.0 ]
							},
							#border : BlBorder {
								#paint : BlColorPaint {
									#color : @294
								},
								#width : 1,
								#style : BlStrokeStyle {
									#lineCap : @33,
									#lineJoin : @34,
									#miterLimit : 4.0,
									#dashArray : @35,
									#dashOffset : 0.0
								},
								#opacity : 1.0
							},
							#background : BlPaintBackground {
								#paint : BlColorPaint {
									#color : @129
								}
							}
						},
						#userData : IdentityDictionary {
							#closeTooltipWindowOnMouseLeave : true,
							#elementId : BlElementNamedId {
								#identifier : #buttonE
							},
							#stonLabeledIcon : ToLabeledIcon {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#constraints : {
										@13 : BlLinearLayoutConstraints {
											#vertical : BlLinearLayoutConstraintsVertical {
												#alignment : @47
											},
											#horizontal : BlLinearLayoutConstraintsHorizontal {
												#alignment : @49
											},
											#weight : 1
										},
										@50 : BlFrameLayoutConstraints {
											#vertical : BlFrameLayoutConstraintsVertical {
												#alignment : @47,
												#weight : 1.0
											},
											#horizontal : BlFrameLayoutConstraintsHorizontal {
												#alignment : @49,
												#weight : 1.0
											}
										}
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#previouslyAccessedConstraints : @1257,
									#previouslyAccessedConstraintsType : @13,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#stonToImage : nil,
									#stonToLabel : ToLabel {
										#constraints : BlLayoutCommonConstraints {
											#vertical : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#horizontal : BlLayoutCommonConstraintsAxis {
												#resizer : @11
											},
											#constraints : {
												@50 : BlFrameLayoutConstraints {
													#vertical : BlFrameLayoutConstraintsVertical {
														#alignment : @16,
														#weight : 1.0
													},
													#horizontal : BlFrameLayoutConstraintsHorizontal {
														#alignment : @18,
														#weight : 1.0
													}
												}
											},
											#position : Point [ 0.0, 0.0 ],
											#margin : @20,
											#padding : @20,
											#minHeight : 0.0,
											#minWidth : 0.0,
											#maxHeight : @22,
											#maxWidth : @22,
											#ignoredByLayout : false,
											#previouslyAccessedConstraints : @1270,
											#previouslyAccessedConstraintsType : @50,
											#accountTransformation : false
										},
										#visuals : @55,
										#userData : IdentityDictionary {
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
															#paint : @1030
														}
													],
													#rope : BlCollectionRope {
														#collection : ''Link Button''
													}
												}
											},
											#enabled : true,
											#stamps : [
												#label : ToStampProperty {
													#name : #label,
													#value : true
												}
											],
											#tokens : [ ]
										},
										#layout : BlFrameLayout { }
									},
									#enabled : true,
									#stamps : [
										#horizontal : ToStampProperty {
											#name : #horizontal,
											#value : true
										},
										#labeled-icon : ToStampProperty {
											#name : #labeled-icon,
											#value : true
										},
										#exact-interspace : ToStampProperty {
											#name : #exact-interspace,
											#value : true
										},
										#icon-first : ToStampProperty {
											#name : #icon-first,
											#value : true
										}
									],
									#tokens : [ ]
								},
								#layout : BlLinearLayout {
									#weightSum : 0,
									#verticalAlignment : @88,
									#horizontalAlignment : @89,
									#orientation : BlLinearLayoutHorizontalOrientation {
										#layout : @1294
									},
									#shouldUseLargestChild : false,
									#cellSpacing : 0.0,
									#interspace : 0.0
								}
							},
							#enabled : true,
							#tooltipContent : ToLabel {
								#constraints : BlLayoutCommonConstraints {
									#vertical : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#horizontal : BlLayoutCommonConstraintsAxis {
										#resizer : @11
									},
									#position : Point [ 0.0, 0.0 ],
									#margin : @20,
									#padding : @20,
									#minHeight : 0.0,
									#minWidth : 0.0,
									#maxHeight : @22,
									#maxWidth : @22,
									#ignoredByLayout : false,
									#accountTransformation : false
								},
								#visuals : @55,
								#userData : IdentityDictionary {
									#enabled : true,
									#stonToLabelText : BlRopedText {
										#rope : BlCollectionRope {
											#collection : ''I\''m a button''
										}
									}
								},
								#layout : BlFrameLayout { }
							},
							#stamps : [
								#button : ToStampProperty {
									#name : #button,
									#value : true
								},
								#link : ToStampProperty {
									#name : #link,
									#value : true
								},
								#danger : ToStampProperty {
									#name : #danger,
									#value : true
								}
							],
							#tokens : [ ]
						},
						#layout : BlLinearLayout {
							#weightSum : 0,
							#verticalAlignment : @88,
							#horizontalAlignment : @89,
							#orientation : BlLinearLayoutHorizontalOrientation {
								#layout : @1310
							},
							#shouldUseLargestChild : false,
							#cellSpacing : 0.0,
							#interspace : 0.0
						}
					}
				],
				#constraints : BlLayoutCommonConstraints {
					#vertical : BlLayoutCommonConstraintsAxis {
						#resizer : @11
					},
					#horizontal : BlLayoutCommonConstraintsAxis {
						#resizer : @11
					},
					#constraints : {
						@447 : BlFlowLayoutConstraints {
							#vertical : BlFlowLayoutConstraintsVertical {
								#alignment : @16
							},
							#horizontal : BlFlowLayoutConstraintsHorizontal {
								#alignment : @18
							},
							#newLine : false,
							#weight : 0,
							#display : @451
						}
					},
					#position : Point [ 0.0, 0.0 ],
					#margin : @20,
					#padding : BlInsets {
						#top : 5.0,
						#left : 5.0,
						#bottom : 5.0,
						#right : 5.0
					},
					#minHeight : 0.0,
					#minWidth : 0.0,
					#maxHeight : @22,
					#maxWidth : @22,
					#ignoredByLayout : false,
					#previouslyAccessedConstraints : @1316,
					#previouslyAccessedConstraintsType : @447,
					#accountTransformation : false
				},
				#visuals : @55,
				#userData : IdentityDictionary { },
				#layout : BlLinearLayout {
					#weightSum : 0,
					#verticalAlignment : @88,
					#horizontalAlignment : @89,
					#orientation : BlLinearLayoutHorizontalOrientation {
						#layout : @1322
					},
					#shouldUseLargestChild : false,
					#cellSpacing : 5.0,
					#interspace : 0.0
				}
			}
		],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : @11
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : @11
			},
			#constraints : {
				@447 : BlFlowLayoutConstraints {
					#vertical : BlFlowLayoutConstraintsVertical {
						#alignment : @16
					},
					#horizontal : BlFlowLayoutConstraintsHorizontal {
						#alignment : @18
					},
					#newLine : false,
					#weight : 0,
					#display : @451
				}
			},
			#position : Point [ 0.0, 0.0 ],
			#margin : @20,
			#padding : BlInsets {
				#top : 5.0,
				#left : 5.0,
				#bottom : 5.0,
				#right : 5.0
			},
			#minHeight : 0.0,
			#minWidth : 0.0,
			#maxHeight : @22,
			#maxWidth : @22,
			#ignoredByLayout : false,
			#previouslyAccessedConstraints : @1328,
			#previouslyAccessedConstraintsType : @447,
			#accountTransformation : false
		},
		#visuals : @55,
		#userData : IdentityDictionary {
			#enabled : true,
			#elementId : BlElementNamedId {
				#identifier : #themeSandBox
			},
			#stamps : [ ],
			#tokens : [ ]
		},
		#layout : BlFlowLayout {
			#measurer : BlFlowLayoutMeasurer {
				#layout : @1337,
				#children : OrderedCollection [
					BlFlowLayoutInlineChild {
						#width : 527.0,
						#height : 42.0,
						#margin : @20,
						#weight : 0,
						#newLine : false,
						#startLength : 0,
						#startBreadth : 0,
						#element : @4,
						#alignment : BlCompositeAlignment {
							#vertical : @16,
							#horizontal : @18,
							#direction : BlLayoutLeftToRight { }
						},
						#measurer : @1338,
						#display : @451
					},
					BlFlowLayoutInlineChild {
						#width : 527.0,
						#height : 42.0,
						#margin : @20,
						#weight : 0,
						#newLine : false,
						#startLength : 42.0,
						#startBreadth : 0.0,
						#element : @457,
						#alignment : BlCompositeAlignment {
							#vertical : @16,
							#horizontal : @18,
							#direction : @1342
						},
						#measurer : @1338,
						#display : @451
					},
					BlFlowLayoutInlineChild {
						#width : 527.0,
						#height : 42.0,
						#margin : @20,
						#weight : 0,
						#newLine : false,
						#startLength : 84.0,
						#startBreadth : 0.0,
						#element : @888,
						#alignment : BlCompositeAlignment {
							#vertical : @16,
							#horizontal : @18,
							#direction : @1342
						},
						#measurer : @1338,
						#display : @451
					}
				],
				#lines : OrderedCollection [
					BlFlowLayoutLine {
						#children : OrderedCollection [
							@1340,
							@1343,
							@1345
						],
						#startLength : 0,
						#startBreadth : 0,
						#length : 126.0,
						#breadth : 527.0,
						#measurer : @1338
					}
				],
				#orientation : BlFlowLayoutVertical { },
				#maxWidth : -10.0,
				#maxHeight : -10.0,
				#widthMode : BlMeasurementSpec {
					#size : 0.0,
					#mode : BlMeasurementUnspecifiedMode { }
				},
				#heightMode : BlMeasurementSpec {
					#size : 0.0,
					#mode : @1352
				},
				#checkCanFit : false
			},
			#orientation : BlLayoutVertical { },
			#horizontalAlignment : @18,
			#verticalAlignment : @16
		}
	}
]'
]
