//Steven



// constants won't change. They're used here to set pin numbers:
const int buttonPinA = 2;

const int led1 =  13;      // the number of the LED pin
const int led2 =  12;
const int led3 =  11;
const int led4 =  10;

int counter = 1;

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status

void setup() {
  Serial.begin(9600);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led4, OUTPUT);

  pinMode(buttonPinA, INPUT);

}
//Steven
void loop() {



  int buttonStateA = digitalRead(buttonPinA);
  Serial.println(counter);

  if (counter <= 4) {
    if (buttonStateA == HIGH) {


      counter +=  1;


      digitalWrite(led1, HIGH);

      digitalWrite(led3, HIGH);
      digitalWrite(led2, LOW);

      digitalWrite(led4, LOW);




    }


    else {

      digitalWrite(led1, LOW);

      digitalWrite(led3, LOW);
      digitalWrite(led2, HIGH);

      digitalWrite(led4, HIGH);
    }


    delay(500);
  }





  if (counter >= 5) {
    if (buttonStateA == HIGH) {

      counter +=  1;

      digitalWrite(led1, LOW);

      digitalWrite(led2, HIGH);

      digitalWrite(led3, HIGH);

      digitalWrite(led4, LOW);
      if (counter == 10) {
        counter = 0;
      }


    }


    else {

      digitalWrite(led1, HIGH);

      digitalWrite(led2, LOW);

      digitalWrite(led3, LOW);

      digitalWrite(led4, HIGH);
    }


    delay(500);
  }
}

//Steven Lui
