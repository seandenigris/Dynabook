Class {
	#name : #PpEventUIDReference,
	#superclass : #DbObjectUIDReference,
	#category : #'Dynabook-GToolkit'
}

{ #category : #accessing }
PpEventUIDReference class >> leJsonV4Name [
	^ 'ppEventUIDReference'
]

{ #category : #accessing }
PpEventUIDReference >> detectUID: aBlock ifNone: noneBlock [

	| detectBlock |
	detectBlock := self wrappedUidDetector: aBlock.
	self source allEventsDo: [ :e | (detectBlock value: e) ifTrue: [ ^ e ] ].	
	^ noneBlock value
]

{ #category : #accessing }
PpEventUIDReference >> initialize [
	super initialize.
	self sourceClassName: PpEventLog
]
