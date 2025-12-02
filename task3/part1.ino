// -------------------------------
// Voltage Divider Sensor Code
// -------------------------------

const int analogPin = A0;

const float R1 = 33000.0;   // 33kΩ
const float R2 = 8200.0;   // 8.2kΩ


const float VREF = 5;     
const int ADC_BITS = 10;    

void setup() {
  Serial.begin(115200);
  delay(1000);
  Serial.println("Voltage Divider Sensor Started...");
}

void loop() {

  unsigned int maxADC = (1 << ADC_BITS) - 1;

 
  int rawValue = analogRead(analogPin);

  float vout = (rawValue * VREF) / maxADC;


  float vin = vout * (R1 + R2) / R2;

  Serial.print("ADC Raw: ");
  Serial.print(rawValue);

  Serial.print("  |  Vout: ");
  Serial.print(vout, 3);
  Serial.print(" V");

  Serial.print("  |  Vin: ");
  Serial.print(vin, 3);
  Serial.println(" V");

  delay(500);
}
