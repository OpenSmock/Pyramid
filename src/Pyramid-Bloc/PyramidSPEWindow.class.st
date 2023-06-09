Class {
	#name : #PyramidSPEWindow,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'windowElement',
		'windowOverlay'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #initialization }
PyramidSPEWindow >> defaultBorder [

	^ BlBorderBuilder new width: 2; paint: Color blue; capButt; dashed; joinBevel; build
]

{ #category : #hooks }
PyramidSPEWindow >> defaultSize [

	^ 600 @ 400
]

{ #category : #initialization }
PyramidSPEWindow >> initialize [

	windowElement := BlElement new
		                 id: #window;
		                 size: self defaultSize;
		                 clipChildren: false;
		                 yourself.


	windowOverlay := PyramidOverlay new
		                 position: 1000;
		                 element: windowElement;
		                 whenReceiveDo: [
			                 windowElement addChild: (BlElement new
						                  id: #visual;
						                  constraintsDo: [ :c |
							                  c horizontal matchParent.
							                  c vertical matchParent ];
						                  border: self defaultBorder;
						                  outskirts: BlOutskirts outside;
						                  yourself) ];
		                 yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEWindow >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self windowOverlay.
]

{ #category : #'as yet unclassified' }
PyramidSPEWindow >> windowOverlay [

^ windowOverlay
]
