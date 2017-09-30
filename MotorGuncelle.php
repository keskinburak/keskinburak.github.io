<html>
<head>
    <title>Motor Ekle</title>
</head>
<body>
    <form method="post" action="motorguncelle.php">
        <div>
        <label for="ad">Motor Adı</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label for="yeniAd">Yeni Motor Adı</label> <br>
        <?php

        $dsn = 'mysql:host=localhost;dbname=oyundb';
        $user='root';
        $password='';
        $db= new PDO($dsn,$user,$password);

        $sth=$db->prepare('SELECT `m_ad` FROM `motor`');
        $sth->execute();
        echo "<select name='motorAd' onchange='yeniMotorAdGuncelle(this.value)'>";
        echo "<option value='0'>Motoru Seçiniz </option>";
        while ($result = $sth->fetch(PDO::FETCH_ASSOC))
        {
            echo '<option value="'.$result['m_ad'].'">'.$result['m_ad'] .'</option>';
        }
        echo "</select>";
        ?>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="yeniMotorAdID" type="text" name="yeniMotorAd"><br>
        <br>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="Güncelle" name="motorGuncelle">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="Geri Dön" name="geriDon">
        <input id="eskiMotorAdID" type="text" name="eskiMotorAd" style="display: none">
        </div>
    </form>
    <script>
    function yeniMotorAdGuncelle(degisken)
    {
        document.getElementById("yeniMotorAdID").value = degisken;
        document.getElementById("eskiMotorAdID").value = degisken;
    }
    </script>

    <?php

    function motorGuncelleFunc()
    {
        $dsn = 'mysql:host=localhost;dbname=oyundb';
        $user='root';
        $password='';
        $db= new PDO($dsn,$user,$password);

        $eskiAd=$_POST['eskiMotorAd'];
        $ad=$_POST['yeniMotorAd'];
        $sth=$db->prepare("UPDATE motor SET m_ad=? WHERE m_ad=?");
        $update=$sth->execute(array($ad,$eskiAd));
        if($update)
        {
            echo "<script type='text/javascript'>alert('Güncelleme Başarılı')</script>";
            header("Location: motorGuncelle.php");
            die();
        }
        else
        {
            echo "<script type='text/javascript'>alert('Malesef güncelleme yapılamadı.')</script>";
        }
    }

    function geriClick()
    {
        header("Location: deneme.php");
        die();
    }

    if(isset($_POST['motorGuncelle']))
    {
       motorGuncelleFunc();
    } 

    if(isset($_POST['geriDon']))
    {
       geriClick();
    } 

    ?>
    
    </body>
    </html>