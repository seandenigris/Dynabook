Class {
	#name : #DbEventRecording,
	#superclass : #LlAuthoredWork,
	#instVars : [
		'event'
	],
	#category : #'Dynabook-Core'
}

{ #category : #'as yet unclassified' }
DbEventRecording class >> of: aPpEvent [

	^ self new
		event: aPpEvent;
		yourself
]

{ #category : #accessing }
DbEventRecording >> event [

	^ event
]

{ #category : #accessing }
DbEventRecording >> event: anObject [

	event := anObject
]

{ #category : #accessing }
DbEventRecording >> participants [
	^ self event participants
]

{ #category : #accessing }
DbEventRecording >> title [
	^ self event displayString
]
