-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2022 at 06:11 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mardone`
--

-- --------------------------------------------------------

--
-- Table structure for table `last_movie`
--

CREATE TABLE `last_movie` (
  `id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Director` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `Length_minutes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `last_movie`
--

INSERT INTO `last_movie` (`id`, `Title`, `Director`, `Year`, `Length_minutes`) VALUES
(1, 'Toy Story', 'John Lasseter', '1995', '81'),
(2, 'A Bug\'s Life', 'John Lasseter', '1998', '95'),
(3, 'Toy Story 2', 'John Lasseter', '1999', '93'),
(4, 'Monsters, inc.', 'Pete Docter', '2001', '92'),
(5, 'Finding Nemo', 'Andrew Stanton', '2003', '107'),
(6, 'The Incredibles', 'Brad Bird', '2004', '116'),
(7, 'Cars', 'John Lasseter', '2006', '117'),
(8, 'Ratatouille', 'Brad Bird', '2007', '115'),
(9, 'WALL-E', 'Andrew Stanton', '2008', '104'),
(10, 'Up', 'Pete Docter', '2009', '101'),
(11, 'Toy Story 3', 'Lee Unkrich', '2010', '103'),
(12, 'Cars 2', 'John Lasseter', '2011', '102'),
(13, 'Monsters University', 'Dan Scanlon', '2013', '110');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `last_movie`
--
ALTER TABLE `last_movie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `last_movie`
--
ALTER TABLE `last_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
