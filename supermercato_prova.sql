-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 26, 2018 alle 00:54
-- Versione del server: 10.1.29-MariaDB
-- Versione PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermercato_prova`
--
CREATE DATABASE IF NOT EXISTS `supermercato_prova` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `supermercato_prova`;

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisti`
--

CREATE TABLE `acquisti` (
  `scontrino` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `quantita` float(10,2) DEFAULT NULL,
  `prezzo` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `acquisti`
--

INSERT INTO `acquisti` (`scontrino`, `prodotto`, `quantita`, `prezzo`) VALUES
(2, 4, 100.00, 60.00),
(2, 5, 15.00, 30.00),
(3, 1, 1.00, 21.50),
(3, 3, 1.00, 0.00),
(3, 8, 12.00, 34.50),
(4, 11, 9.00, 80.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `listino`
--

CREATE TABLE `listino` (
  `Prodotto` int(11) NOT NULL,
  `Reparto` int(11) DEFAULT NULL,
  `Prezzo` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `listino`
--

INSERT INTO `listino` (`Prodotto`, `Reparto`, `Prezzo`) VALUES
(1, 3, 21.50),
(2, 3, 25.50),
(3, 3, 100.00),
(4, 1, 1.50),
(5, 1, 0.80),
(8, 1, 1.00),
(9, 2, 2.50),
(10, 2, 1.50),
(11, 2, 0.90);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `codice` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`codice`, `nome`, `marca`) VALUES
(1, 'cuffie', 'sony'),
(2, 'cuffie', 'panasonic'),
(3, 'cuffie', 'jbl'),
(4, 'uva', 'none'),
(5, 'mele', 'melinda'),
(8, 'pere', 'none'),
(9, 'orsetti gommosi', 'haribo'),
(10, 'liquirizie', 'haribo'),
(11, 'caramelle gommose', 'fruittella'),
(12, 'glitter', 'UHU');

-- --------------------------------------------------------

--
-- Struttura della tabella `reparti`
--

CREATE TABLE `reparti` (
  `codice` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `reparti`
--

INSERT INTO `reparti` (`codice`, `nome`) VALUES
(1, 'ortofrutta'),
(2, 'caramelle'),
(3, 'elettronica');

-- --------------------------------------------------------

--
-- Struttura della tabella `scontrini`
--

CREATE TABLE `scontrini` (
  `codice` int(11) NOT NULL,
  `dataScontrino` date DEFAULT NULL,
  `totale` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `scontrini`
--

INSERT INTO `scontrini` (`codice`, `dataScontrino`, `totale`) VALUES
(1, '2016-12-21', 160.50),
(2, '2017-12-04', 90.00),
(3, '2016-01-14', 56.00),
(4, '2017-12-04', 98.60),
(5, '2018-01-03', 1230.10);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `acquisti`
--
ALTER TABLE `acquisti`
  ADD PRIMARY KEY (`scontrino`,`prodotto`),
  ADD KEY `prodotto` (`prodotto`);

--
-- Indici per le tabelle `listino`
--
ALTER TABLE `listino`
  ADD PRIMARY KEY (`Prodotto`),
  ADD KEY `Reparto` (`Reparto`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `reparti`
--
ALTER TABLE `reparti`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `scontrini`
--
ALTER TABLE `scontrini`
  ADD PRIMARY KEY (`codice`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `reparti`
--
ALTER TABLE `reparti`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `scontrini`
--
ALTER TABLE `scontrini`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  ADD CONSTRAINT `acquisti_ibfk_1` FOREIGN KEY (`scontrino`) REFERENCES `scontrini` (`codice`),
  ADD CONSTRAINT `acquisti_ibfk_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotti` (`codice`);

--
-- Limiti per la tabella `listino`
--
ALTER TABLE `listino`
  ADD CONSTRAINT `listino_ibfk_1` FOREIGN KEY (`Reparto`) REFERENCES `reparti` (`codice`),
  ADD CONSTRAINT `listino_ibfk_2` FOREIGN KEY (`Prodotto`) REFERENCES `prodotti` (`codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
