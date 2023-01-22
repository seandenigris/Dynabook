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
PpEventUIDReference >> detectUID: anObject ifNone: noneBlock [
	"anObject - must respond to olDetectUIDBlock. See implementors"

	| detectBlock |
	detectBlock := self wrappedUidDetector: anObject olDetectUIDBlock.
	self source allEventsDo: [ :e | (detectBlock value: e) ifTrue: [ ^ e ] ].	
	^ noneBlock value
]

{ #category : #accessing }
PpEventUIDReference >> initialize [
	super initialize.
	self sourceClassName: PpEventLog
]
