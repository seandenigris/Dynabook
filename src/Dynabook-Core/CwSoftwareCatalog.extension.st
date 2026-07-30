Extension { #name : 'CwSoftwareCatalog' }

{ #category : '*Dynabook-Core' }
CwSoftwareCatalog >> dbCollectionAccessor [

	^ #collection
]

{ #category : '*Dynabook-Core' }
CwSoftwareCatalog >> transactions [

  ^ VsBooks personal generalJournal iterator
    | [ :t | t subjects anySatisfy: [ :s | self collection includes: s ] ] selectIt
    > VsGeneralJournal
]
