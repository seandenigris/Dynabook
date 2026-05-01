Extension { #name : 'CwSafari' }

{ #category : '*Dynabook-Core' }
CwSafari >> pageAtUrl: aUrl [

	^ RlAppleScriptWebPage atUrl: aUrl in: self
]
