-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 09, 2023 at 04:05 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `idCom` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`idCom`, `comment`, `created_date`) VALUES
(3, 'Un site qui instruit merci', '2023-02-09 14:02:34'),
(2, 'Ahh ce site est le bienvenue', '2023-02-09 14:01:07'),
(4, 'Super ca!', '2023-02-09 14:02:43'),
(5, 'Des devoirs de qualité merci!', '2023-02-09 14:03:01'),
(7, 'Ouff quelle panoplie de\'enseignement', '2023-02-09 14:03:50'),
(8, 'Ah OUpsss quelle decouverte', '2023-02-09 14:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `inscris`
--

CREATE TABLE `inscris` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscris`
--

INSERT INTO `inscris` (`id`, `name`, `email`, `contact`) VALUES
(1, 'Kouakou Bath De-roh Dorgeles', 'bathdorgeleskouakou@gmail.com', '0705364991'),
(3, 'Brye Oceane', 'Oceane@gmail.com', '0704765424'),
(4, 'Bedou Laliere', 'Bedouuuuu@gmail.com', '0768565432'),
(5, 'Coulibaly Marcel', 'Coulibaly@gmail.com', '0747651908'),
(6, 'Sehi David', 'sehi@gmail.com', '0788654709'),
(7, 'Ouattara Affousiata', 'Ouattara@gmail.com', '0155678325'),
(10, 'Koua William', 'koua@gmail.com', '0154342321'),
(9, 'Toure Valsindou', 'valse@gmail.com', '0165747865');

--
-- Triggers `inscris`
--
DELIMITER $$
CREATE TRIGGER `trigger_delete` AFTER DELETE ON `inscris` FOR EACH ROW INSERT INTO log(date,heure,action,donnees) VALUES(CURRENT_DATE, CURRENT_TIME,"DELETE",OLD.name)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_insert` AFTER INSERT ON `inscris` FOR EACH ROW INSERT INTO log(date,heure,action,donnees) VALUES(CURRENT_DATE, CURRENT_TIME,"INSERT",New.name)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update` AFTER UPDATE ON `inscris` FOR EACH ROW INSERT INTO log(date,heure,action,donnees) VALUES(CURRENT_DATE, CURRENT_TIME,"UPDATE",Old.name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `action` varchar(10) NOT NULL,
  `donnees` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `date`, `heure`, `action`, `donnees`) VALUES
(1, '2023-02-09', '13:05:06', 'INSERT', 'Kouakou Bath De-roh Dorgeles'),
(2, '2023-02-09', '13:06:10', 'INSERT', 'Koua Willian'),
(3, '2023-02-09', '13:06:54', 'INSERT', 'Brye Oceane'),
(4, '2023-02-09', '13:07:34', 'INSERT', 'Bedou Lalie'),
(5, '2023-02-09', '13:08:13', 'INSERT', 'Coulibaly Marcel'),
(6, '2023-02-09', '13:08:57', 'INSERT', 'Sehi David'),
(7, '2023-02-09', '13:10:22', 'INSERT', 'Ouattara Affousiata'),
(8, '2023-02-09', '13:11:08', 'INSERT', 'N\'goran Elie'),
(9, '2023-02-09', '13:59:52', 'INSERT', 'Toure Valsindou'),
(10, '2023-02-09', '14:00:01', 'DELETE', 'N\'goran Elie'),
(11, '2023-02-09', '14:49:40', 'UPDATE', 'Koua Willian'),
(12, '2023-02-09', '14:50:00', 'DELETE', 'Koua Williannnnnnnnnnnnnn'),
(13, '2023-02-09', '14:50:33', 'INSERT', 'Koua William'),
(14, '2023-02-09', '14:51:26', 'UPDATE', 'Bedou Lalie');

-- --------------------------------------------------------

--
-- Table structure for table `matieres`
--

CREATE TABLE `matieres` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matieres`
--

INSERT INTO `matieres` (`id`, `nom`) VALUES
(1, 'Python'),
(2, 'Java'),
(3, 'Vue js'),
(4, 'React js'),
(5, 'Swift'),
(6, 'flutter'),
(7, 'JavaScript');

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `idProjet` int(11) NOT NULL,
  `titreProjet` varchar(255) NOT NULL,
  `descripProjet` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`idProjet`, `titreProjet`, `descripProjet`) VALUES
(1, 'Intelligence Artificielle', 'Un projet qui prone les ecrit sur la voix d\'un homme'),
(2, 'Cacao App(Python)', 'Une vie en foret une experience extraordinaire'),
(3, 'Conception d\'un blog en React native', 'Une discussions dans une tranquilité absolue'),
(4, 'Realisation d\'une App de Route', 'Definir la routes qu\'on veut prendre au volant d\'une voiture'),
(6, 'Vite js', 'Travailler vitejs');

-- --------------------------------------------------------

--
-- Table structure for table `publicationn`
--

CREATE TABLE `publicationn` (
  `idPub` int(11) NOT NULL,
  `matierePub` varchar(255) NOT NULL,
  `typeExPub` varchar(255) NOT NULL,
  `lecritPub` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publicationn`
--

INSERT INTO `publicationn` (`idPub`, `matierePub`, `typeExPub`, `lecritPub`) VALUES
(1, '3', 'Devoir', 'Faire un programme de definition de mot'),
(2, '1', 'Devoir', 'Faire un programme de definition '),
(3, '1', 'interrogation', 'Un devoir de qualité'),
(4, '2', 'Devoir', 'Faire un programme de definition de mot'),
(5, '6', 'interrogation', 'Faire une vue simplement'),
(6, '4', 'interrogation', 'Exo1'),
(7, '4', 'Devoir', 'Ewo2'),
(8, '6', 'interrogation', 'Faire une App'),
(9, '2', 'interrogation', 'Conception d\'une Api'),
(10, '5', 'Devoir', 'Faire une App de maison a loué'),
(11, '7', 'interrogation', 'Fairre une barre de recherche'),
(12, '7', 'Devoir', 'Faire des requetes au travers de la BDD'),
(13, '2', 'interrogation', 'Faire une App de gestion'),
(14, '2', 'interrogation', 'Algo vite faire'),
(15, '3', 'interrogation', 'Add Button'),
(16, '4', 'Devoir', 'Add a LINK'),
(17, '1', 'interrogation', 'add a color rigth'),
(18, '3', 'Devoir', 'yes create a new app');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`idCom`);

--
-- Indexes for table `inscris`
--
ALTER TABLE `inscris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`idProjet`);

--
-- Indexes for table `publicationn`
--
ALTER TABLE `publicationn`
  ADD PRIMARY KEY (`idPub`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `idCom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inscris`
--
ALTER TABLE `inscris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `idProjet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `publicationn`
--
ALTER TABLE `publicationn`
  MODIFY `idPub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
