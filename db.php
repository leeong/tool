<?php

class DB
{

    private $config;
    private $conn;

    public function __construct($argv)
    {
        $this->configInit($argv);
        if (!$this->conn) {
            return $this->conn = $this->getConnection();
        }
        return $this->conn;

    }

    private function configInit($argv)
    {
        $config = include('config.php');
        if (isset($argv[2]) && $argv[2] != '') {
            $this->config = $config[$argv[1]];
        } else {
            $this->config = $config['jfw'];
        }
    }


    private function getConnection()
    {

        $username = $this->config['username'];
        $password = $this->config['password'];
        $host = $this->config['host'];
        $db = $this->config['db'];
        $connection = new PDO("mysql:dbname=$db;host=$host", $username, $password);
        $connection->exec("set names utf8");
        return $connection;
    }

    public function exec($sql)
    {
        return $this->conn->exec($sql);
    }

    public function query($sql)
    {
        return $this->conn->query($sql);
    }

    public function prepare($sql)
    {
        return $this->conn->prepare($sql);
    }
}
