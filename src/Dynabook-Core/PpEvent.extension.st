Extension { #name : 'PpEvent' }

{ #category : '*Dynabook-Core' }
PpEvent >> oneNotePage [

	^ self 
		propertyAt: #oneNotePageID
		ifPresent: [ :pageID | 
			DbMsalApp uniqueInstance oneNote pageWithID: pageID ]
]

{ #category : '*Dynabook-Core' }
PpEvent >> recordingEnsure [
	^ self propertyAt: #recording ifAbsentPut: [ 
		| recording |
		recording := DbEventRecording of: self.
		LlLibrary uniqueInstance beAwareOf: recording.
		recording ]
]

{ #category : '*Dynabook-Core' }
PpEvent >> recordingExists [
	^ self hasProperty: #recording
]
