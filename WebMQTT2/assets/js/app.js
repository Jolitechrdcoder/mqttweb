const MAX_TEMPERATURE = 100;
const hostname = "mqtt-dashboard.com";
const port = 8884;
const clientId = `clientId-${new Date().getUTCMilliseconds()}`;
const username = "webclient";
const password = "Super$icher123";
const topic = "temp";
const mqttClient = new Paho.MQTT.Client(hostname, port, clientId);

mqttClient.onMessageArrived = MessageArrived;
mqttClient.onConnectionLost = ConnectionLost;
Connect();

function Connect() {
    mqttClient.connect({
        onSuccess: Connected,
        onFailure: ConnectionFailed,
        keepAliveInterval: 10,
        userName: username,
        useSSL: true,
        password: password
    });
}

function Connected() {
    console.log("Connected");
    mqttClient.subscribe(topic);
}

function ConnectionFailed(res) {
    console.log(`Connect failed: ${res.errorMessage}`);
}

function ConnectionLost(res) {
    if (res.errorCode !== 0) {
        console.log(`Connection lost: ${res.errorMessage}`);
        Connect();
    }
}

function MessageArrived(message) {
    console.log(`${message.destinationName}: ${message.payloadString}`);
    const data = parseFloat(message.payloadString);

    if (!isNaN(data)) {
        const voltage = (data / 4095) * 5000;
        const temperature = voltage / 10;
        document.getElementById("temperature").textContent = `${temperature.toFixed(2)} °C`;
        updateTemperatureBar(temperature);

        // Enviar la temperatura al servidor PHP
        sendDataToServer(temperature);
    }
}

function sendDataToServer(temperature) {
    const formData = new FormData();
    formData.append('temperature', temperature);

    fetch('http://localhost/WebMQTT2/save_data.php', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`Network response was not ok: ${response.statusText}`);
        }
        return response.text();
    })
    .then(data => {
        console.log('Response from server:', data);
    })
    .catch(error => {
        console.error('Error during fetch:', error);
    });
}

function updateTemperatureBar(temperature) {
    const temperatureBar = document.getElementById("temperatureBar");
    const barWidth = (temperature / MAX_TEMPERATURE) * 100;
    temperatureBar.style.width = `${barWidth}%`;

    let color = temperature < 30 ? "#27ae60" : temperature < 60 ? "#f39c12" : "#e74c3c";
    temperatureBar.style.backgroundColor = color;
}

