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
PpEventUIDReference >> initialize [
	super initialize.
	self sourceClassName: PpEventLog
]

{ #category : #accessing }
PpEventUIDReference >> object [

	self source allEventsDo: [ :e | e uuid = uid ifTrue: [ ^ e ] ].
	
	^ nil
]
