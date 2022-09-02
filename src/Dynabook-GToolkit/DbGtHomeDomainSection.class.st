Class {
	#name : #DbGtHomeDomainSection,
	#superclass : #GtHomeSection,
	#category : #'Dynabook-GToolkit'
}

{ #category : #accessing }
DbGtHomeDomainSection class >> dataDB: anSpFileDatabaseClass [

	DataDB := anSpFileDatabaseClass
]

{ #category : #stencils }
DbGtHomeDomainSection >> addressBookButton [
	^ self
		buttonTitled: 'Address Book'
		iconFileNamed: 'noun-address-book-148913.png'
		tooltip: 'Inspect default address book'
		inspecting: MpAddressBook uniqueInstance
]

{ #category : #stencils }
DbGtHomeDomainSection >> booksButton [
	^ self
		buttonTitled: 'Books - Personal'
		iconFileNamed: 'noun-financial-advice-book-4450943.png'
		tooltip: 'Inspect personal books'
		inspecting: VsBooks personal
]

{ #category : #'api - instantiation' }
DbGtHomeDomainSection >> create [
	| cardsContainer sectionContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Dynabook').

	cardsContainer := self newCardsContainer
		addChild: self addressBookButton create;
		addChild: self booksButton create;
		addChild: self eventLogButton create;
		addChild: self ppInventoryButton create;
		addChild: self livingLibraryButton create;
		addChild: self cwNetworkedDeviceButton create;
		addChild: self projectListButton create;
		addChild: self resourceLibraryButton create;
		yourself.
		
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

{ #category : #stencils }
DbGtHomeDomainSection >> cwNetworkedDeviceButton [
	^ self
		buttonTitled: 'Network Devices'
		iconFileNamed: 'noun-computer-network-1836808.png'
		tooltip: 'Inspect devices'
		inspecting: CwNetworkDevice db
]

{ #category : #stencils }
DbGtHomeDomainSection >> eventLogButton [
	^ self
		buttonTitled: 'Event Log'
		iconFileNamed: 'noun-calendar-4979381.png'
		tooltip: 'Inspect default event log'
		inspecting: PpEventLog uniqueInstance
]

{ #category : #accessing }
DbGtHomeDomainSection >> iconFolder [
	^ BaselineOfDynabook iconFolder
]

{ #category : #stencils }
DbGtHomeDomainSection >> livingLibraryButton [
	^ self
		buttonTitled: 'LL Library'
		iconFileNamed: 'noun-library-book-4329851.png'
		tooltip: 'Inspect default library'
		inspecting: LlLibrary uniqueInstance
]

{ #category : #stencils }
DbGtHomeDomainSection >> ppInventoryButton [
	^ self
		buttonTitled: 'Inventory'
		iconFileNamed: 'noun-inventory-2895895.png'
		tooltip: 'Inspect Inventory'
		inspecting: PpInventory uniqueInstance
]

{ #category : #stencils }
DbGtHomeDomainSection >> projectListButton [
	^ self
		buttonTitled: 'Projects'
		iconFileNamed: 'noun-project-2662138.png'
		tooltip: 'Inspect default project list'
		inspecting: PpProjectList uniqueInstance
]

{ #category : #stencils }
DbGtHomeDomainSection >> resourceLibraryButton [
	^ self
		buttonTitled: 'Resource Library'
		iconFileNamed: 'noun-file-4980207.png'
		tooltip: 'Inspect default resource library'
		inspecting: RlResourceLibrary uniqueInstance
]
