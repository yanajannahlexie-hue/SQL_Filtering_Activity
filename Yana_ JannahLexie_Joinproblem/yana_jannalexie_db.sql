-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2026 at 04:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yana_jannalexie_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_name`, `appointment_date`, `status`) VALUES
(201, 101, 'Dr. Garcia', '2025-03-10', 'Completed'),
(202, 102, 'Dr. Ramos', '2025-03-11', 'Scheduled'),
(203, 101, 'Dr. Cruz', '2025-03-15', 'Scheduled'),
(204, 103, 'Dr. Garcia', '2025-03-18', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_name`, `city`, `contact_number`) VALUES
(101, 'Maria Santos', 'Cebu', '09123456781'),
(102, 'Juan Dela Cruz', 'Bohol', '09123456782'),
(103, 'Ana Reyes', 'Cebu', '09123456783'),
(104, 'Mark Lopez', 'Dumaguete', '09123456784'),
(105, 'Carla Gomez', 'Bohol', '09123456785');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Part A No.01
SELECT Patients.patient_name, Appointments.doctor_name
FROM Patients
INNER JOIN Appointments 
ON Patients.patient_id = Appointments.patient_id;

-- Part B No.02
SELECT Patients.patient_name, Patients.city, Appointments.*
FROM Patients
INNER JOIN Appointments
ON Patients.patient_id = Appointments.patient_id
WHERE Patients.city = 'Cebu';

-- Part B No.03
SELECT Patients.patient_name, Appointments.doctor_name, Appointments.appointment_date
FROM Patients
INNER JOIN Appointments 
ON Patients.patient_id = Appointments.patient_id
WHERE Appointments.doctor_name = 'Dr. Garcia';


-- Part C No.04
SELECT Patients.patient_name, Appointments.appointment_id, Appointments.status
FROM Patients
LEFT JOIN Appointments 
ON Patients.patient_id = Appointments.patient_id;

-- Part C No.05
SELECT Patients.patient_name, Appointments.*
FROM Patients
RIGHT JOIN Appointments 
ON Patients.patient_id = Appointments.patient_id;


