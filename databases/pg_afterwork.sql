-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2021 at 11:15 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pg_afterwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `id_rubrique` int(11) NOT NULL,
  `id_employe` int(11) NOT NULL,
  `nom` text NOT NULL,
  `contenu` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `description`) VALUES
(1, 'Racine', 'test'),
(2, 'Infusion vrac', 'df'),
(3, 'Infusion vrac', 'test'),
(4, 'Root', 'testroot'),
(5, 'Boutique', 'dgf'),
(6, 'Home', 'fg'),
(7, 'Infusion', 'fg'),
(8, 'Infusion', ''),
(9, 'Infusettes', ''),
(10, 'Infusette triangle', ''),
(11, 'Thé', ''),
(12, 'Thé', ''),
(13, 'Café', ''),
(14, 'Café vert', ''),
(15, 'Infusettes', ''),
(16, 'Thé triangle', ''),
(17, 'Thé vrac', ''),
(18, 'Thé vrac', ''),
(19, 'Café capsule', ''),
(20, 'Café capsule', 'y'),
(21, 'Café grain', 'y'),
(22, 'Café grain', 'y'),
(23, 'Café grain & moulu', 'y'),
(24, 'Café moulu', 'y'),
(25, 'Rooibos', 'y'),
(26, 'Rooibos', 'y'),
(27, 'Accompagnements', 'y'),
(28, 'Accompagnements', 'y'),
(29, 'Machine & Accessoire', 'y'),
(30, 'Matériel', 'y'),
(31, 'Les Chocolats de Damien Benetot', 'y'),
(32, 'Chocolat Damien Benetot', 'y'),
(33, 'Coffret', 'y'),
(34, 'Coffret', 'y'),
(35, 'Pâques - Moulage', 'y'),
(36, 'Pâques - Moulage', 'y'),
(37, 'Chocolats, macarons et divers', 'y'),
(38, 'Chocolat', 'y'),
(39, 'Epicerie', 'y'),
(40, 'Chocolat & Confiserie', 'y'),
(41, 'Confiseries', 'y'),
(42, 'Confiseries', 'y'),
(43, 'Thé & Infusion', 'y'),
(44, 'Thé & Infusion', 'y'),
(45, 'Vrac', 'y'),
(46, 'Vrac', 'y'),
(47, 'Sachet', 'y'),
(48, 'Sachet', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `email` text NOT NULL,
  `adresse` text NOT NULL,
  `code_postal` text NOT NULL,
  `ville` text NOT NULL,
  `tel` text NOT NULL,
  `password` text NOT NULL,
  `inscritNewsletter` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `id_declinaison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `titre` text NOT NULL,
  `contenu` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `declinaison`
--

CREATE TABLE `declinaison` (
  `id_declinaison` int(11) NOT NULL,
  `nom` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `declinaison`
--

INSERT INTO `declinaison` (`id_declinaison`, `nom`, `description`) VALUES
(13, '250 g', 'dsfg'),
(14, 'Filtre', 'wsfgwfdg'),
(15, 'Piston', 'wswdfg'),
(16, 'Italienne', 'wdfgsd'),
(17, 'Espresso', 'No description'),
(18, '500 g', 'No description'),
(19, '1 kg', 'No description'),
(20, '15', 'No description'),
(21, 'Chocolat noir', 'No description'),
(22, 'Chocolat lait', 'No description'),
(23, '12', 'No description'),
(24, '20', 'No description'),
(25, '30', 'No description'),
(26, '16', 'No description'),
(27, '25', 'No description'),
(28, '40 g', 'No description'),
(29, '125 g', 'No description'),
(30, '650 g', 'No description'),
(31, 'Chocolat noir', 'No description'),
(32, 'Chocolat lait', 'No description'),
(33, 'sachet 100 g', 'No description'),
(34, 'boîte 100 g ', 'No description'),
(35, 'Grain', 'No description'),
(36, 'Boîte 100 g ', 'No description'),
(37, 'Sachet 100g', 'No description'),
(38, 'Boîte 50g', 'No description'),
(39, 'Sachet 50g', 'No description'),
(40, '15', 'No description'),
(41, '50', 'No description'),
(42, '100', 'No description');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `code_postal` text NOT NULL,
  `ville` text NOT NULL,
  `adresse` text NOT NULL,
  `date_embauche` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `id_tva` int(11) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `nom` text NOT NULL,
  `description` text NOT NULL,
  `pu_ht` float NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_tva`, `id_categorie`, `nom`, `description`, `pu_ht`, `images`) VALUES
