Extension { #name : #BlElement }

{ #category : #'*NeoPyramid-Spec' }
BlElement >> openEditor [
	PyBusiness new openStrategy: (PyOpenStrategyElement new sourceElement: self);
						open
]

{ #category : #'*NeoPyramid-Spec' }
BlElement >> openInNewSpaceWithPyramidShortcut [
	"Add self to a new BlSpace and show it. Add a keyBoard shortcut to open pyramid editor. Answer such space."

	| space |
	space := BlSpace new.

	space
		addChild: self;
		when: BlKeyDownEvent do: [ :anEvent |
			anEvent key = KeyboardKey F2 ifTrue: [
					PyBusiness new
						openStrategy: (PyOpenStrategySpace new sourceSpace: space);
						open ] ];
		yourself.

	^ space
		  show;
		  yourself
]
