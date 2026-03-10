Extension { #name : 'BaselineOf' }

{ #category : '*Dynabook-Core' }
BaselineOf >> dbSoupAddSources [
	
	self dbReferenceBuilderMap do: [ :aBlock |
		DbSoup uniqueInstance sourceAdd: aBlock value ].
]
