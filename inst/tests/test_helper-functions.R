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
  pepsin1.3 <- list(
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
             556, 568, 574, 575, 577, 578, 591, 592, 598, 606, 607))
  pepsin <- list(
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
             606, 607))
  trypsin <- list(
    "gaju"=5,
    "ins"=c(6, 46, 53, 55, 56, 88, 89),
    "albu"=c(2, 19, 23, 24, 28, 34, 36, 44, 65, 75, 88, 97, 105, 117, 122, 130,
             138, 160, 161, 168, 183, 184, 186, 198, 205, 210, 214, 219, 221,
             223, 229, 233, 236, 242, 246, 249, 257, 264, 281, 286, 298, 300,
             310, 337, 341, 347, 360, 372, 375, 383, 396, 413, 426, 434, 437,
             438, 452, 456, 460, 468, 469, 490, 496, 499, 508, 524, 543, 545,
             548, 549, 558, 562, 565, 569, 581, 584, 588, 597, 598))
  expect_equal(cleaver:::.cleavePos(peptides, cleaver:::rules["pepsin1.3"]),
               unname(pepsin1.3))
  expect_equal(cleaver:::.cleavePos(peptides, cleaver:::rules["pepsin"]),
               unname(pepsin))
  expect_equal(cleaver:::.cleavePos(peptides,
                cleaver:::rules["trypsin"], cleaver:::exceptions["trypsin"]),
               unname(trypsin))
})

test_that(".rxPos", {
  expect_equal(cleaver:::.rxPos(c("foobar", "foobar2"), "\\d"),
               list(integer(), 7))
})

