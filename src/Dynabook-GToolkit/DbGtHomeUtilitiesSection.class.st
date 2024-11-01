Class {
	#name : #DbGtHomeUtilitiesSection,
	#superclass : #GtHomeMultiCardSection,
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
DbGtHomeUtilitiesSection >> baselineCard [
	<gtSectionCard>

	^ self
		buttonPriority: 30
		titled: 'Baseline'
		icon: BrGlamorousVectorIcons largeBook
		tooltip: ''
		action: [ :card | 
			self
				showSpaceWithIcon: BrGlamorousVectorIcons emphasizedBrowse
				title: 'Coder'
				with: (GtCoder forClass: BaselineOfDynabook) createInPager maximized
				from: card ]
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> bridgeCard [
	<gtSectionCard>

	^ self
		buttonPriority: 20
		titled: 'PBridge - Restart'
		icon: 'noun-bridge-4982741.png'
		tooltip: 'Stop and then start PBApplication'
		action: [ :card | 
			PBApplication stop; start.
			UIManager default inform: 'Python Bridge Restarted' ]
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> dataCard [
	<gtSectionCard>

	^ self
		buttonPriority: 10
		titled: 'SP Data'
		icon: 'noun-database-4716694.png'
		tooltip: 'Inspect persisted DB'
		inspecting: [ self dataDB ]
]

{ #category : #accessing }
DbGtHomeUtilitiesSection >> dataDB [
	^ DataDB ifNil: [ DynabookDB ]
]

{ #category : #accessing }
DbGtHomeUtilitiesSection >> defaultPriority [
	^ 20
]

{ #category : #accessing }
DbGtHomeUtilitiesSection >> iconFolder [
	^ BaselineOfDynabook iconFolder
]

{ #category : #'api - instantiation' }
DbGtHomeUtilitiesSection >> sectionTitle [
	
	^ 'Dynabook - Utilities'
]

{ #category : #stencils }
DbGtHomeUtilitiesSection >> updateHomeCard [
	<gtSectionCard>

	^ self
		buttonPriority: 40
		titled: 'Update These'
		icon: 'noun-home-323099.png'
		"iconSize: 55@55;"
		tooltip: 'Refresh after making changes'
		action: [ :card | GtHome allInstances do: #updateSections ]
]
