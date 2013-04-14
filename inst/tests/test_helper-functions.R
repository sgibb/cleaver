context("helper")

test_that(".cleavePos", {
  peptides <- c(
    "gaju"="LAAGKVEDSD",
    "ins"=paste("MALWMRLLPLLALLALWGPDPAAAFVNQHLCGSHLVEALYLVCGERGFFYTPKTRREAED",
                "LQVGQVELGGGPGAGSLQPLALEGSLQKRGIVEQCCTSICSLYQLENYCN", sep=""),
    "albu"=paste("MKWVTFISLLFLFSSAYSRGVFRRDAHKSEVAHRFKDLGEENFKALVLIAFAQYLQQCPF",
                 "EDHVKLVNEVTEFAKTCVADESAENCDKSLHTLFGDKLCTVATLRETYGEMADCCAKQEP",
                 "ERNECFLQHKDDNPNLPRLVRPEVDVMCTAFHDNEETFLKKYLYEIARRHPYFYAPELLF",
                 "FAKRYKAAFTECCQAADKAACLLPKLDELRDEGKASSAKQRLKCASLQKFGERAFKAWAV",
                 "ARLSQRFPKAEFAEVSKLVTDLTKVHTECCHGDLLECADDRADLAKYICENQDSISSKLK",
                 "ECCEKPLLEKSHCIAEVENDEMPADLPSLAADFVESKDVCKNYAEAKDVFLGMFLYEYAR",
                 "RHPDYSVVLLLRLAKTYETTLEKCCAAADPHECYAKVFDEFKPLVEEPQNLIKQNCELFE",
                 "QLGEYKFQNALLVRYTKKVPQVSTPTLVEVSRNLGKVGSKCCKHPEAKRMPCAEDYLSVV",
                 "LNQLCVLHEKTPVSDRVTKCCTESLVNRRPCFSALEVDETYVPKEFNAETFTFHADICTL",
                 "SEKERQIKKQTALVELVKHKPKATKEQLKAVMDDFAAFVEKCCKADDKETCFAEEGKKLV",
                 "AASQAALGL", sep=""))

  cleavageResults <- list(
    "arg-c proteinase"=list(
      "gaju"=integer(0),
      "ins"=c(6, 46, 55, 56, 89),
      "albu"=c(19, 23, 24, 34, 105, 122, 138, 141, 168, 169, 184, 210, 221,
               233, 242, 246, 281, 360, 361, 372, 434, 452, 469, 496, 508, 509,
               545)),
    "asp-n endopeptidase"=list(
      "gaju"=c(7, 9),
      "ins"=c(19, 59),
      "albu"=c(24, 36, 61, 79, 86, 95, 112, 130, 131, 144, 152, 196, 206,
               210, 260, 272, 278, 279, 282, 292, 319, 324, 331, 337, 347, 363,
               388, 398, 474, 494, 517, 535, 572, 573, 585, 586)),
    "bnps-skatole"=list(
      "gaju"=integer(0),
      "ins"=c(4, 17),
      "albu"=c(3, 238)),
    caspase1=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=c(261, 332, 536)),
    caspase2=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase3=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase4=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase5=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase6=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase7=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase8=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase9=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    caspase10=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    "chymotrypsin-high"=list(
      "gaju"=integer(0),
      "ins"=c(17, 25, 40, 48, 49, 50, 103, 108),
      "albu"=c(3, 6, 11, 13, 17, 22, 35, 43, 51, 54, 60, 73, 94, 108, 126,
               151, 158, 162, 164, 172, 173, 174, 180, 181, 185, 189, 230, 235,
               238, 252, 287, 333, 343, 350, 354, 356, 358, 365, 377, 394, 398,
               401, 419, 425, 427, 435, 476, 512, 521, 526, 531, 533, 575, 578,
               592)),
    "chymotrypsin-low"=list(
      "gaju"=1,
      "ins"=c(1, 3, 5, 7, 10, 11, 13, 14, 16, 17, 25, 29, 30, 34, 35, 39,
              40, 41, 48, 49, 50, 61, 68, 77, 80, 82, 86, 102, 103, 105, 108),
      "albu"=c(1, 3, 6, 9, 10, 11, 12, 13, 17, 22, 27, 33, 35, 38, 43, 46,
               48, 51, 54, 55, 60, 63, 66, 73, 90, 91, 93, 94, 98, 104, 108,
               111, 126, 127, 129, 139, 147, 151, 158, 159, 162, 163, 164, 172,
               173, 174, 178, 179, 180, 181, 185, 189, 202, 206, 209, 222, 227,
               230, 235, 238, 243, 252, 258, 262, 266, 271, 274, 275, 284, 287,
               299, 307, 308, 312, 329, 333, 343, 350, 351, 353, 354, 355, 356,
               358, 365, 369, 370, 371, 373, 377, 381, 391, 394, 398, 401, 404,
               411, 418, 419, 422, 425, 427, 431, 432, 435, 447, 454, 476, 477,
               481, 484, 487, 488, 505, 512, 515, 521, 526, 531, 533, 534, 540,
               553, 556, 559, 568, 572, 575, 578, 592, 599, 607)),
    clostripain=list(
      "gaju"=integer(0),
      "ins"=c(6, 46, 55, 56, 89),
      "albu"=c(19, 23, 24, 34, 105, 122, 138, 141, 168, 169, 184, 210, 221,
               233, 242, 246, 281, 360, 361, 372, 434, 452, 469, 496, 508, 509,
               545)),
    cnbr=list(
      "gaju"=integer(0),
      "ins"=c(1, 5),
      "albu"=c(1, 111, 147, 322, 353, 470, 572)),
    enterokinase=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    "factor xa"=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    "formic acid"=list(
      "gaju"=8,
      "ins"=c(20, 60),
      "albu"=c(25, 37, 62, 80, 87, 96, 113, 131, 132, 145, 153, 197, 207,
               211, 261, 273, 279, 280, 283, 293, 320, 325, 332, 338, 348, 364,
               389, 399, 475, 495, 518, 536, 573, 574, 586, 587)),
    "glutamyl endopeptidase"=list(
      "gaju"=7,
      "ins"=c(37, 45, 57, 59, 67, 83, 93, 106),
      "albu"=c(30, 40, 41, 61, 69, 72, 81, 84, 106, 110, 119, 121, 124, 143,
               155, 156, 165, 177, 191, 208, 212, 232, 251, 254, 268, 276, 290,
               301, 304, 309, 316, 318, 321, 335, 345, 357, 378, 382, 392, 400,
               406, 407, 417, 420, 424, 449, 466, 474, 489, 503, 516, 519, 525,
               529, 542, 544, 555, 566, 580, 589, 594, 595)),
    "granzyme-b"=list(
      "gaju"=integer(0),
      "ins"=integer(0),
      "albu"=integer(0)),
    pepsin1.3=list(
      "gaju"=integer(0),
      "ins"=c(2, 3, 4, 9, 11, 12, 13, 14, 15, 16, 24, 25, 29, 30, 34, 35,
              38, 39, 40, 41, 47, 49, 60, 61, 67, 68, 76, 79, 81, 82, 85, 86,
              101, 102, 103, 104, 105, 107, 108),
      "albu"=c(2, 3, 5, 6, 8, 9, 10, 11, 12, 13, 16, 17, 22, 37, 42, 43, 45,
               47, 48, 50, 51, 53, 54, 55, 59, 66, 72, 73, 89, 92, 94, 97, 98,
               103, 104, 108, 125, 126, 127, 136, 139, 150, 151, 157, 158, 159,
               161, 164, 173, 178, 179, 180, 181, 189, 201, 203, 206, 208, 209,
               222, 226, 227, 229, 230, 234, 237, 243, 247, 252, 257, 258, 261,
               262, 274, 275, 284, 286, 287, 298, 299, 306, 308, 326, 329, 332,
               333, 342, 350, 351, 353, 354, 355, 356, 357, 358, 365, 368, 369,
               370, 371, 373, 376, 380, 381, 394, 397, 400, 403, 410, 411, 417,
               418, 419, 421, 422, 424, 425, 426, 427, 430, 431, 432, 435, 447,
               453, 475, 476, 477, 480, 481, 483, 484, 486, 487, 504, 505, 512,
               514, 515, 520, 525, 530, 531, 532, 533, 539, 540, 552, 553, 555,
               556, 568, 574, 575, 577, 578, 591, 592, 598, 606, 607)),
    pepsin=list(
      "gaju"=integer(0),
      "ins"=c(2, 3, 9, 11, 12, 13, 14, 15, 16, 24, 25, 29, 30, 34, 35, 38, 39,
              40, 41, 47, 49, 60, 61, 67, 68, 76, 79, 81, 82, 85, 86, 101, 102,
              104, 105),
      "albu"=c(5, 6, 8, 9, 10, 11, 12, 13, 22, 37, 42, 43, 45, 47, 48, 50, 51,
               54, 55, 59, 66, 72, 73, 89, 92, 94, 97, 98, 103, 104, 125, 126,
               127, 136, 139, 150, 151, 157, 158, 159, 173, 178, 179, 180, 181,
               189, 201, 203, 206, 208, 209, 222, 226, 227, 229, 230, 234, 243,
               247, 252, 257, 258, 261, 262, 274, 275, 284, 298, 299, 306, 308,
               326, 329, 332, 333, 350, 351, 353, 354, 355, 368, 369, 370, 371,
               373, 380, 381, 397, 400, 403, 410, 411, 417, 418, 419, 421, 422,
               426, 427, 430, 431, 432, 447, 453, 476, 477, 480, 481, 483, 484,
               486, 487, 504, 505, 512, 514, 515, 525, 530, 531, 532, 533, 539,
               540, 552, 553, 555, 556, 568, 574, 575, 577, 578, 591, 592, 598,
               606, 607)),
    trypsin=list(
      "gaju"=5,
      "ins"=c(6, 46, 53, 55, 56, 88, 89),
      "albu"=c(2, 19, 23, 24, 28, 34, 36, 44, 65, 75, 88, 97, 105, 117, 122, 130,
               138, 160, 161, 168, 183, 184, 186, 198, 205, 210, 214, 219, 221,
               223, 229, 233, 236, 242, 246, 249, 257, 264, 281, 286, 298, 300,
               310, 337, 341, 347, 360, 372, 375, 383, 396, 413, 426, 434, 437,
               438, 452, 456, 460, 468, 469, 490, 496, 499, 508, 524, 543, 545,
               548, 549, 558, 562, 565, 569, 581, 584, 588, 597, 598)))

  for (i in seq(along=cleavageResults)) {
    enzyme <- names(cleavageResults)[i]
    expect_equal(cleaver:::.cleavePos(peptides, cleaver:::rules[enzyme],
                                      cleaver:::exceptions[enzyme]),
                 unname(cleavageResults[[i]]))

  }
})

test_that(".rxPos", {
  expect_equal(cleaver:::.rxPos(c("foobar", "foobar2"), "\\d"),
               list(integer(), 7))
})

