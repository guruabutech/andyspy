-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: andyspycdlmain.mysql.db
-- Generation Time: Apr 20, 2018 at 05:41 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `andyspycdlmain`
--

-- --------------------------------------------------------

--
-- Table structure for table `call`
--

CREATE TABLE `call` (
  `id_device` int(11) NOT NULL,
  `_id` int(11) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `type` enum('OUT','IN') NOT NULL,
  `date` bigint(20) NOT NULL,
  `duration` bigint(20) NOT NULL,
  `record` varchar(20) NOT NULL,
  `warning` enum('Y','N') NOT NULL DEFAULT 'N',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `call`
--

INSERT INTO `call` (`id_device`, `_id`, `contact`, `phone_number`, `type`, `date`, `duration`, `record`, `warning`, `added_at`) VALUES
(2, 1516466436, 'Imran', '+212633843285', 'IN', 1516466436, 18, '1516466436893.mp4', 'N', '2018-01-20 16:44:06'),
(2, 1516467401, '', '', 'OUT', 1516467401, 3, '1516467401742.mp4', 'N', '2018-01-20 16:57:07'),
(2, 1516626047, 'Ma Chérie', '+212603844294', 'OUT', 1516626047, 71, '1516626047865.mp4', 'N', '2018-01-22 13:05:15'),
(2, 1516626147, 'Père', '+212603969901', 'IN', 1516626147, 16, '1516626147580.mp4', 'N', '2018-01-22 13:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `sync_time_interval` int(11) NOT NULL DEFAULT '30',
  `sync` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `allowed_sync_network` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `id_user`, `name`, `sync_time_interval`, `sync`, `allowed_sync_network`, `added_at`) VALUES
(2, 2, 'ahmed', 30, 'Y', '2', '2018-01-20 16:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id_device` int(11) NOT NULL,
  `_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `contact` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('SENT','RECEIVED') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL,
  `reviewed` tinyint(4) NOT NULL DEFAULT '0',
  `warning` enum('Y','N') NOT NULL DEFAULT 'N',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`id_device`, `_id`, `thread_id`, `contact`, `phone_number`, `body`, `type`, `date`, `reviewed`, `warning`, `added_at`) VALUES
(2, 1, 1, 'Whatsapp', 'Whatsapp', 'WhatsApp code 169-056.\n\nYou can also tap on this link to verify your phone: v.whatsapp.com/169056', 'RECEIVED', 1514070389, 0, 'N', '2018-01-20 16:43:31'),
(2, 2, 2, 'IAM', 'IAM', 'Votre connexion internet vous offre encore 873 Mo, à consommer jusqu\'au 20/01/2018 à 14:42. Pensez à recharger votre compte internet, code recharge *3. ', 'RECEIVED', 1514093915, 0, 'N', '2018-01-20 16:43:30'),
(2, 3, 2, 'IAM', 'IAM', 'Votre compte Jawal a été rechargé de 80DH valables jusqu\'au 19/05/2018.', 'RECEIVED', 1514131392, 0, 'N', '2018-01-20 16:43:29'),
(2, 4, 3, '333', '333', 'Votre Android ne supporte pas la configuration automatique, GPRS: Parametres Controles sans fil>Reseaux Mobile>Noms Point d\'Acces.Nouveau Point d\'Acces.entrer WEB . Point d\'Acces, entrer www.inwi.ma. Type Point d\'Acces, choix par defaut faire OK. Appuyer bouton radio a cote de WEB pour definir le profil par defaut. touche Accueil. Appuyer touche Menu et choix Navigateur. Appuyer touche Menu et choix Plus>parametres>Configurer Page d\'Accueil. Entrer www.inwi.ma', 'RECEIVED', 1514137763, 0, 'N', '2018-01-20 16:43:28'),
(2, 5, 4, 'Ma Chérie', '+212603844294', '0662715386 houssine ', 'SENT', 1514193399, 0, 'N', '2018-01-20 16:43:27'),
(2, 6, 4, 'Ma Chérie', '+212603844294', '0661330205 abdelaziz', 'SENT', 1514193486, 0, 'N', '2018-01-20 16:43:27'),
(2, 7, 2, 'IAM', 'IAM', 'Désolé, votre solde est insuffisant pour l\'opération demandée. Nous vous invitons à recharger votre compte Jawal.', 'RECEIVED', 1514193491, 0, 'N', '2018-01-20 16:43:26'),
(2, 8, 5, '+212661089790', '+212661089790', 'bonjour. c est de alighieri', 'RECEIVED', 1514193526, 0, 'N', '2018-01-20 16:43:25'),
(2, 9, 5, '+212661089790', '+212661089790', 'voici les bons doc', 'RECEIVED', 1514193570, 0, 'N', '2018-01-20 16:43:23'),
(2, 10, 5, '+212661089790', '+212661089790', 'je me suis trompée tt a l heure', 'RECEIVED', 1514193581, 0, 'N', '2018-01-20 16:43:22'),
(2, 11, 5, '+212661089790', '+212661089790', 'mon mari de lemseffer 0661 33 02 05', 'RECEIVED', 1514193600, 0, 'N', '2018-01-20 16:43:21'),
(2, 13, 2, 'IAM', 'IAM', 'Votre compte Jawal a été rechargé de 80DH valables jusqu\'au 19/05/2018.', 'RECEIVED', 1514193993, 0, 'N', '2018-01-20 16:43:20'),
(2, 14, 5, '+212661089790', '+212661089790', 'email a.hannachi@mundiapolis.ma', 'SENT', 1514194033, 0, 'N', '2018-01-20 16:43:20'),
(2, 15, 2, 'IAM', 'IAM', 'Votre connexion internet vous offre encore 8 Mo, à consommer jusqu\'au 20/01/2018 à 14:42. Pensez à recharger votre compte internet, code recharge *3. ', 'RECEIVED', 1514194177, 0, 'N', '2018-01-20 16:43:18'),
(2, 16, 5, '+212661089790', '+212661089790', 'ok. bien reçu ', 'RECEIVED', 1514194180, 0, 'N', '2018-01-20 16:43:17'),
(2, 17, 6, '+212661662634', '+212661662634', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212661662634 le 25/12/2017 à 10:02\n', 'RECEIVED', 1514201575, 0, 'N', '2018-01-20 16:43:17'),
(2, 18, 3, '333', '333', 'Votre Android ne supporte pas la configuration automatique, GPRS: Parametres Controles sans fil>Reseaux Mobile>Noms Point d\'Acces.Nouveau Point d\'Acces.entrer WEB . Point d\'Acces, entrer www.inwi.ma. Type Point d\'Acces, choix par defaut faire OK. Appuyer bouton radio a cote de WEB pour definir le profil par defaut. touche Accueil. Appuyer touche Menu et choix Navigateur. Appuyer touche Menu et choix Plus>parametres>Configurer Page d\'Accueil. Entrer www.inwi.ma', 'RECEIVED', 1514201709, 0, 'N', '2018-01-20 16:43:15'),
(2, 19, 7, 'CIH', 'CIH', '180102 est le code confidentiel pour valider la connexion d\'un nouvel appareil. Attention !! Ce code a une validité de 5 mn. A ne communiquer à personne.', 'RECEIVED', 1514202097, 0, 'N', '2018-01-20 16:43:14'),
(2, 20, 7, 'CIH', 'CIH', 'CIH BANK vous informe que votre nouvel appareil a bien été confirmé.', 'RECEIVED', 1514202114, 0, 'N', '2018-01-20 16:43:13'),
(2, 21, 8, 'Omar Mouhieddine', '+212608082348', 'Oui 5oya fine', 'RECEIVED', 1514204952, 0, 'N', '2018-01-20 16:43:12'),
(2, 22, 9, 'inwi', 'inwi', 'Vous avez recharge 20 Dh. Vous beneficiez de 2h vers le national valables 7 jours', 'RECEIVED', 1514207925, 0, 'N', '2018-01-20 16:43:11'),
(2, 23, 10, 'Service Client', '220', 'جديد، برومو د لهبال، شرجيو 20dh و إستافدوا من روشارج x10 كتمنحكم المكالمات، الإنترنت و SMS وx17 إبتداءً من 50 درهم. عرض صالح  إلى غاية 31 دجنبر', 'RECEIVED', 1514214139, 0, 'N', '2018-01-20 16:43:10'),
(2, 24, 11, '+212661330205', '+212661330205', '122 bd Anfa ', 'RECEIVED', 1514214897, 0, 'N', '2018-01-20 16:43:09'),
(2, 25, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  10 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514216887, 0, 'N', '2018-01-20 16:43:08'),
(2, 26, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  32 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514228155, 0, 'N', '2018-01-20 16:43:07'),
(2, 27, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  7 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514228849, 0, 'N', '2018-01-20 16:43:06'),
(2, 28, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  36 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514232110, 0, 'N', '2018-01-20 16:43:05'),
(2, 29, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  3 min 46 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514233971, 0, 'N', '2018-01-20 16:43:04'),
(2, 30, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  46 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514235836, 0, 'N', '2018-01-20 16:43:03'),
(2, 31, 9, 'inwi', 'inwi', 'استافدوا من 2 ساعات من المكالمات الوطنية صالحة 7 أيام غير ب 20 درهم، ركبوا *1 بعد كود روشارج', 'RECEIVED', 1514287991, 0, 'N', '2018-01-20 16:43:02'),
(2, 32, 12, 'Imran', '+212633843285', 'Vous avez essayé d\'appeler le +212633843285, le 26/12/2017 à 13:29. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1514300205, 0, 'N', '2018-01-20 16:43:01'),
(2, 33, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  40 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514320504, 0, 'N', '2018-01-20 16:43:00'),
(2, 34, 10, 'Service Client', '220', 'Club inwi : Rendez-vous aujourd\'hui sur club.inwi.ma ou sur l\'appli Club inwi pour choisir votre KDO ou envoyez 3 au 665 pour un KDO par défaut.', 'RECEIVED', 1514391774, 0, 'N', '2018-01-20 16:42:59'),
(2, 35, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  25 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514402454, 0, 'N', '2018-01-20 16:42:58'),
(2, 36, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 27/12/2017 à 19:27. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1514403226, 0, 'N', '2018-01-20 16:42:57'),
(2, 37, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 17 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514460831, 0, 'N', '2018-01-20 16:42:56'),
(2, 38, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  11 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514462732, 0, 'N', '2018-01-20 16:42:55'),
(2, 40, 9, 'inwi', 'inwi', 'Votre solde est insuffisant pour effectuer cette operation. Veuillez recharger votre compte.', 'RECEIVED', 1514470515, 0, 'N', '2018-01-20 16:42:54'),
(2, 41, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  43 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514475041, 0, 'N', '2018-01-20 16:42:53'),
(2, 42, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514477674, 0, 'N', '2018-01-20 16:42:52'),
(2, 43, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  20 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514500097, 0, 'N', '2018-01-20 16:42:51'),
(2, 44, 9, 'inwi', 'inwi', 'Votre Bonus national est epuise.', 'RECEIVED', 1514501477, 0, 'N', '2018-01-20 16:42:50'),
(2, 45, 14, 'Amine Ami De Aziz', '+212666928647', 'Ce correspondant a essayé de vous appeler plusieurs fois, dernier appel reÇu du \n+212666928647 le 29/12/2017 à 11:40\n', 'RECEIVED', 1514547750, 0, 'N', '2018-01-20 16:42:49'),
(2, 46, 14, 'Amine Ami De Aziz', '+212666928647', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212666928647 le 29/12/2017 à 11:44\n', 'RECEIVED', 1514547894, 0, 'N', '2018-01-20 16:42:48'),
(2, 47, 9, 'inwi', 'inwi', 'Votre Pass Internet sur mobile expire le 30/12/2017 à 13:30 Nous vous invitons à le renouveler en introduisant votre code de recharge suivi de *3.', 'RECEIVED', 1514557132, 0, 'N', '2018-01-20 16:42:47'),
(2, 48, 9, 'inwi', 'inwi', 'Vous avez recharge 20 Dh. Vous beneficiez de 2h vers le national valables 7 jours', 'RECEIVED', 1514560915, 0, 'N', '2018-01-20 16:42:46'),
(2, 49, 15, '990', '990', 'inwi : à 5Dh seulement, Envoyer 2 par SMS au 990 pour profiter de 500 Mo d\'internet valables 2 jours', 'RECEIVED', 1514560950, 0, 'N', '2018-01-20 16:42:45'),
(2, 51, 9, 'inwi', 'inwi', 'Votre solde est insuffisant pour effectuer cette operation. Veuillez recharger votre compte.', 'RECEIVED', 1514562806, 0, 'N', '2018-01-20 16:42:44'),
(2, 52, 12, 'Imran', '+212633843285', 'Vous avez essayé d\'appeler le +212633843285, le 29/12/2017 à 16:25. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1514564723, 0, 'N', '2018-01-20 16:42:43'),
(2, 53, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 45 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514574206, 0, 'N', '2018-01-20 16:42:42'),
(2, 54, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  3 min 39 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514581136, 0, 'N', '2018-01-20 16:42:41'),
(2, 55, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514581819, 0, 'N', '2018-01-20 16:42:40'),
(2, 56, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  7 min 51 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514590581, 0, 'N', '2018-01-20 16:42:39'),
(2, 57, 10, 'Service Client', '220', 'inwi :\nجديد، برومو د لهبال، شرجيو 20dh و إستافدوا من روشارج x10 كتمنحكم المكالمات، الإنترنت و SMS وx17 إبتداءً من 50 درهم. عرض مستمر إلى غاية 1 يناير', 'RECEIVED', 1514630095, 0, 'N', '2018-01-20 16:42:38'),
(2, 58, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  46 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514646288, 0, 'N', '2018-01-20 16:42:37'),
(2, 59, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  23 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514650801, 0, 'N', '2018-01-20 16:42:36'),
(2, 60, 6, '+212661662634', '+212661662634', 'Fink', 'RECEIVED', 1514654652, 0, 'N', '2018-01-20 16:42:35'),
(2, 61, 9, 'inwi', 'inwi', 'Vous avez recharge 20 Dh.', 'RECEIVED', 1514655690, 0, 'N', '2018-01-20 16:42:34'),
(2, 62, 9, 'inwi', 'inwi', 'inwi vous offre un bonus x10 de 180 dh valables 3 mois.', 'RECEIVED', 1514655700, 0, 'N', '2018-01-20 16:42:33'),
(2, 63, 15, '990', '990', 'inwi : à 5Dh seulement, Envoyer 4 par SMS au 990 pour profiter de 500 Mo d\'internet valables 2 jours', 'RECEIVED', 1514655749, 0, 'N', '2018-01-20 16:42:32'),
(2, 70, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  7 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514664859, 0, 'N', '2018-01-20 16:42:31'),
(2, 71, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 21 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514669940, 0, 'N', '2018-01-20 16:42:30'),
(2, 72, 19, 'Mere', '+212629149276', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212629149276 le 30/12/2017 à 22:23\n', 'RECEIVED', 1514672594, 0, 'N', '2018-01-20 16:42:29'),
(2, 74, 19, 'Mere', '+212629149276', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212629149276 le 31/12/2017 à 01:42\n', 'RECEIVED', 1514691204, 0, 'N', '2018-01-20 16:42:28'),
(2, 75, 19, 'Mere', '+212629149276', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212629149276 le 31/12/2017 à 01:42\n', 'RECEIVED', 1514691206, 0, 'N', '2018-01-20 16:42:27'),
(2, 76, 19, 'Mere', '+212629149276', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212629149276 le 31/12/2017 à 03:39\n', 'RECEIVED', 1514694449, 0, 'N', '2018-01-20 16:42:26'),
(2, 77, 20, 'Père', '+212603969901', 'Ce correspondant a essayé de vous appeler plusieurs fois, dernier appel reÇu du \n+212603969901 le 31/12/2017 à 04:25\n', 'RECEIVED', 1514694452, 0, 'N', '2018-01-20 16:42:25'),
(2, 78, 20, 'Père', '+212603969901', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603969901 le 31/12/2017 à 04:32\n', 'RECEIVED', 1514694987, 0, 'N', '2018-01-20 16:42:24'),
(2, 79, 21, 'Snapchat', 'Snapchat', 'Snapchat Code: 241506. Happy Snapping!', 'RECEIVED', 1514717630, 0, 'N', '2018-01-20 16:42:23'),
(2, 80, 12, 'Imran', '+212633843285', 'Vous avez essayé d\'appeler le +212633843285, le 31/12/2017 à 16:57. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1514740439, 0, 'N', '2018-01-20 16:42:22'),
(2, 81, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 5 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514743449, 0, 'N', '2018-01-20 16:42:21'),
(2, 82, 22, '+212650771106', '+212650771106', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212650771106 le 31/12/2017 à 18:23\n', 'RECEIVED', 1514744910, 0, 'N', '2018-01-20 16:42:20'),
(2, 83, 23, 'Ayoub Dabdoub', '+212664383101', 'Sat ana baghi ntharak', 'SENT', 1514746278, 0, 'N', '2018-01-20 16:42:18'),
(2, 84, 23, 'Ayoub Dabdoub', '+212664383101', 'répond ', 'SENT', 1514746289, 0, 'N', '2018-01-20 16:42:17'),
(2, 85, 9, 'inwi', 'inwi', 'استافدوا من 2 ساعات من المكالمات الوطنية صالحة 7 أيام غير ب 20 درهم، ركبوا *1 بعد كود روشارج', 'RECEIVED', 1514748568, 0, 'N', '2018-01-20 16:42:16'),
(2, 86, 9, 'inwi', 'inwi', 'Il vous reste 4 Dh sur votre solde initial. Pensez a recharger votre compte.', 'RECEIVED', 1514750545, 0, 'N', '2018-01-20 16:42:15'),
(2, 87, 10, 'Service Client', '220', 'inwi\nتتمنى لكم سنة سعيدة و كل عام و أنتم بألف خير. ', 'RECEIVED', 1514809896, 0, 'N', '2018-01-20 16:42:14'),
(2, 88, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  28 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514810054, 0, 'N', '2018-01-20 16:42:13'),
(2, 89, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  4 min 1 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514810967, 0, 'N', '2018-01-20 16:42:12'),
(2, 90, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  42 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514813010, 0, 'N', '2018-01-20 16:42:11'),
(2, 91, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  58 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514828217, 0, 'N', '2018-01-20 16:42:10'),
(2, 93, 12, 'Imran', '+212633843285', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1514836553, 0, 'N', '2018-01-20 16:42:09'),
(2, 94, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 33 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514849743, 0, 'N', '2018-01-20 16:42:08'),
(2, 95, 9, 'inwi', 'inwi', 'Votre solde recharge est epuise. Pensez a recharger votre compte.', 'RECEIVED', 1514852630, 0, 'N', '2018-01-20 16:42:07'),
(2, 96, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  21 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514886132, 0, 'N', '2018-01-20 16:42:06'),
(2, 97, 9, 'inwi', 'inwi', 'Vous avez recharge 50 Dh.vous benificiez de 5GO valable 30 jours.', 'RECEIVED', 1514889280, 0, 'N', '2018-01-20 16:42:05'),
(2, 98, 10, 'Service Client', '220', 'جديد عند inwi روشارج*2 فيها كلشي استعمل بها للي حتاجيتي. 10DH كتمنحكم حتال 1h وطنية أو 1Go لمدة 7 أيام عوض 3 أيام.عرض محدود. للاستفادة ركبوا *2 بعد كود الروشارج', 'RECEIVED', 1514903704, 0, 'N', '2018-01-20 16:42:04'),
(2, 99, 9, 'inwi', 'inwi', 'Votre Bonus national est epuise.', 'RECEIVED', 1514912434, 0, 'N', '2018-01-20 16:42:03'),
(2, 100, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  4 min 11 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514913390, 0, 'N', '2018-01-20 16:42:02'),
(2, 101, 9, 'inwi', 'inwi', 'Felicitations. Vous profitez d un bonus depannage national de 60 secondes ou 10 SMS gratuits valable 2 jours', 'RECEIVED', 1514980663, 0, 'N', '2018-01-20 16:42:01'),
(2, 102, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  11 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1514985096, 0, 'N', '2018-01-20 16:42:00'),
(2, 103, 10, 'Service Client', '220', 'Club inwi : Rendez-vous aujourd\'hui sur club.inwi.ma ou sur l\'appli Club inwi pour choisir votre KDO ou envoyez 3 au 665 pour un KDO par défaut.', 'RECEIVED', 1514989722, 0, 'N', '2018-01-20 16:41:59'),
(2, 104, 25, 'Google', 'Google', 'Votre code de validation Google est 120293.', 'RECEIVED', 1515003068, 0, 'N', '2018-01-20 16:41:58'),
(2, 105, 19, 'Mere', '+212629149276', 'Sat rah radi nmchu nsali sarbi', 'RECEIVED', 1515006442, 0, 'N', '2018-01-20 16:41:57'),
(2, 106, 9, 'inwi', 'inwi', 'Vous avez recharge 50 Dh. Vous beneficiez de 5h vers le national valables 14 jours', 'RECEIVED', 1515012465, 0, 'N', '2018-01-20 16:41:56'),
(2, 107, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  4 min 39 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515013501, 0, 'N', '2018-01-20 16:41:55'),
(2, 108, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 04/01/2018 à 11:03. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515064790, 0, 'N', '2018-01-20 16:41:54'),
(2, 109, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 15 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515069038, 0, 'N', '2018-01-20 16:41:53'),
(2, 110, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 15 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515069039, 0, 'N', '2018-01-20 16:41:52'),
(2, 111, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  40 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515073000, 0, 'N', '2018-01-20 16:41:51'),
(2, 112, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  32 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515073655, 0, 'N', '2018-01-20 16:41:50'),
(2, 113, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  40 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515074407, 0, 'N', '2018-01-20 16:41:49'),
(2, 114, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  16 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515075653, 0, 'N', '2018-01-20 16:41:48'),
(2, 115, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 24 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515077547, 0, 'N', '2018-01-20 16:41:47'),
(2, 116, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  4 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515082689, 0, 'N', '2018-01-20 16:41:46'),
(2, 117, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  9 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515086795, 0, 'N', '2018-01-20 16:41:45'),
(2, 118, 8, 'Omar Mouhieddine', '+212608082348', ' Ana radi jama3', 'RECEIVED', 1515093175, 0, 'N', '2018-01-20 16:41:44'),
(2, 119, 7, 'CIH', 'CIH', 'CIH BANK N A PAS PU DONNER SUITE A VOTRE ACHAT ECOM DE 1 USD CHEZ GOOGLE *SERVICE, VOTRE DOTATION OFFICE DE CHANGE EST NON ACTIVEE MERCI DE L ACTIVER.', 'RECEIVED', 1515119152, 0, 'N', '2018-01-20 16:41:43'),
(2, 120, 7, 'CIH', 'CIH', 'CIH BANK N A PAS PU DONNER SUITE A VOTRE ACHAT ECOM DE 1 USD CHEZ GOOGLE *SERVICE, VOTRE DOTATION OFFICE DE CHANGE EST NON ACTIVEE MERCI DE L ACTIVER.', 'RECEIVED', 1515119470, 0, 'N', '2018-01-20 16:41:42'),
(2, 121, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 05/01/2018 à 13:22. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515158594, 0, 'N', '2018-01-20 16:41:41'),
(2, 122, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  17 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515159936, 0, 'N', '2018-01-20 16:41:40'),
(2, 123, 25, 'Google', 'Google', 'Votre code de validation Google est 392864.', 'RECEIVED', 1515164677, 0, 'N', '2018-01-20 16:41:39'),
(2, 124, 26, '+212630341101', '+212630341101', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212630341101 le 05/01/2018 à 15:59\n', 'RECEIVED', 1515168047, 0, 'N', '2018-01-20 16:41:38'),
(2, 125, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  43 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515169721, 0, 'N', '2018-01-20 16:41:37'),
(2, 126, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  43 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515169721, 0, 'N', '2018-01-20 16:41:36'),
(2, 127, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 47 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515170305, 0, 'N', '2018-01-20 16:41:35'),
(2, 128, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  25 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515174052, 0, 'N', '2018-01-20 16:41:34'),
(2, 129, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 05/01/2018 à 18:04. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515175551, 0, 'N', '2018-01-20 16:41:33'),
(2, 130, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  23 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515178533, 0, 'N', '2018-01-20 16:41:32'),
(2, 131, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  38 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515181478, 0, 'N', '2018-01-20 16:41:31'),
(2, 132, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  3 min 12 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515182411, 0, 'N', '2018-01-20 16:41:30'),
(2, 134, 9, 'inwi', 'inwi', 'Votre solde est insuffisant pour effectuer cette operation. Veuillez recharger votre compte.', 'RECEIVED', 1515190973, 0, 'N', '2018-01-20 16:41:29'),
(2, 135, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  28 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515191149, 0, 'N', '2018-01-20 16:41:28'),
(2, 136, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  8 min 46 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515197751, 0, 'N', '2018-01-20 16:41:27'),
(2, 137, 8, 'Omar Mouhieddine', '+212608082348', 'Bonjour, peux-tu m\'appler s\'il te plait? Merci!', 'RECEIVED', 1515199689, 0, 'N', '2018-01-20 16:41:26'),
(2, 138, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  7 min 50 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515201335, 0, 'N', '2018-01-20 16:41:25'),
(2, 139, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 34 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515204609, 0, 'N', '2018-01-20 16:41:24'),
(2, 140, 7, 'CIH', 'CIH', 'Virement recu de la part de SOUMIA BOUFOUS  d\'un montant de  500  DHS.', 'RECEIVED', 1515238892, 0, 'N', '2018-01-20 16:41:23'),
(2, 141, 4, 'Ma Chérie', '+212603844294', 'Ton argent est versé f le compte dialk. Merci.', 'RECEIVED', 1515238919, 0, 'N', '2018-01-20 16:41:22'),
(2, 142, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  4 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515240611, 0, 'N', '2018-01-20 16:41:21'),
(2, 143, 20, 'Père', '+212603969901', 'Vous avez essayé d\'appeler le +212603969901, le 06/01/2018 à 12:21. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515241981, 0, 'N', '2018-01-20 16:41:20'),
(2, 144, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 06/01/2018 à 12:57. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515243875, 0, 'N', '2018-01-20 16:41:19'),
(2, 145, 27, 'Mehdi Bouazar', '+212695431461', 'Ji lpark a sat mal9inahach meli rangelso f chi 9ahwa rangulha lik', 'RECEIVED', 1515254470, 0, 'N', '2018-01-20 16:41:18'),
(2, 146, 27, 'Mehdi Bouazar', '+212695431461', 'L9ahwa li glest fiha ana o yal o mon3im', 'RECEIVED', 1515254770, 0, 'N', '2018-01-20 16:41:18'),
(2, 147, 27, 'Mehdi Bouazar', '+212695431461', 'Stella marina', 'RECEIVED', 1515254773, 0, 'N', '2018-01-20 16:41:18'),
(2, 148, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  9 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515264492, 0, 'N', '2018-01-20 16:41:18'),
(2, 149, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  34 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515266824, 0, 'N', '2018-01-20 16:41:17'),
(2, 150, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 06/01/2018 à 19:25. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515266953, 0, 'N', '2018-01-20 16:41:18'),
(2, 151, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 42 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515267864, 0, 'N', '2018-01-20 16:41:18'),
(2, 152, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  12 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515269580, 0, 'N', '2018-01-20 16:41:17'),
(2, 153, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  49 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515275496, 0, 'N', '2018-01-20 16:41:17'),
(2, 154, 7, 'CIH', 'CIH', '1280402 est votre code 3DSecure pour valider votre achat E-Commerce du 06/01/2018 23:38:02 d\'un montant de MAD200,00. Ce code est valide 5min', 'RECEIVED', 1515281911, 0, 'N', '2018-01-20 16:41:17'),
(2, 155, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  19 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515283810, 0, 'N', '2018-01-20 16:41:10'),
(2, 156, 4, 'Ma Chérie', '+212603844294', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603844294 le 07/01/2018 à 00:30\n', 'RECEIVED', 1515285300, 0, 'N', '2018-01-20 16:41:09'),
(2, 157, 4, 'Ma Chérie', '+212603844294', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603844294 le 07/01/2018 à 00:31\n', 'RECEIVED', 1515285307, 0, 'N', '2018-01-20 16:41:05'),
(2, 158, 4, 'Ma Chérie', '+212603844294', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603844294 le 07/01/2018 à 00:32\n', 'RECEIVED', 1515285317, 0, 'N', '2018-01-20 16:41:04'),
(2, 159, 4, 'Ma Chérie', '+212603844294', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603844294 le 07/01/2018 à 00:36\n', 'RECEIVED', 1515285626, 0, 'N', '2018-01-20 16:41:03'),
(2, 160, 4, 'Ma Chérie', '+212603844294', 'Koul marra kanbghi nssa kolchi o nbda m3ak saf7a bida, mais m3ak 3amerni ghadiya nertah. Wlah hta hram hadchi li kadir fiya, nhar ghadi tkhsser kolchi 3ad at3ref hadchi', 'RECEIVED', 1515286333, 0, 'N', '2018-01-20 16:41:03'),
(2, 161, 19, 'Mere', '+212629149276', 'Vous avez essayé d\'appeler le +212629149276, le 06/01/2018 à 20:55. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515322364, 0, 'N', '2018-01-20 16:41:02'),
(2, 162, 9, 'inwi', 'inwi', 'استافدوا من 2 ساعات من المكالمات الوطنية صالحة 7 أيام غير ب 20 درهم، ركبوا *1 بعد كود روشارج', 'RECEIVED', 1515324689, 0, 'N', '2018-01-20 16:41:01'),
(2, 163, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  3 min 25 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515348114, 0, 'N', '2018-01-20 16:41:00'),
(2, 164, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  17 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515404598, 0, 'N', '2018-01-20 16:40:59'),
(2, 165, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 08/01/2018 à 10:36. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515409039, 0, 'N', '2018-01-20 16:40:58'),
(2, 166, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  7 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515411075, 0, 'N', '2018-01-20 16:40:58'),
(2, 167, 10, 'Service Client', '220', 'جديد عند inwi روشارج*2 فيها كلشي استعمل بها للي حتاجيتي. 10DH كتمنحكم حتال 1h وطنية أو 1Go لمدة 7 أيام عوض 3 أيام.عرض محدود. للاستفادة ركبوا *2 بعد كود الروشارج', 'RECEIVED', 1515413550, 0, 'N', '2018-01-20 16:40:56'),
(2, 168, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  58 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515424883, 0, 'N', '2018-01-20 16:40:55'),
(2, 169, 20, 'Père', '+212603969901', 'Vous avez essayé d\'appeler le +212603969901, le 08/01/2018 à 19:08. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515438561, 0, 'N', '2018-01-20 16:40:54'),
(2, 170, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  3 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515439376, 0, 'N', '2018-01-20 16:40:53'),
(2, 171, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  25 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515440269, 0, 'N', '2018-01-20 16:40:51'),
(2, 172, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  15 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515443315, 0, 'N', '2018-01-20 16:40:50'),
(2, 173, 20, 'Père', '+212603969901', 'Vous avez essayé d\'appeler le +212603969901, le 08/01/2018 à 20:18. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515484734, 0, 'N', '2018-01-20 16:40:50'),
(2, 174, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 09/01/2018 à 12:02. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515513803, 0, 'N', '2018-01-20 16:40:48'),
(2, 175, 10, 'Service Client', '220', 'جديد عند inwi روشارج*2 فيها كلشي استعمل بها للي حتاجيتي. 10DH كتمنحكم حتال 1h وطنية أو 1Go لمدة 7 أيام عوض 3 أيام.عرض محدود. للاستفادة ركبوا *2 بعد كود الروشارج', 'RECEIVED', 1515514776, 0, 'N', '2018-01-20 16:40:47'),
(2, 176, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 41 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515517205, 0, 'N', '2018-01-20 16:40:46'),
(2, 177, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  44 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515519820, 0, 'N', '2018-01-20 16:40:45'),
(2, 178, 4, 'Ma Chérie', '+212603844294', 'Vous avez essayé d\'appeler le +212603844294, le 09/01/2018 à 20:51. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515531420, 0, 'N', '2018-01-20 16:40:44'),
(2, 179, 28, 'Menara', 'Menara', 'Maroc Telecom vous informe qu\'elle procédera à la résiliation d\'office de votre compte Internet le 25-01-2018 en cas de non-paiement avant cette date.', 'RECEIVED', 1515593368, 0, 'N', '2018-01-20 16:40:43'),
(2, 180, 10, 'Service Client', '220', 'Club inwi : Rendez-vous aujourd\'hui sur club.inwi.ma ou sur l\'appli Club inwi pour choisir votre KDO ou envoyez 3 au 665 pour un KDO par défaut.', 'RECEIVED', 1515593697, 0, 'N', '2018-01-20 16:40:42'),
(2, 181, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  20 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515597071, 0, 'N', '2018-01-20 16:40:41'),
(2, 182, 12, 'Imran', '+212633843285', 'Vous avez essayé d\'appeler le +212633843285, le 10/01/2018 à 14:43. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515598833, 0, 'N', '2018-01-20 16:40:40'),
(2, 183, 9, 'inwi', 'inwi', 'Il vous reste moins de 5 Mo de volume internet. Pensez à activer un pass Internet à partir de 5DH au *120# suivi de la touche appel', 'RECEIVED', 1515612247, 0, 'N', '2018-01-20 16:40:39'),
(2, 184, 9, 'inwi', 'inwi', 'Votre Bonus internet est épuisé. Vous pouvez activer un pass internet à partir de 5Dh en composant *3 après code de recharge', 'RECEIVED', 1515612329, 0, 'N', '2018-01-20 16:40:38'),
(2, 185, 9, 'inwi', 'inwi', 'Felicitations. Vous profitez d un bonus depannage Whatsapp/Facebook gratuit de 10Mo valable 2 jours', 'RECEIVED', 1515614590, 0, 'N', '2018-01-20 16:40:37'),
(2, 186, 9, 'inwi', 'inwi', 'Vous avez recharge 50 Dh.vous benificiez de 5GO valable 30 jours.', 'RECEIVED', 1515624987, 0, 'N', '2018-01-20 16:40:36'),
(2, 187, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 51 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515667338, 0, 'N', '2018-01-20 16:40:35'),
(2, 188, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 8 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515669153, 0, 'N', '2018-01-20 16:40:34'),
(2, 189, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 13 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515677922, 0, 'N', '2018-01-20 16:40:33'),
(2, 190, 12, 'Imran', '+212633843285', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1515686075, 0, 'N', '2018-01-20 16:40:32'),
(2, 191, 12, 'Imran', '+212633843285', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1515686084, 0, 'N', '2018-01-20 16:40:31'),
(2, 192, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  18 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515687535, 0, 'N', '2018-01-20 16:40:30'),
(2, 193, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  11 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515688019, 0, 'N', '2018-01-20 16:40:29'),
(2, 194, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  44 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515694058, 0, 'N', '2018-01-20 16:40:28'),
(2, 195, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  29 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515696873, 0, 'N', '2018-01-20 16:40:27'),
(2, 196, 19, 'Mere', '+212629149276', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212629149276 le 11/01/2018 à 23:18\n', 'RECEIVED', 1515713270, 0, 'N', '2018-01-20 16:40:26'),
(2, 197, 8, 'Omar Mouhieddine', '+212608082348', 'Fi casa lyoma?', 'RECEIVED', 1515753137, 0, 'N', '2018-01-20 16:40:25'),
(2, 198, 29, 'cityclub', 'cityclub', 'URGENT!Il parait que CityClub va offrir 1 AN D\'ABONNEMENT à tous ces adhérents mercredi 17 Janvier!Pas encore abonné?C\'est le moment ou jamais!0522647000', 'RECEIVED', 1515753868, 0, 'N', '2018-01-20 16:40:24'),
(2, 199, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 59 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515756276, 0, 'N', '2018-01-20 16:40:23'),
(2, 200, 12, 'Imran', '+212633843285', 'Vous avez essayé d\'appeler le +212633843285, le 12/01/2018 à 12:01. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1515763671, 0, 'N', '2018-01-20 16:40:22'),
(2, 201, 9, 'inwi', 'inwi', ' عرض خاص، روشارج 50Dh كتمنحك 1000dh من الرصيد صالح لمدة 14 يوم . للتشغيل ركب *9 بعد كود روشارج. عرض صالح إلى غاية منتصف الليل.', 'RECEIVED', 1515773377, 0, 'N', '2018-01-20 16:40:21'),
(2, 202, 30, 'NXSMS', 'NXSMS', 'G2A.COM code: 014192. Valid for 5 minutes.', 'RECEIVED', 1515774713, 0, 'N', '2018-01-20 16:40:21'),
(2, 203, 31, 'INFO', 'INFO', 'Your Gameflip verification code is 494236', 'RECEIVED', 1515781755, 0, 'N', '2018-01-20 16:40:19'),
(2, 204, 8, 'Omar Mouhieddine', '+212608082348', 'Mazal ma5rajti', 'RECEIVED', 1515785495, 0, 'N', '2018-01-20 16:40:18'),
(2, 205, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  11 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515786065, 0, 'N', '2018-01-20 16:40:17'),
(2, 206, 4, 'Ma Chérie', '+212603844294', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603844294 le 12/01/2018 à 21:10\n', 'RECEIVED', 1515791565, 0, 'N', '2018-01-20 16:40:16'),
(2, 207, 4, 'Ma Chérie', '+212603844294', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1515848189, 0, 'N', '2018-01-20 16:40:15'),
(2, 208, 9, 'inwi', 'inwi', 'Votre Bonus national est epuise.', 'RECEIVED', 1515848383, 0, 'N', '2018-01-20 16:40:14'),
(2, 209, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 46 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515848704, 0, 'N', '2018-01-20 16:40:12'),
(2, 210, 7, 'CIH', 'CIH', '187306 est le code confidentiel pour compléter la Recharge Télécom. Attention !! Ce code a une validité de 5 mn. A ne communiquer à personne.', 'RECEIVED', 1515849718, 0, 'N', '2018-01-20 16:40:11'),
(2, 211, 9, 'inwi', 'inwi', 'Vous avez recharge 20 Dh. Vous beneficiez de 2h vers le national valables 7 jours', 'RECEIVED', 1515849757, 0, 'N', '2018-01-20 16:40:10'),
(2, 212, 9, 'inwi', 'inwi', 'استافدوا من 500Mo انترنت صالحة ل2 أيام عوض يوم واحد غير ب5 دراهم!  للتشغيل ارسلوا 2 عبر SMS إلى 990. ', 'RECEIVED', 1515849810, 0, 'N', '2018-01-20 16:40:09'),
(2, 213, 10, 'Service Client', '220', 'Recharge effectuée , votre numéro d\'opération est le HH2034. Pour toute information contactez-nous au 220.', 'RECEIVED', 1515850748, 0, 'N', '2018-01-20 16:40:08'),
(2, 214, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515861278, 0, 'N', '2018-01-20 16:40:07'),
(2, 215, 20, 'Père', '+212603969901', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212603969901 le 13/01/2018 à 18:50\n', 'RECEIVED', 1515869500, 0, 'N', '2018-01-20 16:40:06'),
(2, 216, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  11 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515871049, 0, 'N', '2018-01-20 16:40:05'),
(2, 217, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  52 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515875025, 0, 'N', '2018-01-20 16:40:04'),
(2, 218, 19, 'Mere', '+212629149276', 'Ce correspondant a essayé de vous appeler plusieurs fois, dernier appel reÇu du \n+212629149276 le 13/01/2018 à 23:26\n', 'RECEIVED', 1515891847, 0, 'N', '2018-01-20 16:40:03'),
(2, 219, 20, 'Père', '+212603969901', 'Ce correspondant a essayé de vous appeler plusieurs fois, dernier appel reÇu du \n+212603969901 le 13/01/2018 à 21:31\n', 'RECEIVED', 1515891852, 0, 'N', '2018-01-20 16:40:02'),
(2, 220, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 9 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1515947823, 1, 'N', '2018-01-20 16:40:01'),
(2, 221, 32, 'INFRACTION', 'INFRACTION', 'Merci d\'avoir installé l\'application mobile de consultation des infractions.\nVotre mot de passe est : PVCKI7', 'RECEIVED', 1515965578, 0, 'N', '2018-01-20 16:40:01'),
(2, 222, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  13 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516009057, 1, 'N', '2018-01-20 16:39:59'),
(2, 223, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 15/01/2018 à 10:47. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1516015491, 0, 'N', '2018-01-20 16:39:58'),
(2, 224, 33, 'Verify', 'Verify', 'Your Gameflip verification code is 734159', 'RECEIVED', 1516037782, 0, 'N', '2018-01-20 16:39:57'),
(2, 225, 25, 'Google', 'Google', 'G-361063 is your Google verification code.', 'RECEIVED', 1516039913, 0, 'N', '2018-01-20 16:39:56'),
(2, 226, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 15/01/2018 à 20:32. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1516048366, 0, 'N', '2018-01-20 16:39:55'),
(2, 227, 10, 'Service Client', '220', 'inwi :\n روشارج*2 فيها كلشي استعمل بها للي حتاجيتي. 10DH كتمنحكم 1h وطنية أو 1Go لمدة 7 أيام عوض 3 أيام.عرض صالح إلى غاية 22 يناير.للاستفادة ركبوا *2 بعد كود الروشارج', 'RECEIVED', 1516103747, 0, 'N', '2018-01-20 16:39:55'),
(2, 228, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  20 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516106667, 1, 'N', '2018-01-20 16:39:53'),
(2, 229, 34, 'Aziz Boutaleb', '+212653380559', 'Ce correspondant a essayé de vous appeler 1 fois, dernier appel reÇu du \n+212653380559 le 16/01/2018 à 16:05\n', 'RECEIVED', 1516118765, 0, 'N', '2018-01-20 16:39:52'),
(2, 230, 4, 'Ma Chérie', '+212603844294', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1516121913, 0, 'N', '2018-01-20 16:39:51'),
(2, 231, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 34 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516134563, 1, 'N', '2018-01-20 16:39:50'),
(2, 232, 4, 'Ma Chérie', '+212603844294', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1516137207, 0, 'N', '2018-01-20 16:39:49'),
(2, 233, 4, 'Ma Chérie', '+212603844294', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1516140854, 0, 'N', '2018-01-20 16:39:48'),
(2, 234, 27, 'Mehdi Bouazar', '+212695431461', 'Ra bdina a sat', 'RECEIVED', 1516180104, 0, 'N', '2018-01-20 16:39:47'),
(2, 235, 10, 'Service Client', '220', 'Club inwi : Rendez-vous aujourd\'hui sur club.inwi.ma ou sur l\'appli Club inwi pour choisir votre KDO ou envoyez 3 au 665 pour un KDO par défaut.', 'RECEIVED', 1516203672, 0, 'N', '2018-01-20 16:39:46'),
(2, 236, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 59 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516209625, 1, 'N', '2018-01-20 16:39:45'),
(2, 237, 8, 'Omar Mouhieddine', '+212608082348', 'Boit vocal ri icha3lo nsowlo', 'RECEIVED', 1516210253, 0, 'N', '2018-01-20 16:39:44'),
(2, 238, 4, 'Ma Chérie', '+212603844294', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1516223047, 0, 'N', '2018-01-20 16:39:43'),
(2, 239, 4, 'Ma Chérie', '+212603844294', 'مرحباً،هل يمكن لكم الاتصال بي من فضلكم، شكراً!!!', 'RECEIVED', 1516275472, 0, 'N', '2018-01-20 16:39:42'),
(2, 240, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  4 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516282946, 1, 'N', '2018-01-20 16:39:41'),
(2, 241, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  18 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516284048, 1, 'N', '2018-01-20 16:39:40'),
(2, 242, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 15 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516295873, 1, 'N', '2018-01-20 16:39:39'),
(2, 243, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 50 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516296997, 1, 'N', '2018-01-20 16:39:38'),
(2, 244, 9, 'inwi', 'inwi', 'Votre Bonus national est epuise.', 'RECEIVED', 1516297003, 1, 'N', '2018-01-20 16:39:37'),
(2, 245, 9, 'inwi', 'inwi', 'Votre Bonus national est epuise.', 'RECEIVED', 1516297536, 1, 'N', '2018-01-20 16:39:36'),
(2, 246, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  18 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516297834, 1, 'N', '2018-01-20 16:39:35'),
(2, 247, 35, '46769447011', '46769447011', 'G-859196 is your Google verification code.', 'RECEIVED', 1516308779, 0, 'N', '2018-01-20 16:39:34'),
(2, 248, 9, 'inwi', 'inwi', 'Felicitations. Vous profitez d un bonus depannage national de 60 secondes ou 10 SMS gratuits valable 2 jours', 'RECEIVED', 1516309628, 1, 'N', '2018-01-20 16:39:33'),
(2, 249, 25, 'Google', 'Google', 'G-202935 is your Google verification code.', 'RECEIVED', 1516360061, 0, 'N', '2018-01-20 16:39:32'),
(2, 250, 9, 'inwi', 'inwi', 'عرض خاص، إلى غاية منتصف الليل استافدوا من رصيد X10 على كل روشارج 20 درهم صالح لمدة 3 أشهر .', 'RECEIVED', 1516363741, 1, 'N', '2018-01-20 16:39:31'),
(2, 251, 36, 'CityClub', 'CityClub', 'VENTE FLASH aujourd\'hui chez CityClub!SUPER PROMO 1+1=3 soit 1633Dh/personne! Soyez malin venez a trois et faites du sport entre amis!Offre limitée!0522647000', 'RECEIVED', 1516374827, 1, 'N', '2018-01-20 16:39:30'),
(2, 252, 9, 'inwi', 'inwi', 'Vous avez recharge 20 Dh. Vous beneficiez de 2h vers le national valables 7 jours', 'RECEIVED', 1516377538, 1, 'N', '2018-01-20 16:39:29'),
(2, 253, 9, 'inwi', 'inwi', 'استافدوا من 500Mo انترنت صالحة ل2 أيام عوض يوم واحد غير ب5 دراهم!  للتشغيل ارسلوا 2 عبر SMS إلى 990. ', 'RECEIVED', 1516377554, 1, 'N', '2018-01-20 16:39:28');
INSERT INTO `sms` (`id_device`, `_id`, `thread_id`, `contact`, `phone_number`, `body`, `type`, `date`, `reviewed`, `warning`, `added_at`) VALUES
(2, 254, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 31 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516378543, 1, 'N', '2018-01-20 16:39:27'),
(2, 255, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  2 min 33 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516379018, 1, 'N', '2018-01-20 16:39:26'),
(2, 256, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  6 min 45 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516379311, 1, 'N', '2018-01-20 16:39:25'),
(2, 257, 27, 'Mehdi Bouazar', '+212695431461', '0662494917', 'RECEIVED', 1516379407, 0, 'N', '2018-01-20 16:39:24'),
(2, 258, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  1 min 17 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516380321, 1, 'N', '2018-01-20 16:39:23'),
(2, 259, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  6 min 55 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516390429, 1, 'N', '2018-01-20 16:39:22'),
(2, 260, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  15 min 5 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516392620, 1, 'N', '2018-01-20 16:39:21'),
(2, 261, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  21 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516397099, 1, 'N', '2018-01-20 16:39:20'),
(2, 262, 20, 'Père', '+212603969901', 'Vous avez essayé d\'appeler le +212603969901, le 19/01/2018 à 21:13. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1516397235, 0, 'N', '2018-01-20 16:39:19'),
(2, 263, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  17 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516402412, 1, 'N', '2018-01-20 16:39:18'),
(2, 264, 37, 'Moustapha Loudi', '+212603052853', 'Ce correspondant a essayé de vous appeler plusieurs fois, dernier appel reÇu du \n+212603052853 le 20/01/2018 à 11:11\n', 'RECEIVED', 1516446921, 0, 'N', '2018-01-20 16:39:17'),
(2, 265, 2, 'IAM', 'IAM', 'Votre connexion internet vous offre encore 4 Mo, à consommer jusqu\'au 20/01/2018 à 14:42. Pensez à recharger votre compte internet, code recharge *3. ', 'RECEIVED', 1516447863, 0, 'N', '2018-01-20 16:39:16'),
(2, 266, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  35 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516450310, 1, 'N', '2018-01-20 16:39:15'),
(2, 267, 38, 'Globalsms', 'Globalsms', 'PayPal: Your confirmation code is: 434252. Your code expires in 5 minutes. Please don\'t reply.', 'RECEIVED', 1516458440, 0, 'N', '2018-01-20 16:39:14'),
(2, 268, 8, 'Omar Mouhieddine', '+212608082348', 'Vous avez essayé d\'appeler le +212608082348, le 20/01/2018 à 13:35. Il est désormais joignable si vous souhaitez le rappeler', 'RECEIVED', 1516460253, 0, 'N', '2018-01-20 16:39:13'),
(2, 269, 9, 'inwi', 'inwi', 'Votre dernier appel emis a dure  6 sec.  Consultation GRATUITE du solde en appelant le 1202.Pour desactiver cette notification,composez le *120*33#', 'RECEIVED', 1516464596, 1, 'N', '2018-01-20 16:39:12'),
(2, 315, 8, 'Omar Mouhieddine', '+212608082348', 'Jawb ', 'RECEIVED', 1516623541, 0, 'N', '2018-01-22 13:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `lname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `username` varchar(20) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(32) CHARACTER SET latin1 NOT NULL,
  `status` enum('NEW','CONFIRMED','BLACKLISTED') CHARACTER SET latin1 NOT NULL DEFAULT 'NEW',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `username`, `email`, `password`, `status`, `updated_at`, `added_at`) VALUES
(1, 'med', 'bzr', 'bzrmed', 'bzrmed10@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'CONFIRMED', '2018-01-24 12:11:26', '2018-01-18 19:25:06'),
(2, 'Ahmed ', 'Hannachi', 'Nkconcept', 'Ahmedhannachi25@gmail.com', 'a34e0b31f815c5efd6cee39915a31b37', 'CONFIRMED', '2018-01-20 16:37:38', '2018-01-20 16:19:56');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `onUpdateCurrentTimeStamp` BEFORE UPDATE ON `user` FOR EACH ROW SET NEW.updated_at=CURRENT_TIMESTAMP
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `call`
--
ALTER TABLE `call`
  ADD PRIMARY KEY (`_id`,`id_device`),
  ADD KEY `id_device` (`id_device`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id_device`,`_id`),
  ADD KEY `id_device` (`id_device`),
  ADD KEY `id_device_2` (`id_device`),
  ADD KEY `_id` (`_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `call`
--
ALTER TABLE `call`
  ADD CONSTRAINT `call_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id`);

--
-- Constraints for table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `sms`
--
ALTER TABLE `sms`
  ADD CONSTRAINT `sms_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
