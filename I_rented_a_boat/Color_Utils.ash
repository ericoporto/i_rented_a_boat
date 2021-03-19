// new module header

import int MixColors(int c1, int c2, int mix);
import int GetColorRed(int ags_color);
import int GetColorGreen(int ags_color);
import int GetColorBlue(int ags_color);

enum eAgsColor {
  eAgsColor_Black = 2113, 
  eAgsColor_White = 65535, 
};

// Utilities modules are write once, test once, use modules.  <<<<<<<<<<<<<<<<<<<
// WARNING: Complex game/3dengine functionality should NOT be in a utility module
//                              <<------>>