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

if (is.null(getGeneric("cleavageSites"))) {
  setGeneric("cleavageSites", function(x, ...)standardGeneric("cleavageSites"))
}

if (is.null(getGeneric("cleave"))) {
  setGeneric("cleave", function(x, ...)standardGeneric("cleave"))
}

