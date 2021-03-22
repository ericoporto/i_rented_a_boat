// DictToIni Module Header 
// Version 0.0.1 - needs testing!
// Note: currently spaces aren't trimmed

/// Creates a new ini-like string representing the dictionary.
import String ToIniString(this Dictionary*);

/// Overwrites the dictionary with the key value pairs in the ini-like string.
import void FromIniString(this Dictionary*, String ini_string);

/// Creates an ini file on the player's save directory, from current dictionary key value pairs.
import void ToIniFile(this Dictionary*, String filename);

/// Reads an ini file on the player's save directory and replaces current dictionary with file's key value pairs.
import void FromIniFile(this Dictionary*, String filename);