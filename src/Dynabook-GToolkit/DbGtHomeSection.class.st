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
	^ self
		buttonTitled: 'Address Book'
		iconFileNamed: 'noun-address-book-148913.png'
		tooltip: 'Inspect default address book'
		inspecting: MpAddressBook uniqueInstance
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
	^ self
		buttonTitled: 'Books - Personal'
		iconFileNamed: 'noun-financial-advice-book-4450943.png'
		tooltip: 'Inspect personal books'
		inspecting: VsBooks personal
]

{ #category : #stencils }
DbGtHomeSection >> bridgeButton [
	| icon |
	icon := self iconFromFileNamed: 'noun-bridge-4982741.png'.
	^ GtToolButtonStencil new 
		title: 'PBridge - Restart';
		icon: icon;
		iconSize: 50@50;
		action: [ :card | 
			PBApplication stop; start.
			UIManager default inform: 'Python Bridge Restarted' ];
		description: 'Stop and then start PBApplication'.
]

{ #category : #stencils }
DbGtHomeSection >> buttonTitled: aString iconFileNamed: iconName tooltip: tipString inspecting: anObject [
	^ GtToolButtonStencil new 
		title: aString;
		icon: (self iconFromFileNamed: iconName);
		iconSize: 50@50;
		action: [ :card | 
			self
				showSpaceWithTitle: aString
				with:
					(GtInspector
						createOn: anObject) maximized
				from: card ];
		description: tipString.
]

{ #category : #'api - instantiation' }
DbGtHomeSection >> create [
	| sectionContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Dynabook').

	cardsContainer := self newCardsContainer
		addChild: self livingLibraryButton create;
		addChild: self projectListButton create;
		addChild: self eventLogButton create;
		addChild: self addressBookButton create;
		addChild: self booksButton create;
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
	^ self
		buttonTitled: 'SP Data'
		iconFileNamed: 'noun-database-4716694.png'
		tooltip: 'Inspect persisted DB'
		inspecting: self dataDB
]

{ #category : #accessing }
DbGtHomeSection >> dataDB [
	^ DataDB ifNil: [ DynabookDB ]
]

{ #category : #stencils }
DbGtHomeSection >> eventLogButton [
	^ self
		buttonTitled: 'Event Log'
		iconFileNamed: 'noun-calendar-4979381.png'
		tooltip: 'Inspect default event log'
		inspecting: PpEventLog uniqueInstance
]

{ #category : #private }
DbGtHomeSection >> iconFromFileNamed: aString [
	| result |
	result := GtFileUtility imageElementFromFileReference: BaselineOfDynabook iconFolder / aString.
	^ result
		alignBottomCenter;
		yourself	
]

{ #category : #stencils }
DbGtHomeSection >> livingLibraryButton [
	^ self
		buttonTitled: 'LL Library'
		iconFileNamed: 'noun-library-book-4329851.png'
		tooltip: 'Inspect default library'
		inspecting: LlLibrary uniqueInstance
]

{ #category : #stencils }
DbGtHomeSection >> projectListButton [
	^ self
		buttonTitled: 'Projects'
		iconFileNamed: 'noun-project-2662138.png'
		tooltip: 'Inspect default project list'
		inspecting: PpProjectList uniqueInstance
]

{ #category : #stencils }
DbGtHomeSection >> resourceLibraryButton [
	^ self
		buttonTitled: 'Resource Library'
		iconFileNamed: 'noun-file-4980207.png'
		tooltip: 'Inspect default resource library'
		inspecting: RlResourceLibrary uniqueInstance
]

{ #category : #stencils }
DbGtHomeSection >> updateHomeButton [
	^ GtToolButtonStencil new 
		title: 'Update These';
		icon: (self iconFromFileNamed: 'noun-home-323099.png');
		iconSize: 55@55;
		action: [ :card | 
			GtHome allInstances do: #updateSections ];
		description: 'Refresh after making changes'.
]
