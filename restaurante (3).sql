-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/10/2023 às 02:14
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurante`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho_temporario`
--

CREATE TABLE `carrinho_temporario` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `sessao_id` varchar(255) NOT NULL,
  `data_adicao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `ID` int(11) NOT NULL,
  `PedidoID` int(11) DEFAULT NULL,
  `NomeProduto` varchar(100) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Observacoes` text DEFAULT NULL,
  `PrecoUnitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesas`
--

CREATE TABLE `mesas` (
  `mesa_id` int(11) NOT NULL,
  `numero_mesa` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `status` enum('livre','ocupada','reservada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `forma_pagamento` enum('cartao_credito','cartao_debito','pix','dinheiro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`ID`, `UsuarioID`, `nome`, `telefone`, `cpf`, `cep`, `rua`, `bairro`, `cidade`, `numero`, `forma_pagamento`) VALUES
(1, NULL, 'Maria Rita', '(14)997107356', '40377885860', '18803340', 'Avenida Vereador Milton Spínola', 'Jardim Paulista', 'Piraju', 660, 'cartao_credito'),
(2, NULL, 'Jessica', '(14)997903212', '52105371884', '18810562', 'Rua Antônio Bernardino', 'Conjunto Habitacional Doutor Ovídio Rodrigues Tucunduva Junior (Tibiriçá', 'Piraju', 141, 'dinheiro'),
(3, NULL, 'Maria Rita', '(14)997107356', '521.053.718.84', '18807022', 'Rua Plínio Ribas', 'Vila São José', 'Piraju', 15, 'pix'),
(4, NULL, 'Italo', '(14)997789625', '299.657.481.15', '18810562', 'Rua Antônio Bernardino', 'Conjunto Habitacional Doutor Ovídio Rodrigues Tucunduva Junior (Tibiriçá', 'Piraju', 161, 'pix');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `nome`, `descricao`, `preco`, `categoria`, `imagem`) VALUES
(1, 'Hamburguer', 'Delicioso hamburguer de carne com queijo e alface.', 8.99, 'Promocao', 'img/hamburguer.jpg'),
(2, 'Pizza de Pepperoni', 'Pizza de pepperoni com molho de tomate e queijo derretido.', 12.99, 'Promocao', 'img/pizza.jpg'),
(3, 'Salada Caesar', 'Conhecida por sua mistura de alface crocante, croutons de pão, queijo parmesão e um molho cremoso e saboroso.', 6.99, 'Saladas', 'img/salada.jpg'),
(4, 'Porção de Peixe ', 'Filé de tilápia frito acompanhada com limão.', 15.99, 'Promocao', 'img/tilapia.jpg'),
(5, 'Coca Lata ', 'Coca de 350ml ', 4.99, 'Bebidas', 'img/coca.jpg'),
(6, 'Suco Laranja ', 'Suco de laranja natural, com gelo e açúcar.', 7.99, 'Bebidas', 'img/laranja.jpg'),
(7, 'Bife a Parmegiana ', 'O bife à parmegiana é um prato tradicional da culinária italiana que consiste em uma deliciosa combinação de carne de bovina, empanada e frita, coberta com molho de tomate e queijo derretido.', 25.99, 'Pratos', 'img/parmegiana.jpg'),
(8, 'Feijoada Brasileira ', 'Nosso prato de feijoada é uma verdadeira celebração da culinária brasileira, que combina sabores ricos e autênticos em cada garfada. ', 21.99, 'Pratos ', 'img/feijoada.jpg'),
(9, 'Tilapia ao Alho', 'Nossa Tilápia ao Alho é uma experiência culinária sublime que combina a frescura da tilápia com o aroma e sabor reconfortantes do alho.', 26.99, 'Pratos', 'img/tilapia.jpg'),
(10, 'Executivo Vegano', 'Desfrute de uma explosão de sabores com nosso Risoto Primavera Vegano. Este prato é uma celebração das cores e sabores da estação, preparado com ingredientes frescos e de alta qualidade.', 28.99, 'Pratos', 'img/vegano.jpg'),
(11, 'Salada Russa', 'Ela é conhecida por sua combinação de ingredientes frescos e uma maionese cremosa que a torna deliciosa e reconfortante. ', 17.99, 'Saladas', 'img/saladarussa.jpeg\r\n'),
(12, 'Salada Colorida de Repolho', 'Esta salada fresca e crocante combina diferentes variedades de repolho, proporcionando uma variedade de tons vibrantes que fazem deste prato uma atração.', 13.99, 'Saladas', 'img/repolho.jpg'),
(13, 'Salada de Ricota', 'Esta salada fresca e colorida combina a suavidade da ricota com a doçura dos tomates maduros e o aroma do manjericão fresco, criando uma explosão de frescor em cada garfada.', 15.99, 'Saladas', 'img/salada-da-casa.jpg'),
(14, 'Salada Grão de Bico', 'Ela combina a suavidade do grão-de-bico cozido com uma variedade de ingredientes frescos e coloridos, criando um prato que agrada tanto ao paladar quanto aos olhos.', 14.99, 'Saladas', 'img/graodebico.png'),
(15, 'Salada Fresh', 'Este prato combina o doce e suculento da manga com ingredientes frescos e vibrantes, criando uma experiência de sabor que é uma verdadeira celebração da culinária tropical.', 15.99, 'Saladas', 'img/manga.jpeg'),
(16, 'Bife Acebolado', 'O Marmitex de Bife Acebolado é uma refeição deliciosa e reconfortante que combina bife grelhado, cebolas douradas e um toque de temperos. É uma escolha popular para quem deseja uma refeição caseira saborosa e nutritiva.', 15.99, 'Marmitex', 'img/bifeacebolado.jpg'),
(17, 'Lagarto ao Molho', 'Uma escolha indulgente e reconfortante que combina a suculência da carne de lagarto com um molho rico e saboroso. Preparado com carinho e ingredientes de qualidade, esta refeição oferece um verdadeiro deleite para o seu paladar.', 16.99, 'Marmitex', 'img/lagarto.jpg'),
(18, 'Churrasquinho', 'Um marmitex de churrasco é uma opção deliciosa e prática de refeição para quem deseja desfrutar do sabor defumado e suculento da carne grelhada em um formato para viagem.', 17.99, 'Marmitex', 'img/churrasco.jpg'),
(19, 'Strogonoff de Frango', 'Uma opção saborosa e reconfortante para o seu almoço. Preparamos esse clássico prato com carinho e ingredientes de alta qualidade para que você desfrute de uma refeição deliciosa a qualquer momento e em qualquer lugar.', 16.99, 'Marmitex', 'img/carnes.jpg'),
(20, 'Água sem Gás', 'água mineral de 500ml', 3.99, 'Bebidas', 'img/agua.jpeg'),
(21, 'Água com Gás', 'Água mineral gaseificada de 500ml', 3.99, 'Bebidas', 'img/aguagas2.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtospromocionais`
--

CREATE TABLE `produtospromocionais` (
  `produto_promo_id` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `promoção_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `promoção_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrição` text DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

CREATE TABLE `reservas` (
  `reserva_id` int(11) NOT NULL,
  `Nome` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mesa_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `numero_pessoas` int(11) NOT NULL,
  `status` enum('confirmada','pendente','cancelada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`reserva_id`, `Nome`, `mesa_id`, `usuario_id`, `data_hora`, `numero_pessoas`, `status`) VALUES
(1, 'Maria Rita ', 7, 0, '2023-10-28 13:25:00', 4, 'pendente'),
(2, 'Maria Rita ', 7, 0, '2023-10-28 13:25:00', 4, 'pendente'),
(3, 'Maria Rita ', 7, 0, '2023-10-28 13:25:00', 4, 'pendente'),
(4, 'Maria Rita ', 7, 0, '2023-10-28 13:25:00', 4, 'pendente'),
(5, 'Maria Rita ', 7, 0, '2023-10-28 13:25:00', 4, 'pendente'),
(6, 'Maria Rita ', 7, 0, '2023-10-28 13:25:00', 4, 'pendente'),
(7, 'Maria Eduarda', 5, NULL, '2023-10-24 14:40:00', 6, 'pendente'),
(8, 'Nathalia ', 4, NULL, '2023-10-27 14:45:00', 3, 'pendente'),
(9, 'Nathalia ', 4, NULL, '2023-10-27 14:45:00', 3, 'pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `papel` enum('cliente','funcionario','administrador') NOT NULL,
  `imagem_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`user_id`, `username`, `senha`, `nome`, `email`, `telefone`, `endereco`, `papel`, `imagem_url`) VALUES
(2, '', '123456', 'Hora Certa', 'horacertarestaurante@gmail.com', '14997389908', 'av. Vereador Milton Spinola, 660', 'administrador', NULL),
(4, '', '123654', 'Juliana ', 'jujbajuliana@gmail.com', '14998259002', 'Rua dos Pedreiro, 52 - Teto', 'cliente', './img/perfil2.jpeg'),
(5, '', '789456', 'Aline', 'Alinepiraju@gmail.com', '14997563214', 'Rua dos Pedreiro, 53 - Teto', 'cliente', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho_temporario`
--
ALTER TABLE `carrinho_temporario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PedidoID` (`PedidoID`);

--
-- Índices de tabela `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`mesa_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices de tabela `produtospromocionais`
--
ALTER TABLE `produtospromocionais`
  ADD PRIMARY KEY (`produto_promo_id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `promoção_id` (`promoção_id`);

--
-- Índices de tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`promoção_id`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`reserva_id`),
  ADD KEY `mesa_id` (`mesa_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho_temporario`
--
ALTER TABLE `carrinho_temporario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mesas`
--
ALTER TABLE `mesas`
  MODIFY `mesa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `produtospromocionais`
--
ALTER TABLE `produtospromocionais`
  MODIFY `produto_promo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `promoção_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `reserva_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho_temporario`
--
ALTER TABLE `carrinho_temporario`
  ADD CONSTRAINT `carrinho_temporario_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`);

--
-- Restrições para tabelas `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`PedidoID`) REFERENCES `pedidos` (`ID`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
