// new module header
enum TargetObjective {
  eObjective_None = 0, 
  eObjective_FindFullSignalSpotNearLake,
  eObjective_FindThePlaceYouFell, 
  eObjective_FindYourWayToTheBeach,
  eObjective_FindLighthouseMountain, 
  eObjective_ReachLighthouseMountainTop, 
  eObjectiveCOUNT, 
};

struct Objective {
  import static void SetCurrent(TargetObjective objective);
  import static void Expire(TargetObjective objective);
  import static void Complete(TargetObjective objective);
};