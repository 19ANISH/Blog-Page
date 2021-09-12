-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 04:20 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `englishblogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'Try', 'try@gmail.com', '1234509876', 'This is to start our database lets see if it works!', '2021-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(100) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `subtitle`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Reality of the World', 'People are not same as they seem to be', 'first-post', 'There are 7.9 billion people in this world which are yet increasing. In so many people there will always be one person close to you which we call as bestfriend, we share each and everything with them. We are different in front of our parents and other people and different with our bestfriend, but what if our bestfriend is fake? What if he/she is jealous of our success, our increment? We never know this thing because he/she will never say it on our face but will be ready to stab on our back when we need them the most. This is not the case with everyone but there are some exceptions. So I would like to advice you all to be aware of the reality of the world we are living in. ', 'globe.jpg', '2021-09-07'),
(2, 'Believe in God and you will never fail', 'God always keeps an eye on you', 'second-post', 'As everyone knows that there is no superpower other than God. We believe in god and so we do rituals and celebrate festivals. I would like to share a story which I read about believing in god and trusting in god. \r\nOnce upon a time there lived a king in a village in India, he was rich and powerful, he bought a statue of Lord Krishna and made a temple for the same. He appointed a saint for performing all the rituals and worships of Lord Krishna daily. King made a necklace for Lord Krishna, he used to go to the temple daily and worship Lord Krishna and then he would wear the necklace until then the necklace was woren by statue of Lord Krishna. That necklace was made of pure pearls and diamond. One day king was out of town and the guards of king informed saint about it. Saint was a bit greedy about the necklace so he wore it for one day and the next day again king worshiped Lord Krishna and wore the necklace, same day at night king called the saint at to his palace and said I have been wearing this necklace from so many years but never found any change in it but yesterday there was a white hair stuck in the necklace, replying to it saint said king it has been so many years that this temple is made Lord Krishna is getting old so maybe this his white hair would have stuck. King agreed and said tomorrow morning when you will be performing worship of Lord Krishna I will come to temple and see how old has our Lord Krishna got. Saint was pretty scared and couldn\'t sleep whole night in fear, he prayed to god for and asked for forgiveness. Very next day when saint was performing worship in the temple, king arrived and asked saint to take off the crown of statue of Lord Krishna when he did so king found out that the statue had so many white hairs, it blew out his mind and he doubted that saint would have painted the statue at night so he went near the statue and plucked out one hair from statue and statue started bleeding. King was shocked he bowed down and asked for forgiveness to both the statue and saint. Saint was happy because his believe in god saved him from king. So we should always believe in God no matter what happens  ', 'krishna.jpg', '2021-09-07'),
(3, 'The Secret of Life', 'Whatever you wish you can get it', 'third-post', 'The Secret is a book written by Rhonda Byrne. \r\nIn this we are told that we can get whatever we desire, the nature will help us get what we want. We just have to keep our thoughts clear about what we want. Our thoughts act as a carrier/ waves which are passed to nature, in reply to that nature gives us the desired result/ desired thing we want. While asking for anything to the nature we have to ask it for ourselves we cannot harm others or can ask anything for others.', 'secret.jpg', '2021-09-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
