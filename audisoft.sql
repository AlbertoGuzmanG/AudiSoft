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

-- Volcando estructura de base de datos para audisoft
CREATE DATABASE IF NOT EXISTS `audisoft` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `audisoft`;


-- Volcando estructura para tabla audisoft.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.auth_permission: ~39 rows (aproximadamente)
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
	(39, 'Can delete session', 13, 'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.auth_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_category
CREATE TABLE IF NOT EXISTS `dashboard_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_category: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_category` DISABLE KEYS */;
INSERT INTO `dashboard_category` (`id`, `name`) VALUES
	(1, 'Tarjetas'),
	(2, 'Prestamos');
/*!40000 ALTER TABLE `dashboard_category` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_indicator
CREATE TABLE IF NOT EXISTS `dashboard_indicator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_indicator: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicator` DISABLE KEYS */;
INSERT INTO `dashboard_indicator` (`id`, `name`) VALUES
	(1, 'Indicador 1'),
	(2, 'Indicador 2'),
	(3, 'Indicador 3'),
	(4, 'Indicador 4'),
	(5, 'Indicador 5');
/*!40000 ALTER TABLE `dashboard_indicator` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_indicatorcategory
CREATE TABLE IF NOT EXISTS `dashboard_indicatorcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_indicatorc_category_id_5418b774_fk_dashboard` (`category_id`),
  KEY `dashboard_indicatorc_indicator_id_d575cd6e_fk_dashboard` (`indicator_id`),
  KEY `dashboard_indicatorc_region_id_3628686c_fk_dashboard` (`region_id`),
  CONSTRAINT `dashboard_indicatorc_category_id_5418b774_fk_dashboard` FOREIGN KEY (`category_id`) REFERENCES `dashboard_category` (`id`),
  CONSTRAINT `dashboard_indicatorc_indicator_id_d575cd6e_fk_dashboard` FOREIGN KEY (`indicator_id`) REFERENCES `dashboard_indicator` (`id`),
  CONSTRAINT `dashboard_indicatorc_region_id_3628686c_fk_dashboard` FOREIGN KEY (`region_id`) REFERENCES `dashboard_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_indicatorcategory: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicatorcategory` DISABLE KEYS */;
INSERT INTO `dashboard_indicatorcategory` (`id`, `weight`, `category_id`, `indicator_id`, `region_id`) VALUES
	(1, 20, 1, 1, 1),
	(2, 80, 2, 2, 1);
/*!40000 ALTER TABLE `dashboard_indicatorcategory` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_indicatordata
CREATE TABLE IF NOT EXISTS `dashboard_indicatordata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `load_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `indicator_type_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_indicatord_indicator_id_676825a1_fk_dashboard` (`indicator_id`),
  KEY `dashboard_indicatord_indicator_type_id_358e8de3_fk_dashboard` (`indicator_type_id`),
  KEY `dashboard_indicatord_office_id_647b3183_fk_dashboard` (`office_id`),
  CONSTRAINT `dashboard_indicatord_indicator_id_676825a1_fk_dashboard` FOREIGN KEY (`indicator_id`) REFERENCES `dashboard_indicator` (`id`),
  CONSTRAINT `dashboard_indicatord_indicator_type_id_358e8de3_fk_dashboard` FOREIGN KEY (`indicator_type_id`) REFERENCES `dashboard_indicatortype` (`id`),
  CONSTRAINT `dashboard_indicatord_office_id_647b3183_fk_dashboard` FOREIGN KEY (`office_id`) REFERENCES `dashboard_office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_indicatordata: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicatordata` DISABLE KEYS */;
INSERT INTO `dashboard_indicatordata` (`id`, `load_date`, `amount`, `indicator_id`, `indicator_type_id`, `office_id`) VALUES
	(1, '2017-01-03', 100.00, 1, 1, 98),
	(3, '2017-02-02', 200.00, 1, 1, 100),
	(4, '2017-04-02', 300.00, 1, 1, 100),
	(7, '2017-08-02', 123.00, 1, 1, 100),
	(8, '2017-02-02', 321.00, 2, 1, 98),
	(9, '2017-03-02', 200.00, 1, 1, 98),
	(10, '2017-04-02', 300.00, 1, 1, 98),
	(11, '2017-07-02', 200.00, 1, 1, 98),
	(12, '2017-06-02', 245.00, 1, 1, 98),
	(13, '2017-10-02', 12.00, 1, 1, 98),
	(14, '2017-05-12', 300.00, 1, 1, 100),
	(15, '2017-05-12', 300.00, 1, 1, 98),
	(17, '2017-02-02', 342.00, 3, 1, 120),
	(18, '2017-04-02', 50.00, 3, 1, 120),
	(19, '2017-04-02', 589.00, 4, 1, 120),
	(20, '2017-04-02', 222.00, 5, 1, 120);
/*!40000 ALTER TABLE `dashboard_indicatordata` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_indicatortype
CREATE TABLE IF NOT EXISTS `dashboard_indicatortype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_indicatortype: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_indicatortype` DISABLE KEYS */;
INSERT INTO `dashboard_indicatortype` (`id`, `name`) VALUES
	(1, 'type 1'),
	(2, 'type 2');
/*!40000 ALTER TABLE `dashboard_indicatortype` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_office
CREATE TABLE IF NOT EXISTS `dashboard_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `location` point DEFAULT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_office_region_id_7ad2a88c_fk_dashboard_region_id` (`region_id`),
  CONSTRAINT `dashboard_office_region_id_7ad2a88c_fk_dashboard_region_id` FOREIGN KEY (`region_id`) REFERENCES `dashboard_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_office: ~121 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_office` DISABLE KEYS */;
INSERT INTO `dashboard_office` (`id`, `code`, `name`, `address`, `location`, `region_id`) VALUES
	(1, 'CC457', 'Centro de Caja 27 de Febrero', 'Ave. 27 de Febrero No. 217 (contiguo a la Oficina ', _binary 0x0000000001010000009D8902E00C7B51C04EFAEF7F4F783240, 1),
	(2, '333', 'UNP UASD', 'Ave. Alma Mater, Edificio Economato UASD', _binary 0x0000000001010000007622FBFFBC7A51C02D13F2FFB2753240, 1),
	(3, '160', 'Ave. Tiradentes', 'Ave. Tiradentes, Edificio La Cumbre, Plaza Naco', _binary 0x00000000010100000071720160637B51C03DA009A05A7A3240, 2),
	(4, '164', 'Dirección Gral. Tránsito Terrestre', 'Ave. Tiradentes Esq. Ave. San Cristóbal', _binary 0x000000000101000000596DFE5F757B51C04923F29F667D3240, 2),
	(5, '165', 'Plaza Florida', 'Ave. Bolívar Núm. 302, esq. Armando Rodriguez ', _binary 0x0000000001010000006376FD1F337B51C0AF390F40CD763240, 1),
	(6, '166', 'Plaza Botánika', 'Ave. Camino Chiquito esq. Andulleros ', _binary 0x000000000101000000003FFC5F627C51C03FEE1120F9803240, 1),
	(7, '167', 'Lope de Vega ', 'Ave. Lope de Vega esq. Gustavo Mejía Ricart', _binary 0x000000000101000000290C04E0A37B51C0EC2CFEDFA6793240, 1),
	(8, '169', 'Plaza Haché', 'Ave. John F. Kennedy  esq. Dr. Luis Lembert', _binary 0x000000000101000000760A03E0297B51C0985B10806E7B3240, 1),
	(9, '240', 'Torre', 'Ave. Winston Churchill esq. Porfirio Herrera', _binary 0x0000000001010000000CAEFBBF117C51C083610A20C6773240, 1),
	(10, '241', 'Plaza Central', 'Ave. Winston Churchill  esq. Ave. 27 de Febrero', _binary 0x000000000101000000B5CD0140DD7B51C02E52EE5FD5763240, 1),
	(11, '261', 'UNP SuperMercado  Nacional 27 de Febrero', 'Ave. 27 de Febrero esq. Abraham Lincoln, Supermerc', _binary 0x000000000101000000ACADD85F767B51C0B9C4910722773240, 1),
	(12, '330', 'Malecon Center', 'Ave. George Washington casi esq. Ave. Máximo Gómez', _binary 0x00000000010100000053D5FCDF2E7A51C07E86FDBF66753240, 1),
	(13, '530', 'Diamond Plaza', 'Ave. Los Próceres esq. Euclides Morillo, Arroyo Ho', _binary 0x00000000010100000039EC00804A7C51C0D75D0B40C47C3240, 1),
	(14, '580', 'Ave. 27 de Febrero', 'Ave. 27 de Febrero Núm.  217', _binary 0x00000000010100000039EC00800A7B51C0787003805B783240, 1),
	(15, '610', 'UNP La Cancillería', 'Ave. G. Washington esq. Indep., edif. Secretaría  ', _binary 0x00000000010100000059DAA9B9DC7A51C0B05758703F743240, 1),
	(16, '810', 'Blue Mall', 'Av. Winston Churchill esq. Av. Gustavo Mejía Ricar', _binary 0x000000000101000000FDF402603A7C51C02E3AF63F02793240, 1),
	(17, '820', 'Agora Mall', 'Ave. John F. Kennedy esq. Abraham Lincoln, Ens. Se', _binary 0x000000000101000000FCCDFE1F2B7C51C0E9F6ED7FDB7B3240, 1),
	(18, '830', 'Gazcue', 'Ave. Independencia esq. Pdte Vicini Burgos, Gazcue', _binary 0x0000000001010000003CF7FD1F507951C01B3B136079773240, 1),
	(19, '840', 'Galeria 360', 'Ave. John F. Kennedy, Km. 5½, Arroyo Hondo, Distri', _binary 0x0000000001010000001678FE1FED7B51C02963F85F197C3240, 1),
	(20, '890', 'UNP Multicentro Jose Contreras', 'Av. Jose Contreras casi esq. Alma Mater, Zona Univ', _binary 0x0000000001010000008C820100D77A51C0A9231500C2763240, 1),
	(21, '011', 'Independencia', 'Ave. Independencia Núm. 1553', _binary 0x000000000101000000E389FFBF5A7B51C04D2912C08B733240, 1),
	(22, '013', 'Máximo Gómez', 'Ave. Máximo Gómez Núm. 4', _binary 0x00000000010100000061D100201F7A51C0E62AED3FF8753240, 1),
	(23, 'PBG01', 'PBG EL HUACAL SANTO DOMINGO (PBG01)', 'Avenida México esq. Leopoldo Navarro, en el Huacal', _binary 0x000000000101000000D0B6FD9F017A51C081D0F6BF8E793240, 1),
	(24, 'PBG05', 'PBG Jurisdicción Inmobiliaria Santo Domingo (PBG05', 'Avenida Jiménez Moya esq. Avenida Independencia', _binary 0x000000000101000000D58DFB7F6A7B51C08850002082733240, 1),
	(25, 'PBG06', 'PBG Migración (PBG06)', 'Avenida George Washington esq. Héroes de Luperón', _binary 0x000000000101000000D859FCBF4D7B51C09E85F35FD6713240, 1),
	(26, 'PBG08', 'PBG MInisterio de Educación (PBG08)', 'Avenida Máximo Gómez esq. A. Fiallo Cabral', _binary 0x000000000101000000747DFEFF287A51C078AFFFDF7D763240, 1),
	(27, 'PBG09', 'PBG MInisterio de Salud Pública (PBG09)', 'Avenida Tiradentes esq. Héctor Hernández Vargas', _binary 0x0000000001010000000B3003008D7B51C049360D40597D3240, 1),
	(28, 'PBG10', 'PBG Palacio de la Policía Nacional (PBG10)', 've. Leopoldo Navarro esq. México', _binary 0x0000000001010000003F02FBBF157A51C07806F45F73793240, 1),
	(29, '342', 'UNP Nacional Tiradentes', 'Supermercado Nacional Tiradentes, Av. Tiradentes e', _binary 0x000000000101000000AD84EE92387B51C01EC539EAE8783240, 1),
	(30, 'CC882', 'Centro de Caja Villa Mella', 'Ave. Charles de Gaulle esq. Ave. Hermanas Mirabal', _binary 0x0000000001010000005C39FF9F987951C0CBC707A0C58B3240, 1),
	(31, 'CC894', 'Centro de Caja México', 'Ave. Mexico esq. Enriquillo', _binary 0x0000000001010000007A17EFC7ED7851C0B48EAA26887A3240, 1),
	(32, '262', 'UNP El Metro', 'Estacion Juan Pablo Duarte, Metro Santo Domingo, A', _binary 0x000000000101000000CED204408B7A51C045D9F89F3E7B3240, 1),
	(33, '263', 'UNP Plaza Lama Gómez (ovando)', 'Ave. Maximo Gomez esq. Nicolas de Ovando', _binary 0x000000000101000000224DFE1F8E7A51C0B219F91F0D803240, 1),
	(34, '670', 'Hermanas Mirabal', 'Ave. Hermanas Mirabal esq. Calle Santa Cruz, Plaza', _binary 0x000000000101000000FA67FE7FB97A51C0A2A30BA0CE853240, 1),
	(35, '690', 'Villa Francisca', 'Calle Duarte esq. Caracas, Villa Francisca', _binary 0x000000000101000000D7B4FFBFF97851C00DD5FFFF207B3240, 1),
	(36, '870', 'Sambil', 'Av. John F. Kennedy esq. Paseo de los Aviadores, V', _binary 0x0000000001010000003D1E02605F7A51C088E6F0FF997B3240, 1),
	(37, '920', 'Buena Vista II', 'Avenida Hermanas Mirabal, Plaza Buena Vista II, Sa', _binary 0x0000000001010000006A3503E0087A51C06EA6002040883240, 1),
	(38, '010', 'Isabel La Católica', 'Calle Isabel la Católica Núm. 201', _binary 0x000000000101000000DBE600A08E7851C0AB1BF7FFD4793240, 1),
	(39, '015', 'Padre Castellanos', 'Ave. Padre Castellanos Núm. 92', _binary 0x00000000010100000014D30120D97851C05B90F31F4E803240, 1),
	(40, '020', 'Ave. Mella', 'Ave. Mella Núm.  407', _binary 0x000000000101000000EA480580F07851C09E85F35FD6793240, 1),
	(41, '021', 'Ave. Duarte ', 'Ave. Duarte Núm.  38', _binary 0x000000000101000000B772FE3FF17951C0CCC3F81F4F803240, 1),
	(42, '022', 'Eusebio Manzueta', 'Calle Eusebio Manzueta Núm. 143', _binary 0x0000000001010000006EA60020C07951C06CC207C0897C3240, 1),
	(43, '023', 'Ave. México', 'Ave. México casi esq. Enriquillo', _binary 0x0000000001010000004866FD7FFF7851C09748F5DF7B7A3240, 1),
	(44, '030', 'Ave. San Martín', 'Ave. San Martín Núm. 139', _binary 0x000000000101000000C17BFDFF2E7A51C09171F7FF927B3240, 1),
	(45, '031', 'Nicolás de Ovando', 'Ave. Nicolás de Ovando Núm. 36', _binary 0x000000000101000000D3A90220747A51C0D8451320F17F3240, 1),
	(46, '032', 'Monte Plata ', 'Calle Altagracia Núm. 49', _binary 0x0000000001010000001412FE7F3B7251C063A110E078CF3240, 1),
	(47, '033', 'Villa Mella', 'Ave. Charles de Gaulle esq. Ave. Hermanas Mirabal', _binary 0x000000000101000000787003809B7951C008FAF29FC18B3240, 1),
	(48, '332', 'Yamasá', 'Calle Eusebio Manzueta No. 88, Yamasá, Monte Plata', _binary 0x00000000010100000097E315889E8151C01C45D61A4AC53240, 1),
	(49, '343', 'UNP Sabana Grande de Boyá', 'Calle Enriquillo No. 27, Plaza Hermanos Ferreira, ', _binary 0x00000000010100000036936FB6B97251C0D591239D81F13240, 1),
	(50, 'PBG07', 'PBG Ministerio de Defensa (PBG07)', 'Avenida 27 de Febrero esq. Avenida Luperón, dentro', _binary 0x000000000101000000704BFD1F547E51C05A2AF37FDC723240, 1),
	(51, 'CC456', 'Centro de Caja  Sarasota', 'Ave. Sarasota No. 102 (contiguo a la Oficina Saras', _binary 0x00000000010100000062F80460AE7C51C0F57808807D733240, 1),
	(52, '337', 'UNP Jumbo Luperón', 'Ave. Luperón esq. Gustavo Mejia Ricart, Las Prader', _binary 0x000000000101000000D3A90220F47D51C040EA02A082763240, 1),
	(53, '334', 'Oficina Pantoja', 'Ave. Isabela esquina Constantino Golonoto, Plaza L', _binary 0x00000000010100000028D36872318051C0220038F6EC853240, 1),
	(54, '336', 'UNP Plaza Luperón', 'Av. Independencia, Km. 12, esq. Av. Luperón, Centr', _binary 0x0000000001010000003F02FBBF557F51C097C6ED9FC06D3240, 1),
	(55, '162', 'Caonabo', 'Ave. 27 de Febrero esq. Caonabo', _binary 0x0000000001010000001285F99FFA7D51C054D1ED5F38733240, 1),
	(56, '163', 'Herrera', 'Ave. Isabel Aguiar Núm. 199', _binary 0x000000000101000000143DF031587E51C092921E8656773240, 1),
	(57, '168', 'John F. Kennedy', 'Ave. John F. Kennedy casi esq. Ave. Núñez de Cácer', _binary 0x000000000101000000D11CFE3FB37D51C06CD6F05FE67A3240, 1),
	(58, '242', 'Multicentro Churchill', 'Ave. Winston Churchill esq. Gustavo Mejía Ricart', _binary 0x000000000101000000ADA8FBDF557C51C01DB5FC9F47793240, 1),
	(59, '243', 'Residencial José Contreras (atalaya del mar)', 'Ave. Independencia, Km.10½ Carret. Sánchez', _binary 0x000000000101000000A62C0100997E51C001A90B800A6E3240, 1),
	(60, '244', 'Los Alcarrizos', 'Calle Duarte Núm. 183, Los Alcarrizos', _binary 0x000000000101000000787B1002F28151C069FCC22B49863240, 1),
	(61, 'CC457', 'Centro de Caja 27 de Febrero', 'Ave. 27 de Febrero No. 217 (contiguo a la Oficina ', _binary 0x0000000001010000009D8902E00C7B51C04EFAEF7F4F783240, 1),
	(62, '333', 'UNP UASD', 'Ave. Alma Mater, Edificio Economato UASD', _binary 0x0000000001010000007622FBFFBC7A51C02D13F2FFB2753240, 1),
	(63, '160', 'Ave. Tiradentes', 'Ave. Tiradentes, Edificio La Cumbre, Plaza Naco', _binary 0x00000000010100000071720160637B51C03DA009A05A7A3240, 2),
	(64, '164', 'Dirección Gral. Tránsito Terrestre', 'Ave. Tiradentes Esq. Ave. San Cristóbal', _binary 0x000000000101000000596DFE5F757B51C04923F29F667D3240, 2),
	(65, '165', 'Plaza Florida', 'Ave. Bolívar Núm. 302, esq. Armando Rodriguez ', _binary 0x0000000001010000006376FD1F337B51C0AF390F40CD763240, 1),
	(66, '166', 'Plaza Botánika', 'Ave. Camino Chiquito esq. Andulleros ', _binary 0x000000000101000000003FFC5F627C51C03FEE1120F9803240, 1),
	(67, '167', 'Lope de Vega ', 'Ave. Lope de Vega esq. Gustavo Mejía Ricart', _binary 0x000000000101000000290C04E0A37B51C0EC2CFEDFA6793240, 1),
	(68, '169', 'Plaza Haché', 'Ave. John F. Kennedy  esq. Dr. Luis Lembert', _binary 0x000000000101000000760A03E0297B51C0985B10806E7B3240, 1),
	(69, '240', 'Torre', 'Ave. Winston Churchill esq. Porfirio Herrera', _binary 0x0000000001010000000CAEFBBF117C51C083610A20C6773240, 1),
	(70, '241', 'Plaza Central', 'Ave. Winston Churchill  esq. Ave. 27 de Febrero', _binary 0x000000000101000000B5CD0140DD7B51C02E52EE5FD5763240, 1),
	(71, '261', 'UNP SuperMercado  Nacional 27 de Febrero', 'Ave. 27 de Febrero esq. Abraham Lincoln, Supermerc', _binary 0x000000000101000000ACADD85F767B51C0B9C4910722773240, 1),
	(72, '330', 'Malecon Center', 'Ave. George Washington casi esq. Ave. Máximo Gómez', _binary 0x00000000010100000053D5FCDF2E7A51C07E86FDBF66753240, 1),
	(73, '530', 'Diamond Plaza', 'Ave. Los Próceres esq. Euclides Morillo, Arroyo Ho', _binary 0x00000000010100000039EC00804A7C51C0D75D0B40C47C3240, 1),
	(74, '580', 'Ave. 27 de Febrero', 'Ave. 27 de Febrero Núm.  217', _binary 0x00000000010100000039EC00800A7B51C0787003805B783240, 1),
	(75, '610', 'UNP La Cancillería', 'Ave. G. Washington esq. Indep., edif. Secretaría  ', _binary 0x00000000010100000059DAA9B9DC7A51C0B05758703F743240, 1),
	(76, '810', 'Blue Mall', 'Av. Winston Churchill esq. Av. Gustavo Mejía Ricar', _binary 0x000000000101000000FDF402603A7C51C02E3AF63F02793240, 1),
	(77, '820', 'Agora Mall', 'Ave. John F. Kennedy esq. Abraham Lincoln, Ens. Se', _binary 0x000000000101000000FCCDFE1F2B7C51C0E9F6ED7FDB7B3240, 1),
	(78, '830', 'Gazcue', 'Ave. Independencia esq. Pdte Vicini Burgos, Gazcue', _binary 0x0000000001010000003CF7FD1F507951C01B3B136079773240, 1),
	(79, '840', 'Galeria 360', 'Ave. John F. Kennedy, Km. 5½, Arroyo Hondo, Distri', _binary 0x0000000001010000001678FE1FED7B51C02963F85F197C3240, 1),
	(80, '890', 'UNP Multicentro Jose Contreras', 'Av. Jose Contreras casi esq. Alma Mater, Zona Univ', _binary 0x0000000001010000008C820100D77A51C0A9231500C2763240, 1),
	(81, '011', 'Independencia', 'Ave. Independencia Núm. 1553', _binary 0x000000000101000000E389FFBF5A7B51C04D2912C08B733240, 1),
	(82, '013', 'Máximo Gómez', 'Ave. Máximo Gómez Núm. 4', _binary 0x00000000010100000061D100201F7A51C0E62AED3FF8753240, 1),
	(83, 'PBG01', 'PBG EL HUACAL SANTO DOMINGO (PBG01)', 'Avenida México esq. Leopoldo Navarro, en el Huacal', _binary 0x000000000101000000D0B6FD9F017A51C081D0F6BF8E793240, 1),
	(84, 'PBG05', 'PBG Jurisdicción Inmobiliaria Santo Domingo (PBG05', 'Avenida Jiménez Moya esq. Avenida Independencia', _binary 0x000000000101000000D58DFB7F6A7B51C08850002082733240, 1),
	(85, 'PBG06', 'PBG Migración (PBG06)', 'Avenida George Washington esq. Héroes de Luperón', _binary 0x000000000101000000D859FCBF4D7B51C09E85F35FD6713240, 1),
	(86, 'PBG08', 'PBG MInisterio de Educación (PBG08)', 'Avenida Máximo Gómez esq. A. Fiallo Cabral', _binary 0x000000000101000000747DFEFF287A51C078AFFFDF7D763240, 1),
	(87, 'PBG09', 'PBG MInisterio de Salud Pública (PBG09)', 'Avenida Tiradentes esq. Héctor Hernández Vargas', _binary 0x0000000001010000000B3003008D7B51C049360D40597D3240, 1),
	(88, 'PBG10', 'PBG Palacio de la Policía Nacional (PBG10)', 've. Leopoldo Navarro esq. México', _binary 0x0000000001010000003F02FBBF157A51C07806F45F73793240, 1),
	(89, '342', 'UNP Nacional Tiradentes', 'Supermercado Nacional Tiradentes, Av. Tiradentes e', _binary 0x000000000101000000AD84EE92387B51C01EC539EAE8783240, 1),
	(90, 'CC882', 'Centro de Caja Villa Mella', 'Ave. Charles de Gaulle esq. Ave. Hermanas Mirabal', _binary 0x0000000001010000005C39FF9F987951C0CBC707A0C58B3240, 1),
	(91, 'CC894', 'Centro de Caja México', 'Ave. Mexico esq. Enriquillo', _binary 0x0000000001010000007A17EFC7ED7851C0B48EAA26887A3240, 1),
	(92, '262', 'UNP El Metro', 'Estacion Juan Pablo Duarte, Metro Santo Domingo, A', _binary 0x000000000101000000CED204408B7A51C045D9F89F3E7B3240, 1),
	(93, '263', 'UNP Plaza Lama Gómez (ovando)', 'Ave. Maximo Gomez esq. Nicolas de Ovando', _binary 0x000000000101000000224DFE1F8E7A51C0B219F91F0D803240, 1),
	(94, '670', 'Hermanas Mirabal', 'Ave. Hermanas Mirabal esq. Calle Santa Cruz, Plaza', _binary 0x000000000101000000FA67FE7FB97A51C0A2A30BA0CE853240, 1),
	(95, '690', 'Villa Francisca', 'Calle Duarte esq. Caracas, Villa Francisca', _binary 0x000000000101000000D7B4FFBFF97851C00DD5FFFF207B3240, 1),
	(96, '870', 'Sambil', 'Av. John F. Kennedy esq. Paseo de los Aviadores, V', _binary 0x0000000001010000003D1E02605F7A51C088E6F0FF997B3240, 1),
	(97, '920', 'Buena Vista II', 'Avenida Hermanas Mirabal, Plaza Buena Vista II, Sa', _binary 0x0000000001010000006A3503E0087A51C06EA6002040883240, 1),
	(98, '010', 'Isabel La Católica', 'Calle Isabel la Católica Núm. 201', _binary 0x000000000101000000DBE600A08E7851C0AB1BF7FFD4793240, 3),
	(99, '015', 'Padre Castellanos', 'Ave. Padre Castellanos Núm. 92', _binary 0x00000000010100000014D30120D97851C05B90F31F4E803240, 1),
	(100, '020', 'Ave. Mella', 'Ave. Mella Núm.  407', _binary 0x000000000101000000EA480580F07851C09E85F35FD6793240, 1),
	(101, '021', 'Ave. Duarte ', 'Ave. Duarte Núm.  38', _binary 0x000000000101000000B772FE3FF17951C0CCC3F81F4F803240, 1),
	(102, '022', 'Eusebio Manzueta', 'Calle Eusebio Manzueta Núm. 143', _binary 0x0000000001010000006EA60020C07951C06CC207C0897C3240, 1),
	(103, '023', 'Ave. México', 'Ave. México casi esq. Enriquillo', _binary 0x0000000001010000004866FD7FFF7851C09748F5DF7B7A3240, 1),
	(104, '030', 'Ave. San Martín', 'Ave. San Martín Núm. 139', _binary 0x000000000101000000C17BFDFF2E7A51C09171F7FF927B3240, 1),
	(105, '031', 'Nicolás de Ovando', 'Ave. Nicolás de Ovando Núm. 36', _binary 0x000000000101000000D3A90220747A51C0D8451320F17F3240, 1),
	(106, '032', 'Monte Plata ', 'Calle Altagracia Núm. 49', _binary 0x0000000001010000001412FE7F3B7251C063A110E078CF3240, 1),
	(107, '033', 'Villa Mella', 'Ave. Charles de Gaulle esq. Ave. Hermanas Mirabal', _binary 0x000000000101000000787003809B7951C008FAF29FC18B3240, 1),
	(108, '332', 'Yamasá', 'Calle Eusebio Manzueta No. 88, Yamasá, Monte Plata', _binary 0x00000000010100000097E315889E8151C01C45D61A4AC53240, 1),
	(109, '343', 'UNP Sabana Grande de Boyá', 'Calle Enriquillo No. 27, Plaza Hermanos Ferreira, ', _binary 0x00000000010100000036936FB6B97251C0D591239D81F13240, 1),
	(110, 'PBG07', 'PBG Ministerio de Defensa (PBG07)', 'Avenida 27 de Febrero esq. Avenida Luperón, dentro', _binary 0x000000000101000000704BFD1F547E51C05A2AF37FDC723240, 1),
	(111, 'CC456', 'Centro de Caja  Sarasota', 'Ave. Sarasota No. 102 (contiguo a la Oficina Saras', _binary 0x00000000010100000062F80460AE7C51C0F57808807D733240, 1),
	(112, '337', 'UNP Jumbo Luperón', 'Ave. Luperón esq. Gustavo Mejia Ricart, Las Prader', _binary 0x000000000101000000D3A90220F47D51C040EA02A082763240, 1),
	(113, '334', 'Oficina Pantoja', 'Ave. Isabela esquina Constantino Golonoto, Plaza L', _binary 0x00000000010100000028D36872318051C0220038F6EC853240, 1),
	(114, '336', 'UNP Plaza Luperón', 'Av. Independencia, Km. 12, esq. Av. Luperón, Centr', _binary 0x0000000001010000003F02FBBF557F51C097C6ED9FC06D3240, 1),
	(115, '162', 'Caonabo', 'Ave. 27 de Febrero esq. Caonabo', _binary 0x0000000001010000001285F99FFA7D51C054D1ED5F38733240, 1),
	(116, '163', 'Herrera', 'Ave. Isabel Aguiar Núm. 199', _binary 0x000000000101000000143DF031587E51C092921E8656773240, 1),
	(117, '168', 'John F. Kennedy', 'Ave. John F. Kennedy casi esq. Ave. Núñez de Cácer', _binary 0x000000000101000000D11CFE3FB37D51C06CD6F05FE67A3240, 1),
	(118, '242', 'Multicentro Churchill', 'Ave. Winston Churchill esq. Gustavo Mejía Ricart', _binary 0x000000000101000000ADA8FBDF557C51C01DB5FC9F47793240, 1),
	(119, '243', 'Residencial José Contreras (atalaya del mar)', 'Ave. Independencia, Km.10½ Carret. Sánchez', _binary 0x000000000101000000A62C0100997E51C001A90B800A6E3240, 1),
	(120, '244', 'Los Alcarrizos', 'Calle Duarte Núm. 183, Los Alcarrizos', _binary 0x000000000101000000787B1002F28151C069FCC22B49863240, 1),
	(121, '245', 'Americana Independencia', 'Ave. Independencia, Km. 7½ ', _binary 0x00000000010100000056A1FD1F127D51C023B70D40F66F3240, 1);
/*!40000 ALTER TABLE `dashboard_office` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.dashboard_region
CREATE TABLE IF NOT EXISTS `dashboard_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `map_id` varchar(20) NOT NULL,
  `area` polygon DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.dashboard_region: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `dashboard_region` DISABLE KEYS */;
INSERT INTO `dashboard_region` (`id`, `name`, `map_id`, `area`) VALUES
	(1, 'METROPOLITANA NORTE', '', _binary 0x00000000010300000001000000530000008E723385C27C51C047192C69E2863240FDFCFF49227D51C0E7C49A026C8B3240171879DE827E51C04629F8D2088E32402FBD7868DA7F51C0CA18486DCB9332404E497448708051C0D1FF39FAC59B3240EA928F297B8151C0B8EAAA69BA9E324021C6ED26EB8151C070FFB5EE029E32400D021CD1508351C02AD75BA9ED9E3240CA56F5084E8451C04E7140F5CCAE3240DD36B204E38651C020E4F26A8CAD324045227E00928951C0186E6E2F35BD32407F9319AFB18A51C083229BDA8BBD3240C8501C7B9B8B51C070852910B6C132402CEA1A6AF38C51C01999F6CE3AC43240FF5C2ED8F38D51C073AA8B7B9EC63240197789FD978F51C05E9F2FAAA6D03240655CC9426D8F51C05DA35F49EDD63240471BEF90238D51C03B8007EC0DDD3240C43A4FD56A8B51C0F0BEB19F26DC3240641B63EFD18851C03349439499DB3240BED622294A8551C0ED43AA2E3EE53240F1B32F4C3D8351C06F0E4006CFE23240A85B918C378251C06D697E83E4E332403B4F5EA7198251C016B2E9B39CE73240DE773EF91C8151C0940C329152E832409B6473BD587F51C0F7E1AE27ACE232403FE709CE637E51C00F5D606E5EE23240472121A1937C51C091160C37B7E73240788A14DA067B51C0229184610FF9324060026F4E1F7B51C025CB88DA60FB3240B6D0A66DC07B51C050A56529B5FE32401068D8B4647B51C0B41591F5BE023340BA9726F2347A51C0B459B487480A33402A35636EBA7851C04236C0FC710A33406A115E53677751C00F489A59900B33407AFA8947D07751C046AAEF89591033407C168D24B27751C089562F81B31533403A5F69C7717451C0A3CF543EAA1433406F4AEE07287351C07D727DEF9A13334005598DCA527251C0F5F31B877C173340261CAD9A027051C04E63D3EFF21733404C6D5B67226E51C0B0BD8CE882153340B7C620DC056D51C0EF56C598620F33400E238200DD6C51C02F3D2AC5040B33404117B0828D6A51C06761688EE7023340EEC0538F356851C0F2D0430BC4FC3240B796B97D896551C0E99C75C8F1FC3240BB62E903D76051C06F83B5E750EF32407375C384C45B51C057A1A46168E1324085E1BF33A75751C010EC45C12CE33240A833722F255851C02CBE72B736E03240019D92C17B5D51C09D9501337ED332402F8AA32D1A5F51C0781EB9DA76CD32400C3AAC36736251C0C0D917DA99BE32403F5A36F0326351C012F3CC56F3B0324000AF8227196451C00C45022D80A932402C14090ED76551C08BF8848E8DA73240713113E34B6851C00DCD8256EAAA3240E675DD0B636951C037108BC221A632403AFBD7948F6B51C074A97203DBA232407A868C12516C51C025D935EF2EA33240226101CC3A6D51C0D6F45C85BDA03240174638782A6E51C0C68DDDC9C9A13240152861B62C7051C01356F050529E32408F1D94A7FB7051C0C2714929CD9832406B991680187251C0E4BA8A57FC953240755762FEB27251C07018BE86439532407F14EE762B7351C0F3025B2F3692324030C84476D27651C0F418C168FD8E324032FDB9AE617951C0AFCB7A2AE08532409C29391D5D7951C0DC074B3F238432408A198A931C7851C060524701428132403D95F43D107851C08E1349812B7F3240D5BBC91F927851C0DC5175A6F37D3240F3D357908B7851C048006A8F857A32405CC04AF1377851C095B0C3C61578324083831A8EB57851C0D13EBCF962783240025EDF7A077951C0735E288D9D773240A23A7DDF0F7951C0FC0328884479324063F85C6AA97951C0A51ED1138A7B324007B1AF4C8C7A51C023606C67D87B32409215B89F897A51C0E243A445B28232408E723385C27C51C047192C69E2863240),
	(2, 'METROPOLITANA CENTRAL	\r\n', '', _binary 0x0000000001030000000100000014000000CE99F4911D7B51C008D1DE94757232403EB87A51397C51C0BC8DDAEA8F783240FD9712A73A7C51C0B4BC0947997932404D4927D57D7C51C0D766763B8D7B32402649661F807C51C00BFC9688D47C324044405860AF7C51C04693BC25C67E32408DADEFC48A7C51C063F8F1C3DF7F3240BBF4AE36487C51C0B572B379A08032409A282FAA657C51C046B768E322823240FAFB5918207D51C0778616C9348432405A757C25D57C51C04FF5FE672C853240C65FBB466E7C51C0618977F0C2853240768E2BB6A57A51C010B74A5DD7813240AC07D957C47A51C0FB2C889771803240E2E01E53997A51C0AAEDEEE6F47A32400C18D3F2C77951C03E2EA2071A7B32406FDC17C52C7951C03A7C1F2D067932409B1A99F0227951C02F90A3BF0A773240B8C4405BEB7A51C0EB549F94F4733240CE99F4911D7B51C008D1DE9475723240),
	(3, 'METROPOLITANA OESTE	\r\n', '', _binary 0x000000000103000000010000002B00000003551085FD7F51C0452EBD3E0C6D3240E7320667978051C04E56F69294753240838E7A8D0D8151C088478600E8783240DA85C2D6B18151C010843BABF07532409B4D454E5D8251C0D2682FE695763240837A8468B18851C07CECDE15D48F3240F38C664F3F8951C0DB5D99AC20933240E3C7E1647E8951C0468D94120E9C32404700E488F48951C048D8C4C573A032401836BCBFC08851C0F8B16C0EB8A032408FB9671B508951C086B06FB66BA532408875CD62F98951C08EEF5D7C48A53240FDEFD51D4F8A51C0AF6639EC26A432408AF37558C48B51C044B5AB4794A83240CD5FD6A8BD8C51C01866D5309AAD324064F00DC01D8B51C07580D3198EB632405BD29CD7408B51C00132862FA3B8324059E06C76B38A51C0353BDE0BB4BA3240853E0F02EE8951C0758E3754FABB32403BD81CC4BD8851C048424DDCD0B632400858D1775F8751C018F43784C0AD324065690E36FD8551C01E06B0DABFAB3240F95D2C50938451C0754D0908E3AC32400541AB64298451C0DCF60D2CEDA83240E432EB60728351C0F73AFC52F69E324075D0FC071F8251C077A35B4F6B9C3240F095C599858151C0663B8F81FB9D324027F36497B88051C0C5CD3C2D7B9B3240F36516AD468051C035134EF7C89332402BECFCE5977E51C0F1D32DF2BB8C32407CC0E39A647D51C0CE77325F338B324055A76FB9EE7C51C070047E65B2853240CEA43D904C7D51C02624BA89FB8332407F3B5978997C51C0716E3E19068232405945C9F09C7C51C043F1C7218C803240106AD782E07C51C0B4004060DD7E32408B450F4D667C51C0C8BB934849783240B84281A23B7B51C0ADC07050547232404804A944747C51C04488C3536E6F324042B180C86D7E51C06EE6B209906D3240A119DDDEDF7E51C0E5CEF123B66D324063BCF461947F51C0E3979180216C324003551085FD7F51C0452EBD3E0C6D3240),
	(4, 'METROPOLITANA ORIENTAL    	\r\n', '', _binary 0x0000000001030000000100000033000000A921B1A5FC7751C07D362CBFDE773240E4ACCC193C7851C0706EEB8B557A3240BEEFB82D5F7851C0BB66392C837D32402EBAD1C7DE7751C0A4B4FCA09A7E3240109AF19CD27751C02C8763CC3A8132400C5F4CAE597951C097F628AA6A85324021AB19F3F77651C03835BDC8CF8D32405189DB0C187351C0F968435CBA9132406CCCA17D687251C0065B1AD2EB933240073CBD4F007151C02EC4D54182963240E6098AD3447051C0B1DA98C5AE97324017E84C7BDD6F51C03AD0B96C5A9B32409B0F69136B6F51C0EA31EF16859F3240A7A5E77E176E51C00820EA9E25A1324069C58EF34A6D51C0A4795F1643A03240A5676BE2366C51C04D80AEEE66A23240B4C91D9A936B51C05423DAA712A23240E056189B456951C0BF5C5B0847A5324007D1CAB3486851C05F213CD501AA32408CF50C7E2D6551C07DEE7456E4A53240CFEE177D386651C0832ACDA414A03240DBF675571A6651C0160E02F3D19B3240FED5D25D416551C0F2B828FF259D324018E8EB25F56551C0A02D6ABAF8963240F47C1C0C026551C05D211B9EED943240DB4F7AC1DF6651C0FE1DD761298932402742B784CA6751C0C608EF8B178532408F4B2DC3E06651C0C518425FD28232408E3F074B4F6651C03A1ECA178F7D3240A35329C2456451C05646E58849783240BA0BA1E5776151C0AF53C0C7F8763240563DE0020B6251C0AFBCEBD0CC703240B2A3F836F86151C0CB52BE278E6832401DB31353E86251C09CB4FA119B6832402CB4411AB36351C03256E922AE6B3240F03497E5796451C08B1D4929D16F3240DDF421FCFE6551C0A02885C3F27232403CB1BD56E86751C05879FE2B5473324071B89018A16851C02FEDDFF482703240FC328DA43C6851C0B50FE1F2BB683240366E1E23906851C0916B772C496732404C20CDD75A6951C039094694816832409E218D86686A51C0CBE735639F6832404B49D2F7FC6A51C0B69699CAE36A3240429F894F3D6B51C072180EE07F6D32403DAA4EF99D6B51C0812F5B9F697432407DA3DDCAA66D51C01BA14672DA743240E8194C364C7051C04D2522F91A783240A18AC9F0077451C07F8A368FEC77324035BC934A6B7551C0BADC27F62A793240A921B1A5FC7751C07D362CBFDE773240),
	(5, 'ZONA ESTE	\r\n', '', _binary 0x00000000010300000001000000730000005F67EAAF786051C084A0B984F7673240879F2600C26151C066BB6446A36732403A0830F8AF6151C0A215B869B06F3240CD9F122AB66151C09F0C780A5272324032A7D2D58D6151C0E1D93367237332400CB70EA2236151C09FF4077612743240C6DB2AA60B6151C03FB0D78F69783240EB916D1E8A6251C0176F3A536A783240B857536B366451C042CC1D98B4793240CFBE8FC2176651C0480519D8AF7D3240AAB100EE976651C09F449A1D0083324046306D778E6751C09B5B110F418532409C95FBB1CC6651C06A6C0D32F5883240751B23CFC86451C0F95677583A953240EB227189CA6551C0EEC264A1379732406CA474BC0B6551C09EF0C437C39C3240F023F212426551C0E0602C9CE49D32402FDC501F086651C0BF89EBB5A29C3240CBFEBD99136651C0ACA038E20DA03240BBACB5A5EF6451C03B23373B98A63240B90A560B5D6351C0C4C7C440FAAA32400FFEEB25206251C0F7DDC1B96DBD3240CEA586DE6D6051C068A202BDC1C33240EF15D232765F51C0096D8785A2C53240E80E90D1295F51C0AFA7AA35CBCA32408A3635CC5A5C51C0CF6B483BF7D03240DAF1761F815B51C01DF0E53F20D632404C1EC29AF55751C0A99FF79553DE32400EC7B4626D5751C07170EB9923E432406BDA47029C5B51C08357363565E23240A73D916F7A6551C0EDE04CDB2DFE324071A2B49E966751C0EFCDE736A6FE32403A96A66F3C6651C097D5010A54143340664A63CB3F6051C0F3D18D94481433402A04AED13B5D51C08C8AC35357113340EB197374005C51C02BCFDB1675123340851A7AD2945B51C017EC52AD56183340AE26A9C4325A51C05D3021E863183340DC0B1A952F5851C0BE87C4AA320D33402CB6B180F95551C096ABE1EFB50A33405C8C6E3F1A5451C0B3DCE3A83F0B3340A30C7885EB5051C0CCD4207E05033340E0B676AC6A4E51C048C90AF832053340EC7C38AFE74C51C016CB311E530133404F7908FE6C4A51C0A78A6C8115013340A115A41C104951C08855CD327CFD3240C42F6BBF094851C0B8FC981A47033340448D38A7DC4451C0E34D605857FB3240270801ABDC3F51C08EB705D85EFC324048DF5D0A254051C09C698D1005033340BAFF7363DE3E51C0A9582820810233405B35FD840D3E51C0AF3CD4022D063340A83A1357F73A51C0745017D0710633403887CDE9BC3751C0BDCFC5A571FD3240FF5077D7B23651C0247129076FFD32400A15E72FC13551C07A727A8ED9FD3240094B1CA03C3451C05AFFFB0CA8FA32407B71298A773351C06A7546D2CBFA32406871EFE3E43151C0A2520C2E6FF832402177FA45CB2D51C01FC24AAA01EF3240AB1FB718F62851C0BA466B597ADC32405D02A6C23F2451C0A5AFB40C22CA3240F6C3CEA9162251C0CF9088F346C53240EF7F603CA02151C07E61D452F9C532403E73B994F81E51C076012ADA32BC3240BA9FC5CB8B1D51C05103090937BA3240D74119AD511C51C015AEB3A5F9B332404136F895B61A51C01DA44B6A96AE324005C7B0E2411951C08CF38C6DA0A832407B060BE3F11751C07387AB7A0AA832404CE9C1EA4E1551C06B1D1C31EB9E3240545A88E3781551C088ED5F706B9A3240205D1EE7481551C0628625A88E953240238ABBF2431651C02520C110EA8D32402C825ABDA01851C0D4591AFFCF80324028DFD9F8471951C0C0DE72EC4E7F324099FE8F8B361A51C08A2D3DFDC376324088C0108D581C51C04ECE86416A6F324052A6BA781B1D51C0EA12D6C47469324032EC728D2B1D51C0B934B69B2B5D324072CB28C2BB1D51C0984084BBEE583240C94D144D571F51C0BC0316471C573240537438D4D42451C004DD70B6DA5F324084F6057A6B2651C057876E79FE6232403A94054F382751C035663DBD09603240078B7798E72751C02ECA1990DD5A32400291938E222751C0D0E881944E583240A299B09FCE2651C09EA0AFF47D54324004F3F077202851C0490BB459174D324052138361382951C0FB7DAED5A6403240E3FF1255A32951C058C1E93D3439324041D3863FC72C51C0F886412913373240AAA52660EC2F51C0B2FDA71C9A3A3240068DF5E4253451C08F6F37CD5D58324050388369343551C03498EEA68C5A3240DACCC1C5FB3551C08A4793B94C613240DFBE3E89F03951C08CAE9701686832405EFC13ACD93B51C0B1DE1C7B7A693240E7F757376A3D51C03D7FD39EE56B3240BF55C072104251C06EFA175E9F653240137916B88F4451C06AFE136EE664324019ACB3F5284651C06C12B216F9653240FDBDA23AC24751C092170DB26A68324029CF094AE04851C04FED2B7C55683240FD3E4E31124C51C08347D87C836D32405BFBADAAA94C51C0CC5C9711ED733240CCAF1AD7C04D51C0619164CA01743240E0C19C7C9C5251C054A6849C42703240756BC89A5C5451C0FF58A78B9C733240EB2A8EB1CA5451C0B4D5C97C456E324030EA6897885551C0227CC4887E6D324020D78134C15651C021356C3B086D3240339DAE2CB15951C069FE78E1CE6D3240D59B53B0755C51C0C9CB0A43D36C32405F67EAAF786051C084A0B984F7673240),
	(6, 'ZONA SANTIAGO ESTE   	\r\n', '', _binary 0x000000000103000000010000001B000000487A644E4AA651C04E856A4AB4663340950BDF5F3BAA51C0527EE6C52B6D3340D6DB4E4D11AD51C0761541D81E773340BA0E878D65AE51C096933CF94E7F3340896C2335E9B351C02DA8A1C5488B3340636BA22F91B851C02EF6B3DFAEA53340920869BA7EB551C0B16D3AAE45A2334027B1D13340B451C0F5AEBC5F2F9F3340897FDB32DAB351C026C12B384CA133408D95F91398B151C0F29B7335C4983340B307D67DA1B051C0F4252E723698334075941643D1AF51C0C890A642239333407759E536C8AE51C0C28D6C1EDD943340E9A04F0123AE51C0A70615B59294334001B09170C8AC51C02C771B534C9A3340053238AB61AD51C06B3EE188B7A533408553EEC451AB51C0AEF0940BBCA033405B8FDA2460AA51C07F15D7B8D0A033400DE12552FBA851C077827FF4859D334067C31AFF3DA951C078BFE45A968E33405E42155E9AA851C0C50797C5078B3340C9E44F08DBA451C0C9A6A77BA38633407B3B5B5C52A351C02FFC206B76833340AF3458E747A351C0804E7573388033409D8FFD2381A551C09B42026D497A334080EC1FF321A651C0AEAA34BA686E3340487A644E4AA651C04E856A4AB4663340),
	(7, 'ZONA SANTIAGO OESTE   	\r\n', '', _binary 0x00000000010300000001000000570000009AC130BECFC251C0C3592E69B00B3340BE27A1FBCBC651C049532B2D7F113340C2DC5B44D5C751C01A4BF17646153340C68B455B98C751C01BD8BBAE721A3340B4505B4F30C851C0CA53466C781F3340C63EEB7E39C951C0317751258A203340E3156670F4C951C00C58BA1E2B253340DF9BEBDDC7CA51C06858DE7703263340C50C4EA4AFCB51C08A3E9CCF912733401BAFBC93E7CB51C090A24E74642A3340B24C4D2C21CD51C0ACDDD0A5562E3340045B9D92B7CD51C086F7F24B212E33401B33DEE230CE51C024D01550C43533407616371215CE51C027D0CB769D383340D49AAE039DCE51C0790CBC8BA73D3340BA74365556CF51C01EE92FC2943F3340D80615ADB2CF51C08E0013D55E4233403EB9D210FDCE51C0A442C4B13F453340C53AD9C734CF51C032A0BF05284A33408A2D3FABF2CE51C03E96C4C9404C33401024512CF2CE51C086811261F34F33402FB591964CCF51C0724ABE823A53334033D4A17CC9CE51C021EE1C221F5633404B053D279ACD51C072FA117484553340E8251D06DACD51C0E60E7754185B3340599A1CB401CD51C0F5F29817535F3340599A1CB401CD51C0F5F29817535F3340085555C9F1CA51C025BEE930256133403B681A606BCA51C0D0B1B4A4E05E3340FCF389C24EC951C0603792E69B5E334088591A3A32C951C035DA7F3E92603340891226D417C751C0A5BD2C029A63334034EBF290F2C651C0F09365B76667334010DB13D719C651C0E5D0E0CEB1683340BFCEC5B2EDC451C0CAD73A1E6F6833404F640EA110C451C0FA8F1CC6196C3340051B51C723C551C05BF0EC40F36D33401223D34740C551C0790EBF374473334018123BC775C451C00DA0ADC2E0753340C810DAE6CFC151C0A7890EC9407033402051495E91BE51C08E20F24762703340015F01650DBE51C05FDE6FF2A7733340F4933C618EBC51C089AA30D8CC703340AC080318A9BB51C0664FBE29B26F3340FB35769CC5BA51C07A9F7695AA71334097CEFE2282B851C01EE19D6FD170334084E8057A45B751C0E3192A33DE74334078C0830B0BB951C0199D5B05B178334042E13CEEBBB951C0A9C8A4C5257E3340B29C1CB395B851C0C0D880967C88334033C39EACE2BA51C0C66CA32DB08E3340B55F11EA69BB51C058D59E545794334009D14C4D43B951C04D80408B389033409D38EA6B6DB851C036217CEF74933340148CEC7F10B851C07BA7C0FCF89E334025F73B92F1B351C02158A85C3B8A3340CCD96D7188AE51C061C5BE8DBA7E33409C8695622BAD51C0FA588509D5753340EE25842E64AA51C0B7B24B71386C33405349053559A651C08E7DCF20BA643340AFE7917DB5A851C088FDD23EA85F33403EB1387B34AB51C096DD4287DF543340FD3E6EC433AB51C0AF94A1EE1D4B334027AF5CA5EBAD51C0A14678811E4C3340EC83D81019AE51C049D2000CBC463340725632F394AB51C0B8294E52DA423340954363424FAB51C00059C8AF9231334060A6A41D7DAE51C0FC4FE18A9235334094A36B8131AF51C0E6A0EDC454323340A4BACF3EE0AE51C0D2A19072EC30334050E7FE1885AF51C0BB5D7D479B2A334093B4A20050B051C0DB686B50752833409E04992445B151C00CE5639A3D263340440726047EB251C04EAFC9940B243340ECBFB9080BB451C0A7FF64FB0F243340162D38FB6EB451C06C2A9BE2D61F3340375EA07526B751C03EE81F66261933403B2C8D25E4BB51C0B8A7F85894193340869D7BC2AFBC51C0635D955D1C19334019C951AC28BD51C00AF12442D5133340108BB5B290BD51C012D3982FA50B33407758E9F56DBE51C01259C4F7230A334052FB502AE4BF51C0B84588C50B0B3340A30A2511AEC051C0D05E13C274073340FC68E517C8C151C02D80EB3DA00533403E7CCE6383C251C06780A69BC90633409AC130BECFC251C0C3592E69B00B3340),
	(8, 'ZONA NORCENTRAL  	\r\n', '', _binary 0x0000000001030000000100000037000000E0FF08396FB451C00B9DA2A35CDA3240636FF8481DB551C04C8CED55FDE13240A1464D0ADAB451C04D86B402D2E93240A348C59DD1B551C0102AC31AB900334036623CD6C7B851C0F8E76EF875013340D2EEB0C10ABD51C0744380A7C80D33405728BD8AE8BB51C0BE1E3A3AD417334013A70F5FE7B651C029B452CE06183340AE9F3ED4AAB351C0D72BC5652220334005533D43D2AF51C0CEDC3481322533407B41FAC543AE51C06495CD9057323340FE64C693E6AA51C017EC413BC230334041D3697F1AAB51C0F8145DC33F4333409B8964E64CAD51C03799A2BBD64833405E714562B8AA51C03AC30E84B34933403EBEC7098CAA51C0580D9B27465533409C9D544CB8A651C0F487EFD89C603340AF42CF3CEBA451C0BB83B7303A63334081AF927C02A551C067FA329E5D703340A17CA94EBF9E51C0210EAD950E7033402562AE93359C51C004ACC0D85263334001219FACDF9751C03815BDF1B13D3340A140D316D99551C06C3F9D6F41313340127B4816F79251C0F5C2A3717926334014DFADE31C9551C007CF2EAB1C263340E596AAB0909551C01477AB1C7B233340FE2996D57B9551C0C9EC29B28B1E3340BEE2CE2A979751C0965BCFE7250C334057DD8EB7CB9751C0AB999584DA043340D8C57159879651C0950D987215FC3240249FBBFFE19551C038352989A1FC324064F022528F9551C0B551DD7F8DF73240AE95BA41348F51C03D1DAFB93FE2324069E05133A98E51C03DA2EA3130DC32404F5F3FA8EE8F51C01087B1310AD73240B47AAD14089051C01A9AC5B357D03240C00914D5199351C05C996CE430CA32401261D9B96C9351C09736E16BA4C332405B944AEE4D9451C0F997F5F584B93240C7FD54F10F9751C066525AF420BC3240716D4A19029A51C07AC37A45C9C23240F7A38EE2C59B51C051B4EB8012C33240EF805EDD1A9F51C0B0C86CAA0DC732409F3071B398A251C002D69CC82ACE324032149DC8F4A251C0DBABF1F7DFC13240EE3022A619A451C0729A243E02BD324087B1484947A551C06ACD91CC4DBB3240FA1BC22A3FA651C03BD60E5BA7B632402AE05EDA8AA651C02D67005F08B13240AE81DD6047A951C03A9BEDA194B2324037A95A2093AB51C0A2D6709A06B23240DAFBE2906AAB51C01A625BDF8BBF32409FDF84D08AAC51C0DD5D064DB9C53240F74F5D90FCAE51C02A3016E4BCC73240E0FF08396FB451C00B9DA2A35CDA3240),
	(9, 'ZONA NORDESTE  	\r\n', '', _binary 0x0000000001030000000100000066000000A5A95556318E51C01B6A19F9A1E13240D00BAB28039551C0F8F7A89DA0F73240CFCF1966399551C00DB92BFC58FE3240097380386B9651C0523494EA99FF324066DD578F889751C0E4D704492B053340C348737BAE9651C0229FDE424E133340CE2880C30D9551C022DC53BF331D33403E4251A92F9551C05E0F445254213340AC235617DC9451C0614FE5972D25334041B599298A9251C0149652E4AA25334054D0434F3D9251C0AFA57CC2AB27334005CFD1B1AC9551C00DE2C08262323340FB4BAC75C89751C0924062EC3A403340A73BC20DE49751C017E2645249483340005319FF1D9C51C0A3637AC097643340CA5FE6EA999E51C091ABBDEF417133403F8D23781CA551C0337429E9AC72334049A2B44E05A551C024AB0C2251793340AB977185C9A251C0E0343785507F3340A0545ED5BAA251C026A6160F278333401F76FE0374A151C0AF1739B635883340AB1DF50D14A151C0BD96222B7D8D3340E9B7291B92A051C0A2FBBCDBD39033400BF9CC648D9F51C0E2C823F88E9A3340D3CE89ACDE9D51C00A5479762F9D33407724CCEAC59C51C0AE430863C6A033409F6E3764EB9C51C073DD1226F1A633407D14E5AEAF9A51C0C5051B80C2A633400AD145B5059A51C0304F58B1F5A8334002632C37389951C0A522A4BD0CAA33402004B3F9369751C086D04344DDB033401EAACF88B79451C05A9F6C5294A9334013611E92589151C06A2550A4DEA333405CF3B3CD5C8F51C053DEB64591A33340BC8FFE9B9A8B51C02E9AF7DBB09F334084661265B98A51C0538A7C1DF59D334067A6B1E43C8A51C0796DFA9BAE9D33401442B0550B8651C0C5A8980914A033408C6243709E8351C0BEAB11C2EFAB33404E471141887E51C06417FEA937AD33405E17E16C957C51C09B43DAE55FAB334050D6B584A07B51C05F21F20C56A633405E0A7A33F37A51C0A30DF69069A633406AC3F80BA27951C0D5330A16B5A33340368A6AE9BF7851C0FDC24EED1E9B3340AF62CD8C947951C0549042285F95334081C0753AA77951C05312EF58D58F334011F1BFA73F7A51C086F2A58FF38C3340D09840EC777951C0C5565578C386334050A5E14BDE7751C0F535B2AFF781334066BD444C577851C0C3C7E90CCF74334009CE47BA5F7651C0BA346C5830643340AFC5FE00817651C03855086E9A5F33402CFDE4BC977451C07EACB9D476593340C8D700553F7251C03A7349BC964C334049B219B0446E51C0EC5200F305453340E3D8D531566551C0FBFBE288CD4B33403C8A195FB66251C0ACC4213DBC503340CF8D155E626051C0DA4D0FE8DC5133406B642CD3785C51C07452A033C95033409326B5ECBD5551C03F142AB194473340AC5F93ABA05451C0CA9649763D48334088FC08B82B5451C0AC0972CE964D3340490CEBFAAC4E51C020A1E9A2515A334062C6681A705051C095287D93C34B3340AB5535A2464F51C0CC72101216483340C581C7396E4A51C07E24D78AEB4A3340B6B1211D7F4A51C0D750ACCA794533405ACEDA4BB64D51C08A96EC7B4C3B33404026D0BCC04E51C08467FCB7452F3340B9BDA14D585451C07B54148AC6353340C5BDA84F9F5A51C0BD9851525C323340AF5C7C30A85E51C0FFB56ACB78363340523004B05D6351C0C461614A34373340ABFA2406F56751C0E4CD6D22CC3A33409BC35443496951C0A571A6209720334082BA10132B6851C0C168552E701333401D56C122F46651C06B45A0095B1333403D3F0440E16751C0BDA20D9F97FD3240E4B498B1486C51C03552DACA420C33401AF34A19F36D51C0FD5100B594173340558ED823696F51C077AD77ED88193340E27A9D822A7251C08EB9274618193340952CC0C63A7351C0D5B6788912153340ADFFD33D1E7751C036B30611FD163340B39CD8D3257851C0EDA07E61181533400F4CAE1EDE7751C055C35E4CCB0C3340C06EA9033D7B51C0EB7654E2560A3340C61D2F0F147C51C05F56BB5897FE32405F72758B507B51C06F9D1A29D4F93240E3F37F51D87C51C036AC3C205DE732407ECE5DDC587E51C0D8A5AE8A9FE33240EA7BC97B5F7F51C009142B2571E332406DE968BE018151C06264F69109EA3240B33ED0975D8251C0D17D1D869AE83240FA836637AD8251C04F8083200CE4324017F4B3BE7A8351C035315075DDE3324042B72CA59C8551C07200AEE527E632406A6EF289E88851C0AEB348A31CDD32405C89B84FDB8C51C05BD14D0B36DF3240FD572641388E51C07A93D1CCF5DB3240A5A95556318E51C01B6A19F9A1E13240),
	(10, 'ZONA NOROESTE  	\r\n', '', _binary 0x0000000001030000000100000077000000265F8BBC93E951C0D1319CE30B3F3340BED12C1ED9EB51C06C62B98B71403340EE51BD6124F151C077278A269F543340E1232C8AE9ED51C0FA6F4A79D55D3340BDF26D12E4EB51C089A7D37AC05A3340EA1C0892DFEB51C070268C4FC9653340992A1C4AAAEA51C07E9013AA9C7233407A2EFFAFC4EB51C00963E089377C334062EA4D9529EB51C0E3D4FD7F59813340A4E68EB700EC51C065E24FED12883340EC909AB7CBEC51C00EDBD2E6858B3340A946E20CEDEE51C0014154D48F9733403B9B508934EF51C01C33721D03A233406E2D266773EE51C045E45AF6CCA833405C794DEFC9EF51C097682BCC43B13340977745E16BEE51C0E8449A07F8B2334011A4F0AAF1ED51C0EF851CEC6FBD33406C965A5383EF51C068F813AA86CD3340EB6F46A44EEC51C02DAEA398ECD13340CC4843BAFEE851C05079E0F5F3E033409216520405DF51C09B75FCC294E73340E015BB7B72D951C01ABA3371C1DB334081A4145BEFD551C02EEED16088D73340D3DB7945FED251C0F6B878B7E0D6334074C81E0077D051C0BB26E1DAB5D1334073D19F8ABCCD51C0265C77C865D53340FA7075712ACD51C00172A29F73DC334031D8525F29CB51C01F7037B369D83340480C8B0BB6C751C0403EED7B89DA3340FFF28EC990C451C026A8FBA105E133404FE64782FAC451C065EC1552CAE53340D6ABB2583CC351C09A860F1603EB334013A101A7C9BE51C0BF4E2C3193ED33406F5D62EEA6BD51C0138D4C298EE83340DDE991D739BD51C00453DA27D1E43340A3A0D3D2B5BB51C0BDEA0C2F3DE43340263421485DB651C01158DCF4FFE53340B9CF0CA0CFB351C09105909FA8DF334021DABC6945B251C092E1A04C31D83340887ECB6356B251C04AE2F4169DD3334066B90E61ECAF51C00A6E8E0219D53340860B2A7E4BAD51C0C7ACFFCAFBCD3340FAE5667A7AA951C06B5E387663C433407CD0B03E57A851C06634E633A4C133408142B5F1AEA751C07B28ACAFA0C333404E748C40CBA551C0960295704DC033401CC61F9CF9A351C00B92D39B5DC233406C5499BA51A351C0A10172EAE5C03340408368864FA151C039A22697BDBF3340E933F3557BA051C0854F641B91C63340F4E93210399D51C0DC24348CF0C73340705737C8D19A51C0959DA473D5BF3340BB7321AA989951C0922DD3965CBF33402217D31C449751C031C78CC457B23340B73355633C9A51C029E826B57AAA3340903A87AAE39A51C008E8682FC8A733405513D9D98A9C51C0F8C719CE73A9334058720BBD879D51C056E0691CCDA73340246B015E259D51C0B86A23F536A0334070BADFAE23A051C0BD18E1D58F9A33402500CCF9A2A151C0CCAB65FC778D334036C76BA8E7A151C015180E69D4883340E560B789F7A251C094E2B8E65B843340E2FC4B1C66A851C0F88FC665C78B334019F75C70E0A851C0589917F2C08E33405FB23459ADA851C022A110E8E69E334046F8783A50AA51C054CFA7AE78A233408F32C21953AB51C0F99665018CA133409FC3AF198AAD51C0F4F03E1FA1A63340B2445CEF14AD51C0899996F1389B33402BC431791FAE51C04A79BE6CD4963340A7F3B319A8AF51C0D4E1304AB69433408964DF0A89B051C0BB07DAA47C9933400BA46D3074B151C04E95F96D5E993340087427D3DAB351C0D57BD38448A23340628882D766B451C05663227145A1334082E1869686B851C0D14C112943A73340FF433E4CE8B851C0EB82439816A43340FFC5485A58B851C02B2D7AD4B1A03340A3D05A548BB851C0A4535ACFAF983340CD1F2CFF43B951C0E96032729D913340BB39C74737BC51C0CC41D92CF0963340524FDD7AD6BB51C09DFB4DF8608E3340D02EDBA5D9B851C005B58089F7873340ABB887BA2EBA51C051E98557397E3340DA09E952D2B951C076694270B3783340B4B5CF55B4B751C0B0901AD51975334029FCDBD5B4B851C019F8780747723340D1BFEFBAFBBA51C0640EE42CAD7233405FC8C52EB4BB51C0D1456ADF98703340E77BC6FF07BE51C0272B25C225753340EE16D509D4BE51C0C5BBDB24077133408E45D21DCFC151C075526CE921713340BDCD001BACC451C0D023CA634A773340F6C12BC9C9C551C0C38F5F81E5723340461ACC5DA9C551C0582E957E236D33404E545D5809C551C0BF47297BF0693340315214EF2CC751C0D7AF4779C66833409D8A898269C751C08025F7154965334083606A085AC851C0EB09B7A845643340B6396D2BA0C951C0E41D47BCB26133401BD89714B3CA51C0D03A18263B643340F24FBBE365CC51C0BA49BE2E2263334060B4FAABEDCD51C02DE93CE8F55E33407B02923801D051C02EE18C935554334030727794E6CF51C0369E65D3994A33405131597F7CD051C06733467BF14233406B5ACA0600CF51C06DBCF48E4F3A334045A86BCE52CE51C09445B95FBC2E33403EC2FF17B9D051C0DD6428F2172E334036F4F74C91D351C0030CFCD9352F334076E1ED5DDADB51C0A3514C8EE63F3340828975D47BDF51C0E74FEFC7364333408C4A8DF61FE051C0CE4B35E2F548334072262AA944E151C01D7FD2A0E5483340474F2716A7E351C08E7CC3A01A493340BD5338B4B6E551C06470CE536D4C3340E92160C49CE651C05368E351B4433340265F8BBC93E951C0D1319CE30B3F3340),
	(11, 'ZONA SURESTE	\r\n', '', _binary 0x00000000010300000001000000340000008EB8611DE9B351C02D21536E036032405C886F8A2FB551C02DCEC91EAF84324038F12C3000B351C00689F70F41933240DF4008AB9AB351C05C0FC06A92AB32402B4D6B8718B351C0F62F811612BA32409350D727F9B451C04DB6CDABC8CF324057DE9CB58FB351C0312872C185D43240E62F3E08E4AF51C05CDDAD495AC532401D8FA05889AD51C0C45F3F902EC232409F04CC592DAC51C0DE99DEE72DBD3240F3770125C1AC51C0D8487FC858AE324038D2827D3AA951C0575DAA969FAF3240B6524E8173A651C0A41E48DCFBAD32408E14920243A551C0ED3DFCA111B53240B03295E4D8A451C0A55A6750A1B93240CCF3F08066A251C0476DEDBB85BD32406924ADF36DA251C0E346A6097CCC324088776D44679F51C0F03F2EA8A3C5324009D7F75CE59B51C0243FC042A2C03240A094D713CE9951C05CAF66048FC0324080D524C9D49751C0D930C1ED2EBB3240F1932CB6309451C047E2E98C05B832406565CC2AA69251C014A07A8EEDC83240CF8EDCBBE78F51C0984A2CCD89CE32409777C6A6358E51C0B454E0AA74C432403D73AE63F88B51C083D21DBB5EBF3240A26377E0BE8B51C0898A5F0451B7324052F46977348D51C0AB45E508B1AB32406AA386C9CD8A51C086105E9371A13240CF4FB132938951C0F130C653CE913240A18D040DA28451C07910DDF2677C324070099A54B08051C0D25DFC54CD7032408FB96733F08451C0ED7CB2A5FF563240A5AD8CCED58A51C03EFA8B09653B3240FC15AB9F198D51C0AF5D61DA093D3240DF790E95C78E51C0C78D75850E3B32402D21CACFFB9051C0FF2A1CBFF43D3240F3EE5C5EAB9251C0876AC5BA723E324092737454A89551C00DD38DFB943B32409A2D58ACCF9A51C03618DEF0F03D32402B0BDA7FF49B51C01EB36889FE37324083A5D0E205A051C0864566AF8033324063F7AF12D7A151C02B763B53A33E32408E80A07F1EA451C061E380864541324055DA69F926A551C060D0DF51574A3240C7667913BBA351C01763D40E105E324010D2A454B5A551C061576850FF6A3240F7E09338C8A951C00B2FA644F26F32405FC7C37FEFAC51C07597798DB56D32402CB4266AFCAD51C0F6B998D84D5E324052539EB1BEB051C0C15938BA2E5B32408EB8611DE9B351C02D21536E03603240),
	(12, 'ZONA SUROESTE\r\n', '', _binary '');
/*!40000 ALTER TABLE `dashboard_region` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.django_content_type: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(8, 'admin', 'logentry'),
	(10, 'auth', 'group'),
	(9, 'auth', 'permission'),
	(11, 'auth', 'user'),
	(12, 'contenttypes', 'contenttype'),
	(1, 'dashboard', 'category'),
	(2, 'dashboard', 'indicator'),
	(3, 'dashboard', 'indicatorcategory'),
	(4, 'dashboard', 'indicatordata'),
	(5, 'dashboard', 'indicatortype'),
	(6, 'dashboard', 'office'),
	(7, 'dashboard', 'region'),
	(13, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.django_migrations: ~14 rows (aproximadamente)
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
	(15, 'dashboard', '0002_auto_20170801_1454', '2017-08-01 18:54:14.151303');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


-- Volcando estructura para tabla audisoft.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla audisoft.django_session: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


-- Volcando estructura para vista audisoft.incidents_by_category
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `incidents_by_category` (
	`key` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`amount` DECIMAL(32,2) NULL,
	`type` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista audisoft.incidents_by_region
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `incidents_by_region` (
	`key` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`amount` DECIMAL(32,2) NULL,
	`type` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista audisoft.indicators_behaviour_last_y
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `indicators_behaviour_last_y` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`office_id` INT(11) NOT NULL,
	`office` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`month` INT(2) NULL,
	`amount` DECIMAL(10,2) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista audisoft.top_ten_indicator
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `top_ten_indicator` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`amount` DECIMAL(32,2) NULL,
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista audisoft.top_ten_offices
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `top_ten_offices` (
	`key` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`amount` DECIMAL(32,2) NULL,
	`type` INT(11) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista audisoft.incidents_by_category
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `incidents_by_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `incidents_by_category` AS select categories.id 'key', categories.name as 'name', sum(indicator_data.amount) as 'amount', indicator_data.indicator_type_id as 'type'

from dashboard_indicatordata indicator_data

join dashboard_indicator indicator
 	on indicator.id = indicator_data.indicator_id

join dashboard_indicatorcategory category_indicators
 	on category_indicators.indicator_id = indicator.id

join dashboard_category categories
 	on categories.id = category_indicators.category_id

group by category_indicators.category_id

order by sum(indicator_data.amount) desc , indicator_data.indicator_type_id ;


-- Volcando estructura para vista audisoft.incidents_by_region
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `incidents_by_region`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `incidents_by_region` AS select r.id as 'key', r.name as 'name', sum(id.amount) as 'amount', id.indicator_type_id as 'type'
from dashboard_office o
join dashboard_region r on o.region_id = r.id
join dashboard_indicatordata id on id.office_id = o.id
group by r.id, id.indicator_type_id ;


-- Volcando estructura para vista audisoft.indicators_behaviour_last_y
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `indicators_behaviour_last_y`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `indicators_behaviour_last_y` AS select i.id, i.name, id.office_id, o.name office, month(id.load_date) month, id.amount
from dashboard_indicator i
join dashboard_indicatordata id on i.id = id.indicator_id
join dashboard_office o on id.office_id = o.id
where  year(id.load_date) = year(now())
group by i.id, id.office_id, month(id.load_date)
order by i.id, id.office_id, id.load_date ;


-- Volcando estructura para vista audisoft.top_ten_indicator
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `top_ten_indicator`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `top_ten_indicator` AS select i.id,i.name , sum(id.amount) as 'amount', it.name as 'type'
from dashboard_indicatordata id
join dashboard_indicator i on i.id = id.indicator_id
join dashboard_indicatortype it on it.id = id.indicator_type_id
group by id.indicator_id, id.indicator_type_id
order by sum(id.amount) desc
limit 4 ;


-- Volcando estructura para vista audisoft.top_ten_offices
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `top_ten_offices`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `top_ten_offices` AS SELECT o.code as 'key', o.name, SUM(id.amount) AS 'amount', id.indicator_type_id AS 'type'
FROM  dashboard_indicatordata id
JOIN  dashboard_office o ON o.id = id.id
GROUP BY id.office_id, id.indicator_type_id
ORDER BY SUM(ID.AMOUNT)  desc ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
