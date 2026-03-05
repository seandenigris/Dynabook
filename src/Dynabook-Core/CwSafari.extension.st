Extension { #name : 'CwSafari' }

{ #category : '*Dynabook-Core' }
CwSafari >> pageAtUrl: aUrl [

	^ LlAppleScriptWebPage atUrl: aUrl in: self
]
