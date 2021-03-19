// new module header
/// player position in 3D world space
import Vec3* Player_Pos;

/// the horizontal angle the player is facing to
import float Player_Angle;

import float Player_BaseSpeed;

/// did the player walk or not in this frame 
import bool Player_Walked;

import bool Player_Running;

/// used to direct where the camera is pointing
import float Player_Horizon;

/// the map the player is!
import int Player_Map;

// POJO stands for Plain Old Java Object, we are using as a dummy structure just to hold data
//
// in THIS specific we are not ACTUALLY using a struct though because it was confusing with AGS own player definition.
// so we do this.
//
// This separation allows us to use information on player in other modules that don't care about player behavior.