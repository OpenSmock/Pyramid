Class {
	#name : #PyramidWorld,
	#superclass : #Object,
	#category : #'Pyramid-IDE-Menus'
}

{ #category : #menu }
PyramidWorld class >> menuBrowseSourcesOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidDev;
		order: 2.0;
		action: [ self startBrowseSources ];
		icon: (self iconNamed: #nautilus);
		help: 'Open Pyramid sources packages in a browser';
		label: 'Browse sources'
]

{ #category : #menu }
PyramidWorld class >> menuGithubOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Github)
		parent: #PyramidDev;
		order: 3.0;
		label: 'Github';
		help: 'Open Pyramid Github page';
		icon: (self iconNamed: #github);
		action: [ WebBrowser openOn: 'https://github.com/OpenSmock/Pyramid' ]
]

{ #category : #menu }
PyramidWorld class >> menuNewOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidUser;
		order: 1.0;
		action: [ self startNewDesign ];
		icon: (self iconNamed: #page);
		help: 'Create a new User-Interface';
		label: 'New UI'
]

{ #category : #'menu - root' }
PyramidWorld class >> menuPyramidOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Pyramid)
		parent: #Tools;
		label: 'Pyramid';
		help: 'A UI editor';
		order: 777;
		
	with:[
			(aBuilder group: #PyramidUser)
				order: 1;
				withSeparatorAfter.	
			(aBuilder group: #PyramidDev)
				order: 2.
		]
]

{ #category : #menu }
PyramidWorld class >> menuRefreshPluginOn: aBuilder [

	<worldMenu>
	(aBuilder item: #New)
		parent: #PyramidDev;
		order: 1.0;
		action: [ self startRefreshPlugins ];
		icon: (self iconNamed: #refresh);
		help: 'Reload all Pyramid plugins, use this to install a new plugin';
		label: 'Refresh plugins'
]

{ #category : #menu }
PyramidWorld class >> menuReportABugOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Github)
		parent: #PyramidDev;
		order: 4.0;
		label: 'Report a Bug';
		icon: (self iconNamed: #smallDebug);
		help: 'Will open the github page to report an issue';
		action: [ WebBrowser openOn: 'https://github.com/OpenSmock/Pyramid/issues/new' ]
]

{ #category : #actions }
PyramidWorld class >> startBrowseSources [

	Smalltalk tools browser open packageView filterField setText: 'Pyramid'
]

{ #category : #actions }
PyramidWorld class >> startNewDesign [

	PyramidPluginManager uniqueInstance makeEditor window open	
]

{ #category : #actions }
PyramidWorld class >> startRefreshPlugins [

	PyramidPluginManager reset
]
