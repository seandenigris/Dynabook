Extension { #name : #GtHome }

{ #category : #'*Dynabook-GToolkit' }
GtHome >> dynabookSection [
	<gtHomeSection>
	^ DbGtHomeDomainSection new
		priority: 6
]

{ #category : #'*Dynabook-GToolkit' }
GtHome >> dynabookUtilitiesSection [
	<gtHomeSection>
	^ DbGtHomeUtilitiesSection new
		priority: 7
]
