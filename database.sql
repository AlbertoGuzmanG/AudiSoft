-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.17 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- Volcando datos para la tabla audisoft.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.auth_permission: ~45 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add category', 1, 'add_category'),
	(2, 'Can change category', 1, 'change_category'),
	(3, 'Can delete category', 1, 'delete_category'),
	(4, 'Can add indicator', 2, 'add_indicator'),
	(5, 'Can change indicator', 2, 'change_indicator'),
	(6, 'Can delete indicator', 2, 'delete_indicator'),
	(7, 'Can add indicator category', 3, 'add_indicatorcategory'),
	(8, 'Can change indicator category', 3, 'change_indicatorcategory'),
	(9, 'Can delete indicator category', 3, 'delete_indicatorcategory'),
	(10, 'Can add indicator data', 4, 'add_indicatordata'),
	(11, 'Can change indicator data', 4, 'change_indicatordata'),
	(12, 'Can delete indicator data', 4, 'delete_indicatordata'),
	(13, 'Can add indicator type', 5, 'add_indicatortype'),
	(14, 'Can change indicator type', 5, 'change_indicatortype'),
	(15, 'Can delete indicator type', 5, 'delete_indicatortype'),
	(16, 'Can add office', 6, 'add_office'),
	(17, 'Can change office', 6, 'change_office'),
	(18, 'Can delete office', 6, 'delete_office'),
	(19, 'Can add region', 7, 'add_region'),
	(20, 'Can change region', 7, 'change_region'),
	(21, 'Can delete region', 7, 'delete_region'),
	(22, 'Can add log entry', 8, 'add_logentry'),
	(23, 'Can change log entry', 8, 'change_logentry'),
	(24, 'Can delete log entry', 8, 'delete_logentry'),
	(25, 'Can add permission', 9, 'add_permission'),
	(26, 'Can change permission', 9, 'change_permission'),
	(27, 'Can delete permission', 9, 'delete_permission'),
	(28, 'Can add group', 10, 'add_group'),
	(29, 'Can change group', 10, 'change_group'),
	(30, 'Can delete group', 10, 'delete_group'),
	(31, 'Can add user', 11, 'add_user'),
	(32, 'Can change user', 11, 'change_user'),
	(33, 'Can delete user', 11, 'delete_user'),
	(34, 'Can add content type', 12, 'add_contenttype'),
	(35, 'Can change content type', 12, 'change_contenttype'),
	(36, 'Can delete content type', 12, 'delete_contenttype'),
	(37, 'Can add session', 13, 'add_session'),
	(38, 'Can change session', 13, 'change_session'),
	(39, 'Can delete session', 13, 'delete_session'),
	(40, 'Can add category weight', 14, 'add_categoryweight'),
	(41, 'Can change category weight', 14, 'change_categoryweight'),
	(42, 'Can delete category weight', 14, 'delete_categoryweight'),
	(43, 'Can add incidence file', 15, 'add_incidencefile'),
	(44, 'Can change incidence file', 15, 'change_incidencefile'),
	(45, 'Can delete incidence file', 15, 'delete_incidencefile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.auth_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$36000$37hWAnxaEJ3y$fbN2nDUsPnKU1SZW4YIKr7wGJujCwb6V6kD4UPx/i6s=', '2017-08-08 15:46:18.239466', 1, 'ldilone', '', '', 'ldilone@gmail.com', 1, 1, '2017-08-08 15:45:59.013466'),
	(2, 'pbkdf2_sha256$36000$37hWAnxaEJ3y$fbN2nDUsPnKU1SZW4YIKr7wGJujCwb6V6kD4UPx/i6s=', '2017-09-12 13:01:39.010383', 1, 'fgabreu', '', '', 'ldilone@gmail.com', 1, 1, '2017-08-08 15:45:59.013466');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_category: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_category` DISABLE KEYS */;
INSERT INTO `dashboard_category` (`id`, `name`, `description`) VALUES
	(1, 'Categoria 1', 'Categoria 1'),
	(2, 'Categoria 2', 'Categoria 2'),
	(3, 'Categoria 3', 'Categoria 3');
/*!40000 ALTER TABLE `dashboard_category` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_categoryweight: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_categoryweight` DISABLE KEYS */;
INSERT INTO `dashboard_categoryweight` (`id`, `weight`, `category_id`, `indicator_type_id`) VALUES
	(1, 35, 1, 1),
	(2, 35, 1, 2),
	(3, 25, 2, 1),
	(4, 25, 2, 2),
	(5, 15, 3, 1),
	(6, 15, 3, 2);
