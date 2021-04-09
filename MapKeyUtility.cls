/**
 * This class provides utility methods for MDT type Map_Key_Value__mdt.
 */
public without sharing class MapKeyUtility{

    // map of string string by map name, this is used to store already fetched records withing transaction
    public static Map<String, Map<String, String>> mapStringStringByMapName = new Map<String, Map<String, String>>();

    /**
    * @description prepares map of key value pairs for given map name.
    **/
    public static void readMapSetting(Map<String, String> mapStringString, String mapName) {
        // if method called for same map name for two times within transaction
        // Check if value already calculated within transaction
        // not present fetch from MDT type
        if(!mapStringStringByMapName.containsKey(mapName)){
            // TRUE read from MDT type
            for(Map_Key_Value__mdt pmkv : [SELECT Id, Map_Name__c, Map_Key__c, Map_Value__c 
                FROM Map_Key_Value__mdt WHERE Map_Name__c =:mapName]){
                    mapStringString.put(pmkv.Map_Key__c.toUpperCase(), pmkv.Map_Value__c.trim());
            }
            // add calculated map to the static scope for refetch, if called again with same map name
            mapStringStringByMapName.put(mapName, mapStringString);
        }else{
            // If present, directly get from static variable
            mapStringString.putAll(mapStringStringByMapName.get(mapName));
        }
    }

    /**
    * @description prepares map of key value pairs for given map name and returns.
    **/
    public static Map<String, String> readMapSetting(String mapName) {
        Map<String, String> mapStringString = new Map<String, String>();
        MapKeyUtility.readMapSetting(mapStringString, mapName);
        return mapStringString;
    }
}
