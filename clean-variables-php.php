<?php

function cleanPost($val) {
	if(!isset($_POST[$val])) {
		$_POST[$val] = NULL;
		return;
	}
	$_POST[$val] = trim(htmlentities($_POST[$val], ENT_QUOTES, 'UTF-8'));
}

function clean($val) {
	return trim(htmlentities($val, ENT_QUOTES, 'UTF-8'));
}
$_POST = array_map('clean', $_POST);
