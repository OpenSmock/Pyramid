Class {
	#name : #PyramidVisibilityInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'buttonVisible',
		'whenValueChangedDo',
		'value',
		'buttonNotVisible'
	],
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocGone [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 12:04:35"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 1.0,
						#blue : 0.3333333333333333,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
			},
			#shouldHandleMousePickOutsideEvent : false
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 11, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 0.3333333333333333,
						#blue : 1.0,
						#alpha : 1.0
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #E
			},
			#shouldHandleMousePickOutsideEvent : false
		},
		#layout : @17
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocHidden [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 12:05:28"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 1.0,
						#blue : 0.3333333333333333,
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
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 11, 3 ],
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
					#color : Color {
						#red : 1.0,
						#green : 0.3333333333333333,
						#blue : 0.3333333333333333,
						#alpha : 0.2980392156862745
					}
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #D
			}
		},
		#layout : @17
	},
	BlElement {
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
			#position : Point [ 22, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 0.3333333333333333,
						#blue : 1.0,
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
		#layout : @17
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocVisibilityUnknow [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 12:06:04"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 3 ],
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
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 1.0
						},
						1 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 0.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 8.0, 0.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #C
			}
		},
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 11, 3 ],
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
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 1.0
						},
						1 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 0.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 8.0, 0.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #D
			}
		},
		#layout : @21
	},
	BlElement {
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
			#position : Point [ 22, 3 ],
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
				#paint : BlLinearGradientPaint {
					#stops : [
						0 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 1.0
						},
						1 : Color {
							#red : 1.0,
							#green : 0.8592375366568915,
							#blue : 0.2590420332355816,
							#alpha : 0.0
						}
					],
					#start : Point [ 0, 0 ],
					#end : Point [ 8.0, 0.0 ]
				}
			}
		},
		#userData : IdentityDictionary {
			#elementId : BlElementNamedId {
				#identifier : #E
			}
		},
		#layout : @21
	}
]'
]

{ #category : #'pyramid-serialized-bloc' }
PyramidVisibilityInputPresenter class >> blocVisible [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2024-01-22 12:06:38"

	<pySTON>
	^ '[
	BlElement {
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
			#position : Point [ 0, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 1.0,
						#blue : 0.3333333333333333,
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
		#layout : BlBasicLayout { }
	},
	BlElement {
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
			#position : Point [ 11, 3 ],
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
					#color : Color {
						#red : 1.0,
						#green : 0.3333333333333333,
						#blue : 0.3333333333333333,
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
		#layout : @17
	},
	BlElement {
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
			#position : Point [ 22, 3 ],
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
					#color : Color {
						#red : 0.3333333333333333,
						#green : 0.3333333333333333,
						#blue : 1.0,
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
		#layout : @17
	}
]'
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formGone [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocGone materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formHidden [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocHidden materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formVisibilityUnknow [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocVisibilityUnknow materializeAsBlElement)
		  exportAsForm
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter class >> formVisible [

	^ (BlElement new
		   size: 40 @ 16;
		   addChildren: self blocVisible materializeAsBlElement) exportAsForm
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> buttonNotVisible [

	^ buttonNotVisible
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> buttonVisible [

	^ buttonVisible
]

{ #category : #layout }
PyramidVisibilityInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: self buttonVisible expand: false;
		  add: self buttonNotVisible expand: true;
		  yourself
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :visibility |  ].
	buttonVisible := SpButtonPresenter new
		                 action: [
			                 self value switchVisibleOn: self.
			                 self whenValueChangedDo value: self value ];
		                 enabled: false;
		                 yourself.
	buttonNotVisible := SpButtonPresenter new
		                    label: 'No value';
		                    action: [
			                    self value switchNotVisibleOn: self.
			                    self whenValueChangedDo value: self value ];
		                    enabled: false;
		                    yourself
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> setVisibilityEmptyValue [

	self buttonNotVisible
		enabled: false;
		label: 'No value';
		help: 'Nothing selected.';
		icon: self class formVisibilityUnknow.
	self buttonVisible
		enabled: false;
		help: 'Nothing selected.';
		icon: self value asIcon
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityGone [

	self buttonNotVisible
		enabled: true;
		label: 'Gone';
		help:
			'The selection is "Gone". It will not display and will not affect the parent layout. Clic to set as "Hidden".';
		icon: self class formGone.
	self buttonVisible
		enabled: true;
		help:
			'The selection is "Gone". It will not display and will not affect the parent layout. Clic to set as "Visible".';
		icon: self value asIcon
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityHidden [

	self buttonNotVisible
		enabled: true;
		label: 'Hidden';
		help:
			'The selection is "Hidden". It will not display and will affect the parent layout. Clic to set as "Gone".';
		icon: self class formHidden.
	self buttonVisible
		enabled: true;
		help:
			'The selection is "Hidden". It will not display and will affect the parent layout. Clic to set as "Visible".';
		icon: self value asIcon
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> setVisibilityMixedValues [

	self buttonNotVisible
		enabled: false;
		label: 'Mixed';
		help:
			'The visibility is unknow. Use the popup to edit the visibility';
		icon: self class formVisibilityUnknow.
	self buttonVisible
		enabled: false;
		icon: self value asIcon
]

{ #category : #initialization }
PyramidVisibilityInputPresenter >> setVisibilityVisible [

	self buttonNotVisible
		enabled: true;
		label: 'Visible';
		help:
			'The selection is "Visible". It will display and will affect the parent layout. Clic on the left button to set as "Hidden".';
		icon: self class formVisible.

	self buttonVisible
		enabled: true;
		help:
			'The selection is "Visible". It will display and will affect the parent layout. Clic to set as "Hidden".';
		icon: self value asIcon
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter >> value [

	^ value
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenter >> value: aBlVisibility [

	value := aBlVisibility.
	aBlVisibility setVisibilityOn: self
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidVisibilityInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
