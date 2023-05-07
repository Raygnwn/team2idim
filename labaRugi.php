<?php
    // session start
    if(!empty($_SESSION))
    {

     }
     else
     { 
        session_start(); 
    }
    require 'proses/panggil.php';
?>

<!DOCTYPE HTML>
<html>
	<head>
		<title> Kalkulasi Untung Rugi </title>
		<!-- BOOTSTRAP CSS-->
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"> -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- DATATABLES CSS -->
        <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" /> -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" /> 
        
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- jQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <!-- DATATABLES BS 4-->
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <!-- BOOTSTRAP 4-->
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	</head>
    <body style="background:#B3C99C;">
            <?php 
                if(!empty($_SESSION['ADMIN']))
                {
                    include('navbar.php');
                }
            ?>    
        <br/>
        <br/>
	    <div class="container"> 
        <!-- <div> -->    
			<div class="row">
				<div class="col-lg-12">
                    <?php 
                        if(!empty($_SESSION['ADMIN']))
                        {
                    ?>
                    <a href="index.php" class="btn btn-success btn-md"><span class="fa fa-arrow-left"></span> Halaman Utama</a>
                    <p> </p>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Data Keuntungan Per Barang</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover table-bordered" id="mytable" style="margin-top: 10px">
                                <thead>
                                    <tr>
                                        <th width="50px">No</th>
                                        <th>Nama Barang</th>
                                        <th>Barang Beli</th>
                                        <th>Barang Jual</th>
                                        <th>Stok</th>
                                        <th>Satuan</th>
                                        <th>Keuntungan</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>   
                                <?php
                                    $no=1;
                                    // memanggil data yang menyimpan keuntungan per item
                                    $keuntungan = $proses->kalkulasi_keuntungan();
                                    // var_dump($keuntungan);
                                    
                                    foreach($keuntungan as $data){

                                        // var_dump($data);
                                ?>
                                    <tr>
                                        <td><?php echo $no; ?></td>
                                        <td><?php echo $data['NamaBarang']?></td>
                                        <td><?php echo $data['jmlbarangbeli'];?></td>
                                        <td><?php echo $data['jmlbarangjual'];?></td>
                                        <td><?php echo $data['stok'];?></td>
                                        <td><?php echo $data['satuan'];?></td>
                                        <td><?php echo 'Rp'.$data['keuntungan'];?></td>
                                        <?php
                                            if($data['keuntungan'] <= 0)
                                            {
                                        ?>
                                        <td>rugi</td>    
                                        <?php
                                            }
                                            else
                                            {
                                        ?>
                                        <td>untung</td> 
                                        <?php
                                            }
                                        ?>
                                    </tr>        
                                <?php
                                    $no++;
                                        }
                                ?>
                                </tbody>
                            </table>                             
                        </div>
                    <?php 
                        }
                        else
                        {
                    ?>
                        <br/>
                        <div class="alert alert-info">
                            <h3> Maaf Anda Belum Dapat Akses CRUD, Silahkan Login Terlebih Dahulu !</h3>
                            <hr/>
                            <p><a href="../login.php">Login Disini</a></p>
                        </div>
                    <?php 
                        }
                    ?>
                </div>
            </div>
        </div>
    </body>
</html>