Extension { #name : 'CwSoftware' }

{ #category : '*Dynabook-Core' }
CwSoftware >> transactions [

  ^ VsBooks personal generalJournal iterator
    | [ :t | t splitsPrivate anySatisfy: [ :s | s subject = self ] ] selectIt > VsGeneralJournal
]
