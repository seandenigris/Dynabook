Extension { #name : #PpEvent }

{ #category : #'*Dynabook-Core' }
PpEvent >> recording [
	^ self propertyAt: #recording ifAbsentPut: [ 
		| recording |
		recording := DbEventRecording of: self.
		LlLibrary uniqueInstance beAwareOf: recording.
		recording ]
]
