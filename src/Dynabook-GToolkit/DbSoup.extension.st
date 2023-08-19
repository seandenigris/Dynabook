Extension { #name : #DbSoup }

{ #category : #'*Dynabook-GToolkit' }
DbSoup >> addSourceForOlReferencedClass: aClass withBuilder: aBlock [

	OlObjectPageType 
		modelReferenceForClass: aClass 
		builder: aBlock.
			
	self sources add: aBlock value
]

{ #category : #'*Dynabook-GToolkit' }
DbSoup class >> addSourceForOlReferencedClass: aClass withBuilder: aBlock [
	"Convenience message because usually one wants to add to both ObjectiveLepiter (to support per-instance pages) and DbSoup"

	^ self uniqueInstance 
		addSourceForOlReferencedClass: aClass 
		withBuilder: aBlock
]
