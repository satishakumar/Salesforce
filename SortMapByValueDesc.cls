Map<String, Decimal> customMap = new Map<String, Decimal>{'aaa' => 10, 'bbb' => 20, 'ccc' => 25, 'ddd' => 20};

List<customWrapper> customList = new List<customWrapper>();
for(String str: customMap.keySet()){
	customList.add(new customWrapper(str, customMap.get(str)) );
}

public class customWrapper implements Comparable {
 
    public String str;
    public Decimal amount;
    
    // Constructor
    public customWrapper(String key, Decimal value) {
        str = key;
        amount = value;
    }
    
    // Implement the compareTo() method
    public Integer compareTo(Object compareTo) {
        customWrapper compareToObj = (customWrapper)compareTo;
        if (amount == compareToObj.amount) return 0;
        if (amount > compareToObj.amount) return -1;
        return 1;        
    }
}
          
System.debug('BEFORE ' + customList);
customList.sort();
System.debug('AFTER ' + customList);
