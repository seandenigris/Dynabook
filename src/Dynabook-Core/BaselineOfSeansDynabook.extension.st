Extension { #name : 'BaselineOfSeansDynabook' }

{ #category : '*Dynabook-Core' }
BaselineOfSeansDynabook >> gtPostLoad [

	GtSpaceTallyHistory recordDefaultSystemWideDataLabeled: 'Seans Dynabook Code Loaded'.
	
	self
		dbSoupAddSources; 
		olBuildReferenceMap.
]
