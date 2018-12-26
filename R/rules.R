## cleavage rules are taken from:
## http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html
rules <- c(
  ## Arg-C proteinase
  "arg-c proteinase"="R(?=\\w)",
  ## Asp-N endopeptidase
  "asp-n endopeptidase"="\\w(?=D)",
  ## BNPS-Skatole
  "bnps-skatole"="W(?=\\w)",
  ## Caspase 1
  "caspase1"="(?<=[FWYL]\\w[HAT])D(?=[^PEDQKR])",
  ## Caspase 2
  "caspase2"="(?<=DVA)D(?=[^PEDQKR])",
  ## Caspase 3
  "caspase3"="(?<=DMQ)D(?=[^PEDQKR])",
  ## Caspase 4
  "caspase4"="(?<=LEV)D(?=[^PEDQKR])",
  ## Caspase 5
  "caspase5"="(?<=[LW]EH)D(?=\\w)",
  ## Caspase 6
  "caspase6"="(?<=VE[HI])D(?=[^PEDQKR])",
  ## Caspase 7
  "caspase7"="(?<=DEV)D(?=[^PEDQKR])",
  ## Caspase 8
  "caspase8"="(?<=[IL]ET)D(?=[^PEDQKR])",
  ## Caspase 9
  "caspase9"="(?<=LEH)D(?=\\w)",
  ## Caspase 10
  "caspase10"="(?<=IEA)D(?=\\w)",
  ## Chymotrypsin - high specifity
  "chymotrypsin-high"="([FY](?=[^P]))|(W(?=[^MP]))",
  ## Chymotrypsin - low specifity
  "chymotrypsin-low"="([FLY](?=[^P]))|(W(?=[^MP]))|(M(?=[^PY]))|(H(?=[^DMPW]))",
  ## Clostripain
  "clostripain"="R(?=\\w)",
  ## CNBr
  "cnbr"="M(?=\\w)",
  ## Enterokinase
  "enterokinase"="(?<=[DE][DE][DE])K(?=\\w)",
  ## Factor Xa
  "factor xa"="(?<=[AFGILTVM][DE]G)R(?=\\w)",
  ## Formic acid
  "formic acid"="D(?=\\w)",
  ## Glutamyl endopeptidase
  "glutamyl endopeptidase"="E(?=\\w)",
  ## Granzyme B
  "granzyme-b"="(?<=IEP)D(?=\\w)",
  ## Hydroxylamine
  "hydroxylamine"="N(?=G)",
  ## Iodosobenzoic acid
  "iodosobenzoic acid"="W(?=\\w)",
  ## LysC
  "lysc"="K(?=\\w)",
  ## LysN
  "lysn"="\\w(?=K)",
  ## Neutrophil elastase
  "neutrophil elastase"="[AV](?=\\w)",
  ## NTCB (2-nitro-5-thiocyanobenzoic acid)
  "ntcb"="\\w(?=C)",
  ## Pepsin (pH 1.3)
  "pepsin1.3"="((?<=([^HKR][^P])|(^[^P]))[^R](?=[FL][^P]))|((?<=([^HKR][^P])|(^[^P]))[FL](?=\\w[^P]))",
  ## Pepsin (pH > 2.0)
  "pepsin"="((?<=([^HKR][^P])|(^[^P]))[^R](?=[FLWY][^P]))|((?<=([^HKR][^P])|(^[^P]))[FLWY](?=\\w[^P]))",
  ## Proline endopeptidase
  "proline endopeptidase"="(?<=[HKR])P(?=[^P])",
  ## Proteinase K
  "proteinase k"="[AEFILTVWY](?=\\w)",
  ## Staphylococcal Peptidase I
  "staphylococcal peptidase i"="(?<=[^E])E(?=\\w)",
  ## Thermolysin
  "thermolysin"="[^DE](?=[AFILMV])",
  ## Thrombin
  "thrombin"="((?<=G)R(?=G))|((?<=[AFGILTVM][AFGILTVW]P)R(?=[^DE][^DE]))",
  ## Trypsin
  "trypsin"="([KR](?=[^P]))|((?<=W)K(?=P))|((?<=M)R(?=P))")

exceptions <- c(
  ## Trypsin
  "trypsin"="((?<=[CD])K(?=D))|((?<=C)K(?=[HY]))|((?<=C)R(?=K))|((?<=R)R(?=[HR]))")
