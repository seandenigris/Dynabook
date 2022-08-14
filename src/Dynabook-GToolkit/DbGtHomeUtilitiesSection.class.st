Class {
	#name : #DbGtHomeUtilitiesSection,
	#superclass : #DbGtHomeSection,
	#instVars : [
		'cardsContainer'
	],
	#classVars : [
		'DataDB'
	],
	#category : #'Dynabook-GToolkit'
}

{ #category : #accessing }
DbGtHomeUtilitiesSection class >> dataDB: anSpFileDatabaseClass [

	DataDB := anSpFileDatabaseClass
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> baselineButton [
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
DbGtHomeUtilitiesSection >> bridgeButton [
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

{ #category : #'api - instantiation' }
DbGtHomeUtilitiesSection >> create [
	| sectionContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Dynabook - Utilities').

	cardsContainer := self newCardsContainer
		addChild: self dataButton create;
		addChild: self bridgeButton create;
		addChild: self baselineButton create;
		addChild: self updateHomeButton create;
		yourself.
		
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> dataButton [
	^ self
		buttonTitled: 'SP Data'
		iconFileNamed: 'noun-database-4716694.png'
		tooltip: 'Inspect persisted DB'
		inspecting: self dataDB
]

{ #category : #accessing }
DbGtHomeUtilitiesSection >> dataDB [
	^ DataDB ifNil: [ DynabookDB ]
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> eventLogButton [
	^ self
		buttonTitled: 'Event Log'
		iconFileNamed: 'noun-calendar-4979381.png'
		tooltip: 'Inspect default event log'
		inspecting: PpEventLog uniqueInstance
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> updateHomeButton [
	^ GtToolButtonStencil new 
		title: 'Update These';
		icon: (self iconFromFileNamed: 'noun-home-323099.png');
		iconSize: 55@55;
		action: [ :card | 
			GtHome allInstances do: #updateSections ];
		description: 'Refresh after making changes'.
]