/*!40000 ALTER TABLE `dashboard_categoryweight` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_incidencefile: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_incidencefile` DISABLE KEYS */;
INSERT INTO `dashboard_incidencefile` (`id`, `path`) VALUES
	(1, 'archivo 1'),
	(2, 'archivo 2'),
	(3, 'archivo 3'),
	(4, 'archivo 4');
/*!40000 ALTER TABLE `dashboard_incidencefile` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_indicator: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicator` DISABLE KEYS */;
INSERT INTO `dashboard_indicator` (`id`, `name`, `code`, `description`) VALUES
	(1, 'Indicador 1', 'Codigo 1', 'Descripcion 1'),
	(2, 'Indicador 2', 'Codigo 2', 'Descripcion 2'),
	(3, 'Indicador 3', 'Codigo 3', 'Descripcion 3'),
	(4, 'Indicador 4', 'Codigo 4', 'Descripcion 4');
/*!40000 ALTER TABLE `dashboard_indicator` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_indicatorcategory: ~44 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicatorcategory` DISABLE KEYS */;
INSERT INTO `dashboard_indicatorcategory` (`id`, `weight`, `category_id`, `indicator_id`, `indicator_type_id`) VALUES
	(1, 18, 1, 1, 1),
	(2, 18, 1, 1, 2),
	(3, 16, 1, 2, 1),
	(4, 16, 1, 2, 2),
	(5, 18, 1, 3, 1),
	(6, 18, 1, 3, 2),
	(7, 16, 1, 4, 1),
	(8, 16, 1, 4, 2);
/*!40000 ALTER TABLE `dashboard_indicatorcategory` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_indicatordata: ~626 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicatordata` DISABLE KEYS */;
INSERT INTO `dashboard_indicatordata` (`id`, `load_date`, `amount`, `indicator_id`, `indicator_type_id`, `office_id`, `attached_file_id`) VALUES
	(1, '2017-09-12', 2508648.13, 1, 1, 10, 1),
	(2, '2017-09-12', 2980512.69, 2, 1, 11, 1),
	(3, '2017-09-12', 985310.33, 3, 1, 12, 1);
/*!40000 ALTER TABLE `dashboard_indicatordata` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_indicatortype: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicatortype` DISABLE KEYS */;
INSERT INTO `dashboard_indicatortype` (`id`, `name`) VALUES
	(1, 'Monto'),
	(2, 'Cantidad');
