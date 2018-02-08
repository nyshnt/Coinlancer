-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 02:17 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coinlancer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cl_admin_tbl`
--

CREATE TABLE `cl_admin_tbl` (
  `id` int(4) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `last_login_date` datetime NOT NULL,
  `last_login_ip` varchar(40) NOT NULL,
  `login_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cl_admin_tbl`
--

INSERT INTO `cl_admin_tbl` (`id`, `name`, `email`, `password`, `last_login_date`, `last_login_ip`, `login_status`) VALUES
(1, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2018-02-07 12:54:15', '::1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cl_category_tbl`
--

CREATE TABLE `cl_category_tbl` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(60) NOT NULL,
  `category_status` tinyint(4) NOT NULL DEFAULT '1',
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cl_category_tbl`
--

INSERT INTO `cl_category_tbl` (`category_id`, `category_name`, `category_status`, `added_by`, `added_on`) VALUES
(1, 'a', 1, 1, '2018-02-06 09:58:30'),
(3, 'as', 0, 1, '2018-02-07 12:16:26'),
(4, 'aav', 0, 1, '2018-02-07 12:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `cl_slider_tbl`
--

CREATE TABLE `cl_slider_tbl` (
  `slider_id` int(4) NOT NULL,
  `slider_title` varchar(50) NOT NULL,
  `slider_img` varchar(255) NOT NULL,
  `slider_desc` varchar(100) NOT NULL,
  `slider_url` varchar(255) NOT NULL,
  `added_by` tinyint(4) NOT NULL,
  `added_on` datetime NOT NULL,
  `slider_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cl_slider_tbl`
--

INSERT INTO `cl_slider_tbl` (`slider_id`, `slider_title`, `slider_img`, `slider_desc`, `slider_url`, `added_by`, `added_on`, `slider_status`) VALUES
(1, 'aa', 'http://localhost:8088/coinlancer/uploads/1625.jpeg', 'for aa', 'www.aa.com', 1, '2018-02-07 12:35:58', 1),
(2, 'bb', 'http://localhost:8088/coinlancer/uploads/8056.jpeg', 'for bb', 'www.bb.gmail.com', 1, '2018-02-07 12:43:01', 1),
(3, 'cc', 'http://localhost:8088/coinlancer/uploads/6771.jpeg', 'for cc', 'www.cc.com', 1, '2018-02-07 12:55:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cl_sub_category_tbl`
--

CREATE TABLE `cl_sub_category_tbl` (
  `sub_category_id` int(11) NOT NULL,
  `subcategory_name` varchar(60) NOT NULL,
  `flag_status` tinyint(4) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cl_sub_category_tbl`
--

INSERT INTO `cl_sub_category_tbl` (`sub_category_id`, `subcategory_name`, `flag_status`, `added_by`, `added_on`, `category_id`) VALUES
(1, '1', 1, 1, '2018-02-07 08:36:47', 1),
(2, '2', 1, 1, '2018-02-07 08:36:47', 1),
(3, '34', 1, 1, '2018-02-07 08:37:11', 2),
(4, 'gjhfghj', 1, 1, '2018-02-07 08:37:11', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cl_admin_tbl`
--
ALTER TABLE `cl_admin_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_category_tbl`
--
ALTER TABLE `cl_category_tbl`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cl_slider_tbl`
--
ALTER TABLE `cl_slider_tbl`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `cl_sub_category_tbl`
--
ALTER TABLE `cl_sub_category_tbl`
  ADD PRIMARY KEY (`sub_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cl_admin_tbl`
--
ALTER TABLE `cl_admin_tbl`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cl_category_tbl`
--
ALTER TABLE `cl_category_tbl`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cl_slider_tbl`
--
ALTER TABLE `cl_slider_tbl`
  MODIFY `slider_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cl_sub_category_tbl`
--
ALTER TABLE `cl_sub_category_tbl`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
