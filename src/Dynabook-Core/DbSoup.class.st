"
A facade presenting something like HPI's soup, a collection from which all interesting domain objects are easily reachable.
"
Class {
	#name : #DbSoup,
	#superclass : #Object,
	#instVars : [
		'sources'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Dynabook-Core-Soup'
}

{ #category : #accessing }
DbSoup class >> detectUID: anObject [
	"See instance-side comment"
	
	^ self uniqueInstance detectUID: anObject
]

{ #category : #accessing }
DbSoup class >> detectUID: anObject ifNone: noneBlock [
	"See instance-side comment"
	
	^ self uniqueInstance 
		detectUID: anObject 
		ifNone: noneBlock
]

{ #category : #'as yet unclassified' }
DbSoup class >> uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #accessing }
DbSoup >> detectUID: anObject [
	"anObject - must understand #olDetectUIDBlock. See implementors"
	
	^ self
		detectUID: anObject 
		ifNone: [ self error: 'UID not found!' ]
]

{ #category : #accessing }
DbSoup >> detectUID: anObject ifNone: noneBlock [
	"anObject - must understand #olDetectUIDBlock. See implementors"
	
	self sources do: [ :source |
		| result |
		result := source 
			detectUID: anObject
			ifNone: [ nil ].
		result ifNotNil: [ ^ result ] ].
		
	^ noneBlock value
]

{ #category : #accessing }
DbSoup >> gtSpotterSearchesInContext: aSpotterContext [
	| spotterSources |
	"Halt now."
	spotterSources := (self sources asOrderedCollection asAsyncStream collect: [ :e | e source ]) withoutDuplicates useIdentityComparison.
	^ spotterSources flatCollect: [ :source | source gtSpotterSearchesInContext: aSpotterContext ].
]

{ #category : #accessing }
DbSoup >> sources [

	^ sources ifNil: [ sources := Set new ].
]
