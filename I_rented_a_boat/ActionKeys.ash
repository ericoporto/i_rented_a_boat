// new module header
struct ActionKeys {
  writeprotected bool Forward;
  writeprotected bool Backward;
  writeprotected bool Left;
  writeprotected bool Right;
  writeprotected bool Run;
  writeprotected bool Flashlight;
  
  bool BlockInput;
  
  import void Update();
};

import ActionKeys actionKeys;