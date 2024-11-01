Extension { #name : #GtHomeMultiCardSection }

{ #category : #'*Dynabook-GToolkit' }
GtHomeMultiCardSection >> buttonPriority: aNumber titled: aString icon: iconable tooltip: tipString action: aValuable [
	"Requires `#iconFolder` to be implemented
	
	iconable - can be icon itself, icon file, or icon path string"

	| icon stencil |
	icon := iconable.
	iconable isString ifTrue: [ icon := self iconFromFileNamed: iconable ].
	(iconable isKindOf: AbstractFileReference) 
		ifTrue: [ icon := GtFileUtility imageElementFromFileReference: iconable ].

	stencil := GtToolButtonStencil new 
		title: aString;
		icon: icon;
		iconSize: 50@50;
		action: aValuable;
		description: tipString.
		
	^ GtHomeCard explicit
		priority: aNumber;
		stencil: [ stencil ];
		yourself
]

{ #category : #'*Dynabook-GToolkit' }
GtHomeMultiCardSection >> buttonPriority: aNumber titled: aString icon: iconable tooltip: tipString inspecting: aValuable [
	
	^ self
		buttonPriority: aNumber 
		titled: aString 
		icon: iconable 
		tooltip: tipString 
		action: [ :card | 
			self
				showSpaceWithTitle: aString
				with:
					(GtInspector
						createOn: aValuable value) maximized
				from: card ]
]
