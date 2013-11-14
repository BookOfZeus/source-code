<?php

class SingleTon {

    private static $instance = NULL;

    private function __construct() {
        // use my mysql_pconnect()
    }

    public function __destruct() {
        // have some useful stuff here
    }

    public static function getInstance() {
        if(!is_object(self::$instance)) {
            self::$instance = new SingleTon();
        }
        return self::$instance;
    }
}

$SingleTon = SingleTon::getInstance();
