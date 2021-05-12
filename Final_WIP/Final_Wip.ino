const int BUTTON = 2;
const int LED1 = 8;
const int LED2 = 7;

int buttonState = LOW;
int lastButtonState = LOW;
int buttonCount = 0;

int inByte = 0;



void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial por to connect
  }

  pinMode(BUTTON , INPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);


  establishContact();

}
void loop(){
  buttonState = digitalRead(BUTTON);
  if (buttonState == HIGH && lastButtonState == LOW) {
  buttonCount ++;
}
else{}
lastButtonState = buttonState;


if (buttonCount > 255) {
  buttonCount = 0;
}
delay(10);

//first check data if available
if (Serial.available() > 0) {
    inByte = Serial.read();

    if (inByte == 0){
    digitalWrite(LED1, LOW);
      digitalWrite(LED2, LOW);
    }
    else if (inByte == 1){
    digitalWrite(LED1, HIGH);
      digitalWrite(LED2, LOW);
    }
    else if (inByte == 2){
    digitalWrite(LED1, LOW);
      digitalWrite(LED2, HIGH);
    }
    else {}
    Serial.write(buttonCount);

  }


}



void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');
    delay(300);
  }
}
