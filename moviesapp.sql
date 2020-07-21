-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2020 at 02:59 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviesapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actorID` int(11) NOT NULL,
  `actorFirstName` text NOT NULL,
  `actorLastName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likesMovie` tinyint(1) NOT NULL,
  `userID` int(11) NOT NULL,
  `movieName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likesMovie`, `userID`, `movieName`) VALUES
(1, 1, 'Inception');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieName` text NOT NULL,
  `movieType` text NOT NULL,
  `Rate` int(11) NOT NULL,
  `Release Date` date NOT NULL,
  `movieID` int(11) NOT NULL,
  `movieDesc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieName`, `movieType`, `Rate`, `Release Date`, `movieID`, `movieDesc`) VALUES
('Inception', 'Action', 8, '2010-07-16', 1, 'Dom Cobb (Leonardo DiCaprio) is a thief with the rare ability to enter people\'s dreams and steal their secrets from their subconscious. His skill has made him a hot commodity in the world of corporate espionage but has also cost him everything he loves. Cobb gets a chance at redemption when he is offered a seemingly impossible task: Plant an idea in someone\'s mind. If he succeeds, it will be the perfect crime, but a dangerous enemy anticipates Cobb\'s every move.'),
('Terminator 3', 'Action', 8, '2003-07-02', 2, 'Now 25, Connor (Nick Stahl) lives with no record of his existence -- no way he can be traced by Skynet. Out of the shadows of the future steps the T-X (Kristanna Loken), Skynet\'s most sophisticated cyborg killing machine yet. Now Connor\'s only hope for survival is the Terminator (Arnold Schwarzenegger), his mysterious former assassin. Together, they must triumph over the technologically superior T-X and forestall the looming threat of Judgment Day.'),
('Avengers', 'Superhero', 9, '2019-05-03', 3, 'Adrift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle. Meanwhile, the remaining Avengers -- Thor, Black Widow, Captain America and Bruce Banner -- must figure out a way to bring back their vanquished allies for an epic showdown with Thanos -- the evil demigod who decimated the planet and the universe.'),
('IT(2017)', 'Horror', 5, '2017-09-08', 4, 'Seven young outcasts in Derry, Maine, are about to face their worst nightmare -- an ancient, shape-shifting evil that emerges from the sewer every 27 years to prey on the town\'s children. Banding together over the course of one horrifying summer, the friends must overcome their own personal fears to battle the murderous, bloodthirsty clown known as Pennywise.'),
('Titanic', 'Drama', 7, '1997-12-19', 5, 'James Cameron\'s \"Titanic\" is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912.'),
('Joker', 'Drama', 7, '2019-10-04', 6, 'Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he\'s part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.'),
('The Judge', 'Drama', 8, '2014-10-10', 7, 'Hank Palmer (Robert Downey Jr.), a brilliant but shady attorney, returns to his Indiana hometown after learning that his mother has passed away. His arrival triggers renewed tension between himself and his father, Judge Joseph Palmer (Robert Duvall), who makes no secret of his disapproval of Hank\'s morally ambiguous career. As the lawyer prepares to depart, his father is arrested for a hit-and-run death. Hank takes on his father\'s defense, despite the objections of the resentful old man.'),
('Jumanji: The Next Level', 'Action', 7, '2019-12-13', 8, 'In Jumanji: The Next Level, the gang is back but the game has changed. As they return to rescue one of their own, the players will have to brave parts unknown from arid deserts to snowy mountains, to escape the world\'s most dangerous game.'),
('Star Wars: The Rise Of Skywalker', 'Fantasy', 6, '2019-12-20', 9, 'The surviving members of the resistance face the First Order once again, and the legendary conflict between the Jedi and the Sith reaches its peak bringing the Skywalker saga to its end.'),
('Fast & Furious Presents: Hobbs & Shaw', 'Action', 6, '2019-08-02', 10, 'Lawman Luke Hobbs (Dwayne \"The Rock\" Johnson) and outcast Deckard Shaw (Jason Statham) form an unlikely alliance when a cyber-genetically enhanced villain threatens the future of humanity.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userFirstName` text NOT NULL,
  `userLastName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userFirstName`, `userLastName`) VALUES
(1, 'Panayiotis', 'Petsas'),
(2, 'John', 'Smith');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actorID`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
