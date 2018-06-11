-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 28-Maio-2018 às 22:59
-- Versão do servidor: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_jsp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

DROP TABLE IF EXISTS `cardapio`;
CREATE TABLE IF NOT EXISTS `cardapio` (
  `IdPizza` int(8) NOT NULL AUTO_INCREMENT,
  `Sabor` varchar(50) DEFAULT NULL,
  `Preco` decimal(10,0) DEFAULT NULL,
  `TempoPreparo` int(5) DEFAULT NULL,
  PRIMARY KEY (`IdPizza`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cardapio`
--

INSERT INTO `cardapio` (`IdPizza`, `Sabor`, `Preco`, `TempoPreparo`) VALUES
(2, 'Americana', '40', 25),
(3, 'Atum', '37', 17),
(4, 'Baiana', '32', 23),
(5, 'Calabresa', '29', 25),
(6, 'Cinco Queijos', '28', 18),
(7, 'Escarola', '32', 30),
(8, 'Frango C/ Catupiry', '34', 32),
(9, 'Lombo C/ Mussarela', '39', 40),
(10, 'Marguerita', '31', 22),
(11, 'Portuguesa', '35', 26);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `IdPedido` int(8) NOT NULL AUTO_INCREMENT,
  `UsuarioId` int(8) NOT NULL,
  `PizzaId` int(8) NOT NULL,
  `Quantidade` int(4) NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `UsuarioId` (`UsuarioId`),
  KEY `PizzaId` (`PizzaId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`IdPedido`, `UsuarioId`, `PizzaId`, `Quantidade`) VALUES
(1, 1, 5, 5),
(2, 1, 2, 2),
(3, 1, 9, 1),
(4, 1, 9, 1),
(5, 1, 9, 1),
(6, 1, 9, 1),
(7, 1, 7, 1),
(10, 1, 3, 2),
(19, 1, 10, 1),
(21, 7, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(8) NOT NULL AUTO_INCREMENT,
  `NomeCliente` varchar(132) DEFAULT NULL,
  `Telefone` varchar(11) DEFAULT NULL,
  `Endereco` varchar(132) DEFAULT NULL,
  `NomeUsuario` varchar(50) DEFAULT NULL,
  `Senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `NomeCliente`, `Telefone`, `Endereco`, `NomeUsuario`, `Senha`) VALUES
(1, 'Gabriel Teste Teste', 'teste', 'teste', 'gabriel', '123'),
(7, 'teste', 'teste', 'teste', 'teste', '963'),
(12, 'teste', 'teste', 'teste', 'teste', '1234'),
(13, 'teste', 'teste', 'teste', 'teste', '7845'),
(14, 'teste', 'teste', 'teste', 'tete', '111');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuario` (`IdUsuario`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`PizzaId`) REFERENCES `cardapio` (`IdPizza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
