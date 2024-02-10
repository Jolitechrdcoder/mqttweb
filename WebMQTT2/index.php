
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MQTT</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <h1 class="title">MQTT</h1>
    <div class="container">
        <div class="card" id="temperatureCard">
            <i class="fas fa-thermometer-half" style="font-size: 24px; color: #fff;"></i>
            <h2>Temperatura</h2>
            <p>Temperatura actual: <span id="temperature">-- °C</span></p>
            <div id="temperatureBar"></div>
        </div>
    </div>

    <?php
    // Capturar la salida de save_data.php
    ob_start();
    include('save_data.php');
    $output = ob_get_clean();
    ?>

    <!-- Mostrar la salida en la página -->
    <div>
        <h2>Respuesta del Servidor PHP:</h2>
        <pre><?php echo $output; ?></pre>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script src="assets/js/app.js"></script>
</body>
</html>