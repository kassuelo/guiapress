-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.21 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela guiapress.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela guiapress.articles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `slug`, `body`, `createdAt`, `updatedAt`, `categoryId`) VALUES
	(2, 'alteradaasdasd', 'alteradaasdasd', '<p>corpo asdasdasdasd</p>', '2020-08-18 20:03:33', '2020-09-04 17:16:13', 5),
	(3, 'Where does it come from?', 'Where-does-it-come-from', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.</p>', '2020-08-18 20:13:23', '2020-08-18 20:13:23', 7),
	(4, 'What is Lorem Ipsum?', 'What-is-Lorem-Ipsum', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2020-08-18 20:14:59', '2020-08-18 20:14:59', 5),
	(5, 'Where can I get some?', 'Where-can-I-get-some', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '2020-08-18 20:15:16', '2020-08-18 20:15:16', 5),
	(6, 'testan', 'testan', '<p>hhfhfgdgdf</p>', '2020-09-04 18:05:25', '2020-09-04 18:05:25', 5);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Copiando estrutura para tabela guiapress.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela guiapress.categories: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `title`, `slug`, `createdAt`, `updatedAt`) VALUES
	(5, 'Teste 34', 'Teste-34', '2020-07-31 18:07:01', '2020-08-08 16:40:09'),
	(6, 'TSDFSD', 'TSDFSD', '2020-08-02 21:50:27', '2020-08-02 21:50:27'),
	(7, 'asdasdasdasd', 'asdasdasdasd', '2020-08-02 21:55:40', '2020-08-02 21:55:40');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela guiapress.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela guiapress.users: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
	(1, 'teste@teste', '$2a$10$l/GkTYclL49xb43CdYf3A.hDXtR7AW3NVf/TpgdJSYJ.2vCzv1zha', '2020-09-19 18:49:47', '2020-09-19 18:49:47'),
	(3, '', '$2a$10$1mqBWYZ4u805gEK/e.Mc9e7MeCnTXMeffXoudAS0g.yVnXdaASevi', '2020-09-26 13:10:29', '2020-09-26 13:10:29'),
	(4, 'asasa@dasd', '$2a$10$/J7nvGIOvovnVDS0NpriCuvaLCOJGI5NBfOlRu.jKFEXNn93K2xLq', '2020-09-26 13:39:40', '2020-09-26 13:39:40'),
	(5, 'asdasd@asdasd', '$2a$10$sZrk6GUImlR7vLWCg9fVzuOAh4d0SYnnmPGsiZduUM7efo.v57Y46', '2020-09-26 13:46:27', '2020-09-26 13:46:27'),
	(6, 'kassuelo.mo@hotmail.com', '$2a$10$yEljSLR2nTU0XNH/H1Mrh.6adJnWgD4bH2a.OT7tSHK4nDOcxOg7i', '2020-09-26 13:51:30', '2020-09-26 13:51:30'),
	(7, 'teste@teste.com', '$2a$10$wnPsavM.9/aCYsViZzya0.8PzytbgXmSAjhQjs2x8BAhWfrHjYgDK', '2020-10-27 14:05:43', '2020-10-27 14:05:43'),
	(8, 'kas@kas', '$2a$10$.9T6Oa..4q/UmB4quAsxfe/IgbWjx5ky/OZb8xAYzSI/ylYjd1fDy', '2020-10-27 16:12:29', '2020-10-27 16:12:29'),
	(9, 'trator@trator', '$2a$10$ZJdHjXCeE.Qzv83nRwPVR.56mVsK6rhCOjV6ilUc/8LON.fUxK3WG', '2020-10-27 16:13:24', '2020-10-27 16:13:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
