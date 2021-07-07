Map<Integer, Long> mapFib = new Map<Integer, Long>();
mapFib.put(1, 0L);
mapFib.put(2, 1L);

Integer fibCounter=2, currentNumber = 2;

While(fibCounter < 50){
	fibCounter ++;
	mapFib.put(fibCounter, fibonacci(mapFib, fibCounter));
	System.debug(LoggingLevel.DEBUG, '*****@***** fibCounter ' + fibCounter + '=>' + mapFib.get(fibCounter));
}

System.debug(LoggingLevel.DEBUG, '*****@***** mapFib ' + mapFib);
System.debug(LoggingLevel.DEBUG, '*****@***** mapFib ' + mapFib.values());

public Long fibonacci(Map<Integer, Long> mapFib, Integer fibCounter){
	return mapFib.get(fibCounter-1) + mapFib.get(fibCounter-2);
}