Extension { #name : #BlElement }

{ #category : #'*Pyramid-Spec' }
BlElement >> openInNewSpaceWithPyramidShortcut [
	"Add self to a new BlSpace and show it. Add a keyBoard shortcut to open pyramid editor. Answer such space."

	^ BlSpace new
		  telemetry: BlMemoryTelemetry new;
		  addShortcut: (BlShortcutWithAction new
				   combination: BlKeyCombination primaryE;
				   action: [ :anEvent :aShortcut |
					   self inform: 'Triggered ' , aShortcut combination asString.
					   PyBusiness new openOn: self ]);
		  addChild: self;
		  show;
		  yourself
]
