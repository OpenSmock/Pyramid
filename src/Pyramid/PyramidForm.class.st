Class {
	#name : #PyramidForm,
	#superclass : #Object,
	#category : #'Pyramid-properties-external'
}

{ #category : #'pyramid-serialized-bloc' }
PyramidForm class >> elementWithForm [
	"This class has been generated using Pyramid.

	By: YannLEGOFF
	2023-05-24 10:12:42"

	<pySTON>
	^ 'OrderedCollection [
	BlElement {
		#children : BlChildrenArray [ ],
		#constraints : BlLayoutCommonConstraints {
			#vertical : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 260.0
				}
			},
			#horizontal : BlLayoutCommonConstraintsAxis {
				#resizer : BlLayoutExactResizer {
					#size : 260.0
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
					#source : PyramidERClassSelector {
						#selector : #pharoBig,
						#target : #PyramidForm
					}
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
	}
]'
]

{ #category : #'as yet unclassified' }
PyramidForm class >> pharoBig [

	^ Object iconNamed: #pharoBig
]
