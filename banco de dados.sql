-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2021 às 23:42
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cervejaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cerveja`
--

CREATE TABLE `cerveja` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `país` varchar(100) DEFAULT NULL,
  `teor` varchar(10) DEFAULT NULL,
  `preco` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cerveja`
--

INSERT INTO `cerveja` (`id`, `nome`, `tipo`, `país`, `teor`, `preco`) VALUES
(1, 'Duvel', 'Belgian Strong Ale', 'Bélgica', '8,5%', '20'),
(2, 'Punk Ipa', 'IPA', 'Escócia', '5,6%', '18'),
(3, 'Samuel Adams', 'Boston Lager', 'Estados Unidos', '5,7%', '17'),
(4, 'Erdinger ', 'Weiss', 'Alemanha', '5,3%', '21'),
(5, 'Guinness Extra Stout', 'Stout', 'Irlanda', '6,5%', '45'),
(6, 'Guinness', 'Dry Stout', 'Irlanda', '4,1%', '17'),
(7, 'Paulaner', 'Weiss', 'Alemanha', '5,5%', '19'),
(8, 'La Trappe Triple', 'Belgian Pale Ale', 'Holanda', '8,00%', '31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_cliente` bigint(20) UNSIGNED NOT NULL,
  `id_tipo_pagamento` bigint(20) UNSIGNED NOT NULL,
  `pagamentoTotal` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagamento`
--

CREATE TABLE `tipo_pagamento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`id`, `descricao`) VALUES
(1, 'dinheiro'),
(2, 'credito'),
(3, 'debito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `nascimento` varchar(10) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `rg` varchar(30) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `uf` varchar(10) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `login` varchar(150) DEFAULT NULL,
  `senha` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cerveja`
--
ALTER TABLE `cerveja`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_UsuarioPagamento` (`id_cliente`),
  ADD KEY `FK_TipoPagamentoPagamento` (`id_tipo_pagamento`);

--
-- Índices para tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cerveja`
--
ALTER TABLE `cerveja`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `FK_TipoPagamentoPagamento` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tipo_pagamento` (`id`),
  ADD CONSTRAINT `FK_UsuarioPagamento` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
