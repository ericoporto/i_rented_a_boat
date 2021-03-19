// new module header

// Player_Update is called in Game Loop module !!!
/// all player behavior is abstracted in this update loop, place it in a rep execute or rep execute always
import void Player_Update();

// since there's a lot of empty space, lets use to notedown behaviors
//
// # Masks
// Masks are reused to implement behaviors in our 3D world
// - Walkable areas: 0 is for walls, any other number the player can walk through.
// - Region: used for the terrain type, which are important for the player step sound effects
// - Hotspot: o hotspot 0 means nothing, and 0 - 3 sets the radio signal in the area, you need signal 3 to communicate. 
//            o Bigger numbers is something of interest, signal is kept from previous ground. For now these are unused.
//            o 20 and above are reserved for teleport.