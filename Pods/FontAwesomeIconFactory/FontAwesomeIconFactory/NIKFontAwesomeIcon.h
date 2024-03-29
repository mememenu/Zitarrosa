@import Foundation;

typedef NS_ENUM(UniChar, NIKFontAwesomeIcon) {
    NIKFontAwesomeIcon500px = 0xf26e,
    NIKFontAwesomeIconAdjust = 0xf042,
    NIKFontAwesomeIconAdn = 0xf170,
    NIKFontAwesomeIconAlignCenter = 0xf037,
    NIKFontAwesomeIconAlignJustify = 0xf039,
    NIKFontAwesomeIconAlignLeft = 0xf036,
    NIKFontAwesomeIconAlignRight = 0xf038,
    NIKFontAwesomeIconAmazon = 0xf270,
    NIKFontAwesomeIconAmbulance = 0xf0f9,
    NIKFontAwesomeIconAnchor = 0xf13d,
    NIKFontAwesomeIconAndroid = 0xf17b,
    NIKFontAwesomeIconAngellist = 0xf209,
    NIKFontAwesomeIconAngleDoubleDown = 0xf103,
    NIKFontAwesomeIconAngleDoubleLeft = 0xf100,
    NIKFontAwesomeIconAngleDoubleRight = 0xf101,
    NIKFontAwesomeIconAngleDoubleUp = 0xf102,
    NIKFontAwesomeIconAngleDown = 0xf107,
    NIKFontAwesomeIconAngleLeft = 0xf104,
    NIKFontAwesomeIconAngleRight = 0xf105,
    NIKFontAwesomeIconAngleUp = 0xf106,
    NIKFontAwesomeIconApple = 0xf179,
    NIKFontAwesomeIconArchive = 0xf187,
    NIKFontAwesomeIconAreaChart = 0xf1fe,
    NIKFontAwesomeIconArrowCircleDown = 0xf0ab,
    NIKFontAwesomeIconArrowCircleLeft = 0xf0a8,
    NIKFontAwesomeIconArrowCircleODown = 0xf01a,
    NIKFontAwesomeIconArrowCircleOLeft = 0xf190,
    NIKFontAwesomeIconArrowCircleORight = 0xf18e,
    NIKFontAwesomeIconArrowCircleOUp = 0xf01b,
    NIKFontAwesomeIconArrowCircleRight = 0xf0a9,
    NIKFontAwesomeIconArrowCircleUp = 0xf0aa,
    NIKFontAwesomeIconArrowDown = 0xf063,
    NIKFontAwesomeIconArrowLeft = 0xf060,
    NIKFontAwesomeIconArrowRight = 0xf061,
    NIKFontAwesomeIconArrowUp = 0xf062,
    NIKFontAwesomeIconArrows = 0xf047,
    NIKFontAwesomeIconArrowsAlt = 0xf0b2,
    NIKFontAwesomeIconArrowsH = 0xf07e,
    NIKFontAwesomeIconArrowsV = 0xf07d,
    NIKFontAwesomeIconAsterisk = 0xf069,
    NIKFontAwesomeIconAt = 0xf1fa,
    NIKFontAwesomeIconAutomobile = 0xf1b9,
    NIKFontAwesomeIconBackward = 0xf04a,
    NIKFontAwesomeIconBalanceScale = 0xf24e,
    NIKFontAwesomeIconBan = 0xf05e,
    NIKFontAwesomeIconBank = 0xf19c,
    NIKFontAwesomeIconBarChart = 0xf080,
    NIKFontAwesomeIconBarChartO = 0xf080,
    NIKFontAwesomeIconBarcode = 0xf02a,
    NIKFontAwesomeIconBars = 0xf0c9,
    NIKFontAwesomeIconBattery0 = 0xf244,
    NIKFontAwesomeIconBattery1 = 0xf243,
    NIKFontAwesomeIconBattery2 = 0xf242,
    NIKFontAwesomeIconBattery3 = 0xf241,
    NIKFontAwesomeIconBattery4 = 0xf240,
    NIKFontAwesomeIconBatteryEmpty = 0xf244,
    NIKFontAwesomeIconBatteryFull = 0xf240,
    NIKFontAwesomeIconBatteryHalf = 0xf242,
    NIKFontAwesomeIconBatteryQuarter = 0xf243,
    NIKFontAwesomeIconBatteryThreeQuarters = 0xf241,
    NIKFontAwesomeIconBed = 0xf236,
    NIKFontAwesomeIconBeer = 0xf0fc,
    NIKFontAwesomeIconBehance = 0xf1b4,
    NIKFontAwesomeIconBehanceSquare = 0xf1b5,
    NIKFontAwesomeIconBell = 0xf0f3,
    NIKFontAwesomeIconBellO = 0xf0a2,
    NIKFontAwesomeIconBellSlash = 0xf1f6,
    NIKFontAwesomeIconBellSlashO = 0xf1f7,
    NIKFontAwesomeIconBicycle = 0xf206,
    NIKFontAwesomeIconBinoculars = 0xf1e5,
    NIKFontAwesomeIconBirthdayCake = 0xf1fd,
    NIKFontAwesomeIconBitbucket = 0xf171,
    NIKFontAwesomeIconBitbucketSquare = 0xf172,
    NIKFontAwesomeIconBitcoin = 0xf15a,
    NIKFontAwesomeIconBlackTie = 0xf27e,
    NIKFontAwesomeIconBold = 0xf032,
    NIKFontAwesomeIconBolt = 0xf0e7,
    NIKFontAwesomeIconBomb = 0xf1e2,
    NIKFontAwesomeIconBook = 0xf02d,
    NIKFontAwesomeIconBookmark = 0xf02e,
    NIKFontAwesomeIconBookmarkO = 0xf097,
    NIKFontAwesomeIconBriefcase = 0xf0b1,
    NIKFontAwesomeIconBtc = 0xf15a,
    NIKFontAwesomeIconBug = 0xf188,
    NIKFontAwesomeIconBuilding = 0xf1ad,
    NIKFontAwesomeIconBuildingO = 0xf0f7,
    NIKFontAwesomeIconBullhorn = 0xf0a1,
    NIKFontAwesomeIconBullseye = 0xf140,
    NIKFontAwesomeIconBus = 0xf207,
    NIKFontAwesomeIconBuysellads = 0xf20d,
    NIKFontAwesomeIconCab = 0xf1ba,
    NIKFontAwesomeIconCalculator = 0xf1ec,
    NIKFontAwesomeIconCalendar = 0xf073,
    NIKFontAwesomeIconCalendarCheckO = 0xf274,
    NIKFontAwesomeIconCalendarMinusO = 0xf272,
    NIKFontAwesomeIconCalendarO = 0xf133,
    NIKFontAwesomeIconCalendarPlusO = 0xf271,
    NIKFontAwesomeIconCalendarTimesO = 0xf273,
    NIKFontAwesomeIconCamera = 0xf030,
    NIKFontAwesomeIconCameraRetro = 0xf083,
    NIKFontAwesomeIconCar = 0xf1b9,
    NIKFontAwesomeIconCaretDown = 0xf0d7,
    NIKFontAwesomeIconCaretLeft = 0xf0d9,
    NIKFontAwesomeIconCaretRight = 0xf0da,
    NIKFontAwesomeIconCaretSquareODown = 0xf150,
    NIKFontAwesomeIconCaretSquareOLeft = 0xf191,
    NIKFontAwesomeIconCaretSquareORight = 0xf152,
    NIKFontAwesomeIconCaretSquareOUp = 0xf151,
    NIKFontAwesomeIconCaretUp = 0xf0d8,
    NIKFontAwesomeIconCartArrowDown = 0xf218,
    NIKFontAwesomeIconCartPlus = 0xf217,
    NIKFontAwesomeIconCc = 0xf20a,
    NIKFontAwesomeIconCcAmex = 0xf1f3,
    NIKFontAwesomeIconCcDinersClub = 0xf24c,
    NIKFontAwesomeIconCcDiscover = 0xf1f2,
    NIKFontAwesomeIconCcJcb = 0xf24b,
    NIKFontAwesomeIconCcMastercard = 0xf1f1,
    NIKFontAwesomeIconCcPaypal = 0xf1f4,
    NIKFontAwesomeIconCcStripe = 0xf1f5,
    NIKFontAwesomeIconCcVisa = 0xf1f0,
    NIKFontAwesomeIconCertificate = 0xf0a3,
    NIKFontAwesomeIconChain = 0xf0c1,
    NIKFontAwesomeIconChainBroken = 0xf127,
    NIKFontAwesomeIconCheck = 0xf00c,
    NIKFontAwesomeIconCheckCircle = 0xf058,
    NIKFontAwesomeIconCheckCircleO = 0xf05d,
    NIKFontAwesomeIconCheckSquare = 0xf14a,
    NIKFontAwesomeIconCheckSquareO = 0xf046,
    NIKFontAwesomeIconChevronCircleDown = 0xf13a,
    NIKFontAwesomeIconChevronCircleLeft = 0xf137,
    NIKFontAwesomeIconChevronCircleRight = 0xf138,
    NIKFontAwesomeIconChevronCircleUp = 0xf139,
    NIKFontAwesomeIconChevronDown = 0xf078,
    NIKFontAwesomeIconChevronLeft = 0xf053,
    NIKFontAwesomeIconChevronRight = 0xf054,
    NIKFontAwesomeIconChevronUp = 0xf077,
    NIKFontAwesomeIconChild = 0xf1ae,
    NIKFontAwesomeIconChrome = 0xf268,
    NIKFontAwesomeIconCircle = 0xf111,
    NIKFontAwesomeIconCircleO = 0xf10c,
    NIKFontAwesomeIconCircleONotch = 0xf1ce,
    NIKFontAwesomeIconCircleThin = 0xf1db,
    NIKFontAwesomeIconClipboard = 0xf0ea,
    NIKFontAwesomeIconClockO = 0xf017,
    NIKFontAwesomeIconClone = 0xf24d,
    NIKFontAwesomeIconClose = 0xf00d,
    NIKFontAwesomeIconCloud = 0xf0c2,
    NIKFontAwesomeIconCloudDownload = 0xf0ed,
    NIKFontAwesomeIconCloudUpload = 0xf0ee,
    NIKFontAwesomeIconCny = 0xf157,
    NIKFontAwesomeIconCode = 0xf121,
    NIKFontAwesomeIconCodeFork = 0xf126,
    NIKFontAwesomeIconCodepen = 0xf1cb,
    NIKFontAwesomeIconCoffee = 0xf0f4,
    NIKFontAwesomeIconCog = 0xf013,
    NIKFontAwesomeIconCogs = 0xf085,
    NIKFontAwesomeIconColumns = 0xf0db,
    NIKFontAwesomeIconComment = 0xf075,
    NIKFontAwesomeIconCommentO = 0xf0e5,
    NIKFontAwesomeIconCommenting = 0xf27a,
    NIKFontAwesomeIconCommentingO = 0xf27b,
    NIKFontAwesomeIconComments = 0xf086,
    NIKFontAwesomeIconCommentsO = 0xf0e6,
    NIKFontAwesomeIconCompass = 0xf14e,
    NIKFontAwesomeIconCompress = 0xf066,
    NIKFontAwesomeIconConnectdevelop = 0xf20e,
    NIKFontAwesomeIconContao = 0xf26d,
    NIKFontAwesomeIconCopy = 0xf0c5,
    NIKFontAwesomeIconCopyright = 0xf1f9,
    NIKFontAwesomeIconCreativeCommons = 0xf25e,
    NIKFontAwesomeIconCreditCard = 0xf09d,
    NIKFontAwesomeIconCrop = 0xf125,
    NIKFontAwesomeIconCrosshairs = 0xf05b,
    NIKFontAwesomeIconCss3 = 0xf13c,
    NIKFontAwesomeIconCube = 0xf1b2,
    NIKFontAwesomeIconCubes = 0xf1b3,
    NIKFontAwesomeIconCut = 0xf0c4,
    NIKFontAwesomeIconCutlery = 0xf0f5,
    NIKFontAwesomeIconDashboard = 0xf0e4,
    NIKFontAwesomeIconDashcube = 0xf210,
    NIKFontAwesomeIconDatabase = 0xf1c0,
    NIKFontAwesomeIconDedent = 0xf03b,
    NIKFontAwesomeIconDelicious = 0xf1a5,
    NIKFontAwesomeIconDesktop = 0xf108,
    NIKFontAwesomeIconDeviantart = 0xf1bd,
    NIKFontAwesomeIconDiamond = 0xf219,
    NIKFontAwesomeIconDigg = 0xf1a6,
    NIKFontAwesomeIconDollar = 0xf155,
    NIKFontAwesomeIconDotCircleO = 0xf192,
    NIKFontAwesomeIconDownload = 0xf019,
    NIKFontAwesomeIconDribbble = 0xf17d,
    NIKFontAwesomeIconDropbox = 0xf16b,
    NIKFontAwesomeIconDrupal = 0xf1a9,
    NIKFontAwesomeIconEdit = 0xf044,
    NIKFontAwesomeIconEject = 0xf052,
    NIKFontAwesomeIconEllipsisH = 0xf141,
    NIKFontAwesomeIconEllipsisV = 0xf142,
    NIKFontAwesomeIconEmpire = 0xf1d1,
    NIKFontAwesomeIconEnvelope = 0xf0e0,
    NIKFontAwesomeIconEnvelopeO = 0xf003,
    NIKFontAwesomeIconEnvelopeSquare = 0xf199,
    NIKFontAwesomeIconEraser = 0xf12d,
    NIKFontAwesomeIconEur = 0xf153,
    NIKFontAwesomeIconEuro = 0xf153,
    NIKFontAwesomeIconExchange = 0xf0ec,
    NIKFontAwesomeIconExclamation = 0xf12a,
    NIKFontAwesomeIconExclamationCircle = 0xf06a,
    NIKFontAwesomeIconExclamationTriangle = 0xf071,
    NIKFontAwesomeIconExpand = 0xf065,
    NIKFontAwesomeIconExpeditedssl = 0xf23e,
    NIKFontAwesomeIconExternalLink = 0xf08e,
    NIKFontAwesomeIconExternalLinkSquare = 0xf14c,
    NIKFontAwesomeIconEye = 0xf06e,
    NIKFontAwesomeIconEyeSlash = 0xf070,
    NIKFontAwesomeIconEyedropper = 0xf1fb,
    NIKFontAwesomeIconFacebook = 0xf09a,
    NIKFontAwesomeIconFacebookF = 0xf09a,
    NIKFontAwesomeIconFacebookOfficial = 0xf230,
    NIKFontAwesomeIconFacebookSquare = 0xf082,
    NIKFontAwesomeIconFastBackward = 0xf049,
    NIKFontAwesomeIconFastForward = 0xf050,
    NIKFontAwesomeIconFax = 0xf1ac,
    NIKFontAwesomeIconFeed = 0xf09e,
    NIKFontAwesomeIconFemale = 0xf182,
    NIKFontAwesomeIconFighterJet = 0xf0fb,
    NIKFontAwesomeIconFile = 0xf15b,
    NIKFontAwesomeIconFileArchiveO = 0xf1c6,
    NIKFontAwesomeIconFileAudioO = 0xf1c7,
    NIKFontAwesomeIconFileCodeO = 0xf1c9,
    NIKFontAwesomeIconFileExcelO = 0xf1c3,
    NIKFontAwesomeIconFileImageO = 0xf1c5,
    NIKFontAwesomeIconFileMovieO = 0xf1c8,
    NIKFontAwesomeIconFileO = 0xf016,
    NIKFontAwesomeIconFilePdfO = 0xf1c1,
    NIKFontAwesomeIconFilePhotoO = 0xf1c5,
    NIKFontAwesomeIconFilePictureO = 0xf1c5,
    NIKFontAwesomeIconFilePowerpointO = 0xf1c4,
    NIKFontAwesomeIconFileSoundO = 0xf1c7,
    NIKFontAwesomeIconFileText = 0xf15c,
    NIKFontAwesomeIconFileTextO = 0xf0f6,
    NIKFontAwesomeIconFileVideoO = 0xf1c8,
    NIKFontAwesomeIconFileWordO = 0xf1c2,
    NIKFontAwesomeIconFileZipO = 0xf1c6,
    NIKFontAwesomeIconFilesO = 0xf0c5,
    NIKFontAwesomeIconFilm = 0xf008,
    NIKFontAwesomeIconFilter = 0xf0b0,
    NIKFontAwesomeIconFire = 0xf06d,
    NIKFontAwesomeIconFireExtinguisher = 0xf134,
    NIKFontAwesomeIconFirefox = 0xf269,
    NIKFontAwesomeIconFlag = 0xf024,
    NIKFontAwesomeIconFlagCheckered = 0xf11e,
    NIKFontAwesomeIconFlagO = 0xf11d,
    NIKFontAwesomeIconFlash = 0xf0e7,
    NIKFontAwesomeIconFlask = 0xf0c3,
    NIKFontAwesomeIconFlickr = 0xf16e,
    NIKFontAwesomeIconFloppyO = 0xf0c7,
    NIKFontAwesomeIconFolder = 0xf07b,
    NIKFontAwesomeIconFolderO = 0xf114,
    NIKFontAwesomeIconFolderOpen = 0xf07c,
    NIKFontAwesomeIconFolderOpenO = 0xf115,
    NIKFontAwesomeIconFont = 0xf031,
    NIKFontAwesomeIconFonticons = 0xf280,
    NIKFontAwesomeIconForumbee = 0xf211,
    NIKFontAwesomeIconForward = 0xf04e,
    NIKFontAwesomeIconFoursquare = 0xf180,
    NIKFontAwesomeIconFrownO = 0xf119,
    NIKFontAwesomeIconFutbolO = 0xf1e3,
    NIKFontAwesomeIconGamepad = 0xf11b,
    NIKFontAwesomeIconGavel = 0xf0e3,
    NIKFontAwesomeIconGbp = 0xf154,
    NIKFontAwesomeIconGe = 0xf1d1,
    NIKFontAwesomeIconGear = 0xf013,
    NIKFontAwesomeIconGears = 0xf085,
    NIKFontAwesomeIconGenderless = 0xf22d,
    NIKFontAwesomeIconGetPocket = 0xf265,
    NIKFontAwesomeIconGg = 0xf260,
    NIKFontAwesomeIconGgCircle = 0xf261,
    NIKFontAwesomeIconGift = 0xf06b,
    NIKFontAwesomeIconGit = 0xf1d3,
    NIKFontAwesomeIconGitSquare = 0xf1d2,
    NIKFontAwesomeIconGithub = 0xf09b,
    NIKFontAwesomeIconGithubAlt = 0xf113,
    NIKFontAwesomeIconGithubSquare = 0xf092,
    NIKFontAwesomeIconGittip = 0xf184,
    NIKFontAwesomeIconGlass = 0xf000,
    NIKFontAwesomeIconGlobe = 0xf0ac,
    NIKFontAwesomeIconGoogle = 0xf1a0,
    NIKFontAwesomeIconGooglePlus = 0xf0d5,
    NIKFontAwesomeIconGooglePlusSquare = 0xf0d4,
    NIKFontAwesomeIconGoogleWallet = 0xf1ee,
    NIKFontAwesomeIconGraduationCap = 0xf19d,
    NIKFontAwesomeIconGratipay = 0xf184,
    NIKFontAwesomeIconGroup = 0xf0c0,
    NIKFontAwesomeIconHSquare = 0xf0fd,
    NIKFontAwesomeIconHackerNews = 0xf1d4,
    NIKFontAwesomeIconHandGrabO = 0xf255,
    NIKFontAwesomeIconHandLizardO = 0xf258,
    NIKFontAwesomeIconHandODown = 0xf0a7,
    NIKFontAwesomeIconHandOLeft = 0xf0a5,
    NIKFontAwesomeIconHandORight = 0xf0a4,
    NIKFontAwesomeIconHandOUp = 0xf0a6,
    NIKFontAwesomeIconHandPaperO = 0xf256,
    NIKFontAwesomeIconHandPeaceO = 0xf25b,
    NIKFontAwesomeIconHandPointerO = 0xf25a,
    NIKFontAwesomeIconHandRockO = 0xf255,
    NIKFontAwesomeIconHandScissorsO = 0xf257,
    NIKFontAwesomeIconHandSpockO = 0xf259,
    NIKFontAwesomeIconHandStopO = 0xf256,
    NIKFontAwesomeIconHddO = 0xf0a0,
    NIKFontAwesomeIconHeader = 0xf1dc,
    NIKFontAwesomeIconHeadphones = 0xf025,
    NIKFontAwesomeIconHeart = 0xf004,
    NIKFontAwesomeIconHeartO = 0xf08a,
    NIKFontAwesomeIconHeartbeat = 0xf21e,
    NIKFontAwesomeIconHistory = 0xf1da,
    NIKFontAwesomeIconHome = 0xf015,
    NIKFontAwesomeIconHospitalO = 0xf0f8,
    NIKFontAwesomeIconHotel = 0xf236,
    NIKFontAwesomeIconHourglass = 0xf254,
    NIKFontAwesomeIconHourglass1 = 0xf251,
    NIKFontAwesomeIconHourglass2 = 0xf252,
    NIKFontAwesomeIconHourglass3 = 0xf253,
    NIKFontAwesomeIconHourglassEnd = 0xf253,
    NIKFontAwesomeIconHourglassHalf = 0xf252,
    NIKFontAwesomeIconHourglassO = 0xf250,
    NIKFontAwesomeIconHourglassStart = 0xf251,
    NIKFontAwesomeIconHouzz = 0xf27c,
    NIKFontAwesomeIconHtml5 = 0xf13b,
    NIKFontAwesomeIconICursor = 0xf246,
    NIKFontAwesomeIconIls = 0xf20b,
    NIKFontAwesomeIconImage = 0xf03e,
    NIKFontAwesomeIconInbox = 0xf01c,
    NIKFontAwesomeIconIndent = 0xf03c,
    NIKFontAwesomeIconIndustry = 0xf275,
    NIKFontAwesomeIconInfo = 0xf129,
    NIKFontAwesomeIconInfoCircle = 0xf05a,
    NIKFontAwesomeIconInr = 0xf156,
    NIKFontAwesomeIconInstagram = 0xf16d,
    NIKFontAwesomeIconInstitution = 0xf19c,
    NIKFontAwesomeIconInternetExplorer = 0xf26b,
    NIKFontAwesomeIconIntersex = 0xf224,
    NIKFontAwesomeIconIoxhost = 0xf208,
    NIKFontAwesomeIconItalic = 0xf033,
    NIKFontAwesomeIconJoomla = 0xf1aa,
    NIKFontAwesomeIconJpy = 0xf157,
    NIKFontAwesomeIconJsfiddle = 0xf1cc,
    NIKFontAwesomeIconKey = 0xf084,
    NIKFontAwesomeIconKeyboardO = 0xf11c,
    NIKFontAwesomeIconKrw = 0xf159,
    NIKFontAwesomeIconLanguage = 0xf1ab,
    NIKFontAwesomeIconLaptop = 0xf109,
    NIKFontAwesomeIconLastfm = 0xf202,
    NIKFontAwesomeIconLastfmSquare = 0xf203,
    NIKFontAwesomeIconLeaf = 0xf06c,
    NIKFontAwesomeIconLeanpub = 0xf212,
    NIKFontAwesomeIconLegal = 0xf0e3,
    NIKFontAwesomeIconLemonO = 0xf094,
    NIKFontAwesomeIconLevelDown = 0xf149,
    NIKFontAwesomeIconLevelUp = 0xf148,
    NIKFontAwesomeIconLifeBouy = 0xf1cd,
    NIKFontAwesomeIconLifeBuoy = 0xf1cd,
    NIKFontAwesomeIconLifeRing = 0xf1cd,
    NIKFontAwesomeIconLifeSaver = 0xf1cd,
    NIKFontAwesomeIconLightbulbO = 0xf0eb,
    NIKFontAwesomeIconLineChart = 0xf201,
    NIKFontAwesomeIconLink = 0xf0c1,
    NIKFontAwesomeIconLinkedin = 0xf0e1,
    NIKFontAwesomeIconLinkedinSquare = 0xf08c,
    NIKFontAwesomeIconLinux = 0xf17c,
    NIKFontAwesomeIconList = 0xf03a,
    NIKFontAwesomeIconListAlt = 0xf022,
    NIKFontAwesomeIconListOl = 0xf0cb,
    NIKFontAwesomeIconListUl = 0xf0ca,
    NIKFontAwesomeIconLocationArrow = 0xf124,
    NIKFontAwesomeIconLock = 0xf023,
    NIKFontAwesomeIconLongArrowDown = 0xf175,
    NIKFontAwesomeIconLongArrowLeft = 0xf177,
    NIKFontAwesomeIconLongArrowRight = 0xf178,
    NIKFontAwesomeIconLongArrowUp = 0xf176,
    NIKFontAwesomeIconMagic = 0xf0d0,
    NIKFontAwesomeIconMagnet = 0xf076,
    NIKFontAwesomeIconMailForward = 0xf064,
    NIKFontAwesomeIconMailReply = 0xf112,
    NIKFontAwesomeIconMailReplyAll = 0xf122,
    NIKFontAwesomeIconMale = 0xf183,
    NIKFontAwesomeIconMap = 0xf279,
    NIKFontAwesomeIconMapMarker = 0xf041,
    NIKFontAwesomeIconMapO = 0xf278,
    NIKFontAwesomeIconMapPin = 0xf276,
    NIKFontAwesomeIconMapSigns = 0xf277,
    NIKFontAwesomeIconMars = 0xf222,
    NIKFontAwesomeIconMarsDouble = 0xf227,
    NIKFontAwesomeIconMarsStroke = 0xf229,
    NIKFontAwesomeIconMarsStrokeH = 0xf22b,
    NIKFontAwesomeIconMarsStrokeV = 0xf22a,
    NIKFontAwesomeIconMaxcdn = 0xf136,
    NIKFontAwesomeIconMeanpath = 0xf20c,
    NIKFontAwesomeIconMedium = 0xf23a,
    NIKFontAwesomeIconMedkit = 0xf0fa,
    NIKFontAwesomeIconMehO = 0xf11a,
    NIKFontAwesomeIconMercury = 0xf223,
    NIKFontAwesomeIconMicrophone = 0xf130,
    NIKFontAwesomeIconMicrophoneSlash = 0xf131,
    NIKFontAwesomeIconMinus = 0xf068,
    NIKFontAwesomeIconMinusCircle = 0xf056,
    NIKFontAwesomeIconMinusSquare = 0xf146,
    NIKFontAwesomeIconMinusSquareO = 0xf147,
    NIKFontAwesomeIconMobile = 0xf10b,
    NIKFontAwesomeIconMobilePhone = 0xf10b,
    NIKFontAwesomeIconMoney = 0xf0d6,
    NIKFontAwesomeIconMoonO = 0xf186,
    NIKFontAwesomeIconMortarBoard = 0xf19d,
    NIKFontAwesomeIconMotorcycle = 0xf21c,
    NIKFontAwesomeIconMousePointer = 0xf245,
    NIKFontAwesomeIconMusic = 0xf001,
    NIKFontAwesomeIconNavicon = 0xf0c9,
    NIKFontAwesomeIconNeuter = 0xf22c,
    NIKFontAwesomeIconNewspaperO = 0xf1ea,
    NIKFontAwesomeIconObjectGroup = 0xf247,
    NIKFontAwesomeIconObjectUngroup = 0xf248,
    NIKFontAwesomeIconOdnoklassniki = 0xf263,
    NIKFontAwesomeIconOdnoklassnikiSquare = 0xf264,
    NIKFontAwesomeIconOpencart = 0xf23d,
    NIKFontAwesomeIconOpenid = 0xf19b,
    NIKFontAwesomeIconOpera = 0xf26a,
    NIKFontAwesomeIconOptinMonster = 0xf23c,
    NIKFontAwesomeIconOutdent = 0xf03b,
    NIKFontAwesomeIconPagelines = 0xf18c,
    NIKFontAwesomeIconPaintBrush = 0xf1fc,
    NIKFontAwesomeIconPaperPlane = 0xf1d8,
    NIKFontAwesomeIconPaperPlaneO = 0xf1d9,
    NIKFontAwesomeIconPaperclip = 0xf0c6,
    NIKFontAwesomeIconParagraph = 0xf1dd,
    NIKFontAwesomeIconPaste = 0xf0ea,
    NIKFontAwesomeIconPause = 0xf04c,
    NIKFontAwesomeIconPaw = 0xf1b0,
    NIKFontAwesomeIconPaypal = 0xf1ed,
    NIKFontAwesomeIconPencil = 0xf040,
    NIKFontAwesomeIconPencilSquare = 0xf14b,
    NIKFontAwesomeIconPencilSquareO = 0xf044,
    NIKFontAwesomeIconPhone = 0xf095,
    NIKFontAwesomeIconPhoneSquare = 0xf098,
    NIKFontAwesomeIconPhoto = 0xf03e,
    NIKFontAwesomeIconPictureO = 0xf03e,
    NIKFontAwesomeIconPieChart = 0xf200,
    NIKFontAwesomeIconPiedPiper = 0xf1a7,
    NIKFontAwesomeIconPiedPiperAlt = 0xf1a8,
    NIKFontAwesomeIconPinterest = 0xf0d2,
    NIKFontAwesomeIconPinterestP = 0xf231,
    NIKFontAwesomeIconPinterestSquare = 0xf0d3,
    NIKFontAwesomeIconPlane = 0xf072,
    NIKFontAwesomeIconPlay = 0xf04b,
    NIKFontAwesomeIconPlayCircle = 0xf144,
    NIKFontAwesomeIconPlayCircleO = 0xf01d,
    NIKFontAwesomeIconPlug = 0xf1e6,
    NIKFontAwesomeIconPlus = 0xf067,
    NIKFontAwesomeIconPlusCircle = 0xf055,
    NIKFontAwesomeIconPlusSquare = 0xf0fe,
    NIKFontAwesomeIconPlusSquareO = 0xf196,
    NIKFontAwesomeIconPowerOff = 0xf011,
    NIKFontAwesomeIconPrint = 0xf02f,
    NIKFontAwesomeIconPuzzlePiece = 0xf12e,
    NIKFontAwesomeIconQq = 0xf1d6,
    NIKFontAwesomeIconQrcode = 0xf029,
    NIKFontAwesomeIconQuestion = 0xf128,
    NIKFontAwesomeIconQuestionCircle = 0xf059,
    NIKFontAwesomeIconQuoteLeft = 0xf10d,
    NIKFontAwesomeIconQuoteRight = 0xf10e,
    NIKFontAwesomeIconRa = 0xf1d0,
    NIKFontAwesomeIconRandom = 0xf074,
    NIKFontAwesomeIconRebel = 0xf1d0,
    NIKFontAwesomeIconRecycle = 0xf1b8,
    NIKFontAwesomeIconReddit = 0xf1a1,
    NIKFontAwesomeIconRedditSquare = 0xf1a2,
    NIKFontAwesomeIconRefresh = 0xf021,
    NIKFontAwesomeIconRegistered = 0xf25d,
    NIKFontAwesomeIconRemove = 0xf00d,
    NIKFontAwesomeIconRenren = 0xf18b,
    NIKFontAwesomeIconReorder = 0xf0c9,
    NIKFontAwesomeIconRepeat = 0xf01e,
    NIKFontAwesomeIconReply = 0xf112,
    NIKFontAwesomeIconReplyAll = 0xf122,
    NIKFontAwesomeIconRetweet = 0xf079,
    NIKFontAwesomeIconRmb = 0xf157,
    NIKFontAwesomeIconRoad = 0xf018,
    NIKFontAwesomeIconRocket = 0xf135,
    NIKFontAwesomeIconRotateLeft = 0xf0e2,
    NIKFontAwesomeIconRotateRight = 0xf01e,
    NIKFontAwesomeIconRouble = 0xf158,
    NIKFontAwesomeIconRss = 0xf09e,
    NIKFontAwesomeIconRssSquare = 0xf143,
    NIKFontAwesomeIconRub = 0xf158,
    NIKFontAwesomeIconRuble = 0xf158,
    NIKFontAwesomeIconRupee = 0xf156,
    NIKFontAwesomeIconSafari = 0xf267,
    NIKFontAwesomeIconSave = 0xf0c7,
    NIKFontAwesomeIconScissors = 0xf0c4,
    NIKFontAwesomeIconSearch = 0xf002,
    NIKFontAwesomeIconSearchMinus = 0xf010,
    NIKFontAwesomeIconSearchPlus = 0xf00e,
    NIKFontAwesomeIconSellsy = 0xf213,
    NIKFontAwesomeIconSend = 0xf1d8,
    NIKFontAwesomeIconSendO = 0xf1d9,
    NIKFontAwesomeIconServer = 0xf233,
    NIKFontAwesomeIconShare = 0xf064,
    NIKFontAwesomeIconShareAlt = 0xf1e0,
    NIKFontAwesomeIconShareAltSquare = 0xf1e1,
    NIKFontAwesomeIconShareSquare = 0xf14d,
    NIKFontAwesomeIconShareSquareO = 0xf045,
    NIKFontAwesomeIconShekel = 0xf20b,
    NIKFontAwesomeIconSheqel = 0xf20b,
    NIKFontAwesomeIconShield = 0xf132,
    NIKFontAwesomeIconShip = 0xf21a,
    NIKFontAwesomeIconShirtsinbulk = 0xf214,
    NIKFontAwesomeIconShoppingCart = 0xf07a,
    NIKFontAwesomeIconSignIn = 0xf090,
    NIKFontAwesomeIconSignOut = 0xf08b,
    NIKFontAwesomeIconSignal = 0xf012,
    NIKFontAwesomeIconSimplybuilt = 0xf215,
    NIKFontAwesomeIconSitemap = 0xf0e8,
    NIKFontAwesomeIconSkyatlas = 0xf216,
    NIKFontAwesomeIconSkype = 0xf17e,
    NIKFontAwesomeIconSlack = 0xf198,
    NIKFontAwesomeIconSliders = 0xf1de,
    NIKFontAwesomeIconSlideshare = 0xf1e7,
    NIKFontAwesomeIconSmileO = 0xf118,
    NIKFontAwesomeIconSoccerBallO = 0xf1e3,
    NIKFontAwesomeIconSort = 0xf0dc,
    NIKFontAwesomeIconSortAlphaAsc = 0xf15d,
    NIKFontAwesomeIconSortAlphaDesc = 0xf15e,
    NIKFontAwesomeIconSortAmountAsc = 0xf160,
    NIKFontAwesomeIconSortAmountDesc = 0xf161,
    NIKFontAwesomeIconSortAsc = 0xf0de,
    NIKFontAwesomeIconSortDesc = 0xf0dd,
    NIKFontAwesomeIconSortDown = 0xf0dd,
    NIKFontAwesomeIconSortNumericAsc = 0xf162,
    NIKFontAwesomeIconSortNumericDesc = 0xf163,
    NIKFontAwesomeIconSortUp = 0xf0de,
    NIKFontAwesomeIconSoundcloud = 0xf1be,
    NIKFontAwesomeIconSpaceShuttle = 0xf197,
    NIKFontAwesomeIconSpinner = 0xf110,
    NIKFontAwesomeIconSpoon = 0xf1b1,
    NIKFontAwesomeIconSpotify = 0xf1bc,
    NIKFontAwesomeIconSquare = 0xf0c8,
    NIKFontAwesomeIconSquareO = 0xf096,
    NIKFontAwesomeIconStackExchange = 0xf18d,
    NIKFontAwesomeIconStackOverflow = 0xf16c,
    NIKFontAwesomeIconStar = 0xf005,
    NIKFontAwesomeIconStarHalf = 0xf089,
    NIKFontAwesomeIconStarHalfEmpty = 0xf123,
    NIKFontAwesomeIconStarHalfFull = 0xf123,
    NIKFontAwesomeIconStarHalfO = 0xf123,
    NIKFontAwesomeIconStarO = 0xf006,
    NIKFontAwesomeIconSteam = 0xf1b6,
    NIKFontAwesomeIconSteamSquare = 0xf1b7,
    NIKFontAwesomeIconStepBackward = 0xf048,
    NIKFontAwesomeIconStepForward = 0xf051,
    NIKFontAwesomeIconStethoscope = 0xf0f1,
    NIKFontAwesomeIconStickyNote = 0xf249,
    NIKFontAwesomeIconStickyNoteO = 0xf24a,
    NIKFontAwesomeIconStop = 0xf04d,
    NIKFontAwesomeIconStreetView = 0xf21d,
    NIKFontAwesomeIconStrikethrough = 0xf0cc,
    NIKFontAwesomeIconStumbleupon = 0xf1a4,
    NIKFontAwesomeIconStumbleuponCircle = 0xf1a3,
    NIKFontAwesomeIconSubscript = 0xf12c,
    NIKFontAwesomeIconSubway = 0xf239,
    NIKFontAwesomeIconSuitcase = 0xf0f2,
    NIKFontAwesomeIconSunO = 0xf185,
    NIKFontAwesomeIconSuperscript = 0xf12b,
    NIKFontAwesomeIconSupport = 0xf1cd,
    NIKFontAwesomeIconTable = 0xf0ce,
    NIKFontAwesomeIconTablet = 0xf10a,
    NIKFontAwesomeIconTachometer = 0xf0e4,
    NIKFontAwesomeIconTag = 0xf02b,
    NIKFontAwesomeIconTags = 0xf02c,
    NIKFontAwesomeIconTasks = 0xf0ae,
    NIKFontAwesomeIconTaxi = 0xf1ba,
    NIKFontAwesomeIconTelevision = 0xf26c,
    NIKFontAwesomeIconTencentWeibo = 0xf1d5,
    NIKFontAwesomeIconTerminal = 0xf120,
    NIKFontAwesomeIconTextHeight = 0xf034,
    NIKFontAwesomeIconTextWidth = 0xf035,
    NIKFontAwesomeIconTh = 0xf00a,
    NIKFontAwesomeIconThLarge = 0xf009,
    NIKFontAwesomeIconThList = 0xf00b,
    NIKFontAwesomeIconThumbTack = 0xf08d,
    NIKFontAwesomeIconThumbsDown = 0xf165,
    NIKFontAwesomeIconThumbsODown = 0xf088,
    NIKFontAwesomeIconThumbsOUp = 0xf087,
    NIKFontAwesomeIconThumbsUp = 0xf164,
    NIKFontAwesomeIconTicket = 0xf145,
    NIKFontAwesomeIconTimes = 0xf00d,
    NIKFontAwesomeIconTimesCircle = 0xf057,
    NIKFontAwesomeIconTimesCircleO = 0xf05c,
    NIKFontAwesomeIconTint = 0xf043,
    NIKFontAwesomeIconToggleDown = 0xf150,
    NIKFontAwesomeIconToggleLeft = 0xf191,
    NIKFontAwesomeIconToggleOff = 0xf204,
    NIKFontAwesomeIconToggleOn = 0xf205,
    NIKFontAwesomeIconToggleRight = 0xf152,
    NIKFontAwesomeIconToggleUp = 0xf151,
    NIKFontAwesomeIconTrademark = 0xf25c,
    NIKFontAwesomeIconTrain = 0xf238,
    NIKFontAwesomeIconTransgender = 0xf224,
    NIKFontAwesomeIconTransgenderAlt = 0xf225,
    NIKFontAwesomeIconTrash = 0xf1f8,
    NIKFontAwesomeIconTrashO = 0xf014,
    NIKFontAwesomeIconTree = 0xf1bb,
    NIKFontAwesomeIconTrello = 0xf181,
    NIKFontAwesomeIconTripadvisor = 0xf262,
    NIKFontAwesomeIconTrophy = 0xf091,
    NIKFontAwesomeIconTruck = 0xf0d1,
    NIKFontAwesomeIconTry = 0xf195,
    NIKFontAwesomeIconTty = 0xf1e4,
    NIKFontAwesomeIconTumblr = 0xf173,
    NIKFontAwesomeIconTumblrSquare = 0xf174,
    NIKFontAwesomeIconTurkishLira = 0xf195,
    NIKFontAwesomeIconTv = 0xf26c,
    NIKFontAwesomeIconTwitch = 0xf1e8,
    NIKFontAwesomeIconTwitter = 0xf099,
    NIKFontAwesomeIconTwitterSquare = 0xf081,
    NIKFontAwesomeIconUmbrella = 0xf0e9,
    NIKFontAwesomeIconUnderline = 0xf0cd,
    NIKFontAwesomeIconUndo = 0xf0e2,
    NIKFontAwesomeIconUniversity = 0xf19c,
    NIKFontAwesomeIconUnlink = 0xf127,
    NIKFontAwesomeIconUnlock = 0xf09c,
    NIKFontAwesomeIconUnlockAlt = 0xf13e,
    NIKFontAwesomeIconUnsorted = 0xf0dc,
    NIKFontAwesomeIconUpload = 0xf093,
    NIKFontAwesomeIconUsd = 0xf155,
    NIKFontAwesomeIconUser = 0xf007,
    NIKFontAwesomeIconUserMd = 0xf0f0,
    NIKFontAwesomeIconUserPlus = 0xf234,
    NIKFontAwesomeIconUserSecret = 0xf21b,
    NIKFontAwesomeIconUserTimes = 0xf235,
    NIKFontAwesomeIconUsers = 0xf0c0,
    NIKFontAwesomeIconVenus = 0xf221,
    NIKFontAwesomeIconVenusDouble = 0xf226,
    NIKFontAwesomeIconVenusMars = 0xf228,
    NIKFontAwesomeIconViacoin = 0xf237,
    NIKFontAwesomeIconVideoCamera = 0xf03d,
    NIKFontAwesomeIconVimeo = 0xf27d,
    NIKFontAwesomeIconVimeoSquare = 0xf194,
    NIKFontAwesomeIconVine = 0xf1ca,
    NIKFontAwesomeIconVk = 0xf189,
    NIKFontAwesomeIconVolumeDown = 0xf027,
    NIKFontAwesomeIconVolumeOff = 0xf026,
    NIKFontAwesomeIconVolumeUp = 0xf028,
    NIKFontAwesomeIconWarning = 0xf071,
    NIKFontAwesomeIconWechat = 0xf1d7,
    NIKFontAwesomeIconWeibo = 0xf18a,
    NIKFontAwesomeIconWeixin = 0xf1d7,
    NIKFontAwesomeIconWhatsapp = 0xf232,
    NIKFontAwesomeIconWheelchair = 0xf193,
    NIKFontAwesomeIconWifi = 0xf1eb,
    NIKFontAwesomeIconWikipediaW = 0xf266,
    NIKFontAwesomeIconWindows = 0xf17a,
    NIKFontAwesomeIconWon = 0xf159,
    NIKFontAwesomeIconWordpress = 0xf19a,
    NIKFontAwesomeIconWrench = 0xf0ad,
    NIKFontAwesomeIconXing = 0xf168,
    NIKFontAwesomeIconXingSquare = 0xf169,
    NIKFontAwesomeIconYCombinator = 0xf23b,
    NIKFontAwesomeIconYCombinatorSquare = 0xf1d4,
    NIKFontAwesomeIconYahoo = 0xf19e,
    NIKFontAwesomeIconYc = 0xf23b,
    NIKFontAwesomeIconYcSquare = 0xf1d4,
    NIKFontAwesomeIconYelp = 0xf1e9,
    NIKFontAwesomeIconYen = 0xf157,
    NIKFontAwesomeIconYoutube = 0xf167,
    NIKFontAwesomeIconYoutubePlay = 0xf16a,
    NIKFontAwesomeIconYoutubeSquare = 0xf166,
};