(703, NULL, NULL, 'Symphonie - 15 infusettes', 'Raisin de Corynthe, Cynorrhodon, Hibiscus, Orange, Ananas, Papaye, arômes', 5.21327, NULL),
(704, NULL, NULL, 'Symphonie', 'Raisin de Corynthe, Cynorrhodon, Hibiscus, Orange, Ananas, Papaye, arômes', 5.21327, NULL),
(705, NULL, NULL, 'Cerise sauvage - 15 infusettes', 'Pomme, Cynorrhodon, Hibiscus, Cerise sauvage (3%), arômes', 5.21327, NULL),
(706, NULL, NULL, 'Cerise sauvage', 'Pomme, Cynorrhodon, Hibiscus, Cerise sauvage (3%), arômes', 5.21327, NULL),
(707, NULL, NULL, 'Digestive - 15 infusettes', 'Menthe Poivrée BIO plante, Mélisse BIO plante, Angélique BIO fruit, Anis Vert BIO fruit, Fenouil BIO fruit', 5.21327, NULL),
(708, NULL, NULL, 'Digestive', 'Menthe Poivrée BIO plante, Mélisse BIO plante, Angélique BIO fruit, Anis Vert BIO fruit, Fenouil BIO fruit', 5.21327, NULL),
(709, NULL, NULL, 'Au clair de la Lune - 15 infusettes', 'Oranger Doux feuille, Passiflore des Indes, Mélisse, Verveine Odorante, Aspérule Odorante', 5.21327, NULL),
(710, NULL, NULL, 'Infusion Au clair de la Lune', 'Oranger Doux feuille, Passiflore des Indes, Mélisse, Verveine Odorante, Aspérule Odorante', 5.21327, NULL),
(711, NULL, NULL, 'Camomille - 15 infusettes', 'Camomille Bio', 5.21327, NULL),
(712, NULL, NULL, 'Infusion Camomille bio', 'Camomille Bio', 5.21327, NULL),
(713, NULL, NULL, 'Infusion Tilleul - 15 infusettes', 'Tilleul', 5.21327, NULL),
(714, NULL, NULL, 'Infusion Tilleul', 'Tilleul', 5.21327, NULL),
(715, NULL, NULL, 'Infusion Verveine - 15 infusettes', 'Verveine Bio', 5.21327, NULL),
(716, NULL, NULL, 'Infusion Verveine Bio', 'Verveine Bio', 5.21327, NULL),
(717, NULL, NULL, 'La délicieuse - 15 infusettes', 'Verveine, Menthe Poivrée, Mélisse, Réglisse', 5.21327, NULL),
(718, NULL, NULL, 'La délicieuse', 'Verveine, Menthe Poivrée, Mélisse, Réglisse', 5.21327, NULL),
(719, NULL, NULL, 'Tisane de Noël - 15 infusettes', 'Cannelle, Orange Douce, Badiane, Hibiscus, Orange Amère, Cardamome', 5.21327, NULL),
(720, NULL, NULL, 'Tisane de Noël', 'Cannelle, Orange Douce, Badiane, Hibiscus, Orange Amère, Cardamome', 5.21327, NULL),
(721, NULL, NULL, 'Transit - 15 infusettes', '<p>Anis Vert, Menthe Douce, Citronnelle</p>', 5.21327, NULL),
(722, NULL, NULL, 'Transit', 'Anis Vert, Menthe Douce, Citronnelle', 5.21327, NULL),
(723, NULL, NULL, 'Zen', 'Oranger Doux pétale, Passiflore des Indes, Camomille Matricaire, Mélisse, Coquelicot', 5.21327, NULL),
(724, NULL, NULL, 'Zen', 'Oranger Doux pétale, Passiflore des Indes, Camomille Matricaire, Mélisse, Coquelicot', 5.21327, NULL),
(725, NULL, NULL, 'Infusion Camomille - 50g', '', 0, NULL),
(726, NULL, NULL, 'Infusion Camomille Bio 50g', '', 0, NULL),
(727, NULL, NULL, 'Infusion Fruits rouges - 100g', '', 0, NULL),
(728, NULL, NULL, 'Infusion Cassis', '', 0, NULL),
(729, NULL, NULL, 'Infusion Mangue - 100g', '', 0, NULL),
(730, NULL, NULL, 'Infusion Mangue', '', 0, NULL),
(731, NULL, NULL, 'Infusion Menthe - 50g', '', 0, NULL),
(732, NULL, NULL, 'Infusion Menthe Poivrée Bio 50g', '', 0, NULL),
(733, NULL, NULL, 'Thé noir caramel beurre salé - 100g', '<p style=\"text-align:justify;\"><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Du caramel fondant et doux accompagné d\'un soupçon de sel de perles africaines ajoutés aux morceaux de crème et d\'amandes... Il n\'en fallait pas plus pour inventer cette noble création gourmande.</span></p>', 0, NULL),
(734, NULL, NULL, 'Thé noir caramel beurre salé', '', 0, NULL),
(735, NULL, NULL, 'Darjeeling First Flush - 100g', '<p>Signifiant \"pays des orages\" en langue tibétaine. Plantation de thé noir issue de la région d\'Inde portant le même nom, elle est la seule à bénéficier d\'une Indication Géographique Protégée (IGP) pour lutter contre les nombreuses contrefaçons existantes.</p>\n<p>Le thé peut être récolté jusqu\'à 4 fois par an, celle du printemps, la première récolte, ou \"First Flush\" est très attendue des amateurs qui la qualifient de \"Champagne du thé\".</p>\n<p>Elle offre un thé léger et délicat aux notes fraîches et intenses, merveilleusement élaboré et présentant un caractère frais, légèrement épicé. </p>', 0, NULL),
(736, NULL, NULL, 'Darjeeling First Flush. Leaf Blend', '', 0, NULL),
(737, NULL, NULL, 'English Breakfast - 100g', '<p style=\"text-align:justify;\">Ce mélange So British de culture biologique contrôlée est composé essentiellement de thés Assam. D\'abord réservée à l\'élite anglaise, la consommation du \"five o\'clock tea\" se démocratise au XIXe siècle. Depuis l\'époque coloniale, les Britanniques ont pour habitude de consommer des thés noirs plus corsés le matin comme ce ENGLISH BREAKFAST. Ce thé, à la fois puissant et aromatique, révèle une tasse foncée d\'un brun cuivré et un bouquet plein et épicé. </p>', 0, NULL),
(738, NULL, NULL, 'English Breakfast', '', 0, NULL),
(739, NULL, NULL, 'Roiboos bergamote - 100g', '', 0, NULL),
(740, NULL, NULL, 'Roiboos bergamote', '', 0, NULL),
(741, NULL, NULL, 'Rooibos aloe vera melon', '', 0, NULL),
(742, NULL, NULL, 'Rooibos Aloe verra melon', '', 0, NULL),
(743, NULL, NULL, 'Rooibos Cranberry vanille - 100g', '', 0, NULL),
(744, NULL, NULL, 'Rooibos Cranberry vanille', '', 0, NULL),
(745, NULL, NULL, 'Rooibos Rhubarbe framboise - 100g', '', 0, NULL),
(746, NULL, NULL, 'Rooibos Rhubarbe framboise', '', 0, NULL),
(747, NULL, NULL, 'Thé blanc Chine - 50g', '<h3>Ce thé du Yunnan est cultivé à une altitude comprise entre 1300 et 2000m d\'altitude et à des températures allant de 12 à 23°C. Ses grandes feuilles ouvertes vert clair et la large proportion de pointes argentées laissent un bouquet doux et fleuri en bouche. La liqueur a un parfum fleuri dont la couleur rappelle le lever du soleil.<br />Le THE BLANC est celui qui nécessite le temps d\'infusion le moins long, l\'eau la moins chaude et est celui qui subit le moins de transformation.</h3>', 0, NULL),
(748, NULL, NULL, 'Thé blanc chine (50g)', '', 0, NULL),
(749, NULL, NULL, 'Thé noir Ceylan - 100g', '<p>Jusqu’au milieu du XIXème siècle, on consommait à Ceylan exclusivement du café. Cependant, dans les années 1850, un parasite ravagea les plantations de café de l’île, ce qui obligea les cultivateurs anglais à recourir à une autre plante : les théiers. C’est ainsi que le thé fit son apparition au Sri Lanka.</p>\n<p>Ce Ceylan organique provient de la vallée de Bogawantalwa dans l\'ouest du Sri Lanka. Les feuilles courtes et foncées d\'un brun rouillé développent une tasse brillante de couleur cuivrée et une infusion rouge vif. Le bouquet vous impressionnera par son goût plein et un arôme doux et épicé, qui laisse un arrière-goût très riche.  </p>', 0, NULL),
(750, NULL, NULL, 'Thé noir Ceylan', '', 0, NULL),
(751, NULL, NULL, 'Thé noir Chine - 100g', '<p style=\"text-align:justify;\"><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">La qualité supérieure de ce thé noir du Yunnan se présente magnifiquement avec beaucoup de grandes pointes de feuilles brun doré et une infusion brun cuivré foncé avec un goût bien équilibré et des notes légèrement douces et épicées. Elle vous laissera avec une touche finale douce et légèrement fumée. </span></p>', 0, NULL),
(752, NULL, NULL, 'Thé noir Chine', '', 0, NULL),
(753, NULL, NULL, 'Thé noir fruits rouges - 100g', '<p style=\"text-align:justify;\"><span id=\"s2_1\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">L’ardeur du printemps se transforme en amour estival.</span><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;background-color:#f7f7f7;\"> </span><span id=\"s2_3\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Les fleurs de pavot, le souci et la rose sont les annonciateurs de l’été.</span><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;background-color:#f7f7f7;\"> </span><span id=\"s2_4\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Le bonheur peut durer un moment de plus sur cette prairie fruitée et douce de fleurs. </span></p>\n<p></p>\n<p></p>\n<p></p>', 0, NULL),
(754, NULL, NULL, 'Thé noir fruits rouges', '', 0, NULL),
(755, NULL, NULL, 'Thé noir Inde - 100g', '<p><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Ce thé noir du Sud de l\'Inde du jardin Thiashola a une saveur fraîche et légèrement tranchante avec un certain corps. Une feuille multicolore et inégale avec des tâches vertes. La couleur de coupe d\'un rouge cuivre offre un parfum de fleurs fraîches. </span></p>', 0, NULL),
(756, NULL, NULL, 'Thé noir Inde', '', 0, NULL),
(757, NULL, NULL, 'Thé noir mangue - 100g', '', 0, NULL),
(758, NULL, NULL, 'Thé noir Mangue', '', 0, NULL),
(759, NULL, NULL, 'Thé noir orange - 100g', '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;background-color:#ffffff;\">Aussi rafraîchissant et vitaminé qu\'un jus d\'orange pressé, ce thé noir, frais et vif, sera votre allié pour démarrer votre journée du bon pied ! </span></p>', 0, NULL),
(760, NULL, NULL, 'Thé noir orange', '', 0, NULL),
(761, NULL, NULL, 'Thé noir pêche - 100g', '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;background-color:#ffffff;\">Ce thé de Ceylan doux décoré avec les couleurs de différentes fleurs et le bleu profond et scintillant de fleurs de bleuet est une promesse de détente complète. Cet arôme est composé des fruits les plus exotiques au monde et d\'un soupçon de crème douce qui fait errer vos pensées, vous permettant de profiter d’un moment de relaxation parfait et de recueillir de nouvelles forces. </span></p>', 0, NULL),
(762, NULL, NULL, 'Thé noir péche', '', 0, NULL),
(763, NULL, NULL, 'Thé vert citron jasmin - 100g', '', 0, NULL),
(764, NULL, NULL, 'Thé vert citron jasmin', '', 0, NULL),
(765, NULL, NULL, 'Thé vert fraise litchi - 100g', '', 0, NULL),
(766, NULL, NULL, 'Thé vert fraise leetchi', '', 0, NULL),
(767, NULL, NULL, 'Thé vert Inde - 100g', '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Au cours des dernières années, la plantation Nagri Farm, qui se trouve dans la vallée de Rongbong, a acquis une réputation exceptionnelle pour la production de thé vert. La plantation est répartie sur une superficie de 571 hectares à des altitudes allant jusqu’à 1400 m et a une production annuelle d’environ 190000 kg de thé. Les buissons poussent lentement dans l’air frais de la montagne et l’arôme et les feuilles peuvent se développer parfaitement dans ces conditions idéales. La feuille verte régulière a quelques pointes argentées et présente son caractère classique, rond et doux dans une tasse jaune citron. </span></p>', 0, NULL),
(768, NULL, NULL, 'Thé vert Inde', '', 0, NULL),
(769, NULL, NULL, 'Thé vert Japon - 50g', '', 0, NULL),
(770, NULL, NULL, 'Thé vert Japon (50g)', '', 0, NULL),
(771, NULL, NULL, 'Thé vert jasmin - 100g', '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Avec une tasse légèrement jaune et le parfum expressif et typique de jasmin ainsi qu\'une légère note fruitée-acidulée, ce thé au jasmin est un compagnon idéal pour chaque repas et un vrai désaltérant. Selon la qualité de l’eau, le thé peut être infusé plus d’une fois</span></p>', 0, NULL),
(772, NULL, NULL, 'Thé vert jasmin', '', 0, NULL),
(773, NULL, NULL, 'Thé vert mangue ananas - 100g', '', 0, NULL),
(774, NULL, NULL, 'Thé vert mangue ananas', '', 0, NULL),
(775, NULL, NULL, 'Thé vert poire - 100g', '', 0, NULL),
(776, NULL, NULL, 'Thé vert poire', '', 0, NULL),
(777, NULL, NULL, 'Thé vert Vanille jasmin - 100g', '', 0, NULL),
(778, NULL, NULL, 'Thé vert Vanille jasmin', '', 0, NULL),
(779, NULL, NULL, 'Thé vert Vietnam - 100g', '', 0, NULL),
(780, NULL, NULL, 'Thé vert vietnam', '', 0, NULL),
(781, NULL, NULL, 'Brésil', '<p>Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.</p>', 0, NULL),
(782, NULL, NULL, 'Brésil', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.', 0, NULL),
(783, NULL, NULL, 'Ethiopie Yrgacheffe', '<p>Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse</p>', 0, NULL),
(784, NULL, NULL, 'Ethiopie Yrgacheffe', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse', 0, NULL),
(785, NULL, NULL, 'Mexique Décaféiné', '<p>Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio</p>', 0, NULL),
(786, NULL, NULL, 'Mexique Décaféiné', 'Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio', 0, NULL),
(787, NULL, NULL, 'Pérou El Palto', '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, NULL),
(788, NULL, NULL, 'Pérou El Palto', '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, NULL),
(789, NULL, NULL, 'Blend de la Brûlerie', '<p>Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs</p>', 0, NULL),
(790, NULL, NULL, 'Blend de la Brûlerie', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs', 0, NULL),
(791, NULL, NULL, 'Mélange italien', '<p>Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal</p>', 0, NULL),
(792, NULL, NULL, 'Mélange italien', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal', 0, NULL),
(793, NULL, NULL, 'Colombie', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves', 0, NULL),
(794, NULL, NULL, 'Colombie', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves', 0, NULL),
(795, NULL, NULL, 'Brésil', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.', 0, NULL),
(796, NULL, NULL, 'Brésil', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.', 0, NULL),
(797, NULL, NULL, 'Ethiopie Yrgacheffe', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse', 0, NULL),
(798, NULL, NULL, 'Ethiopie Yrgacheffe', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse', 0, NULL),
(799, NULL, NULL, 'Ethiopie Guji', '<p>Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café</p>', 0, NULL),
(800, NULL, NULL, 'Guji Ethiopie naturel', 'Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café', 0, NULL),
(801, NULL, NULL, 'Mexique Décaféiné', 'Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio', 0, NULL),
(802, NULL, NULL, 'Mexique Décaféiné', 'Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio', 0, NULL),
(803, NULL, NULL, 'Pérou El Palto', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant  la construction d\'école Label : Bio', 0, NULL),
(804, NULL, NULL, 'Pérou El Palto', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant  la construction d\'école Label : Bio', 0, NULL),
(805, NULL, NULL, 'Blend de la Brûlerie', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs', 0, NULL),
(806, NULL, NULL, 'Blend de la Brûlerie', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs', 0, NULL),
(807, NULL, NULL, 'Mélange italien', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal', 0, NULL),
(808, NULL, NULL, 'Mélange italien', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal', 0, NULL),
(809, NULL, NULL, 'Colombie', '<p>Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves</p>', 0, NULL),
(810, NULL, NULL, 'Colombie', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves', 0, NULL),
(811, NULL, NULL, 'Brésil', '<p>Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.</p>', 0, NULL),
(812, NULL, NULL, 'Brésil', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.', 0, NULL),
(813, NULL, NULL, 'Ethiopie Yrgacheffe', '<p>Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse</p>', 0, NULL),
(814, NULL, NULL, 'Ethiopie Yrgacheffe', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse', 0, NULL),
(815, NULL, NULL, 'Guji Ethiopie naturel', '<p>Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café</p>', 0, NULL),
(816, NULL, NULL, 'Guji Ethiopie naturel', 'Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café', 0, NULL),
(817, NULL, NULL, 'Mexique Décaféiné', '<p>Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio</p>', 0, NULL),
(818, NULL, NULL, 'Mexique Décaféiné', 'Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio', 0, NULL),
(819, NULL, NULL, 'Pérou El Palto', '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, NULL),
(820, NULL, NULL, 'Pérou El Palto', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant  la construction d\'école Label : Bio', 0, NULL),
(821, NULL, NULL, 'Blend de la Brûlerie', '<p>Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs</p>', 0, NULL),
(822, NULL, NULL, 'Blend de la Brûlerie', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs', 0, NULL),
(823, NULL, NULL, 'Mélange italien', '<p>Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal</p>', 0, NULL),
(824, NULL, NULL, 'Mélange italien', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal', 0, NULL),
(825, NULL, NULL, 'Infusion Noix de coco aloé vera - 100g', '', 0, NULL),
(826, NULL, NULL, 'Infusion Noix de coco aloé vera', '', 0, NULL),
(827, NULL, NULL, 'Infusion Pina Colada -100g', '', 0, NULL),
(828, NULL, NULL, 'Infusion Pina Colada', '', 0, NULL),
(829, NULL, NULL, 'Infusion Poire cannelle - 100g', '', 0, NULL),
(830, NULL, NULL, 'Infusion Poire cannelle', '', 0, NULL),
(831, NULL, NULL, 'Infusion Tilleul - 50g', '', 0, NULL),
(832, NULL, NULL, 'Infusion Tilleul Bio 50g', '', 0, NULL),
(833, NULL, NULL, 'Thé blanc Bai Mu Dan - 15 infusettes', 'Thé blanc de Chine', 5.21327, NULL),
(834, NULL, NULL, 'Thé blanc Bai Mu Dan', 'Thé blanc de Chine', 5.21327, NULL),
(835, NULL, NULL, 'Earl Grey - 15 infusettes', 'Thé noir romatisé à la bergamote', 5.21327, NULL),
(836, NULL, NULL, 'Thé Earl Grey', 'Thé noir romatisé à la bergamote', 5.21327, NULL),
(837, NULL, NULL, 'Lendemain de fête - 15 infusettes', 'Thé Noir, Badiane, Tilleul Aubier, Gingembre, Réglisse', 5.21327, NULL),
(838, NULL, NULL, 'Thé noir Lendemain de fête', 'Thé Noir, Badiane, Tilleul Aubier, Gingembre, Réglisse', 5.21327, NULL),
(839, NULL, NULL, 'English Breakfast - 15 infusettes', 'Thé noir', 5.21327, NULL),
(840, NULL, NULL, 'Thé noir mélange anglais', 'Thé noir', 5.21327, NULL),
(841, NULL, NULL, 'Secret d\'Antan - 15 infusettes', 'Thé noir, flocons de sucre, Pomme, Amande, arômes, pétale de Rose', 5.21327, NULL),
(842, NULL, NULL, 'Secret d\'Antan', 'Thé noir, flocons de sucre, Pomme, Amande, arômes, pétale de Rose', 5.21327, NULL),
(843, NULL, NULL, 'Peps - 15 infusettes', 'Maté, Cynorrhodon, Eleuthérocoque, Gingembre, Sarriette, Hibiscus', 5.21327, NULL),
(844, NULL, NULL, 'Peps', 'Maté, Cynorrhodon, Eleuthérocoque, Gingembre, Sarriette, Hibiscus', 5.21327, NULL),
(845, NULL, NULL, 'Sencha douce saveur - 15 infusettes', 'Thé vert Sencha (70%), Raisin de Corinthe, Pétale de rose, arômes,  Ananas, Papaye, Fraise, Framboise', 5.21327, NULL),
(846, NULL, NULL, 'Sencha douce saveur', 'Thé vert Sencha (70%), Raisin de Corinthe, Pétale de rose, arômes,  Ananas, Papaye, Fraise, Framboise', 5.21327, NULL),
(847, NULL, NULL, 'Thé vert bio - 15 infusettes', 'Thé vert Bio', 5.21327, NULL),
(848, NULL, NULL, 'Thé vert bio', 'Thé vert Bio', 5.21327, NULL),
(849, NULL, NULL, 'Thé vert citron - 15 infusettes', 'Thé vert (90%), Citron écorce (10%)', 5.21327, NULL),
(850, NULL, NULL, 'Thé vert citron', 'Thé vert (90%), Citron écorce (10%)', 5.21327, NULL),
(851, NULL, NULL, 'Detox Automne hiver - 15 infusettes', 'Thé vert feuille, Chicorée feuille, Citron écorce, Chiendent Officinal racine', 5.21327, NULL),
(852, NULL, NULL, 'Detox Automne hiver', 'Thé vert feuille, Chicorée feuille, Citron écorce, Chiendent Officinal racine', 5.21327, NULL),
(853, NULL, NULL, 'Thé vert menthe - 15 infusettes', 'Thé vert (60%), Menthe Douce (40%)', 5.21327, NULL),
(854, NULL, NULL, 'Thé vert menthe', 'Thé vert (60%), Menthe Douce (40%)', 5.21327, NULL),
(855, NULL, NULL, 'Thé vert pêche - 100g', '', 0, NULL),
(856, NULL, NULL, 'Thé vert pêche', '', 0, NULL),
(857, NULL, NULL, 'Thé vert mirabelle - 100g', '', 0, NULL),
(858, NULL, NULL, 'Thé vert Mirabelle', '', 0, NULL),
(859, NULL, NULL, 'Thé vert figue baies rouges - 100g', '', 0, NULL),
(860, NULL, NULL, 'Thé vert figue baies', '', 0, NULL),
(861, NULL, NULL, 'Thé vert pomme gingembre - 100g', '', 0, NULL),
(862, NULL, NULL, 'Thé vert Gingembre pomme', '', 0, NULL),
(863, NULL, NULL, 'Thé vert cerise - 100g', '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Ce thé vert est une invitation au voyage... L\'excellente base abondamment décorée de pétales de rose, et son parfum fruité de cerise n\'est pas sans rappeler les magnifiques jardins japonais durant la saison de floraison des cerisiers... </span></p>', 0, NULL),
(864, NULL, NULL, 'Thé vert cerise', '', 0, NULL),
(865, NULL, NULL, 'Oolong Vietnam - 100g', '<h3 class=\"PreformattedText\" style=\"text-align:justify;\"><span style=\"color:#9b9b9b;font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">Thé désigné sous le nom de « bleu vert » à mi chemin entre le thé vert non oxydé et le thé noir </span><span style=\"font-size:14.6667px;\">complétement</span><span style=\"font-size:11pt;\"> oxydé. Qualifié de thé semi-oxydé, faible en théine il sera à déguster tout au long de la journée. Issu de la ville de Bao Loc, où sont produits des Oolong en utilisant les méthodes taïwanaises anciennes. Les </span></span><span style=\"color:#9b9b9b;\"><span style=\"font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">feuilles</span></span><span style=\"font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\"> </span></span></span><span style=\"color:#9b9b9b;font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">de thé fraîchement cueillies sont séchées puis écrasées pour commencer la fermentation. Après avoir atteint le niveau de fermentation souhaité, le thé est séché à basse température. La tasse verte rayonnante caresse les papilles de chacun avec sa saveur fleurie et sucrée. </span></span></h3>', 0, NULL),
(866, NULL, NULL, 'Thé Oolong Vietnam (50g)', '', 0, NULL),
(867, NULL, NULL, 'Honduras', '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, NULL),
(868, NULL, NULL, 'Honduras', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café', 0, NULL),
(869, NULL, NULL, 'Honduras', '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, NULL),
(870, NULL, NULL, 'Honduras', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café', 0, NULL),
(871, NULL, NULL, 'Honduras', '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, NULL),
(872, NULL, NULL, 'Honduras', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café', 0, NULL),
(873, NULL, NULL, 'Orangette chocolat noir  - 100g', '', 5.30806, NULL),
(874, NULL, NULL, 'Orangette chocolat noir  - 100g', '', 5.30806, NULL),
(875, NULL, NULL, 'Caramel à l\'O - 230g', '<p>Elaboré par la Confiserie Lou Sucrèu St Haon-le-Châtel avec l\'eau Thermale de Salins les Bains, Jura</p>\n<p>Ingrédients : crème, sucre, glucose, beurre, sel 1,2%.</p>\n<p><strong>Sans huile de palme</strong></p>', 5.59242, NULL),
(876, NULL, NULL, 'Caramel à tartiner à l\'eau de Salins les Bains - 230g', '', 5.59242, NULL),
(877, NULL, NULL, 'Nougatine amandes - 150g', '<p>Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p>Ingrédients : glucose, sucre, <span>amandes</span>, beurre</p>', 6.54028, NULL),
(878, NULL, NULL, 'Nougatine - 150g', '', 6.54028, NULL),
(879, NULL, NULL, 'Miel forêt - 250g', '<p>Miel du JURA - 39190 Val-Sonnette</p>', 7.109, NULL),
(880, NULL, NULL, 'Miel Toutes fleurs - 250g', '', 7.109, NULL),
(881, NULL, NULL, 'Machine Automatique Mélitta Solo Noir', 'Machine automatique avec moulin intégré, réservoir d\'eau + 1kg de café offert Pérou Bio Commerce équitable', 290.833, NULL),
(882, NULL, NULL, 'Machine Automatique Mélitta Solo Noir', 'Machine automatique avec moulin intégré, réservoir d\'eau + 1kg de café offert Pérou Bio Commerce équitable', 290.833, NULL),
(883, NULL, NULL, 'cafetière', 'Machine à café vendue avec 3 adaptateurs : Café moulu, Capsules Nespresso et Capsules Dolce Gusto. Une machine compact et facile d\'utilisation. Fournit avec un tampeur et une cuillère doseuse.', 65.8333, NULL),
(884, NULL, NULL, 'cafetière', 'Machine à café vendue avec 3 adaptateurs : Café moulu, Capsules Nespresso et Capsules Dolce Gusto. Une machine compact et facile d\'utilisation. Fournit avec un tampeur et une cuillère doseuse.', 65.8333, NULL),
(885, NULL, NULL, 'Nougatine noisettes - 150g', '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Ingrédients : glucose, sucre, <span>noisettes</span>, beurre</p>', 6.54028, NULL),
(886, NULL, NULL, 'Nougatine noisettes - 150g', '', 6.54028, NULL),
(887, NULL, NULL, 'Nougatine sésame - 150g', '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Ingrédients : glucose, sucre, lin,  sésame, beurre</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\"><span>Traces possibles de fruits à coque</span></p>', 6.54028, NULL),
(888, NULL, NULL, 'Nougatine sésame - 150g', '', 6.54028, NULL),
(889, NULL, NULL, 'Miel Tilleul - 250g', '<p>Miel du JURA - 39190 Val-Sonnette</p>', 7.109, NULL),
(890, NULL, NULL, 'Miel Tilleul - 250g', '', 7.109, NULL),
(891, NULL, NULL, 'Miel acacia - 250g', '<p>Miel du JURA - 39190 Val-Sonnette</p>', 7.109, NULL),
(892, NULL, NULL, '', '', 7.109, NULL),
(893, NULL, NULL, 'Indonésie', '', 0, NULL),
(894, NULL, NULL, '', '', 0, NULL),
(895, NULL, NULL, 'Papouasie Nouvelle Guinée', '<p>Ce café a été récolté par 3113 petits exploitants agricoles travaillant avec Greenco Coffee et qui livrent leur production à la centrale de lavage de Nemba. Greenco achète les cerises de café aux exploitants plus cher que la moyenne des achats dans le secteur. </p>', 0, NULL),
(896, NULL, NULL, '', '', 0, NULL),
(897, NULL, NULL, 'Eau tonique nature', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE NATURE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs. </span></span></p>', 2.36967, NULL),
(898, NULL, NULL, '', '', 2.36967, NULL),
(899, NULL, NULL, 'Eau tonique concombre', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE CONCOMBRE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 2.36967, NULL),
(900, NULL, NULL, '', '', 2.36967, NULL),
(901, NULL, NULL, 'Eau tonique gingembre', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE GINGEMBRE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 2.36967, NULL),
(902, NULL, NULL, '', '', 2.36967, NULL),
(903, NULL, NULL, 'Eau tonique citron', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE CITRON HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 2.36967, NULL),
(904, NULL, NULL, '', '', 2.36967, NULL),
(905, NULL, NULL, 'Eau tonique fleur de sureau', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE FLEUR DE SUREAU HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 2.36967, NULL),
(906, NULL, NULL, '', '', 2.36967, NULL),
(907, NULL, NULL, 'Miel sapin - 250g', '<p>Miel du JURA - 39190 Val-Sonnette</p>', 7.109, NULL),
(908, NULL, NULL, '', '', 7.109, NULL),
(909, NULL, NULL, 'Miel fleurs sauvages - 250g', '<p>Miel du JURA - 39190 Val-Sonnette</p>', 7.109, NULL),
(910, NULL, NULL, '', '', 7.109, NULL),
(911, NULL, NULL, 'Cranberry enrobée - 120g', '<p>Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 4.2654, NULL),
(912, NULL, NULL, '', '', 4.2654, NULL),
(913, NULL, NULL, 'Guimauve vanille', '', 3.31754, NULL),
(914, NULL, NULL, '', '', 3.31754, NULL),
(915, NULL, NULL, 'Dragée fruitée - abricot 150g', '<p style=\"font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\"></p>\n<p style=\"font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>', 3.31754, NULL),
(916, NULL, NULL, '', '', 3.31754, NULL),
(917, NULL, NULL, 'Dragée fruitée - framboise 150g', '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 3.31754, NULL),
(918, NULL, NULL, '', '', 3.31754, NULL),
(919, NULL, NULL, 'Dragée fruitée - poire 150g', '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 3.31754, NULL),
(920, NULL, NULL, '', '', 3.31754, NULL),
(921, NULL, NULL, 'Dragée fruitée - assortiment 150g', '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 3.31754, NULL),
(922, NULL, NULL, '', '', 3.31754, NULL),
(923, NULL, NULL, 'Amande chocolat noir - 100g', '', 3.79147, NULL),
(924, NULL, NULL, '', '', 3.79147, NULL),
(925, NULL, NULL, 'Bille croustillante chocolat lait - 100g', '', 3.69668, NULL),
(926, NULL, NULL, '', '', 3.69668, NULL),
(927, NULL, NULL, 'Le Café Sigalas - 150g', '', 14.1232, NULL),
(928, NULL, NULL, '', '', 14.1232, NULL),
(929, NULL, NULL, 'Le Café Sigalas - 10 capsules', '', 6.63507, NULL),
(930, NULL, NULL, '', '', 6.63507, NULL),
(931, NULL, NULL, 'Filtre x100', '', 3.31754, NULL),
(932, NULL, NULL, '', '', 3.31754, NULL),
(933, NULL, NULL, 'Valrhona - Jivara 40%', '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Jivara, par sa douceur cacaotée et maltée, est un chocolat chaleureux comme les rayons dorés du soleil à l\'aube d\'un matin d\'été.</span></p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Développé en 1995, Valrhona fait évoluer les codes du chocolat au lait avec Jivara, premier chocolat au lait à proposer une telle force gustative, avec un véritable goût de cacao. Pour atteindre ce goût singulier, Jivara est issu d\'un assemblage complexe de profils aromatiques de cacaos typiques d\'Equateur et du Ghana. </span></p>', 0, NULL),
(934, NULL, NULL, '', '', 0, NULL),
(935, NULL, NULL, 'Valrhona - Dulcey 35%', '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Dulcey, par sa douceur biscuitée très légèrement salée et son goût de lait caramélisé, à ce don de nus renvoyer en enfance, de nousf aire voyager dans un tourbillon de souvenirs délicieux propres à chacun.</span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">En 2012, Valrhona invente la quatrième couleur de chocolat : le blond. Laissant du chocolat blanc au bain-marie trop longtemps, Frédéric Bau découvre un surprenant résultat, le chocolat est devenu blond et laisse échapper une douce odeur. Dulcey est une ode à la créativité et à l\'audace qui révolutionne le monde de la pâtisserie pour offrir de nouvelles émotions grâce à a couleur son goût et sa texture. </span></p>', 0, NULL),
(936, NULL, NULL, '', '', 0, NULL),
(937, NULL, NULL, 'Valrhona - Ivoire 35%', '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Les notes réconfortantes de lait cuit de chocolat blanc Ivoire font écho aux éclats de rire d\'enfants qui partagent ensemble leurs plus grands moments de bonheur. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Avec Ivoire, Valrhona se démarque de l\'univers traditionnel des chocolats blancs, grâce à sa note sucrée tout en légèreté et sa couleur subtilement nacrée. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Référence iconique, Ivoire est devenu le mot générique parmi les professionnels de la gastronomie pour désigner le chocolat blanc.</span></p>', 0, NULL),
(938, NULL, NULL, '', '', 0, NULL),
(939, NULL, NULL, 'Valrhona - Caraïbe 66%', '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Caraïbe, avec ses notes amères intenses et ses accents boisés et de fruits secs grillés, fait rêver à une danse envoûtante à l\'ombre des cacaoyers. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Référent des chocolats équilibrés depuis 1988, Caraïbe est issu d\'un assemblage complexe de profils aromatiques de cacaos typiques de République Dominicaine, Equateur, Jamaïque et Togo pour atteindre ce goût singulier. Caraïbe est ainsi nommé car il rend hommage à la diversité des îles Caraïbes, dont les fèves ont inspiré sa création. </span></p>', 0, NULL),
(940, NULL, NULL, '', '', 0, NULL),
(941, NULL, NULL, 'Thé noir Par Amour - 100g', '<p><span style=\"color:#ffffff;\">Un thé noir aux saveurs de cerise parsemé de pétales de rose et de cœur en sucre. </span></p>\n<p><span style=\"color:#ffffff;\">Une façon gourmande et délicate de dire</span> <strong><span style=\"color:#d0121a;\">JE T\'AIME</span> </strong><span style=\"color:#ffffff;\">à ceux qui sont chers à notre cœur... </span></p>\n<p><span style=\"color:#ffffff;\">A la fois fruité, parfumé et sucré ce thé saura mettre vos pailles en extase. Les pétales de rose qu\'il contient remplaceront volontiers le traditionnel bouquet de fleurs de la Saint Valentin... </span></p>', 0, NULL),
(942, NULL, NULL, '', '', 0, NULL),
(943, NULL, NULL, 'Valrhona - Oriado 60% 1kg', '<p>La douceur onctueuse et vanillée d\'Oriado invite à une sieste sur le sable chaud, avec la caresse enveloppante du soleil sur la peau. </p>\n<p>Créé en 2015, Oriado se distingue à la dégustation par sa légèreté et son équilibre. Issu de la gamme certifée, Oriado est l\'expression visible de l\'engagement de Valrhona, pour sa qualité et la traçabilité de la filière cacao. </p>\n<p>Oriado est réalisé exclusivement à partir des meilleures matières premières biologiques, issues du commerce équitable (certifié Fairtrade/ Max Havelaar et issu de l\'Agriculture Biologique)</p>', 33.0806, NULL),
(944, NULL, NULL, '', '', 33.0806, NULL),
(945, NULL, NULL, 'GEISHA DU PANAMA - 150g', '', 14.1232, NULL),
(946, NULL, NULL, '', '', 14.1232, NULL),
(947, NULL, NULL, 'Thé vert citron - 15 infusettes', '', 5.21327, NULL),
(948, NULL, NULL, '', '', 5.21327, NULL),
(949, NULL, NULL, 'Delonghi Dinamica 3515B', '<p>Système Boissons lactées : Buse vapeur simple</p>\n<p>Boissons réalisable : Expresso, Café Long (Lungo), Café, Café Filtre (basse pression), Mousse de lait manuel, Eau chaude</p>\n<p>Trappe à moulu : Oui</p>\n<p>Nombre de réglages du Broyeur : 13 positions</p>\n<p>Réglage intensité café : 5</p>\n<p>Température de percolation programmable : 3 niveaux</p>\n<p>Interface : Touches tactiles</p>\n<p>Type d\'écran : Écran à texte LCD</p>\n<p>Type de Broyeur<span style=\"white-space:pre;\"> </span>Acier</p>\n<p>2 cafés simultanés : Oui</p>\n<p>Rinçage des buses : Automatique</p>\n<p>Entretien du Groupe Café<span style=\"white-space:pre;\"> </span>Manuel : groupe café extractible</p>\n<p>Pression de la pompe : 15 Bars</p>\n<p>Garantie : 3 ans</p>\n<p>Coloris : Noir</p>\n<p>Matériau(x) : ABS Mat</p>\n<p>Volume du réservoir à eau : 1.8 l</p>\n<p>Volume du bac à grain : 300 g</p>\n<p>Nombre de bac à grains  : 1 bac</p>\n<p>Volume du bac à marcs : 14 galettes</p>\n<p>Dimensions (LxPxH) : 236 x 429 x 348 mm</p>\n<p>Poids<span style=\"white-space:pre;\"> </span> : 9.5 Kg</p>\n<p>Puissance (en Watts) : 1450 W</p>\n<p>Capacité journalière : jusqu\'à 30 cafés/jour</p>', 472.986, NULL),
(950, NULL, NULL, '', '', 472.986, NULL),
(951, NULL, NULL, 'Infuseur Gladys', '', 9.47867, NULL),
(952, NULL, NULL, '', '', 9.47867, NULL),
(953, NULL, NULL, 'Infuseur hippopotame', '', 7.58294, NULL),
(954, NULL, NULL, '', '', 7.58294, NULL),
(955, NULL, NULL, 'Dragée Reyanud - Mûre 150g', '', 3.31754, NULL),
(956, NULL, NULL, '', '', 3.31754, NULL),
(957, NULL, NULL, 'Amande crème de nougat - 140g', '', 3.31754, NULL),
(958, NULL, NULL, '', '', 3.31754, NULL),
(959, NULL, NULL, 'Détartrant Delonghi', '', 12.3223, NULL),
(960, NULL, NULL, '', '', 12.3223, NULL),
(961, NULL, NULL, 'Cartouche filtrante Delonghi', '', 12.3223, NULL),
(962, NULL, NULL, '', '', 12.3223, NULL),
(963, NULL, NULL, 'Rooibos caramel - 100g', '', 0, NULL),
(964, NULL, NULL, '', '', 0, NULL),
(965, NULL, NULL, 'Earl Grey - 15 infusettes', '', 5.21327, NULL),
(966, NULL, NULL, '', '', 5.21327, NULL),
(967, NULL, NULL, 'Secret d\'Antan - 15 infusettes', '', 5.21327, NULL),
(968, NULL, NULL, '', '', 5.21327, NULL),
(969, NULL, NULL, 'Peps - 15 infusettes', '', 5.21327, NULL),
(970, NULL, NULL, '', '', 5.21327, NULL),
(971, NULL, NULL, 'Gyokuro - 100g', '', 0, NULL),
(972, NULL, NULL, '', '', 0, NULL),
(973, NULL, NULL, 'Honeybush chocolat - 100g', '', 0, NULL),
(974, NULL, NULL, '', '', 0, NULL),
(975, NULL, NULL, 'Maté latino - 100g', '', 0, NULL),
(976, NULL, NULL, '', '', 0, NULL),
(977, NULL, NULL, 'Infusion Yetchuno - 100g', '', 0, NULL),
(978, NULL, NULL, '', '', 0, NULL),
(979, NULL, NULL, 'Croisière sur le Nil - 100g', '', 0, NULL),
(980, NULL, NULL, '', '', 0, NULL),
(981, NULL, NULL, 'Infusion Tout en douceur - 50g', '', 0, NULL),
(982, NULL, NULL, '', '', 0, NULL),
(983, NULL, NULL, 'Namas\'thé 100g', '', 0, NULL),
(984, NULL, NULL, '', '', 0, NULL),
(985, NULL, NULL, 'Infusion d\'antan - 100g', '', 0, NULL),
(986, NULL, NULL, '', '', 0, NULL),
(987, NULL, NULL, 'Thé blanc grenade cassis aloe 100g', '', 0, NULL),
(988, NULL, NULL, '', '', 0, NULL),
(989, NULL, NULL, 'Thé blanc framboise tonka 50g', '', 0, NULL),
(990, NULL, NULL, '', '', 0, NULL),
(991, NULL, NULL, 'L\'ambroisie du dragon 100g', '', 0, NULL),
(992, NULL, NULL, '', '', 0, NULL),
(993, NULL, NULL, 'Maté della Melagrana - 100g', '', 0, NULL),
(994, NULL, NULL, '', '', 0, NULL),
(995, NULL, NULL, 'Papouasie Nouvelle Guinée', '', 0, NULL),
(996, NULL, NULL, '', '', 0, NULL),
(997, NULL, NULL, 'Bonbon d\'anis 100g', '', 0, NULL),
(998, NULL, NULL, '', '', 0, NULL),
(999, NULL, NULL, 'Bâton de réglisse 100g', '', 0, NULL),
(1000, NULL, NULL, '', '', 0, NULL),
(1001, NULL, NULL, 'Thé vert menthe - 15 infusettes', '', 5.21327, NULL),
(1002, NULL, NULL, '', '', 5.21327, NULL),
(1003, NULL, NULL, 'Zen - 15 infusettes', '', 5.21327, NULL),
(1004, NULL, NULL, '', '', 5.21327, NULL),
(1005, NULL, NULL, 'La délicieuse - 15 infusettes', '', 5.21327, NULL),
(1006, NULL, NULL, '', '', 5.21327, NULL),
(1007, NULL, NULL, 'Croisière sur le Nil - 15 infusettes', '', 5.21327, NULL),
(1008, NULL, NULL, '', '', 5.21327, NULL),
(1009, NULL, NULL, 'Thé vert menthe - 100g', '', 0, NULL),
(1010, NULL, NULL, '', '', 0, NULL),
(1011, NULL, NULL, 'Thé vert citron - 100g', '', 0, NULL),
(1012, NULL, NULL, '', '', 0, NULL),
(1013, NULL, NULL, 'Thé vert coco ananas - 100g', '', 0, NULL),
(1014, NULL, NULL, '', '', 0, NULL),
(1015, NULL, NULL, 'Thé vert ananas fraise - 100g', '', 0, NULL),
(1016, NULL, NULL, '', '', 0, NULL),
(1017, NULL, NULL, 'Earl Grey - 100g', '', 0, NULL),
(1018, NULL, NULL, '', '', 0, NULL),
(1019, NULL, NULL, 'Infusion Chaï - 100g', '', 0, NULL),
(1020, NULL, NULL, '', '', 0, NULL),
(1021, NULL, NULL, 'Infusion verveine - 50g', '', 0, NULL),
(1022, NULL, NULL, '', '', 0, NULL),
(1023, NULL, NULL, 'Maté - 100g', '', 0, NULL),
(1024, NULL, NULL, '', '', 0, NULL),
(1025, NULL, NULL, 'Lapsang Souchong - 100g', '', 0, NULL),
(1026, NULL, NULL, '', '', 0, NULL),
(1027, NULL, NULL, 'Pu Erh - 100g', '', 0, NULL),
(1028, NULL, NULL, '', '', 0, NULL),
(1029, NULL, NULL, 'English Breakfast - 15 infusettes', '', 5.21327, NULL),
(1030, NULL, NULL, '', '', 5.21327, NULL),
(1031, NULL, NULL, 'Detox automne hiver - 15 infusettes', '', 5.21327, NULL),
(1032, NULL, NULL, '', '', 5.21327, NULL),
(1033, NULL, NULL, 'Lendemain de fête - 15 infusettes', '', 5.21327, NULL),
(1034, NULL, NULL, '', '', 5.21327, NULL),
(1035, NULL, NULL, 'Doux nectar - 100g', '', 0, NULL),
(1036, NULL, NULL, '', '', 0, NULL),
(1037, NULL, NULL, 'Thé vert cactus ananas - 100g', '', 0, NULL),
(1038, NULL, NULL, '', '', 0, NULL),
(1039, NULL, NULL, 'Tea maker 0.5l', '', 18.8626, NULL),
(1040, NULL, NULL, '', '', 18.8626, NULL),
(1041, NULL, NULL, 'Pu erh - 100g', '', 0, NULL),
(1042, NULL, NULL, '', '', 0, NULL),
(1043, NULL, NULL, 'Infusion Verveine - 50g', '', 0, NULL),
(1044, NULL, NULL, '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produit_declinaison`
--

CREATE TABLE `produit_declinaison` (
  `id_produit_declinaison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_declinaison` int(11) NOT NULL,
  `prix` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role_employe`
--

CREATE TABLE `role_employe` (
  `id_role` int(11) NOT NULL,
  `nom_role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rubrique`
--

CREATE TABLE `rubrique` (
  `id_rubrique` int(11) NOT NULL,
  `titre` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `statut_commande`
--

CREATE TABLE `statut_commande` (
  `id_statut` int(11) NOT NULL,
  `nom` text NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id_declinaison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `produits_en_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `id_declinaison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_ht` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tva`
--

CREATE TABLE `tva` (
  `id_tva` int(11) NOT NULL,
  `taux_tva` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tva`
--

INSERT INTO `tva` (`id_tva`, `taux_tva`) VALUES
(1, 20),
(2, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `fk_article_id_employe` (`id_employe`),
  ADD KEY `fk_article_id_rubrique` (`id_rubrique`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `fk_commentaire_id_declinaison` (`id_declinaison`),
  ADD KEY `fk_commentaire_id_produit` (`id_produit`),
  ADD KEY `fk_stock_id_client` (`id_client`);

--
-- Indexes for table `declinaison`
--
ALTER TABLE `declinaison`
  ADD PRIMARY KEY (`id_declinaison`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fk_produit_id_categorie` (`id_categorie`),
  ADD KEY `fk_produit_id_tva` (`id_tva`);

--
-- Indexes for table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  ADD PRIMARY KEY (`id_produit_declinaison`),
  ADD KEY `fk_id_declinaison` (`id_declinaison`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `role_employe`
--
ALTER TABLE `role_employe`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id_rubrique`);

--
-- Indexes for table `statut_commande`
--
ALTER TABLE `statut_commande`
  ADD PRIMARY KEY (`id_statut`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_declinaison`,`id_produit`),
  ADD KEY `fk_stock_id_produit` (`id_produit`),
  ADD KEY `id_declinaison` (`id_declinaison`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `fk_transaction_id_declinaison` (`id_declinaison`),
  ADD KEY `fk_transaction_id_produit` (`id_produit`),
  ADD KEY `fk_transaction_id_statut` (`id_statut`);

--
-- Indexes for table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`id_tva`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `declinaison`
--
ALTER TABLE `declinaison`
  MODIFY `id_declinaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_employe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1045;

--
-- AUTO_INCREMENT for table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  MODIFY `id_produit_declinaison` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_employe`
--
ALTER TABLE `role_employe`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id_rubrique` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statut_commande`
--
ALTER TABLE `statut_commande`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tva`
--
ALTER TABLE `tva`
  MODIFY `id_tva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_id_employe` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `fk_article_id_rubrique` FOREIGN KEY (`id_rubrique`) REFERENCES `rubrique` (`id_rubrique`);

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `fk_commentaire_id_declinaison` FOREIGN KEY (`id_declinaison`) REFERENCES `declinaison` (`id_declinaison`),
  ADD CONSTRAINT `fk_commentaire_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_stock_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `fk_produit_id_tva` FOREIGN KEY (`id_tva`) REFERENCES `tva` (`id_tva`);

--
-- Constraints for table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  ADD CONSTRAINT `fk_id_declinaison` FOREIGN KEY (`id_declinaison`) REFERENCES `declinaison` (`id_declinaison`),
  ADD CONSTRAINT `fk_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `produit_declinaison_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_id_declinaison` FOREIGN KEY (`id_declinaison`) REFERENCES `declinaison` (`id_declinaison`),
  ADD CONSTRAINT `fk_stock_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction_id_declinaison` FOREIGN KEY (`id_declinaison`) REFERENCES `declinaison` (`id_declinaison`),
  ADD CONSTRAINT `fk_transaction_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_transaction_id_statut` FOREIGN KEY (`id_statut`) REFERENCES `statut_commande` (`id_statut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
