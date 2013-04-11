## Copyright 2013 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## It is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## See <http://www.gnu.org/licenses/>

## cleavage rules are taken from:
## http://web.expasy.org/peptide_cutter/peptidecutter_enzymes.html
rules <- c(
  ## Arg-C proteinase
  "arg-c proteinase"="R",
  ## Asp-N endopeptidase
  "asp-n endopeptidase"="\\w(?=D)",
  ## BNPS-Skatole
  "bnps-skatole"="W",
  ## Caspase 1
  "caspase1"="(?<=[FWYL]\\w[HAT])D(?=[^PEDQKR])",
  ## Caspase 2
  "caspase2"="(?<=DVA)D(?=[^PEDQKR])",
  ## Caspase 3
  "caspase3"="(?<=DMQ)D(?=[^PEDQKR])",
  ## Caspase 4
  "caspase4"="(?<=LEV)D(?=[^PEDQKR])",
  ## Caspase 5
  "caspase5"="(?<=[LW]EH)D",
  ## Caspase 6
  "caspase6"="(?<=VE[HI])D(?=[^PEDQKR])",
  ## Caspase 7
  "caspase7"="(?<=DEV)D(?=[^PEDQKR])",
  ## Caspase 8
  "caspase8"="(?<=[IL]ET)D(?=[^PEDQKR])",
  ## Caspase 9
  "caspase9"="(?<=LEH)D",
  ## Caspase 10
  "caspase10"="(?<=IEA)D",
  ## Chymotrypsin - high specifity
  "chymotrypsin-high"="([FY](?=[^P]))|(W(?=[^MP]))",
  ## Chymotrypsin - low specifity
  "chymotrypsin-low"="([FLY](?=[^P]))|(W(?=[^MP]))|(M(?=[^PY]))|(H(?=[^DMPW]))",
  ## Clostripain
  "clostripain"="R",
  ## CNBr
  "cnbr"="M",
  ## Pepsin (pH 1.3)
  "pepsin1.3"="((?<=([^HKR][^P])|(^[^P]))[^R](?=[FLWY][^P]))|((?<=([^HKR][^P])|(^[^P]))[FLWY](?=\\w[^P]))",
  ## Pepsin (pH > 2.0)
  "pepsin"="((?<=([^HKR][^P])|(^[^P]))[^R](?=[FL][^P]))|((?<=([^HKR][^P])|(^[^P]))[FL](?=\\w[^P]))",
  ## Trypsin
  "trypsin"="([KR](?=[^P]))|((?<=W)K(?=P))|((?<=M)R(?=P))")

exceptions <- c(
  ## Trypsin
  "trypsin"="((?<=[CD])K(?=D))|((?<=C)K(?=[HY]))|((?<=C)R(?=K))|((?<=R)R(?=[HR]))")

