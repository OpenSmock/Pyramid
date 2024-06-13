Class {
	#name : 'PyramidSystemSettings',
	#superclass : 'Object',
	#category : 'Pyramid-IDE-settings-menu',
	#package : 'Pyramid-IDE',
	#tag : 'settings-menu'
}

{ #category : 'settings' }
PyramidSystemSettings class >> pyramidSettingOn: aBuilder [
	<systemsettings>

	(aBuilder group: #pyramid)
		label: 'Pyramid';
		description: 'Settings related to Pyramid editor'.
]

{ #category : 'see class side' }
PyramidSystemSettings >> seeClassSide [ 
]
