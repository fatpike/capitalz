<?php
//Made for PHP version : 7.3.12
//Made by Iwan van der Wal, Wob Jelsma & Robin van den Hoeven
ob_start();
session_start();
require_once 'autoloader.php';
$app = ApplicationController::getInstance();