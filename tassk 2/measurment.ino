#define TRIG_PIN 5
#define ECHO_PIN 6
void setup() {
  // put your setup code here, to run once:
pinMode(TRIG_PIN,OUTPUT);
pinMode(ECHO_PIN,INPUT);
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  long distance =readUltrasonic();
  if (distance != -1) {
    Serial.print("Distance: ");
    Serial.print(distance);
    Serial.println(" cm");
  } else {
    Serial.println("error!");
  }

  delay(1000); //1s
}

long readUltrasonic(){
   digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(5);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
   long time = pulseIn(ECHO_PIN, HIGH , 20000);
  if (time == 0) return -1;

  long distance = time * 0.0343 / 2;
  return distance;
}
