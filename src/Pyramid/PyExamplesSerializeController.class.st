Class {
	#name : #PyExamplesSerializeController,
	#superclass : #Object,
	#category : #'Pyramid-YYY-Examples'
}

{ #category : #'as yet unclassified' }
PyExamplesSerializeController class >> makeElementWithCustomController [

	| element controller handlerEnter handlerLeave |
	element := BlElement new background: Color green.

	controller := PyController new.

	handlerEnter := PyEventHandler
		                when: BlMouseEnterEvent
		                send: #startHover:
		                to: controller.
	handlerLeave := PyEventHandler
		                when: BlMouseLeaveEvent
		                send: #endHover:
		                to: controller.

	element addEventHandler: handlerEnter.
	element addEventHandler: handlerLeave.

	element userData at: #controller put: controller.
	
^ element
]

{ #category : #'as yet unclassified' }
PyExamplesSerializeController class >> open [

	<script>
	| element |
	element := self view materializeAsBlElement.
	element openInNewSpace.
	element inspect.
	(element userData at: #controller) browse
]

{ #category : #'as yet unclassified' }
PyExamplesSerializeController class >> view [

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
		#maxHeight : Float [ #infinity ],
		#maxWidth : @9,
		#ignoredByLayout : false,
		#accountTransformation : false
	},
	#visuals : BlCustomVisuals {
		#background : BlPaintBackground {
			#paint : BlColorPaint {
				#color : Color [ #green ]
			}
		}
	},
	#userData : IdentityDictionary {
		#controller : PyController { }
	},
	#layout : BlBasicLayout { },
	#eventDispatcher : BlElementEventDispatcher {
		#owner : @1,
		#handlers : [
			PyEventHandler {
				#controller : @15,
				#eventClass : Class [ #BlMouseEnterEvent ],
				#performer : #''startHover:''
			},
			PyEventHandler {
				#controller : @15,
				#eventClass : Class [ #BlMouseLeaveEvent ],
				#performer : #''endHover:''
			}
		]
	}
}'
]

{ #category : #'see class side' }
PyExamplesSerializeController >> seeClassSide [

	
]
