Class {
	#name : #SdSmalltalkCICall,
	#superclass : #SdScriptFunctionCall,
	#category : #'Dynabook-SmalltalkCI'
}

{ #category : #accessing }
SdSmalltalkCICall >> commandString [

	^ 'source "/Users/sean/Documents/Reference/Smalltalk/Repositories/smalltalkCI/helpers.sh" &&', super commandString
]

{ #category : #accessing }
SdSmalltalkCICall >> stubIsARM: aBoolean [

	aBoolean
		ifTrue: [ self stub: 'hardware_platform' with: 'echo "arm64"' ]
		ifFalse: [ self stub: 'hardware_platform' with: 'echo "x86_64"' ]
]

{ #category : #accessing }
SdSmalltalkCICall >> stubPlatform: aString isARM: aBoolean [

	| platformOptions |
	platformOptions := #('linux' 'windows' 'mac').
	platformOptions do: [ :platform |
		self 
			stub: 'is_', platform, '_build' 
			with: (aString = platform) asString ].
			
	self stubIsARM: aBoolean
]

{ #category : #accessing }
SdSmalltalkCICall >> stubRelease: aString [

	self stub: 'gtoolkit::latest_release_version' with: 'echo "', aString, '"'
]
