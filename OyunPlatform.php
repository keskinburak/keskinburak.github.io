<html>
<head>
    <title>Oyun Platform</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    
</head>
<body>
    <form method="post" action="oyunPlatform.php">
        <div>
            <label for="ad">Oyun Adı</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <?php

            $dsn = 'mysql:host=localhost;dbname=oyundb';
            $user='root';
            $password='';
            $db= new PDO($dsn,$user,$password);

            $sth=$db->prepare('SELECT `o_ad` FROM `oyun`');
            $sth->execute();
            echo "<select name='oyunAdi' id='oyunAdi'>";
            echo "<option value='0'>Oyunu Seçiniz </option>";
            while ($result = $sth->fetch(PDO::FETCH_ASSOC))
            {
                echo '<option value="'.$result['o_ad'].'">'.$result['o_ad'] .'</option>';
            }
            echo "</select>";
            ?>
            <br><br>
            Platform Adı<br>
            <?php
            $sth3=$db->prepare('SELECT * FROM `platform`');
            $sth3->execute();
            echo "Oyun Platformu <br>";
            while ($result3 = $sth3->fetch(PDO::FETCH_ASSOC))
            {
                echo '<input type="checkbox" name="oyunPlatform" value="'.$result3['p_ad'].'">'.$result3['p_ad'].'';
                echo "<br>";
            }
            ?>
        </div>
    </form>
	<script type="text/javascript">
    $(document).ready(function()  
    {
        $('#oyunAdi').change(function()
        {
			console.log("ddl değişti");
            var oyunAd=$(this).val();
            var data_String = 'oyunAdi='+oyunAd;
			console.log(oyunAd);
			$.ajax({
				type:'GET',
 			 	url: "OyunPlatformAjax.php",
  				dataType: "json",
  				data: {
					  oyunAdi : oyunAd
				  },
  				success: function(data){
					  //önceki checkleri sil
					$('input:checkbox').removeAttr('checked');
					//checkleme
					  $.each(data, function( index, value ) {
						$('input[value="'+value.p_ad+'"]').prop("checked", true);
					  });

					console.log("success");
				  }
			});

            /*$.get('OyunPlatformAjax.php',{"oyunAdi":oyunAd},function(result){
				console.log(result);
				console.log("ddl değişti");

                $.each(result,function()
                {
                    for(var deger in result){
                        $('#oyunPlatform input[value='+result[deger]+']').prop("checked", true);
                    

                });
            }, "json");*/

        });
        
    });
    </script>
</body>
</html>
