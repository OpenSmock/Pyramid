Extension { #name : #BlElement }

{ #category : #'*Pyramid-Spec' }
BlElement >> openInNewSpaceWithPyramidShortcut [
	"Add self to a new BlSpace and show it. Add a keyBoard shortcut to open pyramid editor. Answer such space."

	^ BlSpace new
		  when: BlKeyDownEvent do: [ :anEvent |
			  anEvent key = KeyboardKey F2 ifTrue: [
					  PyBusiness new openOn: self ] ];
		  addChild: self;
		  show;
		  yourself
]
