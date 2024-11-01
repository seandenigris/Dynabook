Extension { #name : #GtHomeMultiCardSection }

{ #category : #'*Dynabook-GToolkit' }
GtHomeMultiCardSection >> buttonPriority: aNumber titled: aString iconFileNamed: iconable tooltip: tipString inspecting: aValuable [
	"Requires `#iconFolder` to be implemented"

	| icon stencil |
	icon := iconable isString
		ifTrue: [ self iconFromFileNamed: iconable ]
		ifFalse: [ GtFileUtility imageElementFromFileReference: iconable ].

	stencil := GtToolButtonStencil new 
		title: aString;
		icon: icon;
		iconSize: 50@50;
		action: [ :card | 
			self
				showSpaceWithTitle: aString
				with:
					(GtInspector
						createOn: aValuable value) maximized
				from: card ];
		description: tipString.
		
	^ GtHomeCard explicit
		priority: aNumber;
		stencil: [ stencil ];
		yourself
]
