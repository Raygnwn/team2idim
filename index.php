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
		<!-- <title>Tutorial Membuat CRUD PHP OOP dengan PDO MySQL</title> -->
		<!-- BOOTSTRAP 4-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        <!-- DATATABLES BS 4-->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- jQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <!-- DATATABLES BS 4-->
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <!-- BOOTSTRAP 4-->
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	</head>
    <body style="background:#7C96AB;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

                    <?php 
                        if(!empty($_SESSION['ADMIN']))
                        {
                    ?>
                    <br/>
                    <span style="color:#fff";>Selamat Datang, <?php echo $sesi['NamaDepan'];?></span>
                    <a href="logout.php" class="btn btn-danger btn-md float-right"><span class="fa fa-sign-out"></span> Logout</a>
                    <br/><br/>
                    <a href="tambah.php" class="btn btn-success btn-md"><span class="fa fa-plus"></span> Tambah Barang</a>
                    <a href="labaRugi.php" class="btn btn-success btn-md"> Kalkulasi Laba Rugi</a>
                    <br/><br/>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Data Barang</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover table-bordered" id="mytable" style="margin-top: 10px">
                                <thead>
                                    <tr>
                                        <th width="50px">No</th>
                                        <th>Nama Barang</th>
                                        <th>Keterangan</th>
                                        <th>Satuan</th>
                                        <!--
                                        <th>Alamat</th>
                                        <th>Username</th>
                                        <th>Password</th>
                                        -->
                                        <th style="text-align: center;">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                    $no=1;
                                    // ambil data berdasarkan user yang buat
                                    $hasil = $proses->tampil_data_barang('barang',$sesi['IdPengguna']);
                                    foreach($hasil as $isi){
                                ?>
                                    <tr>
                                        <td><?php echo $no; ?></td>
                                        <td><?php echo $isi['NamaBarang']?></td>
                                        <td><?php echo $isi['Keterangan'];?></td>
                                        <td><?php echo $isi['satuan'];?></td>
                                        <!--
                                        <td><?php /* echo $isi['alamat']; */ ?></td>
                                        <td><?php /* echo $isi['username']; */ ?></td>
                                        <td>****</td>
                                        -->
                                        <td style="text-align: center;">
                                            <a href="edit.php?id=<?php echo $isi['IdBarang']; ?>" class="btn btn-success btn-md">
                                            <span class="fa fa-edit"></span></a>
                                            <a onclick="return confirm('Apakah yakin data akan di hapus?')" href="proses/crud.php?aksi=hapusBarang&IdBarang=<?php echo $isi['IdBarang'];?>" 
                                            class="btn btn-danger btn-md"><span class="fa fa-trash"></span></a>
                                        </td>
                                    </tr>
                                <?php
                                    $no++;
                                    }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <?php 
                    }
                    else
                    {?>
                        <br/>
                        <div class="alert alert-info">
                            <h3 style="text-align:center"> Team 2 Introduction to Data and Information Management</h3>
                            <hr/>
                            <p style="text-align:center">  Danis Andika Praditya 
                            <br>Dhea Amalia Ariantoputri
                            <br>Ezra Neviyana Simanullang
                            <br>Radatunnazriah
                            <br>Ray Gunawan Hidayatullah</p>
                        </div>

                        <div class="alert alert-info">
                            <h3 style="text-align:center"> Silahkan Login Terlebih Dahulu  !</h3>
                            <hr/>
                            <div style="display: flex; position: relative;justify-content: center">
                                <button type="button" class="btn btn-primary btn-lg"
                                style="text-align:center"><a href="login.php" style="color:white">Login Disini</a></button>
                                <!-- <p style="text-align:center"><a href="login.php">Login Disini</a></p> -->
                            </div>
                        </div>
                    <?php 
                    }?>
			    </div>
			</div>
		</div>
        <script>
            $('#mytable').dataTable();
        </script>
	</body>
</html>
