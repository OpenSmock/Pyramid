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
		                 border: self defaultBorder;
		                 outskirts: BlOutskirts inside;
		clipChildren: false;
		                 yourself.


	windowOverlay := PyramidOverlay new
		                 position: 1000;
		                 element: windowElement;
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
