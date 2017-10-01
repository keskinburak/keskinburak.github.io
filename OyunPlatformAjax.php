<?php
    header('Content-Type: application/json');
	$response = array();

    if (isset($_GET['oyunAdi'])){
    $dsn = 'mysql:host=localhost;dbname=oyundb';
    $user='root';
    $password='';
    $db= new PDO($dsn,$user,$password);
    
    $oyunAdi=$_GET['oyunAdi'];

    //oyunID bulma
    $sth=$db->prepare('SELECT `idOyun` FROM `oyun` WHERE o_ad=(?)');
    $sth->execute(array($oyunAdi));
    $oyunID=$sth->fetchColumn();


    $sth2=$db->prepare('SELECT p_ad FROM platform INNER JOIN oyun_platform as op ON op.idPlatform=platform.idPlatform 
    WHERE op.idOyun=?');
    $sth2->execute(array($oyunID));
    while($row=$sth2->fetch(PDO::FETCH_ASSOC)){
        array_push($response, $row);
    }
    echo json_encode($response);

	}
?>
