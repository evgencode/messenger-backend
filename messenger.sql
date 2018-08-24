-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 24 2018 г., 17:37
-- Версия сервера: 5.7.19
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `messenger`
--

-- --------------------------------------------------------

--
-- Структура таблицы `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL COMMENT 'who created',
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `chat`
--

INSERT INTO `chat` (`id`, `uuid`, `date_create`, `user_id`, `name`) VALUES
(1, '5913180a-a6de-11e8-a696-00e052f88191', '2018-08-23 14:10:35', 1, 'Let\'s talk about nothing'),
(2, '5916b872-a6de-11e8-a696-00e052f88191', '2018-08-23 14:10:35', 1, 'Discuss a discussion'),
(3, '63a38541-a7a9-11e8-aba9-00e052f88191', '2018-08-23 14:10:35', 2, 'Design of chat'),
(4, 'a77a6c7b-a7a9-11e8-aba9-00e052f88191', '2018-08-23 14:10:35', 2, 'OTF frontend chat with log title');

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL DEFAULT '',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `message`
--

INSERT INTO `message` (`id`, `uuid`, `date_create`, `user_id`, `chat_id`, `content`) VALUES
(1, '6fe1ba17-a6de-11e8-a696-00e052f88191', '2018-08-23 14:11:13', 1, 1, 'In React 17, the componentWillReceiveProps() method will be deprecated. In order to prepare for this, we would like to replace as many instances of its use as possible.'),
(2, 'a47fc6d6-a7aa-11e8-aba9-00e052f88191', '2018-08-23 14:11:13', 2, 1, 'Different solutions may be appropriate for different situations. If you are unclear on the best approach, please discuss with the team.'),
(3, 'e58f8cfb-a7aa-11e8-aba9-00e052f88191', '2018-08-23 14:11:13', 2, 1, 'React makes it painless to create interactive UIs'),
(4, 'e59465ff-a7aa-11e8-aba9-00e052f88191', '2018-08-23 14:11:13', 2, 1, 'Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes.'),
(5, 'e596728e-a7aa-11e8-aba9-00e052f88191', '2018-08-23 14:11:13', 1, 2, 'Since component logic is written in JavaScript instead of templates, you can easily pass rich data through your app and keep state out of the DOM.'),
(6, 'e5988046-a7aa-11e8-aba9-00e052f88191', '2018-08-23 14:11:13', 2, 2, 'We don’t make assumptions about the rest of your technology stack, so you can develop new features in React without rewriting existing code.'),
(7, 'e59a8e65-a7aa-11e8-aba9-00e052f88191', '2018-08-23 14:11:13', 1, 2, 'Different solutions may be appropriate for different situations. If you are unclear on the best approach, please discuss with the team.React can also render on the server using Node and power mobile apps using React Native.');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `uuid`, `email`, `password`, `date_create`, `name`) VALUES
(1, '24bfdda3-a6de-11e8-a696-00e052f88191', 'test@test.com', 'e10adc3949ba59abbe56e057f20f883e', '2018-08-23 14:09:04', 'Evgen Petrov'),
(2, '24c482e4-a6de-11e8-a696-00e052f88191', 'test1@test.com', 'e10adc3949ba59abbe56e057f20f883e', '2018-08-23 14:09:04', 'Ivan Ivanov');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `email_password` (`email`,`password`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
