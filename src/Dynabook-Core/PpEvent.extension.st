Extension { #name : #PpEvent }

{ #category : #'*Dynabook-Core' }
PpEvent >> ensureRecording [
	^ self propertyAt: #recording ifAbsentPut: [ 
		| recording |
		recording := DbEventRecording of: self.
		LlLibrary uniqueInstance beAwareOf: recording.
		recording ]
]

{ #category : #'*Dynabook-Core' }
PpEvent >> hasRecording [
	^ self hasProperty: #recording
]

{ #category : #'*Dynabook-Core' }
PpEvent >> oneNotePage [

	^ self 
		propertyAt: #oneNotePageID
		ifPresent: [ :pageID | 
			DbMsalApp uniqueInstance oneNote pageWithID: pageID ]
]
