/*
Problem: Remove alternate characters
Drop alternate occurrence of any character from a given string (including space and ignore case)

Input:
	 {‘Simpplr SSE’, ‘Simpplr Lead’, ‘Simpplr Technical Architect’, ‘Today is Sunday’, ‘Today is Sunday & tomorrow is Saturday’, ‘Today is Sunday & tomorrow is Monday}

Output:
	{‘Simplr SE’, ‘Simplr ead’, ‘Simplr Technacit’, ‘Today isun’, ‘Today isun &morw satrdy’, ‘Today isun &morw soday’}
*/

public class AlternateCharecterRemover {
	public static String removeAlternateCharecter(String inputStr){
		String outputStr = '';
		// logic
		Map<String, Integer> mapCharecterCounter = new Map<String, Integer>();

		List<String> inputCharList = inputStr.split(''); //split by charecter

		for(String charStr: inputCharList){
			String charStrTemp = charStr.toLowerCase();

			if(mapCharecterCounter.get(charStrTemp) != null){
				mapCharecterCounter.put(charStrTemp, mapCharecterCounter.get(charStrTemp) + 1);
				if(Math.mod(mapCharecterCounter.get(charStrTemp), 2) != 0){
					outputStr += charStr;
				}
			}else{
				outputStr += charStr;
				mapCharecterCounter.put(charStrTemp, 1);
			}
		}

		return outputStr;
	}
}


List<String> inputList= new List<String>{'Simpplr SSE', 'Simpplr Lead', 'Simpplr Technical Architect', 'Today is Sunday', 'Today is Sunday & tomorrow is Saturday', 'Today is Sunday & tomorrow is Monday'};

List<String> outPutList = new List<String>();
for(String inputStr: inputList){
	String outputStr = AlternateCharecterRemover.removeAlternateCharecter(inputStr);
	outPutList.add(outputStr);
}

System.debug(LoggingLevel.DEBUG, 'outPutList ' + outPutList);

