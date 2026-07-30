Extension { #name : 'CwSoftware' }

{ #category : '*Dynabook-Core' }
CwSoftware >> transactions [

  ^ VsBooks personal generalJournal iterator
    | [ :t | t splits anySatisfy: [ :s | s subject = self ] ] selectIt
    > VsGeneralJournal
]