/*!40000 ALTER TABLE `dashboard_indicatortype` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_office: ~243 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_office` DISABLE KEYS */;
INSERT INTO `dashboard_office` (`id`, `code`, `name`, `address`, `region_id`, `schedule`, `location`, `office_type`) VALUES
	(1, '10', 'Isabel La Catolica', 'Calle Isabel la Catolica Num. 201', 1, 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', '18.47590637,-69.88370514', 'SUC'),
	(2, '11', 'Independencia', 'Ave. Independencia Num. 1553', 2, 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', '18.45135117,-69.92741394', 'SUC'),
	(3, '12', 'Aeropuerto', 'Aeropuerto Internacional de Las Americas', 4, 'De Lunes a Viernes de 9:00a.m. a 5:00 p.m.', '18.43040848,-69.67666626', 'SUC'),
	(4, '13', 'Maximo Gomez', 'Ave. M?ximo Gomez Num. 4', 2, 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', '18.46081924,-69.90814972', 'SUC'),
	(5, '15', 'Padre Castellanos', 'Ave. Padre Castellanos Num. 92', 1, 'De Lunes a Viernes de 8:00 a.m. a 4:00 p.m.', '18.50119209,-69.88825226', 'SUC'),
	(6, '16', 'Los Mina', 'Ave. Presidente Estrella Urena Num. 163', 4, 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', '18.50593185,-69.86586761', 'SUC'),
	(7, '17', 'Las Americas', 'Respaldo Las Americas Num. 5, Ensanche Las America', 4, 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', '18.48479843,-69.87244415', 'SUC'),
	(8, '20', 'Ave. Mella', 'Ave. Mella Num. 407', 1, 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', '18.47592735,-69.88967896', 'SUC'),
	(9, '21', 'Ave. Duarte', 'Ave. Duarte Num. 38', 1, 'De Lunes a Viernes de 8:00 a.m. a 4:00 p.m.', '18.50120735,-69.90534973', 'SUC');
/*!40000 ALTER TABLE `dashboard_office` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.dashboard_region: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_region` DISABLE KEYS */;
INSERT INTO `dashboard_region` (`id`, `name`, `map_id`, `area`) VALUES
	(1, 'METROPOLITANA NORTE', '', '[[-69.94937257789772,18.526892255083364],[-69.9552178382764,18.54461685446304],[-69.97673761201473,18.55482214506744],[-69.99770557204168,18.57732279787232],[-70.0068532119378,18.608489646110517],[-70.02314223309409,18.62003193304801],[-70.029977543069,18.617232245858247],[-70.05180766806753,18.62081392757606],[-70.0672628780259,18.68281491111093],[-70.10760610011808,18.67792385511359],[-70.14953625028382,18.739092792950117],[-70.16709496972724,18.740415251612387],[-70.18136480107489,18.75668431295111],[-70.20235684040443,18.76652234573803],[-70.21800808456099,18.775855752561665],[-70.24365175651873,18.81504310286197],[-70.24104375518944,18.83955820641437],[-70.20529578542947,18.86349368270042],[-70.17839558350812,18.859964352507575],[-70.13781342199724,18.857812181880217],[-70.08265140917044,18.895480076378522],[-70.05061630877005,18.885971441878095],[-70.03464044757004,18.89020559154726],[-70.03281578264152,18.904734844736673],[-70.01739340877927,18.90750987502959],[-69.98979126232955,18.885439377017942],[-69.97484160391922,18.88425340511918],[-69.94651058421469,18.905139389468392],[-69.92229320531794,18.972890944352123],[-69.92378578987837,18.981946619412287],[-69.93361989298396,18.994951808276994],[-69.92802163251349,19.010726306840027],[-69.90948156136338,19.040169221430645],[-69.88637885750055,19.040801808287377],[-69.86568149744349,19.04517135635984],[-69.87208736872154,19.063866253864283],[-69.87024797227963,19.084770273263107],[-69.8194445160888,19.08072270937522],[-69.79931829710561,19.076582878233683],[-69.78630317500581,19.0917438929791],[-69.75015894799489,19.09355067168081],[-69.72084983757412,19.084028753624523],[-69.7034826583939,19.060098217180833],[-69.70098889073071,19.043041537105804],[-69.6648871154439,19.01134576843597],[-69.62826903513971,18.98736639409703],[-69.58651679157161,18.988064316476912],[-69.51312349120683,18.934828264059828],[-69.43386954391262,18.880498984044007],[-69.36958020914433,18.887401656695204],[-69.37726961281317,18.875834908975023],[-69.46067847554879,18.82614439762766],[-69.48597279520685,18.802594824023316],[-69.53828207797068,18.74453509409227],[-69.54998402889122,18.69121305946016],[-69.56403529893942,18.662112057737474],[-69.59125090490915,18.654503734077064],[-69.6296317756112,18.667638213094552],[-69.64667030932432,18.648952635718356],[-69.68063851444177,18.636154380315432],[-69.69244827006506,18.637434912344492],[-69.70671367773733,18.627891860193664],[-69.72134213920104,18.631985298719677],[-69.7527290295405,18.618443545032346],[-69.76535977806473,18.596880512648347],[-69.78274538237535,18.58588168274845],[-69.79217490771937,18.583061620149635],[-69.79952786684042,18.57113929721795],[-69.85659558026305,18.558554217474878],[-69.89658706820481,18.52295175073567],[-69.8963082369068,18.516162830179255],[-69.87674416052155,18.504913406288665],[-69.87599133381896,18.496757583943285],[-69.88391871166762,18.491999057428856],[-69.88351830079027,18.47860046708982],[-69.87841446208898,18.469082281852554],[-69.8860812434123,18.470260246713966],[-69.89108154118733,18.467247793536853],[-69.89159381131552,18.47370196320479],[-69.90096530036094,18.48257564406835],[-69.91481320531248,18.483770812949057],[-69.91464989640215,18.51053271541958],[-69.94937257789772,18.526892255083364]]'),
	(2, 'METROPOLITANA CENTRAL	\r\n', '', '[[-69.92367981802747,18.447106651686255],[-69.94099843010278,18.470946005208802],[-69.94107987228195,18.474995078923442],[-69.94518021427685,18.482623783499402],[-69.94531998623697,18.487618004666768],[-69.94820412271753,18.495210989512337],[-69.94596980482147,18.49950813920476],[-69.94190756879372,18.50244866019303],[-69.94370512585957,18.508344853463562],[-69.9550839308503,18.51643044280942],[-69.9505094256796,18.520208835359252],[-69.94423073099378,18.522505788024663],[-69.91636423352779,18.507192450276364],[-69.91823383516629,18.5017332751713],[-69.91560819640611,18.480299409229396],[-69.90282888998644,18.48086593350876],[-69.89335753755743,18.472750492274123],[-69.89275755836063,18.465007760460306],[-69.92061501812975,18.45295075311598],[-69.92367981802747,18.447106651686255]]'),
	(3, 'METROPOLITANA OESTE	\r\n', '', '[[-69.9998486194127,18.4259680950038],[-70.00924087148051,18.45929831041422],[-70.01645218819071,18.472290070326864],[-70.0264794253957,18.460703565626375],[-70.036944930724,18.463224779676985],[-70.13582814156875,18.561829916882274],[-70.14448914541917,18.57471731895735],[-70.14833948182017,18.609589730517904],[-70.15555021539431,18.62676654868872],[-70.13676446323404,18.627808476960098],[-70.14551434640292,18.646174814479785],[-70.1558463102757,18.645637295659576],[-70.16107889072732,18.64121891404528],[-70.18385898131069,18.65851257268993],[-70.19907589850409,18.678134014224355],[-70.17369080888017,18.71310578740709],[-70.1758326560461,18.721240015280276],[-70.1672035277601,18.729309789424594],[-70.15515185822194,18.734288466991035],[-70.13658240143643,18.714124459135093],[-70.11520190662134,18.678718818340798],[-70.09357978255646,18.670896213507255],[-70.07149128277514,18.67533922412027],[-70.06502644275686,18.6598689588635],[-70.05385611504204,18.620946108417197],[-70.03314399422545,18.611012420532884],[-70.02377933783987,18.617118928402668],[-70.01126656397228,18.607348277420687],[-70.00431372821167,18.57728524833802],[-69.97802114200083,18.54974282854886],[-69.95926544419666,18.543752622433935],[-69.95207057861019,18.522253363862944],[-69.95779806156062,18.5155569152304],[-69.9468670722399,18.50790555738644],[-69.94707889228211,18.502138243974752],[-69.95120307003549,18.49556542933051],[-69.94374395839093,18.469868217532877],[-69.9255148184119,18.4465990329051],[-69.94459644799747,18.4352772095083],[-69.97545063560122,18.427979093720232],[-69.98241397468384,18.428560492072297],[-69.99343155765523,18.422386203332177],[-69.9998486194127,18.4259680950038]]'),
	(4, 'METROPOLITANA ORIENTAL    	\r\n', '', '[[-69.8747953634071,18.468242595953132],[-69.87866826045826,18.47786783693158],[-69.88080924091534,18.490282787336337],[-69.87297244530848,18.494546949096403],[-69.87222980112006,18.50480344228633],[-69.89609868486531,18.521158823967735],[-69.8588836432141,18.553951784318286],[-69.79834290923215,18.56924988408807],[-69.787627609259,18.577817088541472],[-69.7656440113061,18.587925066651387],[-69.75420082550372,18.592510557001052],[-69.74789316664133,18.60684852158031],[-69.7409103895174,18.623124535939418],[-69.72018406507287,18.62948029724069],[-69.7076996702432,18.626023672398915],[-69.69084988106495,18.634383123019052],[-69.68088391217208,18.633097162968014],[-69.6448734033288,18.645615122132536],[-69.62943739706326,18.66409046857859],[-69.58090163484138,18.64801540713096],[-69.59719779336159,18.62531499871194],[-69.59535776634168,18.608672321321215],[-69.58211465444035,18.613861033861163],[-69.59308765447383,18.589732790872972],[-69.57824995786706,18.581750756858458],[-69.60740696854138,18.535787692087972],[-69.62173574348763,18.519890542848565],[-69.60746840880732,18.51102252353373],[-69.59858966548765,18.49046467480205],[-69.56675771747409,18.46987205121544],[-69.52294293143396,18.464733585791404],[-69.5319220723953,18.44062524562167],[-69.53077482491679,18.408419116941143],[-69.5454299633388,18.408616183955573],[-69.55780655304324,18.42062586018273],[-69.56993999258316,18.436785297728004],[-69.59368804279389,18.44901678086228],[-69.62355583691254,18.45050311053032],[-69.6348325169836,18.4394982382484],[-69.62870134152394,18.409117870279903],[-69.63379743549089,18.40346029201061],[-69.64616961509563,18.408227221583022],[-69.66262973577838,18.40868206087161],[-69.67168994460842,18.41753832101559],[-69.67561710776957,18.42773247093323],[-69.68151695901993,18.454736671220875],[-69.71330520290753,18.4564582273898],[-69.75465161735303,18.46916157802234],[-69.8129846542529,18.46845336038177],[-69.83467354228272,18.473311791164384],[-69.8747953634071,18.468242595953132]]'),
	(5, 'ZONA ESTE	\r\n', '', NULL),
	(6, 'ZONA SANTIAGO ESTE   	\r\n', '', '[[-70.59828529178878,19.40118851757625],[-70.65987393171083,19.426449173710644],[-70.70418102932976,19.465314403428657],[-70.72494829358303,19.49729879120749],[-70.81110886058208,19.54407916256621],[-70.8838614545944,19.647199613033244],[-70.83585987336326,19.633875741257445],[-70.81641860463843,19.621816619458475],[-70.81019278941507,19.630069266016243],[-70.77490710614639,19.59674390861978],[-70.75985666180968,19.594580780283607],[-70.74714734273023,19.574756780305307],[-70.73097011945161,19.581499005796793],[-70.7208865430472,19.580363576539323],[-70.69973386981293,19.60272712154908],[-70.70908623206931,19.64733176707379],[-70.67686579965637,19.627869342672675],[-70.6621181616187,19.628184845457778],[-70.6403394098199,19.615325242166787],[-70.64440896619418,19.55698173603693],[-70.63442184520815,19.543087338802952],[-70.57586868097418,19.525932053022903],[-70.55190190228852,19.513525672486306],[-70.55126365293357,19.50086137403423],[-70.58600711595359,19.47768288903408],[-70.59582212560235,19.431285512788854],[-70.59828529178878,19.40118851757625]]'),
	(7, 'ZONA SANTIAGO OESTE   	\r\n', '', NULL),
	(8, 'ZONA NORCENTRAL  	\r\n', '', NULL),
	(9, 'ZONA NORDESTE  	\r\n', '', NULL),
	(10, 'ZONA NOROESTE  	\r\n', '', NULL),
	(11, 'ZONA SURESTE	\r\n', '', NULL),
	(12, 'SUR', '', NULL);
/*!40000 ALTER TABLE `dashboard_region` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.django_content_type: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(8, 'admin', 'logentry'),
	(10, 'auth', 'group'),
	(9, 'auth', 'permission'),
	(11, 'auth', 'user'),
	(12, 'contenttypes', 'contenttype'),
	(1, 'dashboard', 'category'),
	(14, 'dashboard', 'categoryweight'),
	(15, 'dashboard', 'incidencefile'),
	(2, 'dashboard', 'indicator'),
	(3, 'dashboard', 'indicatorcategory'),
	(4, 'dashboard', 'indicatordata'),
	(5, 'dashboard', 'indicatortype'),
	(6, 'dashboard', 'office'),
	(7, 'dashboard', 'region'),
	(13, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.django_migrations: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2017-08-01 18:47:54.626192'),
	(2, 'auth', '0001_initial', '2017-08-01 18:47:59.151642'),
	(3, 'admin', '0001_initial', '2017-08-01 18:48:00.074140'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2017-08-01 18:48:00.110352'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2017-08-01 18:48:00.828182'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2017-08-01 18:48:01.249517'),
	(7, 'auth', '0003_alter_user_email_max_length', '2017-08-01 18:48:01.639642'),
	(8, 'auth', '0004_alter_user_username_opts', '2017-08-01 18:48:01.686457'),
	(9, 'auth', '0005_alter_user_last_login_null', '2017-08-01 18:48:02.107792'),
	(10, 'auth', '0006_require_contenttypes_0002', '2017-08-01 18:48:02.139002'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2017-08-01 18:48:02.170212'),
	(12, 'auth', '0008_alter_user_username_max_length', '2017-08-01 18:48:02.560337'),
	(13, 'dashboard', '0001_initial', '2017-08-01 18:48:07.183419'),
	(14, 'sessions', '0001_initial', '2017-08-01 18:48:07.511124'),
	(15, 'dashboard', '0002_auto_20170801_1454', '2017-08-01 18:54:14.151303'),
	(16, 'dashboard', '0003_categoryweight', '2017-08-22 12:12:53.016753'),
	(17, 'dashboard', '0004_indicatorcategory_indicator_type', '2017-08-22 13:16:25.715749'),
	(18, 'dashboard', '0005_auto_20170822_1718', '2017-08-22 21:18:42.741335'),
	(19, 'dashboard', '0006_auto_20170830_1328', '2017-08-30 17:28:27.725891'),
	(20, 'dashboard', '0002_incidencefile_name', '2017-09-12 18:24:38.027658'),
	(21, 'dashboard', '0003_remove_indicatordata_attached_file', '2017-09-12 18:34:10.283091'),
	(22, 'dashboard', '0004_auto_20170912_1657', '2017-09-12 20:58:25.325604');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.django_session: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('5yfjwf2dtavafsycdr4wdwtwkq6pitla', 'ZTJhNjQ5YzVmZjVlZjI5MDU3NmFhZThlODQ5MjMwZWFmN2JkYjg1Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGFzaGJvYXJkLm1vZGVscy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YzEwMjEzNzE2ODNkM2UwYjU0OTM3NjFlZmU1MjNhZWU5ZDdmYzExIn0=', '2017-09-26 13:01:39.121383'),
	('pq4fwlkef06kcfww6q1ht2dnbp819n15', 'NzgwMDQzYTcyZjFjNmEyNGI5ZjJkZTE4MjFiODVhYTUxYmYxNDhmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YzEwMjEzNzE2ODNkM2UwYjU0OTM3NjFlZmU1MjNhZWU5ZDdmYzExIn0=', '2017-08-22 15:46:18.311466');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando datos para la tabla audisoft.offices_file: ~243 rows (aproximadamente)
/*!40000 ALTER TABLE `offices_file` DISABLE KEYS */;
INSERT INTO `offices_file` (`id`, `code`, `name`, `address`, `lat`, `long`, `schedule`, `type`, `office_point`, `region_id`) VALUES
	(1, '10', 'Isabel La Catolica', 'Calle Isabel la Catolica Num. 201', '18.47590637', '-69.88370514', 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', 'SUC', _binary 0x000000000101000000AB1BF7FFD4793240DBE600A08E7851C0, 1),
	(2, '11', 'Independencia', 'Ave. Independencia Num. 1553', '18.45135117', '-69.92741394', 'De Lunes a Viernes de 8:00 a.m. a 5:00 p.m., S?bados de 9:00 a.m. a 1:00 p.m.', 'SUC', _binary 0x0000000001010000004D2912C08B733240E389FFBF5A7B51C0, 2),
	(3, '12', 'Aeropuerto', 'Aeropuerto Internacional de Las Americas', '18.43040848', '-69.67666626', 'De Lunes a Viernes de 9:00a.m. a 5:00 p.m.', 'SUC', _binary 0x000000000101000000658509402F6E32406D4000804E6B51C0, 4);
/*!40000 ALTER TABLE `offices_file` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
