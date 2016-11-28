def sum(f):
  reduce .[] as $row (0; . + ($row|f) )
;

# Produce an object with the same keys as the first object in the 
# input array, but with values equal to the sum of the corresponding
# values in all the objects.
def sumByKey:
  . as $in
  | reduce (.[0] | keys)[] as $key
    ( {}; . + {($key): ($in | sum(.[$key]))})
;

def normaliseInteraction:
  {
    "mousedown": (.["mousedown"] + 0),
    "keydown/textual": (.["keydown/textual"] + 0),
    "keydown/motion": (.["keydown/motion"] + 0)
  }
;

def totals:
  {
    "mousedown": (.["mousedown"] + 0),
    "keydown/textual": (.["keydown/textual"] + 0),
    "keydown/motion": (.["keydown/motion"] + 0),
    "keydown": (.["keydown/textual"] + .["keydown/motion"] + 0)
  }
;

def interactions:
  [
    .["@fields"].log.FieldInteractions |
    .[] |
    .["EventCounts"] |
    normaliseInteraction
  ]
;

def linkClicks:
  {
    "mddf": (.["@fields"].log.FieldInteractions["a.mddfDoseInformationLink"].EventCounts.mousedown + 0),
    "bnf/bnfc": (.["@fields"].log.FieldInteractions["div.bnfLink"].EventCounts.mousedown + 0)
  }
;
