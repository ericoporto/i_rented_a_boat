// new module header
struct CustomSave
{
  import static void Save(int slot,  String description =0);
  import static void SaveNoSchedule(int slot,  String description =0);
  import static void doAutoSave();
  import static void setAutoSaveSlot(int sl);
  import static void cancelRestoreKP();
  import static int getAutoSaveSlot();
};