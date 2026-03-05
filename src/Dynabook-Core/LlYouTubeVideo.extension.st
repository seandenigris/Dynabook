Extension { #name : 'LlYouTubeVideo' }

{ #category : '*Dynabook-Core' }
LlYouTubeVideo class >> fromSafari [

	| frontmostUrl |
	frontmostUrl := CwSafari reference pythonInstance documents first URL
			callMethod: #get.
	^ self fromUrl: frontmostUrl
]
