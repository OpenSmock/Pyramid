Class {
	#name : #PyramidDrawOrderIcons,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocMoveBackward [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-12-15 09:23:43"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#position : Point [ 4, 4 ],
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
			},
			#elevation : BlRelativeElevation {
				#elevation : 1
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
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
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
						#alpha : 1.0
					}
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @17,
					#lineJoin : @18,
					#miterLimit : 4.0,
					#dashArray : @19,
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
			},
			#elevation : BlRelativeElevation {
				#elevation : 2
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #A
			}
		},
		#layout : @26
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocMoveForward [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-12-15 09:24:01"

	<pySTON>
	^ '[
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
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
					#color : Color {
						#red : 0.9022482893450635,
						#green : 0.9022482893450635,
						#blue : 0.9022482893450635,
						#alpha : 1.0
					}
				}
			},
			#elevation : BlRelativeElevation {
				#elevation : 0
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #A
			}
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 12.0
				}
			},
			#position : Point [ 4, 4 ],
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @17,
					#lineJoin : @18,
					#miterLimit : 4.0,
					#dashArray : @19,
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
			},
			#elevation : BlRelativeElevation {
				#elevation : 1
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #B
			}
		},
		#layout : @26
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocOnBackground [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-12-15 09:22:07"

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
			#position : Point [ 4, 4 ],
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
			},
			#elevation : BlRelativeElevation {
				#elevation : 1
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
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
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 8.0
				}
			},
			#position : Point [ 0.0, 0.0 ],
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
						#alpha : 1.0
					}
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @17,
					#lineJoin : @18,
					#miterLimit : 4.0,
					#dashArray : @19,
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
			},
			#elevation : BlRelativeElevation {
				#elevation : 2
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #A
			}
		},
		#layout : @26
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
			#position : Point [ 8.0, 8.0 ],
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
						#alpha : 1.0
					}
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @17,
					#lineJoin : @18,
					#miterLimit : 4.0,
					#dashArray : @19,
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : @40,
			#elevation : BlRelativeElevation {
				#elevation : 2
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #C
			}
		},
		#layout : @26
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidDrawOrderIcons class >> blocOnForeground [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-12-15 09:21:40"

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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
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
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #A
			}
		},
		#layout : BlBasicLayout { }
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
			#position : Point [ 8.0, 8.0 ],
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.592375366568915,
						#green : 0.592375366568915,
						#blue : 0.592375366568915,
						#alpha : 1.0
					}
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @17,
					#lineJoin : @18,
					#miterLimit : 4.0,
					#dashArray : @19,
					#dashOffset : 0.0
				},
				#opacity : 1.0
			},
			#background : @20
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #C
			}
		},
		#layout : @25
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
			#position : Point [ 4, 4 ],
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
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color [ #black ]
				},
				#width : 1,
				#style : BlStrokeStyle {
					#lineCap : @17,
					#lineJoin : @18,
					#miterLimit : 4.0,
					#dashArray : @19,
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
			},
			#elevation : BlRelativeElevation {
				#elevation : 1
			}
		},
		#userData : IdentityDictionary {
			#shouldHandleMousePickOutsideEvent : false,
			#elementId : BlElementNamedId {
				#identifier : #B
			}
		},
		#layout : @25
	}
]'
]
