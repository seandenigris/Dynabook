Class {
	#name : #DbGtHomeSection,
	#superclass : #GtHomeSection,
	#instVars : [
		'cardsContainer'
	],
	#classVars : [
		'DataDB'
	],
	#category : #'Dynabook-GToolkit'
}

{ #category : #accessing }
DbGtHomeSection class >> dataDB: anSpFileDatabaseClass [

	DataDB := anSpFileDatabaseClass
]

{ #category : #stencils }
DbGtHomeSection >> addressBookButton [
	^ GtToolButtonStencil new 
		title: 'Address Book';
		icon: BrGlamorousVectorIcons robot;
		action: [ :card | 
			self
				showSpaceWithTitle: 'Address Book'
				with:
					(GtInspector
						createOn: MpAddressBook default) maximized
				from: card ];
		description: 'Inspect default address book'.
]

{ #category : #stencils }
DbGtHomeSection >> baselineButton [
	^ GtToolButtonStencil new 
		title: 'Baseline';
		icon: BrGlamorousVectorIcons largeBook;
		action: [ :card | 
			self
				showSpaceWithIcon: BrGlamorousVectorIcons emphasizedBrowse
				title: 'Coder'
				with: (GtCoder forClass: BaselineOfDynabook) createInPager maximized
				from: card ]
]

{ #category : #stencils }
DbGtHomeSection >> booksButton [
	^ GtToolButtonStencil new 
		title: 'Books - Personal';
		icon: BrGlamorousVectorIcons largeBook;
		action: [ :card | 
			self
				showSpaceWithTitle: 'Books - Personal'
				with:
					(GtInspector
						createOn: VsBooks personal) maximized
				from: card ];
		description: 'Inspect personal books'.
]

{ #category : #stencils }
DbGtHomeSection >> bridgeButton [
	^ GtToolButtonStencil new 
		title: 'PBridge - Restart';
		icon: BrGlamorousVectorIcons refresh;
		action: [ :card | 
			PBApplication stop; start.
			UIManager default inform: 'Python Bridge Restarted' ];
		description: 'Stop and then start PBApplication'.
]

{ #category : #'api - instantiation' }
DbGtHomeSection >> create [
	| sectionContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Dynabook').

	cardsContainer := self newCardsContainer
		addChild: self addressBookButton create;
		addChild: self booksButton create;
		addChild: self livingLibraryButton create;
		addChild: self projectListButton create;
		addChild: self resourceLibraryButton create;
		addChild: self dataButton create;
		addChild: self bridgeButton create;
		addChild: self baselineButton create;
		addChild: self updateHomeButton create;
		yourself.
		
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

{ #category : #stencils }
DbGtHomeSection >> dataButton [
	^ GtToolButtonStencil new 
		title: 'SP Data';
		icon: BrGlamorousVectorIcons largeWindow;
		action: [ :card | 
			self
				showSpaceWithTitle: 'Dynabook Data'
				with:
					(GtInspector
						createOn: self dataDB) maximized
				from: card ].
]

{ #category : #accessing }
DbGtHomeSection >> dataDB [
	^ DataDB ifNil: [ DynabookDB ]
]

{ #category : #stencils }
DbGtHomeSection >> livingLibraryButton [
	^ GtToolButtonStencil new 
		title: 'LL Library';
		icon: BrGlamorousVectorIcons largeBook;
		action: [ :card | 
			self
				showSpaceWithTitle: 'Living Library'
				with:
					(GtInspector
						createOn: LlLibrary uniqueInstance) maximized
				from: card ];
		description: 'Inspect default library'.
]

{ #category : #stencils }
DbGtHomeSection >> projectListButton [
	^ GtToolButtonStencil new 
		title: 'Projects';
		icon: BrGlamorousVectorIcons clipboard;
		action: [ :card | 
			self
				showSpaceWithTitle: 'Projects'
				with:
					(GtInspector
						createOn: PpProjectList uniqueInstance) maximized
				from: card ];
		description: 'Inspect project list'.
]

{ #category : #stencils }
DbGtHomeSection >> resourceLibraryButton [
	^ GtToolButtonStencil new 
		title: 'Resource Library';
		icon: BrGlamorousVectorIcons largeBook;
		action: [ :card | 
			self
				showSpaceWithTitle: 'Living Library'
				with:
					(GtInspector
						createOn: RlResourceLibrary uniqueInstance) maximized
				from: card ];
		description: 'Inspect default library'.
]

{ #category : #stencils }
DbGtHomeSection >> updateHomeButton [
	^ GtToolButtonStencil new 
		title: 'Home Sections - Update';
		icon: BrGlamorousVectorIcons refresh;
		action: [ :card | 
			GtHome allInstances do: #updateSections ];
		description: 'Refresh after making changes'.
]
