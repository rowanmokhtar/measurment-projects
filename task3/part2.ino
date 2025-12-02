// -------------------------------
// 0-25V Voltage Sensor Module
// -------------------------------

const int sensorPin = A0;

const float DIVIDER_RATIO = 5.0;


const float VREF = 5.0;  
const int ADC_MAX = 1023;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int raw = analogRead(sensorPin);

  float vout = (raw * VREF) / ADC_MAX;

  float vin = vout * DIVIDER_RATIO;

  Serial.print("Raw ADC: ");
  Serial.print(raw);

  Serial.print("  |  Vout (after divider): ");
  Serial.print(vout, 3);
  Serial.print(" V");

  Serial.print("  |  Vin (actual): ");
  Serial.print(vin, 3);
  Serial.println(" V");

  delay(500);
}
