Integer primeCounter = 0;
Integer currentNumber = 2;
Map<Integer, Integer> mapPrime = new Map<Integer, Integer>();

While(primeCounter < 100){
	Boolean isPrime = isPrime(currentNumber);
	if(isPrime){
		primeCounter++;
		mapPrime.put(primeCounter, currentNumber);
	}
	currentNumber ++;
}

public Boolean isPrime(Integer currentNumber){
	Boolean isPrime = true;
	for(Integer j=2;j<=currentNumber/2;j++){
		if(Math.mod(currentNumber, j) == 0){
			isPrime = false;
			break;
		}
	}
	return isPrime;
}

System.debug(LoggingLevel.DEBUG, mapPrime);
System.debug(LoggingLevel.DEBUG, mapPrime.get(100));