<?php
/**
 * Konfigurasi & Koneksi Database
 * sistem manajemen perpustakaan
 */

// Database credentials
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'perpustakaan');

// BUAT Koneksi
$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// set charset ke utf 8
$conn->set_charset("utf8mb4");

// cek kondisi
if ($conn->connect_error){
    // log error (production)
    error_log("Database connection failed: ". $conn->connect_error);

    // Tampilkan pesan user-friendly
    die("
    <!DOCTYPE html>
    <html>
    <head>
        <title>Error</title>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class='container mt-5'>
            <div class='alert alert-danger'>
                <h4>Koneksi Database Gagal</h4>
                <p>Maaf, tidak dapat terhubung ke database. Silakan coba lagi nanti.</p>
            </div>
        </div>
    </body>
    </html>
    ");
}

/**
 * Fungsi untuk menutup koneksi database
 */
function closeConnection(){
    global $conn;
    if($conn){
        $conn->close();
    }
}

/**
 * Fungsi untuk sanitasi input
 */
function sanitize($data){
    global $conn;
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $conn->real_escape_string($data);
}

// Set timezone
date_default_timezone_set('Asia/Jakarta');
?>
