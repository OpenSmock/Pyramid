"
i can show and edit boolean.
i have a uncertain state. In uncertain state i can not be edited
"
Class {
	#name : #PyramidSwitchInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'button',
		'state',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidSwitchInputPresenter class >> blocToggleOff [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 13:50:13"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 0.0 ],
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
			#geometry : BlRoundedRectangleGeometry {
				#extent : Point [ 32.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @12
				},
				#cornerRadii : BlCornerRadii {
					#topLeft : 8.5,
					#topRight : 8.5,
					#bottomLeft : 8.5,
					#bottomRight : 8.5
				},
				#center : Point [ 16.0, 8.0 ]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.7839687194525904,
						#green : 0.7839687194525904,
						#blue : 0.7839687194525904,
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
			#opacity : 1.0
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			},
			#figma_metadata : {
				#name : ''Rectangle 60'',
				#id : ''532:1246'',
				#type : ''RECTANGLE''
			}
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 2, 2.0 ],
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
			#geometry : BlEllipseGeometry {
				#extent : Point [ 12.0, 12.0 ],
				#pathCache : BlPathCache {
					#geometry : @39
				}
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
			},
			#opacity : 1.0
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #toggle
			},
			#figma_metadata : {
				#name : ''Ellipse 2'',
				#id : ''532:1247'',
				#type : ''ELLIPSE''
			}
		},
		#layout : @30
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSwitchInputPresenter class >> blocToggleOn [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 13:50:48"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 0.0 ],
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
			#geometry : BlRoundedRectangleGeometry {
				#extent : Point [ 32.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @12
				},
				#cornerRadii : BlCornerRadii {
					#topLeft : 8.5,
					#topRight : 8.5,
					#bottomLeft : 8.5,
					#bottomRight : 8.5
				},
				#center : Point [ 16.0, 8.0 ]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.7839687194525904,
						#green : 0.7839687194525904,
						#blue : 0.7839687194525904,
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
						#red : 0.6862170087976539,
						#green : 0.8357771260997068,
						#blue : 0.9804496578690127,
						#alpha : 1.0
					}
				}
			},
			#opacity : 1.0
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			},
			#figma_metadata : {
				#name : ''Rectangle 60'',
				#id : ''532:1246'',
				#type : ''RECTANGLE''
			}
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 18, 2.0 ],
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
			#geometry : BlEllipseGeometry {
				#extent : Point [ 12.0, 12.0 ],
				#pathCache : BlPathCache {
					#geometry : @39
				}
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
			},
			#opacity : 1.0
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #toggle
			},
			#figma_metadata : {
				#name : ''Ellipse 2'',
				#id : ''532:1247'',
				#type : ''ELLIPSE''
			}
		},
		#layout : @30
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidSwitchInputPresenter class >> blocToggleUncertain [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 13:51:37"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 0.0 ],
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
			#geometry : BlRoundedRectangleGeometry {
				#extent : Point [ 32.0, 16.0 ],
				#pathCache : BlPathCache {
					#geometry : @12
				},
				#cornerRadii : BlCornerRadii {
					#topLeft : 8.5,
					#topRight : 8.5,
					#bottomLeft : 8.5,
					#bottomRight : 8.5
				},
				#center : Point [ 16.0, 8.0 ]
			},
			#border : BlBorder {
				#paint : BlColorPaint {
					#color : Color {
						#red : 0.7839687194525904,
						#green : 0.7839687194525904,
						#blue : 0.7839687194525904,
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
						#red : 1.0,
						#green : 0.8592375366568915,
						#blue : 0.260019550342131,
						#alpha : 1.0
					}
				}
			},
			#opacity : 1.0
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #background
			},
			#figma_metadata : {
				#name : ''Rectangle 60'',
				#id : ''532:1246'',
				#type : ''RECTANGLE''
			}
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 10.0, 2.0 ],
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
			#geometry : BlEllipseGeometry {
				#extent : Point [ 12.0, 12.0 ],
				#pathCache : BlPathCache {
					#geometry : @39
				}
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
			},
			#opacity : 1.0
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #toggle
			},
			#figma_metadata : {
				#name : ''Ellipse 2'',
				#id : ''532:1247'',
				#type : ''ELLIPSE''
			}
		},
		#layout : @30
	}
]'
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter class >> formToggleOff [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocToggleOff materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter class >> formToggleOn [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocToggleOn materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter class >> formToggleUncertain [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocToggleUncertain materializeAsBlElement)
		  exportAsForm
]

{ #category : #accessing }
PyramidSwitchInputPresenter class >> stringsClass [

	^ PyramidSwitchInputStrings
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> applyStrings [

	self button help: self strings help.
	self button label: self strings offLabel
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> button [

	^ button
]

{ #category : #layout }
PyramidSwitchInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self button;
		  yourself
]

{ #category : #initialization }
PyramidSwitchInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :bool | ].
	state := false.
	button := SpButtonPresenter new
		          icon: self class formToggleOff;
		          action: [ self switchState ];
		          yourself
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> label: aString [

	self button label: aString
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> state [

	^ state
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> state: anObject [

	state := anObject
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> switchState [

	self value: self state not.
	self whenValueChangedDo value: self value
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> value [

	^ self state
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenter >> value: aBoolean [

	self state = aBoolean ifTrue: [ ^ self ].
	(aBoolean == true or: [ aBoolean == false ]) ifTrue: [
		self state: aBoolean.
		self button action: [ self switchState ].
		aBoolean
			ifTrue: [ self button icon: self class formToggleOn.
				self button label: self strings onLabel ]
			ifFalse: [ self button icon: self class formToggleOff.
				self button label: self strings offLabel ].
		^ self ].
	self state: PyramidUnknowState new.
	self button icon: self class formToggleUncertain.
	self button label: self strings uncertainLabel.
	self button action: [  ]
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidSwitchInputPresenter >> whenValueChangedDo: aBlock [

	whenValueChangedDo := aBlock
]
