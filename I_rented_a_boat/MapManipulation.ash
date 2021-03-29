// new module header

/// Get Height of Heightmap at x,y position
import float GetHeight(this MapData*, int x, int y);

/// Set Height of Heightmap in the rect of x1,y1 to x2,y2 , inclusive
import void SetHeightRect(this MapData*, float new_height, int x1, int y1, int x2,  int y2);

/// Copy color in a rectangle from top left corner and width height to a different top left corner rectangle
import void CopyColorRect(this MapData*, int width, int height, int org_x, int org_y, int dest_x, int dest_y);

/// Draws a sprite in the colormap, starting from the target top left position
import void DrawSprite(this MapData*, int graphic, int toplef_x, int toplef_y, int transp_color);