//Steven Lui - Trun your pot to change colors on both the LED and drawing. (In Sync)


const int sensor = A0;
const int LED1 = 11;
const int LED2 = 10;
int value = 0;


void setup() {
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  
value = analogRead(sensor); //goes from 0 - 1023
delay(50);
value = value/4;

//Serial.println(value);
Serial.write(value);
analogWrite(LED1, value);
analogWrite(LED2, value);

if(value <= 175){
  analogWrite(LED1, LOW);
  analogWrite(LED2, value);
  
}
else{
  analogWrite(LED2, LOW);
}




}
