-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Apr 11, 2022 at 09:23 PM
-- Server version: 10.6.5-MariaDB-1:10.6.5+maria~focal
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Warm up'),
(2, 'Upper body'),
(3, 'Lower body'),
(4, 'Core'),
(5, 'Cardio');

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `image` varchar(500) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`id`, `name`, `description`, `image`, `category_id`) VALUES
(1, 'Streching', 'Though static stretching is a part of some pre and post-workout routines, a review article that was published in January 2020 by the Scandinavian Society of Clinical Physiology and Nuclear Medicine, indicated that pre-exercise static stretching did in-fact reduce an individual\'s overall muscular strength and maximal performance. Furthermore, these findings present a uniform effect, regardless of an individual\'s age, sex, or training status', 'https://cdn-icons-png.flaticon.com/512/82/82838.png', 1),
(2, 'Walk', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ante neque, pretium ut interdum eu, ultrices nec dolor. Curabitur semper mattis sagittis. Nulla consectetur erat vel risus sodales, sit amet congue nulla sodales. Nullam condimentum mattis nisl, quis pharetra purus lacinia ac. Praesent ut ullamcorper metus. Etiam lacinia dui nunc, volutpat tincidunt neque sollicitudin tristique. Morbi dictum mi non eleifend porta. Vestibulum laoreet neque odio, congue tristique nulla imperdiet vel.', 'https://cdn-icons-png.flaticon.com/512/4720/4720990.png', 1),
(3, 'Cycle', 'Bicycles provide numerous possible benefits in comparison with motor vehicles,\r\nincluding the sustained physical exercise involved in cycling, easier parking,\r\nincreased maneuverability, and access to roads, bike paths and rural trails.\r\nCycling also offers a reduced consumption of fossil fuels, less air or noise\r\npollution, reduced greenhouse gas emissions, and greatly reduced traffic congestion. \r\nThese have a lower financial cost for users as well as for society at large\r\n(negligible damage to roads, less road area required). By fitting bicycle racks on the\r\nfront of buses, transit agencies can significantly increase the areas they can serve.', 'https://cdn-icons-png.flaticon.com/512/2843/2843746.png', 1),
(4, 'Bench Press', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ante neque, pretium ut interdum eu, ultrices nec dolor. Curabitur semper mattis sagittis. Nulla consectetur erat vel risus sodales, sit amet congue nulla sodales. Nullam condimentum mattis nisl, quis pharetra purus lacinia ac. Praesent ut ullamcorper metus. Etiam lacinia dui nunc, volutpat tincidunt neque sollicitudin tristique. Morbi dictum mi non eleifend porta. Vestibulum laoreet neque odio, congue tristique nulla imperdiet vel.', 'https://cdn-icons-png.flaticon.com/512/7208/7208427.png', 2),
(5, 'Pull Ups', 'Nunc porta eu mauris eget egestas. Etiam finibus libero et lorem dignissim, et pharetra tellus sodales. Donec ipsum magna, lobortis hendrerit consequat ut, varius id nulla. Curabitur est massa, dictum quis dignissim eu, blandit eget ex. Suspendisse semper felis in ante ultricies, ut scelerisque augue interdum. Donec ultricies mi quis neque bibendum, vel mattis felis commodo. Aliquam sed lorem libero. Donec a accumsan felis, id blandit nulla. Etiam ac dictum felis.', 'https://cdn-icons-png.flaticon.com/512/5151/5151220.png', 2),
(27, 'Squat', 'Praesent ac finibus tortor. Curabitur in congue risus. Sed finibus imperdiet dui vitae semper. Vivamus maximus nunc eu diam lacinia, in ullamcorper mi hendrerit. Sed nec sapien sapien. Phasellus sagittis porttitor lobortis. Nulla nulla leo, egestas ut tempus id, blandit at sem. Nulla hendrerit, sem at fermentum laoreet, turpis eros aliquam velit, sit amet finibus purus mauris sit amet ligula. Nullam condimentum enim nec sapien dictum vehicula.', 'https://cdn-icons-png.flaticon.com/512/6583/6583990.png', 3),
(28, 'Abs', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ante neque, pretium ut interdum eu, ultrices nec dolor. Curabitur semper mattis sagittis. Nulla consectetur erat vel risus sodales, sit amet congue nulla sodales. Nullam condimentum mattis nisl, quis pharetra purus lacinia ac. Praesent ut ullamcorper metus. Etiam lacinia dui nunc, volutpat tincidunt neque sollicitudin tristique. Morbi dictum mi non eleifend porta. Vestibulum laoreet neque odio, congue tristique nulla imperdiet vel.', 'https://cdn-icons-png.flaticon.com/512/2309/2309082.png', 4),
(30, 'Biceps Curls', 'Nunc at libero ut risus auctor molestie. Suspendisse gravida pharetra maximus. Suspendisse non gravida tortor. Proin sagittis ligula lectus, non euismod velit maximus et. Donec ultricies metus ut metus dapibus, ac pretium odio condimentum. Morbi odio dolor, suscipit ac nunc ac, rhoncus dictum lacus. Sed finibus diam non malesuada aliquet. Nunc sit amet feugiat ipsum.', 'https://cdn-icons-png.flaticon.com/512/639/639284.png', 2),
(31, 'Shoulders Press', 'Vestibulum tincidunt cursus arcu, vitae lobortis justo. Pellentesque aliquet vitae felis sit amet consectetur. Cras ipsum lorem, eleifend sed mi quis, posuere commodo arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer in lacus efficitur, egestas magna vel, placerat urna. Aenean nec sodales urna. Nulla at nunc purus. Donec pharetra lectus sed enim ultrices pulvinar. Etiam ullamcorper erat massa, ac scelerisque augue volutpat non. Phasellus euismod elementum pharetra.', 'https://cdn-icons-png.flaticon.com/512/2324/2324729.png', 2),
(32, 'Custom Exercise', 'This is an example of an exercise created by the user.', 'https://cdn-icons-png.flaticon.com/512/456/456249.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(1, 'username', '$2a$12$KDGhJKYY/QeQoNHjQ5.JE.kqI7QahSU7lq2f6PRfy4jEr/HmcXH.a', 'me@gym.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
