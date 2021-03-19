// new module header
enum MapXYType {
  eMapXYType_Loop = 0, 
  eMapXYType_NoLoop = 1, 
};

struct MapData {

  float Heightmap[1048576];
  int Heightmap_Width;
  int Heightmap_Height;
  int Heightmap_Width_Period;
  int Heightmap_Height_Period;
  int Heightmap_Length;
  int Heightmap_Sprite;

  int Colormap[1048576];
  int Colormap_Width;
  int Colormap_Height;
  int Colormap_Length;
  int Colormap_Width_Period;
  int Colormap_Height_Period;
  int Colormap_Sprite;
  
  float Base_Horizon; //the orizon base value per map, this is used to calculate the final horizon, for now
  float Base_PlayerSpeed;
  
  MapXYType LoopType;

  import int LoadHeightMap(int i_loaded);
  import int LoadColorMap(int i_loaded);
  import int XYtoIDX(int x, int y);
};