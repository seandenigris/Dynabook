Class {
	#name : #DbGtHomeDomainSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'Dynabook-GToolkit'
}

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> addressBookCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 10
		titled: 'Address Book'
		icon: 'noun-address-book-148913.png'
		tooltip: 'Inspect default address book'
		inspecting: [ MpAddressBook uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> booksCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 20
		titled: 'Books - Personal'
		icon: 'noun-financial-advice-book-4450943.png'
		tooltip: 'Inspect personal books'
		inspecting: [ VsBooks personal ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> dailyNoteCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 40
		titled: 'Daily Note'
		icon: ''
		tooltip: 'Create a TPP note for today'
		inspecting: [ 
			| page |
			page := LePage journalOn: Date today.
			LeDatabasesRegistry defaultPrimaryDatabase addPage: page ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> defaultPriority [
	^ 10
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> eventLogCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 30
		titled: 'Event Log'
		icon: 'noun-calendar-4979381.png'
		tooltip: 'Inspect default event log'
		inspecting: [ PpEventLog uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> iconFolder [
	^ BaselineOfDynabook iconFolder
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> inventoryCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 50
		titled: 'Inventory'
		icon: 'noun-inventory-2895895.png'
		tooltip: 'Inspect Inventory'
		inspecting: [ PpInventory uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> livingLibraryCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 70
		titled: 'LL Library'
		icon: 'noun-library-book-4329851.png'
		tooltip: 'Inspect default library'
		inspecting: [ LlLibrary uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> locationsCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 60
		titled: 'Locations'
		icon: 'noun-inventory-2895895.png'
		tooltip: 'Inspect Location List'
		inspecting: [ PpLocationList uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> networkedDevicesCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 80
		titled: 'Network Devices'
		icon: 'noun-computer-network-1836808.png'
		tooltip: 'Inspect devices'
		inspecting: [ CwNetworkDevice db ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> projectListCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 90
		titled: 'Projects'
		icon: 'noun-project-2662138.png'
		tooltip: 'Inspect default project list'
		inspecting: [ PpProjectList uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> resourceLibraryCard [
	<gtSectionCard>
	
	^ self
		buttonPriority: 100
		titled: 'Resource Library'
		icon: 'noun-file-4980207.png'
		tooltip: 'Inspect default resource library'
		inspecting: [ RlResourceLibrary uniqueInstance ]
]

{ #category : #'as yet unclassified' }
DbGtHomeDomainSection >> sectionTitle [

	^ 'Dynabook'
]
