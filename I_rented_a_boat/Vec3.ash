// new module header
managed struct Vec3 {

  /// x of the triplet (x,y,z).
  float x;

  /// y of the triplet (x,y,z).
  float y;

  /// z of the triplet (x,y,z).
  float z;

  /// Creates a triplet (x,y,z) vector.
  import static Vec3* Create(float x=0, float y=0, float z=0);
  
  /// Creates a new vector triplet that is a copy of the cloned one.
  import Vec3* Clone();
  
  /// Set the values of the triplet.
  import Vec3* Set(float x=0, float y=0, float  z=0);
  
  /// Returns a new quaternion which is the multiplication of this quaternion by a scalar s.
  import Vec3* Scale(float s);
  
  /// Returns a new vector triplet which is the sum of this vector with a vector v.
  import Vec3* Add(Vec3* v);
};

managed struct ScreenPoint{
  int x;
  int y;
  float z;
  float w;
  bool is_visible;
};