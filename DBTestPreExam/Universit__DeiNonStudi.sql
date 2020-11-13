-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Giu 23, 2020 alle 11:35
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UniversitàDeiNonStudi`
--
CREATE DATABASE IF NOT EXISTS `UniversitàDeiNonStudi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `UniversitàDeiNonStudi`;

-- --------------------------------------------------------

--
-- Struttura della tabella `Corsi`
--

CREATE TABLE `Corsi` (
  `numeroCorso` int(11) NOT NULL,
  `nomeCorso` varchar(50) DEFAULT NULL,
  `tipoCorso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Corsi`
--

INSERT INTO `Corsi` (`numeroCorso`, `nomeCorso`, `tipoCorso`) VALUES
(237, 'medicina', 'magistrale'),
(248, 'giurisprudenza', 'magistrale'),
(302, 'fisica', 'triennale'),
(305, 'ingegneria', 'triennale'),
(362, 'veterinaria', 'magistrale');

-- --------------------------------------------------------

--
-- Struttura della tabella `Dipartimento`
--

CREATE TABLE `Dipartimento` (
  `nomeDipartimento` varchar(50) DEFAULT NULL,
  `numeroDipartimento` int(11) NOT NULL,
  `numeroCorso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Dipartimento`
--

INSERT INTO `Dipartimento` (`nomeDipartimento`, `numeroDipartimento`, `numeroCorso`) VALUES
('Watzon', 1, 237),
('G.ruffo', 9, 362),
('Manzoni', 13, 248),
('Turing', 19, 305),
('Einstein', 21, 302);

-- --------------------------------------------------------

--
-- Struttura della tabella `Esami`
--

CREATE TABLE `Esami` (
  `voto` int(11) NOT NULL,
  `numeroCorso` int(11) NOT NULL,
  `matricola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Esami`
--

INSERT INTO `Esami` (`voto`, `numeroCorso`, `matricola`) VALUES
(28, 305, 101),
(30, 302, 102),
(18, 237, 104),
(30, 237, 105),
(26, 362, 106),
(25, 248, 103),
(30, 237, 107);

-- --------------------------------------------------------

--
-- Struttura della tabella `Insegnanti`
--

CREATE TABLE `Insegnanti` (
  `ID` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `ruolo` varchar(50) DEFAULT NULL,
  `CorsoTenuto` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Insegnanti`
--

INSERT INTO `Insegnanti` (`ID`, `nome`, `cognome`, `ruolo`, `CorsoTenuto`) VALUES
(333, 'federica', 'sacco', 'insegnate', 305),
(420, 'gianfranco', 'prestianni', 'insegnate', 302),
(666, 'matteo', 'interlandi', 'assistente insegnante', 248),
(892, 'andrea', 'musso', 'insegnante', 362),
(902, 'mario', 'rossi', 'insegnante', 237);

-- --------------------------------------------------------

--
-- Struttura della tabella `Studenti`
--

CREATE TABLE `Studenti` (
  `matricola` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `dataNascita` date DEFAULT NULL,
  `numeroCorso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Studenti`
--

INSERT INTO `Studenti` (`matricola`, `nome`, `cognome`, `dataNascita`, `numeroCorso`) VALUES
(101, 'ciccio', 'sacco', '2000-03-25', 305),
(102, 'mattei', 'annaro', '1999-11-12', 302),
(103, 'mino', 'raiola', '2000-03-17', 248),
(104, 'mowgli', 'denaro', '1999-03-25', 237),
(105, 'marzia', 'secondo', '2000-04-17', 237),
(106, 'lucia', 'prima', '2000-03-17', 362),
(107, 'tani', 'failla', '2000-07-17', 237);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Corsi`
--
ALTER TABLE `Corsi`
  ADD PRIMARY KEY (`numeroCorso`),
  ADD UNIQUE KEY `numeroCorso` (`numeroCorso`);

--
-- Indici per le tabelle `Dipartimento`
--
ALTER TABLE `Dipartimento`
  ADD PRIMARY KEY (`numeroDipartimento`),
  ADD KEY `NC-DC` (`numeroCorso`);

--
-- Indici per le tabelle `Esami`
--
ALTER TABLE `Esami`
  ADD KEY `MA-VS` (`matricola`),
  ADD KEY `NC-EC` (`numeroCorso`);

--
-- Indici per le tabelle `Insegnanti`
--
ALTER TABLE `Insegnanti`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `C-NC` (`CorsoTenuto`);

--
-- Indici per le tabelle `Studenti`
--
ALTER TABLE `Studenti`
  ADD PRIMARY KEY (`matricola`),
  ADD UNIQUE KEY `matricola` (`matricola`),
  ADD KEY `numeroCorso` (`numeroCorso`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Dipartimento`
--
ALTER TABLE `Dipartimento`
  ADD CONSTRAINT `NC-DC` FOREIGN KEY (`numeroCorso`) REFERENCES `Corsi` (`numeroCorso`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `Esami`
--
ALTER TABLE `Esami`
  ADD CONSTRAINT `MA-VS` FOREIGN KEY (`matricola`) REFERENCES `Studenti` (`matricola`) ON UPDATE CASCADE,
  ADD CONSTRAINT `NC-EC` FOREIGN KEY (`numeroCorso`) REFERENCES `Corsi` (`numeroCorso`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `Insegnanti`
--
ALTER TABLE `Insegnanti`
  ADD CONSTRAINT `C-NC` FOREIGN KEY (`CorsoTenuto`) REFERENCES `Corsi` (`numeroCorso`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `Studenti`
--
ALTER TABLE `Studenti`
  ADD CONSTRAINT `NC-CS` FOREIGN KEY (`numeroCorso`) REFERENCES `Corsi` (`numeroCorso`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
